package cn.superman.sandbox.callable;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import cn.superman.sandbox.dto.Problem;
import cn.superman.sandbox.dto.ProblemResultItem;

public class ProblemCallable implements Callable<List<ProblemResultItem>> {
	private Method mainMethod;
	private Problem problem;
	private Runtime run = null;
	private CountDownLatch countDownLatch = null;
	private static final ExecutorService itemGetThreadPool = Executors
			.newCachedThreadPool(new ThreadFactory() {
				@Override
				public Thread newThread(Runnable r) {
					Thread thread = new Thread(r);
					thread.setName("itemGetThreadPool id "
							+ System.currentTimeMillis());
					return thread;
				}
			});
	private static final ExecutorService itemExecThreadPool = Executors
			.newCachedThreadPool(new ThreadFactory() {
				@Override
				public Thread newThread(Runnable r) {
					Thread thread = new Thread(r);
					thread.setName("itemExecThreadPool id "
							+ System.currentTimeMillis());
					return thread;
				}
			});

	public ProblemCallable(Method mainMethod, Problem problem) {
		this.mainMethod = mainMethod;
		this.problem = problem;
		run = Runtime.getRuntime();
	}

	@Override
	public List<ProblemResultItem> call() throws Exception {
		final List<ProblemResultItem> resultItems = new ArrayList<ProblemResultItem>();
		countDownLatch = new CountDownLatch(problem.getNum());
		// 为了内存使用比较准确，先大概的执行一次回收吧
		run.gc();

		for (int i = 1; i <= problem.getNum(); i++) {
			int num = i;
			itemExecThreadPool.execute(new Runnable() {
				@Override
				public void run() {
					resultItems.add(process(problem.getInputDataFilePath(), num));
				}
			});
		}

		// 阻塞线程，等待所有结果都计算完了，再返回
		countDownLatch.await();
		return resultItems;
	}

	private ProblemResultItem process(String inputFilePath, int Num) {
		ProblemResultItem item = null;
		ProblemItemCallable itemCallable = null;
		long beginMemory = 0;
		long beginTime = 0;
		long endTime = 0;
		long endMemory = 0;
		Future<ProblemResultItem> submit = null;

		try {
			itemCallable = new ProblemItemCallable(mainMethod, inputFilePath, Num ,problem.getuserId());

			submit = itemGetThreadPool.submit(itemCallable);

			beginMemory = run.totalMemory() - run.freeMemory();
			beginTime = System.nanoTime();

			item = submit
					.get(30, TimeUnit.SECONDS);

			if (item == null) {
				killThread((FutureTask<ProblemResultItem>) submit);
				throw new TimeoutException();
			}

			endTime = System.nanoTime();
			endMemory = run.totalMemory() - run.freeMemory();
		} catch (Exception e) {
			// 出现了意外，先关闭资源再说（如已经打开的流等）
			killThread((FutureTask<ProblemResultItem>) submit);
			item = new ProblemResultItem();
			item.setNormal(false);
			if (e instanceof CancellationException
					|| e instanceof TimeoutException) {
				// 超时了，会进来这里
				item.setMessage("超时");
			} else {
				item.setMessage(e.getMessage());
			}
			endTime = System.nanoTime();
			endMemory = run.totalMemory() - run.freeMemory();
		}
		// 时间为毫微秒，要先转变为微秒再变为毫秒
		item.setUseTime((endTime - beginTime) / 1000 / 1000);
		item.setUseMemory(endMemory - beginMemory);
		if (item.getUseMemory() > 200000000) {
			item.setNormal(false);
			item.setMessage("超出内存限制");
		}
		// 无论怎么样，这里必须最后都要进行减一，不然将会一直阻塞线程，最终无法返回结果
		countDownLatch.countDown();
		Class myNative = null;
		try {
			myNative = Class.forName("com.sun.jna.Native");
			Method method = myNative.getDeclaredMethod("dispose", new Class[]{});
			method.setAccessible(true);
			method.invoke(myNative, new Object[]{});
		} catch (ClassNotFoundException | NoSuchMethodException | InvocationTargetException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return item;
	}

	/**
	 * @param submit
	 */
	@SuppressWarnings("deprecation")
	private void killThread(FutureTask<ProblemResultItem> submit) {
		try {
			submit.cancel(true);
			// 利用反射，强行取出正在运行该任务的线程
			Field runner = submit.getClass().getDeclaredField("runner");
			runner.setAccessible(true);
			Thread execThread = (Thread) runner.get(submit);
			execThread.stop();
			submit.cancel(true);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

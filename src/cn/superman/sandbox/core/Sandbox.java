package cn.superman.sandbox.core;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.concurrent.*;

import cn.superman.sandbox.callable.ProblemCallable;
import cn.superman.sandbox.constant.ConstantParameter;
import cn.superman.sandbox.core.classLoader.SandboxClassLoader;
import cn.superman.sandbox.core.securityManager.SandboxSecurityManager;
import cn.superman.sandbox.dto.*;

public class Sandbox extends Thread{
    private static final int UPDATE_CLASSLOADER_GAP = 50;
	// 记录一共加载过的类数量
    public static  BlockingQueue<Problem> ProblemQueue = new LinkedBlockingQueue<Problem>();
    private boolean go = false;
	private int loadClassCount = 0;
	private String pid = null;
	private SandboxClassLoader sandboxClassLoader;
	private MemoryMXBean systemMemoryBean = null;
	private long beginStartTime = 0;
	// 表示当前进程是否在忙，如果在忙的话，就表示当前正在判题(这是当前正在的忙情况，以后可能会增加更多的情况)
	private boolean isBusy = false;
	private ProblemCallable problemCallable;
	private FileReader reader = null;

	private ExecutorService problemThreadPool = Executors
			.newSingleThreadExecutor(new ThreadFactory() {

				@Override
				public Thread newThread(Runnable r) {
					Thread thread = new Thread(r);
					thread.setName("problemThreadPool");
					thread.setUncaughtExceptionHandler(new UncaughtExceptionHandler() {

						@Override
						public void uncaughtException(Thread t, Throwable e) {
							System.out.println(e.getMessage());
						}
					});
					return thread;
				}
			});
	// 用一个线程池去等待每个判题请求的结果返回
	private ExecutorService problemResultThreadPool = Executors
			.newSingleThreadExecutor(new ThreadFactory() {

				@Override
				public Thread newThread(Runnable r) {
					Thread thread = new Thread(r);
					thread.setName("problemResultThreadPool");
					thread.setUncaughtExceptionHandler(new UncaughtExceptionHandler() {

						@Override
						public void uncaughtException(Thread t, Throwable e) {
							e.printStackTrace();
						}
					});
					return thread;
				}
			});

	public Sandbox() {
		initSandbox();
	}

	/**
	 * 沙箱初始化函数
	 */
	private void initSandbox() {
		// 获取进程id，用于向外界反馈
		getPid();
		// 沙箱环境准备
		buildEnvironment();
	}

	/**
	 * 获取进程ID
	 */
	private void getPid() {
		String name = ManagementFactory.getRuntimeMXBean().getName();
		pid = name.split("@")[0];
	}

	/**
	 * 建立沙箱环境
	 */
	private void buildEnvironment(){
		sandboxClassLoader = new SandboxClassLoader();
        systemMemoryBean = ManagementFactory.getMemoryMXBean();
        beginStartTime = System.currentTimeMillis();
	}

	public void closeSandbox() {
		go = false;
		if(!isBusy)
			interrupt();
	}
	public void startSandbox(){
		go = true;
		start();
	}

	@Override
	public void run() {

			while(go) {
				if(!isBusy) {
					try {
					Problem problem = ProblemQueue.take();
					isBusy = true;
					Response response = JudgedProblem(problem);
					response.setId(problem.getId());
					response.setuserId(problem.getuserId());
					response.setClassPath(problem.getClassPath());
					ResponseQueue.responseQueue.put(response);
					isBusy = false;
					} catch (InterruptedException e) {
						e.printStackTrace();
					}

				}
			}
	}

	/**
	 * 判题函数
	 */
	private Response JudgedProblem(Problem problem){
		try {
		sandboxClassLoader.setclassPath(problem.getClassPath());
//		System.setSecurityManager(new SandboxSecurityManager());
		} catch (Exception e) {
			System.out.println(e.getMessage());
			isBusy = true;
		}
		if (loadClassCount >= UPDATE_CLASSLOADER_GAP) {
			loadClassCount = 0;
			// 重置类加载器，使得原有已经加载进内存的过期的类，可以得以释放
			sandboxClassLoader = new SandboxClassLoader();
			sandboxClassLoader.setclassPath(problem.getClassPath());
			System.gc();
		}
		Future<List<ProblemResultItem>> processProblem = processProblem(problem);
		Future<Response> response = returnJudgedProblemResult(problem.getuserId(), processProblem);
		try {
			return response.get();
		} catch (InterruptedException | ExecutionException e) {
			e.printStackTrace();
		}
		loadClassCount++;
		return null;
	}
	/**
	 * 进行项目处理
	 * @return 题目处理结果
	 */
	private Future<List<ProblemResultItem>> processProblem(Problem problem) {
		try {
			Class<?> mainClass = sandboxClassLoader.loadSandboxClass(problem.getClassFileName());
			Method mainMethod = mainClass.getMethod("main", String[].class);
			mainMethod.setAccessible(true);

			problemCallable = new ProblemCallable(mainMethod, problem);
			Future<List<ProblemResultItem>> submit = problemThreadPool
					.submit(problemCallable);
			mainClass = null;
			return submit;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 返回题目运行结果
	 * @param userId 用户名
	 * @param processProblem 题目运行结果
	 */
	private Future<Response> returnJudgedProblemResult(final String userId,
			final Future<List<ProblemResultItem>> processProblem) {
		Future<Response> response = problemResultThreadPool.submit(new Callable<Response>() {
			@Override
			public Response call() {
				Response response = new Response();
				if (processProblem != null) {
					try {
						List<ProblemResultItem> resultItems = processProblem.get();
						ProblemResult problemResult = new ProblemResult();
						problemResult.setuserId(userId);
						problemResult.setResultItems(resultItems);
						String fileName;
						Boolean Normal = true;
						for(ProblemResultItem item:resultItems) {

							if(!item.isNormal())
								Normal = false;
						}
						if(!Normal) response.setNormal(false);
						else
							{
								StringBuilder result = new StringBuilder();
								for (ProblemResultItem item : resultItems)
								{
									fileName = item.getInputFilePath() + File.separator + userId + File.separator
											+ userId + String.valueOf(item.getNum())+"_test.out";
									File file = new File(fileName);
									if (!file.exists()) {
										Normal = false;
										break;
									}

									reader = new FileReader(file);

									char[] buffer = new char[1024];
									while (reader.read(buffer) != -1) {
										result.append(buffer) ;
									}
									item.setResult(result.toString());
									result.delete(0,result.length());
									reader.close();
								}
								for (ProblemResultItem item : resultItems){
									fileName = item.getInputFilePath() + File.separator + "out"+ File.separator
											+ String.valueOf(item.getNum())+".out";
									File file = new File(fileName);
									if (!file.exists()) {
										System.out.println(".out no found");
										break;
									}
									reader = new FileReader(file);
									char[] buffer = new char[1024];
									while (reader.read(buffer) != -1) {
										result.append(buffer) ;
									}

									if(!result.toString().equals(item.getResult()))
										Normal = false;
									result.delete(0,result.length());
									reader.close();
								}
								if (Normal)
									response.setNormal(true);
								else
									response.setNormal(false);
							}
					} catch (InterruptedException | ExecutionException | IOException e) {
						e.printStackTrace();
					}

					finally {
						problemCallable = null;
					}
				}return response;
			}
		});

		return response;
	}

	public SandBoxStatus getSandboxStatus(int st){
		if (ConstantParameter.Status_VALUE == st)
			return feedbackSandboxStatusService();
		else
			return null;
	}
	/**
	 * 返回沙箱状态的服务
	 */
	private SandBoxStatus feedbackSandboxStatusService() {
		SandBoxStatus sandBoxStatus = new SandBoxStatus();
		sandBoxStatus.setPid(pid);
		sandBoxStatus.setBeginStartTime(beginStartTime);
		sandBoxStatus.setBusy(isBusy);
		// 由堆内存和非堆内存组成
		long useMemory = systemMemoryBean.getHeapMemoryUsage().getUsed()
				+ systemMemoryBean.getNonHeapMemoryUsage().getUsed();
		sandBoxStatus.setUseMemory(useMemory);
		// 由堆内存和非堆内存组成
		long maxMemory = systemMemoryBean.getHeapMemoryUsage().getMax()
				+ systemMemoryBean.getNonHeapMemoryUsage().getMax();
		sandBoxStatus.setMaxMemory(maxMemory);
		return sandBoxStatus;
	}

}

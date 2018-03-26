package cn.superman.sandbox.callable;

import java.io.File;
import java.io.PrintStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.Callable;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import cn.superman.sandbox.dto.ProblemResultItem;

public class ProblemItemCallable implements Callable<ProblemResultItem> {
	private Method mainMethod;
	private String inputFilePath;
	private int Num = 0;
	private PrintStream out = null;
	private static Lock lock = new ReentrantLock();
	private String userId;

	public ProblemItemCallable(Method mainMethod, String inputFilePath, int Num,String userId) {
		this.mainMethod = mainMethod;
		this.Num = Num;
		this.userId = userId;
		out = System.out;
		File file = new File(inputFilePath + File.separator + "in" + File.separator
				+ String.valueOf(Num) + ".in");
		if (!file.exists()) {
			throw new RuntimeException("测试数据有问题");
		} else
			this.inputFilePath = inputFilePath;
	}

	public ProblemResultItem call() throws Exception {
		ProblemResultItem item = new ProblemResultItem();

		try {
			String file_in,file_testOut;
			file_in = inputFilePath + File.separator + "in"+ File.separator  + String.valueOf(Num);
			file_testOut = inputFilePath + File.separator + userId + File.separator + userId + String.valueOf(Num);
			lock.lock();
			mainMethod.invoke(null, (Object) new String[]{ file_in, file_testOut});
			lock.unlock();
			System.setOut(out);
			item.setNormal(true);
			item.setInputFilePath(inputFilePath);
			item.setNum(Num);
			System.out.println(item.toString());
			System.out.println(System.out.toString());
		} catch (InvocationTargetException e) {
			lock.unlock();
			Throwable throwable = e.getTargetException();
			if (throwable instanceof OutOfMemoryError) {
				item.setMessage("内存溢出");
			} else {
				item.setMessage(throwable.getMessage());
			}
			item.setNormal(false);
		} catch (RuntimeException runtimeException) {
			lock.unlock();
			item.setMessage(runtimeException.getMessage());
			item.setNormal(false);
		} finally {
			return item;
		}

	}
}
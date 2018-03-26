package cn.superman.sandbox.core.classLoader;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;

public class SandboxClassLoader extends ClassLoader {
	private String classPath = null;

	public SandboxClassLoader(){
		super();
		try {
			File file = new File("E:\\STUDY\\J2ee_program\\CHelp\\lib\\jna.jar");
			URL url = null;

			url = file.toURI().toURL();
			URLClassLoader systemClassLoader = (URLClassLoader) ClassLoader.getSystemClassLoader();
			Class urlClassLoaderClass = URLClassLoader.class;
			Method var3 = urlClassLoaderClass.getDeclaredMethod("addURL", new Class[] { URL.class });
			var3.setAccessible(true);
			var3.invoke(systemClassLoader, new Object[]{url});
			Class<?> c = Class.forName("com.sun.jna.Native");
			Class<?> b = Class.forName("com.sun.jna.Library");
		} catch (MalformedURLException | IllegalAccessException
				| InvocationTargetException | ClassNotFoundException | NoSuchMethodException e) {
			e.printStackTrace();
		}
	}
	public void setclassPath(String classPath) {
		this.classPath = classPath;
	}

	@Override
	protected Class<?> findClass(String name) throws ClassNotFoundException {
		return loadSandboxClass(name);
	}

	public Class<?> loadSandboxClass(String name) throws ClassNotFoundException {
		String classFilePath = classPath + File.separator + name + ".class";
		FileInputStream inputStream = null;
		try {
			File file = new File(classFilePath);
			inputStream = new FileInputStream(file);
			byte[] classByte = new byte[(int) file.length()];
			inputStream.read(classByte);

			return defineClass(name, classByte, 0, classByte.length);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
			}
		}

		return null;
	}
}

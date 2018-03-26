package cn.superman.sandbox.core;

import cn.superman.sandbox.core.securityManager.SandboxSecurityManager;
import cn.superman.sandbox.dto.Response;

import java.io.File;
import java.util.concurrent.*;

public class ResponseQueue extends Thread{
    public static BlockingQueue<Response> responseQueue = new LinkedBlockingQueue<Response>();
    private boolean go = false;
    private static final ExecutorService getSql = Executors
            .newCachedThreadPool(new ThreadFactory() {
                @Override
                public Thread newThread(Runnable r) {
                    Thread thread = new Thread(r);
                    thread.setName("getSql id "
                            + System.currentTimeMillis());
                    return thread;
                }
            });
    public void closeResponseQueue() {
        go = false;
    }

    public void startResponseQueue() {
        go = true;
        start();
    }

    @Override
    public void run() {

        while (go) {
            try {
                Response finalResponse = responseQueue.take();
                getSql.execute(new Runnable() {
                    @Override
                    public void run() {

//                        SecurityManager sm=System.getSecurityManager();
//                        if(sm!=null){
//                            System.setSecurityManager(null);
//                        }
                        deleteDirectory(finalResponse.getClassPath());
//                        System.setSecurityManager(new SandboxSecurityManager());
//                        System.out.println("y");
                    }
                });
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    private static boolean deleteDirectory(String dir) {
        // 如果dir不以文件分隔符结尾，自动添加文件分隔符
        if (!dir.endsWith(File.separator))
            dir = dir + File.separator;
        File dirFile = new File(dir);
        // 如果dir对应的文件不存在，或者不是一个目录，则退出
        if ((!dirFile.exists()) || (!dirFile.isDirectory())) {
            System.out.println("删除目录失败：" + dir + "不存在！");
            return false;
        }
        boolean flag = true;
        // 删除文件夹中的所有文件包括子目录
        File[] files = dirFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            // 删除子文件
            if (files[i].isFile()) {
                flag = deleteFile(files[i].getAbsolutePath());
                if (!flag)
                    continue;
            }
            // 删除子目录
            else if (files[i].isDirectory()) {
                flag = deleteDirectory(files[i]
                        .getAbsolutePath());
                if (!flag)
                    continue;
            }
        }
        if (!flag) {
            return false;
        }
        // 删除当前目录
        if (dirFile.delete()) {
            return true;
        } else {
            return false;
        }
    }

    private static boolean deleteFile(String fileName) {
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}

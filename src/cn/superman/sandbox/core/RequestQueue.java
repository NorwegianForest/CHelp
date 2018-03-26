package cn.superman.sandbox.core;

import java.io.*;
import java.util.concurrent.*;

import cn.superman.sandbox.dto.Problem;
import cn.superman.sandbox.dto.Request;
import cn.superman.sandbox.dto.Response;

public class RequestQueue extends Thread {
    public static BlockingQueue<Request> requestQueue = new LinkedBlockingQueue<Request>();
    private boolean go = false;

    private static final ExecutorService getClass = Executors
            .newCachedThreadPool(new ThreadFactory() {
                @Override
                public Thread newThread(Runnable r) {
                    Thread thread = new Thread(r);
                    thread.setName("getClass id "
                            + System.currentTimeMillis());
                    return thread;
                }
            });

    public void closeRequestQueue() {
        go = false;
    }

    public void startRequestQueue() {
        go = true;
        start();
    }

    @Override
    public void run() {

        while (go) {
            try {
                Request finalRequest = requestQueue.take();
                Problem problem = toProblem(finalRequest);
                getClass.execute(new Runnable() {
                    @Override
                    public void run() {
                        boolean Normal = CtoJava(finalRequest);
                        if (Normal) {
                            try {
                                Sandbox.ProblemQueue.put(problem);
                            } catch (InterruptedException e) {
                                e.printStackTrace();
                            }
                        } else{
                            Response response = new Response();
                            response.setNormal(false);
                            response.setClassPath(problem.getClassPath());
                            response.setId(response.getId());
                        }
                    }
                });
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    private Problem toProblem(Request request) {
        Problem problem = new Problem();
        problem.setClassPath("C:\\Problem\\" + request.getproblemID()+"\\"+request.getuserId());
        problem.setClassFileName("_"+request.getuserId());
        problem.setuserId(request.getuserId());
        problem.setInputDataFilePath("C:\\Problem\\" + request.getproblemID());
        problem.setId(request.getproblemID());
        String file_path = "C:\\Problem\\" + request.getproblemID()+"\\in";
        File file = new File(file_path);
        if(!file.exists()){
            System.out.println("路径不存在");
        }else{
            File[] files = file.listFiles();
            int i = files != null ? files.length : 0;
            problem.setNum(i);
        }
        file = new File(problem.getClassPath());
        if(!file.exists())
            file.mkdir();
        return problem;
    }

    private boolean CtoJava(Request request){
        boolean Normal = false;
        String str = request.getData();
        String Id = request.getproblemID();
        String userId = request.getuserId();
        str = addStr(str,"_"+userId);
        WriteCPP(str,Id,userId);
        WriteH(str,Id,userId);
        WriteJava(Id,userId);
        Normal = toClass(Id,userId);
        return Normal;
    }

    private void WriteJava(String Id, String userId) {
        String str = "import com.sun.jna.Native;\n" +
                "import com.sun.jna.Library;\n" +
                "\n" +
                "interface _" + userId + " extends Library\n" +
                "{\n" +
                "    _" + userId + " instanceDll  = (_" + userId + ")Native.loadLibrary(\"C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\" + userId + "\",_" + userId + ".class);\n" +
                "    public int _main(String str1,String str2);\n" +
                "    public static void main(String[] args) {\n" +
                "        _" + userId + " jnaDemo = _" + userId + ".instanceDll;\n" +
                "        jnaDemo._main(args[0],args[1]);\n" +
                "    }\n" +
                "}\n";
        pickOut("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\"+"_" + userId + ".java", str);
    }

    private void WriteCPP(String str, String Id, String userId) {
        int a=0,b=0,c=0;
        int subscriptstart=0,subscriptend=0,subscript1=0,subscript2=0;
        String str1 = "#include \""+userId+".h\"\n" +
                "#include <String.h>";
        pickOut("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\" + userId +".cpp", str1);
        for(int i=0;i<str.length();i++)
        {
            if(str.charAt(i)=='{')
            {
                a=a+1;
            }
            if(str.charAt(i)=='}')
            {
                b=b+1;
                if(a==b)
                {
                    subscript1=i;
                }
            }
            if(a==b&&str.charAt(i)==';'&&str.charAt(i-1)=='}')
            {
                subscript2=i;
            }
            else if(a==b&&str.charAt(i)!=';' &&str.charAt(i==0?0:i-1)=='}'&&c==1)
            {
                subscript2 = subscriptstart;
                c=0;
            }
            if(a==b&&str.charAt(i)=='}')
            {
                subscriptstart=subscript2==0?0:subscript2+1;
                subscriptend=subscript1;
                String s1 = str.substring(subscriptstart,subscriptend+1);
                if(s1.indexOf("struct")==-1)
                {
                    pickOut("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\" + userId +".cpp", s1+"\n");
                    subscript2 = subscriptend;
                    a = 0;
                    b = 0;
                }
            }
        }
    }

    private void WriteH(String str, String Id, String userId) {
        String str1 = "#define JNADLL extern \"C\" __declspec(dllexport)\r\n";
        pickOut("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\" + userId +".h",str1);
        String str2 = null;
        String str3 = null;
        int a=0,b=0;
        int subscriptstart=0,subscriptend=0,subscript1=0,subscript2=0,subscript3=0;
        for(int i = 0 ;i < str.length();i++)
        {
            if(str.charAt(i)=='<')
            {
                a=a+1;
            }
            if(str.charAt(i)=='>')
            {
                subscript1 = i;
                b=b+1;
                if(a==b)
                {
                    subscriptstart = subscript1+1;
                    a=0;b=0;
                }
            }
            if(str.charAt(i)=='{')
            {
                a=a+1;
                if(a==1)
                {
                    subscript2=i;
                }
            }
            if(str.charAt(i)=='}')
            {
                subscript3=i;
                b=b+1;
            }
            if(a==b&&str.charAt(i)=='}' )
            {
                subscriptend = subscript2;
                str2 = str.substring(subscriptstart, subscriptend );//
                if (str2.indexOf("struct") == -1)
                {
                    str2 = " JNADLL  " + str2 + ";\n";
                    pickOut("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\" + userId +".h",str2);
                    subscriptstart = subscript3 + 1;
                    a = 0;
                    b = 0;
                }
                else
                {
                    subscriptend = subscript3+2;
                    str3 = str.substring(subscriptstart,subscriptend);
                    str3 = " JNADLL " + str3 + "\n";
                    pickOut("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\" + userId +".h",str3);
                    subscriptstart = subscript3 + 2;
                    a = 0;
                    b = 0;
                }
            }
        }
    }

    private void pickOut(String filename, String oneLine){
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(filename, true);
            fos.write(oneLine.getBytes());
            fos.write("\r\n".getBytes());

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fos != null) {
                try {
                    fos.flush();
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private String addStr(String str, String userId) {
        str = str.replaceAll("main",userId);
        String str1 = "int _main(char* str1,char* str2)\n" +
                "{\n" +
                "\tconst char* in=\".in\";\n" +
                "\tconst char* out=\"_test.out\";\n" +
                "\tstrcat(str1,in);\n" +
                "\tstrcat(str2,out);\n" +
                "\tif(freopen(str1,\"r\",stdin)!=NULL&&freopen(str2,\"w\",stdout)!=NULL)\n" +
                "\t\t"+ userId +"();\n" +
                "\telse \n" +
                "\t\treturn -1;\n" +
                "\tfflush(stdout);\n" +
                "\tfclose(stdin);\n" +
                "\tfclose(stdout);\n" +
                "\tfreopen(\"CON\",\"r\",stdin);\n" +
                "\tfreopen(\"CON\",\"w\",stdout);\n" +
                "\treturn 0;\n" +
                "}";
        str = str + str1;

        return str;
    }

    public boolean toClass(String Id,String userId) {
        boolean Normal = false;
        File file1 = new File("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\"+"_" + userId + ".java");
        File file2 = new File("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\" + userId + ".cpp");
        File file3 = new File("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\" + userId + ".h");
        File file4 = new File("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\" + userId + ".bat");
        try {
            Runtime runtime = Runtime.getRuntime();
            String str2 = "gcc -Wall -D_JNI_IMPLEMENTATION_ -Wl,--kill-at -shared -o "+userId+".dll "+userId+".cpp\r\n";
            String str3 = "javac -cp E:\\STUDY\\J2ee_program\\CHelp\\lib\\jna.jar; _"+userId+".java\r\n";
            pickOut("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\"+ userId +".bat",str2+str3);
            String   ls_1;
            String str ="cmd /c "+userId;
            String dir ="C:\\\\Problem\\"+ Id + "\\\\" + userId;

            while(true){
                if (file1.exists() && file2.exists() && file3.exists() && file4.exists()) break;
            }
            Process r = runtime.exec(str,null, new File(dir));
            InputStream child_error=r.getErrorStream();
            BufferedReader error = new BufferedReader(new InputStreamReader(r.getErrorStream(), "GBK"));
            String line = null;

            while ((line = error.readLine()) != null) {
                System.out.println(line);
            }
            child_error.close();

            r.waitFor();
            int i = r.exitValue();  //接收执行完毕的返回值
            if (i == 0)
                Normal = true;
            r.destroy();  //销毁子进程
            r = null;
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        File file = new File("C:\\\\Problem\\\\" + Id + "\\\\"+userId+"\\\\_"+ userId +".class");
        while (true) {
            if (file.exists())
                break;
        }
        return Normal;

    }

}
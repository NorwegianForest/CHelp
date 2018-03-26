package cn.superman.sandbox.core;

import cn.superman.sandbox.dto.Request;
import com.business.Paper;

public class testSandbox {
    static Sandbox sandbox = new Sandbox();
    static RequestQueue requestQueue = new RequestQueue();
    public static void main(String[] args){
        Sandbox sandbox = new Sandbox();
        RequestQueue requestQueue = new RequestQueue();
        ResponseQueue responseQueue = new ResponseQueue();
        Request request = new Request();

        request.setData("#include <stdio.h>\n" +
                "\n" +
                "int main()\n" +
                "{\n" +
                "    return add1();\n" +
                "}\n" +
                "int add1()\n" +
                "{\n" +
                "\tint a,b;\n" +
                "\tscanf(\"%d\",&a);\n" +
                "\tscanf(\"%d\",&b);\n" +
                "\tprintf(\"%d\\n\",a+b);\n" +
                "\tprintf(\"%d\\n\",b-a);\n" +
                "    return a + b;\n" +
                "}");
        request.setuserId("null");
        request.setproblemID("1");
        try {
            RequestQueue.requestQueue.put(request);
            sandbox.startSandbox();
            responseQueue.startResponseQueue();
            requestQueue.startRequestQueue();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}

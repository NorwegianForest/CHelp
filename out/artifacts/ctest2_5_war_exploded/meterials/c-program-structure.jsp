<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
    <%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../highlight/styles/default.css" rel="stylesheet">  
<title>C ���Խ̳� | C Help</title>
</head>
<body>
<script src="../highlight/highlight.pack.js"></script>  
<script >hljs.initHighlightingOnLoad();</script>


	  
    <h1>C ����ṹ</h1>
    <p>������ѧϰ C ���ԵĻ���������֮ǰ����������������һ����С�� C ����ṹ���ڽ��������½��п����Դ���Ϊ�ο���</p>
    <hr />
    <h2>C Hello World ʵ��</h2>
    <p>C ������Ҫ�������²��֣�</p>
    <ul>
      <li>Ԥ������ָ��</li>
      <li>����</li>
      <li>����</li>
      <li>��� &amp; ���ʽ</li>
      <li>ע��</li>
    </ul>
    <p>�����ǿ�һ�μ򵥵Ĵ��룬����������� &quot;Hello World&quot;��</p>
    <div>
    <hr />
      <h2>ʵ��</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;

int main()
{
    /* �ҵĵ�һ�� C ���� */
    printf(&quot;Hello, World! \n&quot;);
    return 0;
}</code></pre></div>
      </div>
    </div>
    <p>���������ǽ���һ��������γ���</p>
    <ol>
      <li>����ĵ�һ�� <em>#include &lt;stdio.h&gt;</em> ��Ԥ������ָ����� C ��������ʵ�ʱ���֮ǰҪ���� stdio.h �ļ���</li>
      <li>��һ�� <em>int main()</em> ������������������￪ʼִ�С�</li>
      <li>��һ�� /*...*/ ���ᱻ���������ԣ�������ó����ע�����ݡ����Ǳ���Ϊ�����ע�͡�</li>
      <li>��һ�� <em>printf(...)</em> �� C ����һ�����õĺ�����������Ļ����ʾ��Ϣ &quot;Hello, World!&quot;��</li>
      <li>��һ�� <strong>return 0;</strong> ��ֹ main() ������������ֵ 0��</li>
    </ol>
    <hr />
    <h2>���� &amp; ִ�� C ����</h2>
    <p>�����������ǿ�����ΰ�Դ���뱣����һ���ļ��У��Լ���α��벢�������������Ǽ򵥵Ĳ��裺</p>
    <ol>
      <li>��һ���ı��༭��������������롣</li>
      <li>�����ļ�Ϊ <em>hello.c</em>��</li>
      <li>��������ʾ�������뵽�����ļ����ڵ�Ŀ¼��</li>
      <li>���� <em>gcc hello.c</em>������س���������롣</li>
      <li>���������û�д���������ʾ����������һ�У������� <em>a.out</em> ��ִ���ļ���</li>
      <li>���ڣ����� <em>a.out</em> ��ִ�г���</li>
      <li>�����Կ�����Ļ����ʾ <em>&quot;Hello World&quot;</em>��</li>
    </ol>
    <pre>$ gcc hello.c<br>
$ ./a.out<br>
Hello, World!</pre>
    <p>��ȷ������·�����Ѱ��� gcc ����������ȷ���ڰ���Դ�ļ� hello.c ��Ŀ¼����������</p>
    

    
</body>
</html>
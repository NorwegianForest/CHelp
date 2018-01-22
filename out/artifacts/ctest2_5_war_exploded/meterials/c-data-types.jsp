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

    <h1>C ��������</h1>
    <div>
      <p>�� C �����У���������ָ��������������ͬ���͵ı���������һ���㷺��ϵͳ�����������;����˱����洢ռ�õĿռ䣬�Լ���ν��ʹ洢��λģʽ��</p>
      <p>C �е����Ϳɷ�Ϊ���¼��֣�</p>
      <table border="1">
        <tbody>
          <tr>
            <th>���</th>
            <th>����������</th>
          </tr>
          <tr>
            <td>1</td>
            <td><strong>�������ͣ�</strong><br />
              �������������ͣ������������ͣ��������ͺ͸������͡�</td>
          </tr>
          <tr>
            <td>2</td>
            <td><strong>ö�����ͣ�</strong><br />
              ����Ҳ���������ͣ������������ڳ�����ֻ�ܸ�����һ������ɢ����ֵ�ı�����</td>
          </tr>
          <tr>
            <td>3</td>
            <td><strong>void ���ͣ�</strong><br />
              ����˵���� <em>void</em> ����û�п��õ�ֵ��</td>
          </tr>
          <tr>
            <td>4</td>
            <td><strong>�������ͣ�</strong><br />
              ���ǰ�����ָ�����͡��������͡��ṹ���͡����������ͺͺ������͡�</td>
          </tr>
        </tbody>
      </table>
      <br />
      <p>�������ͺͽṹ����ͳ��Ϊ�ۺ����͡�����������ָ���Ǻ�������ֵ�����͡��ڱ��½ڽ������Ĳ������ǽ����ܻ������ͣ������������ͻ��ں�߼����½��н��н��⡣</p>
    </div>
    <hr />
    <h2>��������</h2>
    <p>�±��г��˹��ڱ�׼�������͵Ĵ洢��С��ֵ��Χ��ϸ�ڣ�</p>
    <table border="1"> 
      <tbody>
        <tr>
          <th>����</th>
          <th>�洢��С</th>
          <th>ֵ��Χ</th>
        </tr>
        <tr>
          <td>char</td>
          <td>1 �ֽ�</td>
          <td>-128 �� 127 �� 0 �� 255</td>
        </tr>
        <tr>
          <td>unsigned char</td>
          <td>1 �ֽ�</td>
          <td>0 �� 255</td>
        </tr>
        <tr>
          <td>signed char</td>
          <td>1 �ֽ�</td>
          <td>-128 �� 127</td>
        </tr>
        <tr>
          <td>int</td>
          <td>2 �� 4 �ֽ�</td>
          <td>-32,768 �� 32,767 �� -2,147,483,648 �� 2,147,483,647</td>
        </tr>
        <tr>
          <td>unsigned int</td>
          <td>2 �� 4 �ֽ�</td>
          <td>0 �� 65,535 �� 0 �� 4,294,967,295</td>
        </tr>
        <tr>
          <td>short</td>
          <td>2 �ֽ�</td>
          <td>-32,768 �� 32,767</td>
        </tr>
        <tr>
          <td>unsigned short</td>
          <td>2 �ֽ�</td>
          <td>0 �� 65,535</td>
        </tr>
        <tr>
          <td>long</td>
          <td>4 �ֽ�</td>
          <td>-2,147,483,648 �� 2,147,483,647</td>
        </tr>
        <tr>
          <td>unsigned long</td>
          <td>4 �ֽ�</td>
          <td>0 �� 4,294,967,295</td>
        </tr>
      </tbody>
    </table>
    <blockquote>
      <p>ע�⣬�������͵Ĵ洢��С��ϵͳλ���йأ���Ŀǰͨ�õ���64λϵͳΪ����</p>
      <p>�����г���32λϵͳ��64λϵͳ�Ĵ洢��С�Ĳ��windows ��ͬ����</p>
      <p><img src="http://www.runoob.com/wp-content/uploads/2014/09/32-64.jpg" alt="" width="400" height="400"/></p>
    </blockquote>
    <p>Ϊ�˵õ�ĳ�����ͻ�ĳ���������ض�ƽ̨�ϵ�׼ȷ��С��������ʹ�� <strong>sizeof</strong> ����������ʽ <em>sizeof(type)</em> �õ���������͵Ĵ洢�ֽڴ�С�������ʵ����ʾ�˻�ȡ int ���͵Ĵ�С��</p>
    <div>
    <hr />
      <h2>ʵ��</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;limits.h&gt;

int main()
{
	printf(&quot;int �洢��С : %lu \n&quot;, sizeof(int));
	return 0;
}</code></pre></div>
      </div>
    </div>
    <p>������ Linux �ϱ��벢ִ������ĳ���ʱ������������н����</p>
    <pre>int �洢��С : 4 </pre>
    <hr />
    <h2>��������</h2>
    <p>�±��г��˹��ڱ�׼�������͵Ĵ洢��С��ֵ��Χ�;��ȵ�ϸ�ڣ�</p>
    <table border="1">
      <tbody>
        <tr>
          <th>����</th>
          <th>�洢��С</th>
          <th>ֵ��Χ</th>
          <th>����</th>
        </tr>
        <tr>
          <td>float</td>
          <td>4 �ֽ�</td>
          <td>1.2E-38 �� 3.4E+38</td>
          <td>6 λС��</td>
        </tr>
        <tr>
          <td>double</td>
          <td>8 �ֽ�</td>
          <td>2.3E-308 �� 1.7E+308</td>
          <td>15 λС��</td>
        </tr>
        <tr>
          <td>long double</td>
          <td>16 �ֽ�</td>
          <td>3.4E-4932 �� 1.1E+4932</td>
          <td>19 λС��</td>
        </tr>
      </tbody>
    </table>
    <p>ͷ�ļ� float.h �����˺꣬�ڳ����п���ʹ����Щֵ�������й�ʵ�������Ʊ�ʾ��ϸ�ڡ������ʵ���������������ռ�õĴ洢�ռ��Լ����ķ�Χֵ��</p>
    <div>
    <hr />
      <h2>ʵ��</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;float.h&gt;     
 
int main()  
{
     printf(&quot;float �洢����ֽ��� : %lu \n&quot;, sizeof(float));
     printf(&quot;float ��Сֵ: %E\n&quot;, FLT_MIN );
     printf(&quot;float ���ֵ: %E\n&quot;, FLT_MAX );
     printf(&quot;����ֵ: %d\n&quot;, FLT_DIG );
     return 0;  
}</code></pre></div>
      </div>
    </div>
    <p>������ Linux �ϱ��벢ִ������ĳ���ʱ������������н����</p>
    <pre>float �洢����ֽ��� : 4
float ��Сֵ: 1.175494E-38
float ���ֵ: 3.402823E+38
����ֵ: 6</pre>
<hr />
    <h2>void ����</h2>
    <p>void ����ָ��û�п��õ�ֵ����ͨ������������������£�</p>
    <table border="1">
      <tbody>
        <tr>
          <th>���</th>
          <th>����������</th>
        </tr>
        <tr>
          <td>1</td>
          <td><strong>��������Ϊ��</strong><br />
            C ���и��ֺ�����������ֵ������������˵���Ƿ��ؿա�������ֵ�ĺ����ķ�������Ϊ�ա����� <strong>void exit (int status);</strong></td>
        </tr>
        <tr>
          <td>2</td>
          <td><strong>��������Ϊ��</strong><br />
            C ���и��ֺ����������κβ��������������ĺ������Խ���һ�� void������ <strong>int rand(void);</strong></td>
        </tr>
        <tr>
          <td>3</td>
          <td><strong>ָ��ָ�� void</strong><br />
            ����Ϊ void * ��ָ��������ĵ�ַ�����������͡����磬�ڴ���亯�� <strong>void *malloc( size_t size );</strong> ����ָ�� void ��ָ�룬����ת��Ϊ�κ��������͡�</td>
        </tr>
      </tbody>
    </table>
    <p>��������������޷���ȫ��� void ���ͣ�����̫���ģ��ں������½������ǽ�����ϸ������Щ���</p>
    

    
</body>
</html>
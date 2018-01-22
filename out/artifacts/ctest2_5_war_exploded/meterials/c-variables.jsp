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


	
    <h1>C ����</h1>
    <div>
      <p>������ʵֻ�����ǳ���ɲ����Ĵ洢�������ơ�C ��ÿ�����������ض������ͣ����;����˱����洢�Ĵ�С�Ͳ��֣��÷�Χ�ڵ�ֵ�����Դ洢���ڴ��У��������Ӧ���ڱ����ϡ�</p>
      <p>���������ƿ�������ĸ�����ֺ��»����ַ���ɡ�����������ĸ���»��߿�ͷ����д��ĸ��Сд��ĸ�ǲ�ͬ�ģ���Ϊ C �Ǵ�Сд���еġ�����ǰһ�½���Ļ������ͣ������¼��ֻ����ı������ͣ�</p>
      <table border="1">
        <tbody>
          <tr>
            <th>����</th>
            <th>����</th>
          </tr>
          <tr>
            <td>char</td>
            <td>ͨ����һ���ֽڣ���λ��������һ���������͡�</td>
          </tr>
          <tr>
            <td>int</td>
            <td>�Ի������ԣ�����������Ȼ�Ĵ�С��</td>
          </tr>
          <tr>
            <td>float</td>
            <td>�����ȸ���ֵ��</td>
          </tr>
          <tr>
            <td>double</td>
            <td>˫���ȸ���ֵ��</td>
          </tr>
          <tr>
            <td>void</td>
            <td>��ʾ���͵�ȱʧ��</td>
          </tr>
        </tbody>
      </table>
      <br />
      <p>C ����Ҳ������������������͵ı���������ö�١�ָ�롢���顢�ṹ��������ȵȣ��⽫���ں������½��н��н��⣬���½������Ƚ�������������͡�</p>
    </div>
    <hr />
    <h2>C �еı�������</h2>
    <p>����������Ǹ��߱������ںδ����������Ĵ洢���Լ���δ��������Ĵ洢����������ָ��һ���������ͣ��������˸����͵�һ�������������б���������ʾ��</p>
    <pre>type variable_list;</pre>
    <p>�����<strong>type</strong> ������һ����Ч�� C �������ͣ������� char��w_char��int��float��double��bool ���κ��û��Զ���Ķ���<strong>variable_list</strong> ������һ��������ʶ��������ɣ������ʶ��֮���ö��ŷָ��������г�������Ч��������</p>
    <pre><code class="c">int    i, j, k;  
char   c, ch;  
float  f, salary;  
double d;</code></pre>
    <p>�� <strong>int i, j, k;</strong> �����������˱��� i��j �� k����ָʾ��������������Ϊ int ����Ϊ i��j��k �ı�����</p>
    <p>����������������ʱ�򱻳�ʼ����ָ��һ����ʼֵ������ʼ������һ���Ⱥţ����һ����������ʽ��ɣ�������ʾ��</p>
    <pre>type variable_name = value;</pre>
    <p>�����оټ���ʵ����</p>
    <pre><code class="c">extern int d = 3, f = 5;    // d �� f ���������ʼ��  
int d = 3, f = 5;           // ���岢��ʼ�� d �� f  
byte z = 22;                // ���岢��ʼ�� z  
char x = 'x';               // ���� x ��ֵΪ 'x'</code></pre>
    <p>������ʼ���Ķ��壺���о�̬�洢����ʱ��ı����ᱻ��ʽ��ʼ��Ϊ NULL�������ֽڵ�ֵ���� 0�����������б����ĳ�ʼֵ��δ����ġ�</p>
    <hr />
    <h2>C �еı�������</h2>
    <p>�����������������֤������ָ�������ͺ����ƴ��ڣ������������ڲ���Ҫ֪����������ϸ�ڵ������Ҳ�ܼ�����һ���ı��롣��������ֻ�ڱ���ʱ���������壬�ڳ�������ʱ��������Ҫʵ�ʵı���������</p>
    <p>���������������������</p>
    <ul>
      <li>1��һ������Ҫ�����洢�ռ�ġ����磺int a ��������ʱ����Ѿ������˴洢�ռ䡣</li>
      <li>2����һ���ǲ���Ҫ�����洢�ռ�ģ�ͨ��ʹ��extern�ؼ������������������������� ���磺extern int a ���б��� a �����ڱ���ļ��ж���ġ�</li>
      <li>������extern�ؼ��֣������Ǳ����Ķ��塣</li>
    </ul>
    <pre><code class="c">extern int i; //���������Ƕ��� 
int i; //������Ҳ�Ƕ���</code></pre>
<hr />
    <h3>ʵ��</h3>
    <p>���������ʵ�������У�������ͷ�����Ѿ������������Ƕ������ʼ�����������ڣ�</p>
    <div>
      <h2>ʵ��</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      
// ��������  
extern int a, b;  
extern int c;  
extern float f;     
int main ()
{    
    /* �������� */    
    int a, b;    
    int c;    
    float f;       
    /* ��ʼ�� */    
    a = 10;    
    b = 20;        
    c = a + b;    
    printf(&quot;value of c : %d \n&quot;, c);       
    f = 70.0/3.0;    
    printf(&quot;value of f : %f \n&quot;, f);       
    return 0;  
}</code></pre></div>
      </div>
    </div>
    <p>������Ĵ��뱻�����ִ��ʱ������������н����</p>
    <pre>value of c : 30  
value of f : 23.333334</pre>
    <hr />
    <h2>C �е���ֵ��Lvalues������ֵ��Rvalues��</h2>
    <p>C �����������͵ı���ʽ��</p>
    <ol>
      <li><strong>��ֵ��lvalue����</strong>ָ���ڴ�λ�õı���ʽ����Ϊ��ֵ��lvalue������ʽ����ֵ���Գ����ڸ�ֵ�ŵ���߻��ұߡ�</li>
      <li><strong>��ֵ��rvalue����</strong>������ֵ��rvalue��ָ���Ǵ洢���ڴ���ĳЩ��ַ����ֵ����ֵ�ǲ��ܶ�����и�ֵ�ı���ʽ��Ҳ����˵����ֵ���Գ����ڸ�ֵ�ŵ��ұߣ������ܳ����ڸ�ֵ�ŵ���ߡ�</li>
    </ol>
    <p>��������ֵ����˿��Գ����ڸ�ֵ�ŵ���ߡ���ֵ�͵�����ֵ����ֵ����˲��ܱ���ֵ�����ܳ����ڸ�ֵ�ŵ���ߡ�������һ����Ч����䣺</p>
    <pre><code class="c">int g = 20;</code></pre>
    <p>������������Ͳ���һ����Ч����䣬�����ɱ���ʱ����</p>
    <pre><code class="c">10 = 20;</code></pre>

    
</body>
</html>
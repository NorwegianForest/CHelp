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
      <p>�����ǹ̶�ֵ���ڳ���ִ���ڼ䲻��ı䡣��Щ�̶���ֵ���ֽ���<strong>������</strong>��</p>
      <p>�����������κεĻ����������ͣ������������������㳣�����ַ����������ַ�������ֵ��Ҳ��ö�ٳ�����</p>
      <p><strong>����</strong>�����ǳ���ı�����ֻ����������ֵ�ڶ�����ܽ����޸ġ�</p>
    </div>
    <hr />
    <h2>��������</h2>
    <p>��������������ʮ���ơ��˽��ƻ�ʮ�����Ƶĳ�����ǰ׺ָ��������0x �� 0X ��ʾʮ�����ƣ�0 ��ʾ�˽��ƣ�����ǰ׺��Ĭ�ϱ�ʾʮ���ơ�</p>
    <p>��������Ҳ���Դ�һ����׺����׺�� U �� L ����ϣ�U ��ʾ�޷���������unsigned����L ��ʾ��������long������׺�����Ǵ�д��Ҳ������Сд��U �� L ��˳�����⡣</p>
    <p>�����оټ�������������ʵ����</p>
    <pre><code class="c">212         /* �Ϸ��� */  
215u        /* �Ϸ��� */  
0xFeeL      /* �Ϸ��� */  
078         /* �Ƿ��ģ�8 ���ǰ˽��Ƶ����� */  
032UU       /* �Ƿ��ģ������ظ���׺ */</code></pre>
    <p>�����Ǹ������͵�����������ʵ����</p>
    <pre><code class="c">85         /* ʮ���� */  
0213       /* �˽��� */  
0x4b       /* ʮ������ */  
30         /* ���� */  
30u        /* �޷������� */  
30l        /* ������ */  
30ul       /* �޷��ų����� */</code></pre>
<hr />
    <h2>���㳣��</h2>
    <p>���㳣�����������֡�С���㡢С�����ֺ�ָ��������ɡ�������ʹ��С����ʽ����ָ����ʽ����ʾ���㳣����</p>
    <p>��ʹ��С����ʽ��ʾʱ����������������֡�С�����֣���ͬʱ�������ߡ���ʹ��ָ����ʽ��ʾʱ�� �������С���㡢ָ������ͬʱ�������ߡ������ŵ�ָ������ e �� E ����ġ�</p>
    <p>�����оټ������㳣����ʵ����</p>
    <pre><code class="c">3.14159       /* �Ϸ��� */  
314159E-5L    /* �Ϸ��� */  
510E          /* �Ƿ��ģ���������ָ�� */  
210f          /* �Ƿ��ģ�û��С����ָ�� */  
.e55          /* �Ƿ��ģ�ȱ����������� */</code></pre>
<hr />
    <h2>�ַ�����</h2>
    <p>�ַ����������ڵ������У����磬'x' ���Դ洢�� <strong>char</strong> ���͵ļ򵥱����С�</p>
    <p>�ַ�����������һ����ͨ���ַ������� 'x'����һ��ת�����У����� '\t'������һ��ͨ�õ��ַ������� '\u02C0'����</p>
    <p>�� C �У���һЩ�ض����ַ���������ǰ���з�б��ʱ�����Ǿ;�������ĺ��壬��������ʾ�绻�з���\n�����Ʊ����\t���ȡ��±��г���һЩ������ת�������룺</p>
    <table border="1">
      <tbody>
        <tr>
          <th>ת������</th>
          <th>����</th>
        </tr>
        <tr>
          <td>\\</td>
          <td>\ �ַ�</td>
        </tr>
        <tr>
          <td>\'</td>
          <td>' �ַ�</td>
        </tr>
        <tr>
          <td>\&quot;</td>
          <td>&quot; �ַ�</td>
        </tr>
        <tr>
          <td>\?</td>
          <td>? �ַ�</td>
        </tr>
        <tr>
          <td>\a</td>
          <td>��������</td>
        </tr>
        <tr>
          <td>\b</td>
          <td>�˸��</td>
        </tr>
        <tr>
          <td>\f</td>
          <td>��ҳ��</td>
        </tr>
        <tr>
          <td>\n</td>
          <td>���з�</td>
        </tr>
        <tr>
          <td>\r</td>
          <td>�س�</td>
        </tr>
        <tr>
          <td>\t</td>
          <td>ˮƽ�Ʊ��</td>
        </tr>
        <tr>
          <td>\v</td>
          <td>��ֱ�Ʊ��</td>
        </tr>
        <tr>
          <td>\ooo</td>
          <td>һ����λ�İ˽�����</td>
        </tr>
        <tr>
          <td>\xhh . . .</td>
          <td>һ���������ֵ�ʮ��������</td>
        </tr>
      </tbody>
    </table>
    <p>�����ʵ����ʾ��һЩת�������ַ���</p>
    <div>
    <hr />
      <h2>ʵ��</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      

int main()  
{     
    printf(&quot;Hello\tWorld\n\n&quot;);        
    return 0;  
}</code></pre></div>
      </div>
    </div>
    <p>������Ĵ��뱻�����ִ��ʱ������������н����</p>
    <pre>Hello   World  </pre>
    <hr />
    <h2>�ַ�������</h2>
    <p>�ַ�������ֵ����������˫���� &quot;&quot; �еġ�һ���ַ��������������ַ��������ַ�����ͨ���ַ���ת�����к�ͨ�õ��ַ���</p>
    <p>������ʹ�ÿո����ָ�������һ���ܳ����ַ����������з��С�</p>
    <p>�����ʵ����ʾ��һЩ�ַ���������������������ʽ����ʾ���ַ�������ͬ�ġ�</p>
    <pre><code class="c">&quot;hello, dear&quot;    
&quot;hello, \    
dear&quot;    
&quot;hello, &quot; &quot;d&quot; &quot;ear&quot;</code></pre>
<hr /> 
    <h2>���峣��</h2>
    <p>�� C �У������ּ򵥵Ķ��峣���ķ�ʽ��</p>
    <ol>
      <li>ʹ�� <strong>#define</strong> Ԥ��������</li>
      <li>ʹ�� <strong>const</strong> �ؼ��֡�</li>
    </ol>
    <h3>#define Ԥ������</h3>
    <p>������ʹ�� #define Ԥ���������峣������ʽ��</p>
    <pre><code class="c">#define identifier value</code></pre>
    <p>�����뿴�����ʵ����</p>
    <div>
    <hr />
      <h2>ʵ��</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      

#define LENGTH 10      
#define WIDTH  5   
#define NEWLINE '\n'      

int main()  
{        
    int area;           
    area = LENGTH * WIDTH;     
    printf(&quot;value of area : %d&quot;, area);     
    printf(&quot;%c&quot;, NEWLINE);        
    return 0;  
}</code></pre></div>
      </div>
    </div>
    <p>������Ĵ��뱻�����ִ��ʱ������������н����</p>
    <pre>value of area : 50</pre>
    <h3>const �ؼ���</h3>
    <p>������ʹ�� <strong>const</strong> ǰ׺����ָ�����͵ĳ�����������ʾ��</p>
    <pre><code class="c">const type variable = value;</code></pre>
    <p>�����뿴�����ʵ����</p>
    <div>
    <hr />
      <h2>ʵ��</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      

int main()  
{     
    const int  LENGTH = 10;     
    const int  WIDTH  = 5;     
    const char NEWLINE = '\n';     
    int area;            
    area = LENGTH * WIDTH;     
    printf(&quot;value of area : %d&quot;, area);     
    printf(&quot;%c&quot;, NEWLINE);        
    return 0;  
}</code></pre></div>
      </div>
    </div>
    <p>������Ĵ��뱻�����ִ��ʱ������������н����</p>
    <pre>value of area : 50</pre>
    <p>��ע�⣬�ѳ�������Ϊ��д��ĸ��ʽ����һ���ܺõı��ʵ����</p>
    

    
</body>
</html>
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


	
    <h1>C �洢��</h1>
    <div>
      <p>�洢�ඨ�� C �����б���/�����ķ�Χ���ɼ��ԣ����������ڡ���Щ˵�������������������ε�����֮ǰ�������г� C �����п��õĴ洢�ࣺ</p>
      <ul>
        <li>auto</li>
        <li>register</li>
        <li>static</li>
        <li>extern</li>
      </ul>
    </div>
    <hr />
    <h2>auto �洢��</h2>
    <p><strong>auto</strong> �洢�������оֲ�����Ĭ�ϵĴ洢�ࡣ</p>
    <pre><code class="c">{     
    int mount;     
    auto int month;  
}</code></pre>
    <p>�����ʵ������������������ͬ�洢��ı�����auto ֻ�����ں����ڣ��� auto ֻ�����ξֲ�������</p>
	<hr />
    <h2>register �洢��</h2>
    <p><strong>register</strong> �洢�����ڶ���洢�ڼĴ����ж����� RAM �еľֲ�����������ζ�ű��������ߴ���ڼĴ����Ĵ�С��ͨ����һ���ʣ����Ҳ��ܶ���Ӧ��һԪ�� '&amp;' ���������Ϊ��û���ڴ�λ�ã���</p>
    <pre><code class="c">{     
    register int  miles;  
}</code></pre>
    <p>�Ĵ���ֻ������Ҫ���ٷ��ʵı������������������Ӧע����ǣ����� 'register' ������ζ�ű��������洢�ڼĴ����У�����ζ�ű������ܴ洢�ڼĴ����У���ȡ����Ӳ����ʵ�ֵ����ơ�</p>
	<hr />
    <h2>static �洢��</h2>
    <p><strong>static</strong> �洢��ָʾ�������ڳ�������������ڱ��־ֲ������Ĵ��ڣ�������Ҫ��ÿ����������뿪������ʱ���д��������١���ˣ�ʹ�� static ���ξֲ����������ں�������֮�䱣�־ֲ�������ֵ��</p>
    <p>static ���η�Ҳ����Ӧ����ȫ�ֱ������� static ����ȫ�ֱ���ʱ����ʹ���������������������������ļ��ڡ�</p>
    <p>static ��ȫ�ֱ�����Ĭ�ϴ洢�࣬������������ (count �� road) ����һ�� static �洢�ࡣ</p>
    <pre><code class="c">static int Count;  
int Road;    

main()  
{      
    printf(&quot;%d\n&quot;, Count);      
    printf(&quot;%d\n&quot;, Road);   
}</code></pre>
    <p>����ʵ����ʾ�� static ����ȫ�ֱ����;ֲ�������Ӧ�ã�</p>
    <div>
    <hr />
      <h2>ʵ��</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      

/* �������� */  
void func1(void);   
  
static int count=10;        /* ȫ�ֱ��� - static ��Ĭ�ϵ� */     

int main()  
{    
    while (count--) 
    {        
        func1();    
    }    
    return 0;  
}     

void func1(void)  
{  
    /* 'thingy' �� 'func1' �ľֲ����� - ֻ��ʼ��һ��  
     * ÿ�ε��ú��� 'func1' 'thingy' ֵ���ᱻ���á�   */                    
    static int thingy=5;    
    thingy++;    
    printf(&quot; thingy Ϊ %d �� count Ϊ %d\n&quot;, thingy, count);  
}</code></pre></div>
      </div>
    </div>
    <p>ʵ���� count ��Ϊȫ�ֱ��������ں�����ʹ�ã�thingy ʹ�� static ���κ󣬲�����ÿ�ε���ʱ���á�</p>
    <p>���������ڻ��޷�������ʵ������Ϊ���Ѿ�ʹ���˺�����ȫ�ֱ���������������ĿǰΪֹ��û���н��⡣��ʹ�����ڲ�����ȫ��⣬Ҳû�й�ϵ���������½����ǻ���ϸ���⡣������Ĵ��뱻�����ִ��ʱ������������н����</p>
    <pre>thingy Ϊ 6 �� count Ϊ 9   
thingy Ϊ 7 �� count Ϊ 8   
thingy Ϊ 8 �� count Ϊ 7   
thingy Ϊ 9 �� count Ϊ 6   
thingy Ϊ 10 �� count Ϊ 5   
thingy Ϊ 11 �� count Ϊ 4   
thingy Ϊ 12 �� count Ϊ 3   
thingy Ϊ 13 �� count Ϊ 2   
thingy Ϊ 14 �� count Ϊ 1   
thingy Ϊ 15 �� count Ϊ 0</pre>
 	<hr />
    <h2>extern �洢��</h2>
    <p><strong>extern</strong> �洢�������ṩһ��ȫ�ֱ��������ã�ȫ�ֱ��������еĳ����ļ����ǿɼ��ġ�����ʹ�� 'extern' ʱ�������޷���ʼ���ı�������ѱ�����ָ��һ��֮ǰ������Ĵ洢λ�á�</p>
    <p>�����ж���ļ��Ҷ�����һ�������������ļ���ʹ�õ�ȫ�ֱ�������ʱ�������������ļ���ʹ�� <em>extern</em> ���õ��Ѷ���ı������������á�������ô��⣬<em>extern</em> ����������һ���ļ�������һ��ȫ�ֱ���������</p>
    <p>extern ���η�ͨ�����ڵ������������ļ�������ͬ��ȫ�ֱ���������ʱ��������ʾ��</p>
    <p><strong>��һ���ļ���main.c</strong></p>
    <div>
    <hr />
      <h2>ʵ��</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      

int count;  
extern void write_extern();     

main()  
{     
    count = 5;     
    write_extern();  
}</code></pre></div>
      </div>
    </div>
    <p><strong>�ڶ����ļ���support.c</strong></p>
    <div>
    <hr />
      <h2>ʵ��</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      
        
extern int count;     
void write_extern(void)  
{     
    printf(&quot;count is %d\n&quot;, count);  
}</code></pre></div>
      </div>
    </div>
    <p>������ڶ����ļ��е� <em>extern</em> �ؼ������������Ѿ��ڵ�һ���ļ� main.c �ж���� <em>count</em>������ �������������ļ���������ʾ��</p>
    <pre> $ gcc main.c support.c</pre>
    <p>������ <strong>a.out</strong> ��ִ�г��򣬵�����ִ��ʱ������������н����</p>
    <pre>count is 5</pre>
    

    
</body>
</html>
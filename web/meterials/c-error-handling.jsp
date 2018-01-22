<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../highlight/styles/default.css" rel="stylesheet">   
<title>C 语言教程 | C Help</title>
</head>
<body>
<script src="../highlight/highlight.pack.js"></script>  
<script >hljs.initHighlightingOnLoad();</script>


<h1>C 错误处理</h1>
<div>
  <p>C 语言不提供对错误处理的直接支持，但是作为一种系统编程语言，它以返回值的形式允许您访问底层数据。在发生错误时，大多数的 C 或 UNIX 函数调用返回 1 或 NULL，同时会设置一个错误代码 <strong>errno</strong>，该错误代码是全局变量，表示在函数调用期间发生了错误。您可以在 &lt;error.h&gt; 头文件中找到各种各样的错误代码。</p>
  <p>所以，C 程序员可以通过检查返回值，然后根据返回值决定采取哪种适当的动作。开发人员应该在程序初始化时，把 errno 设置为 0，这是一种良好的编程习惯。0 值表示程序中没有错误。</p>
</div>
<hr>
<h2>errno、perror() 和 strerror()</h2>
<p>C 语言提供了 <strong>perror()</strong> 和 <strong>strerror()</strong> 函数来显示与 <strong>errno</strong> 相关的文本消息。</p>
<ul>
  <li><strong>perror()</strong> 函数显示您传给它的字符串，后跟一个冒号、一个空格和当前 errno 值的文本表示形式。</li>
  <li><strong>strerror()</strong> 函数，返回一个指针，指针指向当前 errno 值的文本表示形式。</li>
</ul>
<p>让我们来模拟一种错误情况，尝试打开一个不存在的文件。您可以使用多种方式来输出错误消息，在这里我们使用函数来演示用法。另外有一点需要注意，您应该使用 <strong>stderr</strong> 文件流来输出所有的错误。</p>
<pre><code class="c">#include &lt;stdio.h&gt;  
#include &lt;errno.h&gt;  
#include &lt;string.h&gt;    

extern int errno ;    

int main ()  
{     
    FILE * pf;    
    int errnum;     
    pf = fopen (&quot;unexist.txt&quot;, &quot;rb&quot;);     
    if (pf == NULL)     
    {        
        errnum = errno;        
        fprintf(stderr, &quot;错误号: %d\n&quot;, errno);        
        perror(&quot;通过 perror 输出错误&quot;);        
        fprintf(stderr, &quot;打开文件错误: %s\n&quot;, strerror( errnum ));     
    }     
    else     
    {        
        fclose (pf);     
    }     
    
    return 0;  
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>错误号: 2  通过 perror 输出错误: No such file or directory  打开文件错误: No such file or directory</pre>
<hr>
<h2>被零除的错误</h2>
<p>在进行除法运算时，如果不检查除数是否为零，则会导致一个运行时错误。</p>
<p>为了避免这种情况发生，下面的代码在进行除法运算前会先检查除数是否为零：</p>
<pre><code class="c">#include &lt;stdio.h&gt;  
#include &lt;stdlib.h&gt;    

main()  
{     
    int dividend = 20;     
    int divisor = 0;     
    int quotient;        
    if( divisor == 0)
    {        
        fprintf(stderr, &quot;除数为 0 退出运行...\n&quot;);        
        exit(-1);     
    }     
    quotient = dividend / divisor;     
    fprintf(stderr, &quot;quotient 变量的值为 : %d\n&quot;, quotient );       
    exit(0);  
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>除数为 0 退出运行...</pre>
<hr>
<h2>程序退出状态</h2>
<p>通常情况下，程序成功执行完一个操作正常退出的时候会带有值 EXIT_SUCCESS。在这里，EXIT_SUCCESS 是宏，它被定义为 0。</p>
<p>如果程序中存在一种错误情况，当您退出程序时，会带有状态值 EXIT_FAILURE，被定义为 -1。所以，上面的程序可以写成：</p>
<pre><code class="c">#include &lt;stdio.h&gt;  
#include &lt;stdlib.h&gt;    
main()  
{     
    int dividend = 20;     
    int divisor = 5;     
    int quotient;        
    if( divisor == 0)
    {        
        fprintf(stderr, &quot;除数为 0 退出运行...\n&quot;);        
        exit(EXIT_FAILURE);     
    }     
    quotient = dividend / divisor;     
    fprintf(stderr, &quot;quotient 变量的值为: %d\n&quot;, quotient );       
    exit(EXIT_SUCCESS);  
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>quotient 变量的值为 : 4</pre>	  
	  
	  
	 
</body>
</html>
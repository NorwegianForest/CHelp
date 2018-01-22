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


<h1>C 共用体</h1>
<p><strong>共用体</strong>是一种特殊的数据类型，允许您在相同的内存位置存储不同的数据类型。您可以定义一个带有多成员的共用体，但是任何时候只能有一个成员带有值。共用体提供了一种使用相同的内存位置的有效方式。</p>
<h2>定义共用体</h2>
<p>为了定义共用体，您必须使用 <strong>union</strong> 语句，方式与定义结构类似。union 语句定义了一个新的数据类型，带有多个成员。union 语句的格式如下：</p>
<div>
  <div>
    <div><pre><code class="c">union [union tag]  
{     
    member definition;     
    member definition;     
    ...     
    member definition;  
} [one or more union variables];</code></pre></div>
  </div>
</div>
<p><strong>union tag</strong> 是可选的，每个 member definition 是标准的变量定义，比如 int i; 或者 float f; 或者其他有效的变量定义。在共用体定义的末尾，最后一个分号之前，您可以指定一个或多个共用体变量，这是可选的。下面定义一个名为 Data 的共用体类型，有三个成员 i、f 和 str：</p>
<div>
  <div>
    <div><pre><code class="c">union Data  
{     
    int i;     
    float f;     
    char  str[20]; 
} data;</code></pre></div>
  </div>
</div>
<p>现在，<strong>Data</strong> 类型的变量可以存储一个整数、一个浮点数，或者一个字符串。这意味着一个变量（相同的内存位置）可以存储多个多种类型的数据。您可以根据需要在一个共用体内使用任何内置的或者用户自定义的数据类型。</p>
<p>共用体占用的内存应足够存储共用体中最大的成员。例如，在上面的实例中，Data 将占用 20 个字节的内存空间，因为在各个成员中，字符串所占用的空间是最大的。下面的实例将显示上面的共用体占用的总内存大小：</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;string.h&gt;      

union Data  
{     
    int i;     
    float f;     
    char  
    str[20];  
};     

int main( )  
{     
    union Data data;                
    printf( &quot;Memory size occupied by data : %d\n&quot;, sizeof(data));        
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Memory size occupied by data : 20</pre>
<hr>
<h2>访问共用体成员</h2>
<p>为了访问共用体的成员，我们使用<strong>成员访问运算符（.）</strong>。成员访问运算符是共用体变量名称和我们要访问的共用体成员之间的一个句号。您可以使用 <strong>union</strong> 关键字来定义共用体类型的变量。下面的实例演示了共用体的用法：</p>
<hr>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;string.h&gt;  
    
union Data  
{     
    int i;     
    float f;     
    char  str[20];  
};     

int main( )  
{     
    union Data data;                
    data.i = 10;     
    data.f = 220.5;     
    strcpy( data.str, &quot;C Programming&quot;);        
    printf( &quot;data.i : %d\n&quot;, data.i);     
    printf( &quot;data.f : %f\n&quot;, data.f);     
    printf( &quot;data.str : %s\n&quot;, data.str);        
    
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>data.i : 1917853763  data.f : 4122360580327794860452759994368.000000  data.str : C Programming</pre>
<p>在这里，我们可以看到共用体的 <strong>i</strong> 和 <strong>f</strong> 成员的值有损坏，因为最后赋给变量的值占用了内存位置，这也是 <strong>str</strong> 成员能够完好输出的原因。现在让我们再来看一个相同的实例，这次我们在同一时间只使用一个变量，这也演示了使用共用体的主要目的：</p>

<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;string.h&gt;      

union Data  
{     
    int i;     
    float f;     
    char  str[20];  
};     

int main( )  
{     
    union Data data;                
    data.i = 10;     
    printf( &quot;data.i : %d\n&quot;, data.i);          
    data.f = 220.5;     
    printf( &quot;data.f : %f\n&quot;, data.f);          
    strcpy( data.str, &quot;C Programming&quot;);     
    printf( &quot;data.str : %s\n&quot;, data.str);        
    
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>data.i : 10  data.f : 220.500000  data.str : C Programming</pre>
<p>在这里，所有的成员都能完好输出，因为同一时间只用到一个成员。</p>	  
	  
	  

</body>
</html>
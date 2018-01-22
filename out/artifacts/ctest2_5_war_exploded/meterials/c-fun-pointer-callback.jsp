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


	  
<h2>函数指针</h2>
<p>函数指针是指向函数的指针变量。</p>
<p>通常我们说的指针变量是指向一个整型、字符型或数组等变量，而函数指针是指向函数。</p>
<p>函数指针可以像一般函数一样，用于调用函数、传递参数。</p>
<p>函数指针变量的声明：</p>
<pre><code class="c">typedef int (*fun_ptr)(int,int); // 声明一个指向同样参数、返回值的函数指针类型</code></pre>
<h3>实例</h3>
<p>以下实例声明了函数指针变量 p，指向函数 max：</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;      
    
int max(int x, int y)  
{      
    return x &gt; y ? x : y;  
}     

int main(void)  
{      
    /* p 是函数指针 */      
    int (* p)(int, int) = &amp; max; // &amp;可以省略       int a, b, c, d;         
    printf(&quot;请输入三个数字:&quot;);      
    scanf(&quot;%d %d %d&quot;, &amp; a, &amp; b, &amp; c);         
    /* 与直接调用函数等价，d = max(max(a, b), c) */      
    d = p(p(a, b), c);          
    printf(&quot;最大的数字是: %d\n&quot;, d);         
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>编译执行，输出结果如下：</p>
<pre>请输入三个数字:1 2 3  最大的数字是: 3</pre>
<hr />
<hr>
<h2>回调函数</h2>
<h3>函数指针作为某个函数的参数</h3>
<p>函数指针变量可以作为某个函数的参数来使用的，回调函数就是一个通过函数指针调用的函数。</p>
<p>简单讲：回调函数是由别人的函数执行时调用你实现的函数。</p>
<blockquote>
  <p>以下是自知乎作者常溪玲的解说：</p>
  <p>你到一个商店买东西，刚好你要的东西没有货，于是你在店员那里留下了你的电话，过了几天店里有货了，店员就打了你的电话，然后你接到电话后就到店里去取了货。在这个例子里，你的电话号码就叫回调函数，你把电话留给店员就叫登记回调函数，店里后来有货了叫做触发了回调关联的事件，店员给你打电话叫做调用回调函数，你到店里去取货叫做响应回调事件。</p>
</blockquote>
<h3>实例</h3>
<p>实例中 populate_array 函数定义了三个参数，其中第三个参数是函数的指针，通过该函数来设置数组的值。</p>
<p>实例中我们定义了回调函数 getNextRandomValue，它返回一个随机值，它作为一个函数指针传递给 populate_array 函数。</p>
<p>populate_array 将调用 10 次回调函数，并将回调函数的返回值赋值给数组。</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdlib.h&gt;     
#include &lt;stdio.h&gt;      

// 回调函数   
void populate_array(int *array, size_t arraySize, int (*getNextValue)(void))  
{      
    for (size_t i=0; i&lt;arraySize; i++)          
        array[i] = getNextValue();  
}     

// 获取随机值   int getNextRandomValue(void)  
{      
    return rand();  
}     

int main(void)  
{      
    int myarray[10];      
    populate_array(myarray, 10, getNextRandomValue);      
    for(int i = 0; i &lt; 10; i++) 
    {          
        printf(&quot;%d &quot;, myarray[i]);      
    }      
    printf(&quot;\n&quot;);      
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>编译执行，输出结果如下：</p>
<pre>16807 282475249 1622650073 984943658 1144108930 470211272 101027544 1457850878 1458777923 2007237709 </pre>	  
	  

</body>
</html>
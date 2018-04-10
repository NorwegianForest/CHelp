<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<h1>C 位域</h1>
<p>如果程序的结构中包含多个开关量，只有 TRUE/FALSE 变量，如下：</p>
<pre><code class="c">struct  
{    
    unsigned int widthValidated;    
    unsigned int heightValidated;  
} status;</code></pre>
<p>这种结构需要 8 字节的内存空间，但在实际上，在每个变量中，我们只存储 0 或 1。在这种情况下，C 语言提供了一种更好的利用内存空间的方式。如果您在结构内使用这样的变量，您可以定义变量的宽度来告诉编译器，您将只使用这些字节。例如，上面的结构可以重写成：</p>
<pre><code class="c">struct  
{    
    unsigned int widthValidated : 1;    
    unsigned int heightValidated : 1;  
} status;</code></pre>
<p>现在，上面的结构中，status 变量将占用 4 个字节的内存空间，但是只有 2 位被用来存储值。如果您用了 32 个变量，每一个变量宽度为 1 位，那么 status 结构将使用 4 个字节，但只要您再多用一个变量，如果使用了 33 个变量，那么它将分配内存的下一段来存储第 33 个变量，这个时候就开始使用 8 个字节。让我们看看下面的实例来理解这个概念：</p>
<pre><code class="c">#include &lt;stdio.h&gt;  
#include &lt;string.h&gt;    

/* 定义简单的结构 */  
struct  
{    
    unsigned int widthValidated;    
    unsigned int heightValidated;  
} status1;    

/* 定义位域结构 */  
struct  
{    
    unsigned int widthValidated : 1;    
    unsigned int heightValidated : 1;  
} status2;     

int main( )  
{     
    printf( &quot;Memory size occupied by status1 : %d\n&quot;, sizeof(status1));     
    printf( &quot;Memory size occupied by status2 : %d\n&quot;, sizeof(status2));       
    
    return 0;  
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Memory size occupied by status1 : 8  Memory size occupied by status2 : 4</pre>
<hr>
<h2>位域声明</h2>
<p>在结构内声明位域的形式如下：</p>
<pre><code class="c">struct  
{    
    type [member_name] : width ;  
};</code></pre>
<p>下面是有关位域中变量元素的描述：</p>
<table border=1>
  <tbody>
    <tr>
      <th>元素</th>
      <th>描述</th>
    </tr>
    <tr>
      <td>type</td>
      <td>整数类型，决定了如何解释位域的值。类型可以是整型、有符号整型、无符号整型。</td>
    </tr>
    <tr>
      <td>member_name</td>
      <td>位域的名称。</td>
    </tr>
    <tr>
      <td>width</td>
      <td>位域中位的数量。宽度必须小于或等于指定类型的位宽度。</td>
    </tr>
  </tbody>
</table>
<p>带有预定义宽度的变量被称为<strong>位域</strong>。位域可以存储多于 1 位的数，例如，需要一个变量来存储从 0 到 7 的值，您可以定义一个宽度为 3 位的位域，如下：</p>
<pre><code class="c">struct  
{    
    unsigned int age : 3;  
} Age;</code></pre>
<p>上面的结构定义指示 C 编译器，age 变量将只使用 3 位来存储这个值，如果您试图使用超过 3 位，则无法完成。让我们来看下面的实例：</p>
<pre><code class="c">#include &lt;stdio.h&gt;  
#include &lt;string.h&gt;    

struct  
{    
    unsigned int age : 3;  
} Age;    

int main( )  
{     
    Age.age = 4;     
    printf( &quot;Sizeof( Age ) : %d\n&quot;, sizeof(Age) );    
    printf( &quot;Age.age : %d\n&quot;, Age.age );       
    Age.age = 7;     
    printf( &quot;Age.age : %d\n&quot;, Age.age );       
    Age.age = 8;     
    printf( &quot;Age.age : %d\n&quot;, Age.age );       
    
    return 0;  
}</code></pre>
<p>当上面的代码被编译时，它会带有警告，当上面的代码被执行时，它会产生下列结果：</p>
<pre>Sizeof( Age ) : 4  
Age.age : 4  
Age.age : 7  
Age.age : 0</pre>	  

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<h1>C typedef</h1>
<p>C 语言提供了 <strong>typedef</strong> 关键字，您可以使用它来为类型取一个新的名字。下面的实例为单字节数字定义了一个术语 <strong>BYTE</strong>：</p>
<pre>typedef unsigned char BYTE;</pre>
<p>在这个类型定义之后，标识符 BYTE 可作为类型 <strong>unsigned char</strong> 的缩写，例如：</p>
<pre><code class="c">BYTE  b1, b2;</code></pre>
<p>按照惯例，定义时会大写字母，以便提醒用户类型名称是一个象征性的缩写，但您也可以使用小写字母，如下：</p>
<pre><code class="c">typedef unsigned char byte;</code></pre>
<p>您也可以使用 <strong>typedef</strong> 来为用户自定义的数据类型取一个新的名字。例如，您可以对结构体使用 typedef 来定义一个新的数据类型名字，然后使用这个新的数据类型来直接定义结构变量，如下：</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;string.h&gt;      

typedef struct Books  
{     
    char  title[50];     
    char  author[50];     
    char  subject[100];     
    int   book_id;  
} Book;     

int main( )  
{     
    Book book;       
    strcpy( book.title, &quot;C 教程&quot;);     
    strcpy( book.author, &quot;Runoob&quot;);      
    strcpy( book.subject, &quot;编程语言&quot;);     
    book.book_id = 12345;        
    printf( &quot;书标题 : %s\n&quot;, book.title);     
    printf( &quot;书作者 : %s\n&quot;, book.author);     
    printf( &quot;书类目 : %s\n&quot;, book.subject);     
    printf( &quot;书 ID : %d\n&quot;, book.book_id);        
    
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>书标题 : C 教程  书作者 : Runoob  书类目 : 编程语言  书 ID : 12345</pre>
<hr>
<h2>typedef vs #define</h2>
<p><strong>#define</strong> 是 C 指令，用于为各种数据类型定义别名，与 <strong>typedef</strong> 类似，但是它们有以下几点不同：</p>
<ul>
  <li><strong>typedef</strong> 仅限于为类型定义符号名称，<strong>#define</strong> 不仅可以为类型定义别名，也能为数值定义别名，比如您可以定义 1 为 ONE。</li>
  <li><strong>typedef</strong> 是由编译器执行解释的，<strong>#define</strong> 语句是由预编译器进行处理的。</li>
</ul>
<p>下面是 #define 的最简单的用法：</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;    
      
#define TRUE  1   
#define FALSE 0      

int main( )  
{     
    printf( &quot;TRUE 的值: %d\n&quot;, TRUE);     
    printf( &quot;FALSE 的值: %d\n&quot;, FALSE);        
    
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>TRUE 的值: 1  FALSE 的值: 0</pre>	  

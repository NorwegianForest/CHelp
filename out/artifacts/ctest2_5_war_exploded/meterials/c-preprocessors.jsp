<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<h1>C 预处理器</h1>
<div>
  <p><strong>C 预处理器</strong>不是编译器的组成部分，但是它是编译过程中一个单独的步骤。简言之，C 预处理器只不过是一个文本替换工具而已，它们会指示编译器在实际编译之前完成所需的预处理。我们将把 C 预处理器（C Preprocessor）简写为 CPP。</p>
  <p>所有的预处理器命令都是以井号（#）开头。它必须是第一个非空字符，为了增强可读性，预处理器指令应从第一列开始。下面列出了所有重要的预处理器指令：</p>
  <table border=1>
    <tbody>
      <tr>
        <th>指令</th>
        <th>描述</th>
      </tr>
      <tr>
        <td>#define</td>
        <td>定义宏</td>
      </tr>
      <tr>
        <td>#include</td>
        <td>包含一个源代码文件</td>
      </tr>
      <tr>
        <td>#undef</td>
        <td>取消已定义的宏</td>
      </tr>
      <tr>
        <td>#ifdef</td>
        <td>如果宏已经定义，则返回真</td>
      </tr>
      <tr>
        <td>#ifndef</td>
        <td>如果宏没有定义，则返回真</td>
      </tr>
      <tr>
        <td>#if</td>
        <td>如果给定条件为真，则编译下面代码</td>
      </tr>
      <tr>
        <td>#else</td>
        <td>#if 的替代方案</td>
      </tr>
      <tr>
        <td>#elif</td>
        <td>如果前面的 #if 给定条件不为真，当前条件为真，则编译下面代码</td>
      </tr>
      <tr>
        <td>#endif</td>
        <td>结束一个 #if……#else 条件编译块</td>
      </tr>
      <tr>
        <td>#error</td>
        <td>当遇到标准错误时，输出错误消息</td>
      </tr>
      <tr>
        <td>#pragma</td>
        <td>使用标准化方法，向编译器发布特殊的命令到编译器中</td>
      </tr>
    </tbody>
  </table>
</div>
<br />
<hr>
<h2>预处理器实例</h2>
<p>分析下面的实例来理解不同的指令。</p>
<pre><code class="c">#define MAX_ARRAY_LENGTH 20</code></pre>
<p>这个指令告诉 CPP 把所有的 MAX_ARRAY_LENGTH 替换为 20。使用 <em>#define</em> 定义常量来增强可读性。</p>
<pre><code class="c">#include &lt;stdio.h&gt;  
#include &quot;myheader.h&quot;</code></pre>
<p>这些指令告诉 CPP 从<strong>系统库</strong>中获取 stdio.h，并添加文本到当前的源文件中。下一行告诉 CPP 从本地目录中获取 <strong>myheader.h</strong>，并添加内容到当前的源文件中。</p>
<pre><code class="c">#undef  FILE_SIZE  
#define FILE_SIZE 42</code></pre>
<p>这个指令告诉 CPP 取消已定义的 FILE_SIZE，并定义它为 42。</p>
<pre><code class="c">#ifndef MESSAGE     
#define MESSAGE &quot;You wish!&quot;  
#endif</code></pre>
<p>这个指令告诉 CPP 只有当 MESSAGE 未定义时，才定义 MESSAGE。</p>
<pre><code class="c">#ifdef DEBUG     
/* Your debugging statements here */  
#endif</code></pre>
<p>这个指令告诉 CPP 如果定义了 DEBUG，则执行处理语句。在编译时，如果您向 gcc 编译器传递了 <em>-DDEBUG</em> 开关量，这个指令就非常有用。它定义了 DEBUG，您可以在编译期间随时开启或关闭调试。</p>
<hr>
<h2>预定义宏</h2>
<p>ANSI C 定义了许多宏。在编程中您可以使用这些宏，但是不能直接修改这些预定义的宏。</p>
<table border=1>
  <tbody>
    <tr>
      <th>宏</th>
      <th>描述</th>
    </tr>
    <tr>
      <td>__DATE__</td>
      <td>当前日期，一个以 &quot;MMM DD YYYY&quot; 格式表示的字符常量。</td>
    </tr>
    <tr>
      <td>__TIME__</td>
      <td>当前时间，一个以 &quot;HH:MM:SS&quot; 格式表示的字符常量。</td>
    </tr>
    <tr>
      <td>__FILE__</td>
      <td>这会包含当前文件名，一个字符串常量。</td>
    </tr>
    <tr>
      <td>__LINE__</td>
      <td>这会包含当前行号，一个十进制常量。</td>
    </tr>
    <tr>
      <td>__STDC__</td>
      <td>当编译器以 ANSI 标准编译时，则定义为 1。</td>
    </tr>
  </tbody>
</table>
<p>让我们来尝试下面的实例：</p>
<pre><code class="c">#include &lt;stdio.h&gt;    

main()  
{     
    printf(&quot;File :%s\n&quot;, __FILE__ );     
    printf(&quot;Date :%s\n&quot;, __DATE__ );     
    printf(&quot;Time :%s\n&quot;, __TIME__ );     
    printf(&quot;Line :%d\n&quot;, __LINE__ );     
    printf(&quot;ANSI :%d\n&quot;, __STDC__ );    
}</code></pre>
<p>当上面的代码（在文件 <strong>test.c</strong> 中）被编译和执行时，它会产生下列结果：</p>
<pre>File :test.c  Date :Jun 2 2012  Time :03:36:24  Line :8  ANSI :1</pre>
<hr>
<h2>预处理器运算符</h2>
<p>C 预处理器提供了下列的运算符来帮助您创建宏：</p>
<h5>宏延续运算符（\）</h5>
<p>一个宏通常写在一个单行上。但是如果宏太长，一个单行容纳不下，则使用宏延续运算符（\）。例如：</p>
<pre><code class="c">#define  message_for(a, b)  \      
printf(#a &quot; and &quot; #b &quot;: We love you!\n&quot;)  </code></pre>
<h5>字符串常量化运算符（#）</h5>
<p>在宏定义中，当需要把一个宏的参数转换为字符串常量时，则使用字符串常量化运算符（#）。在宏中使用的该运算符有一个特定的参数或参数列表。例如：</p>
<pre><code class="c">#include &lt;stdio.h&gt;    
#define  message_for(a, b)  \      

printf(#a &quot; and &quot; #b &quot;: We love you!\n&quot;)    

int main(void)  
{    
    message_for(Carole, Debra);     
    
    return 0;  
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Carole and Debra: We love you!</pre>
<h5>标记粘贴运算符（##）</h5>
<p>宏定义内的标记粘贴运算符（##）会合并两个参数。它允许在宏定义中两个独立的标记被合并为一个标记。例如：</p>
<pre><code class="c">#include &lt;stdio.h&gt;    
#define tokenpaster(n) 
printf (&quot;token&quot; #n &quot; = %d&quot;, token##n)    
int main(void)  
{     
    int token34 = 40;          
    tokenpaster(34);     
    
    return 0;  
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>token34 = 40</pre>
<p>这是怎么发生的，因为这个实例会从编译器产生下列的实际输出：</p>
<pre><code class="c">printf (&quot;token34 = %d&quot;, token34);</code></pre>
<p>这个实例演示了 token##n 会连接到 token34 中，在这里，我们使用了<strong>字符串常量化运算符（#）</strong>和<strong>标记粘贴运算符（##）</strong>。</p>
<h5>defined() 运算符</h5>
<p>预处理器 <strong>defined</strong> 运算符是用在常量表达式中的，用来确定一个标识符是否已经使用 #define 定义过。如果指定的标识符已定义，则值为真（非零）。如果指定的标识符未定义，则值为假（零）。下面的实例演示了 defined() 运算符的用法：</p>
<pre><code class="c">#include &lt;stdio.h&gt;    
#if !defined (MESSAGE)     
#define MESSAGE &quot;You wish!&quot;  
#endif    

int main(void)  
{     
    printf(&quot;Here is the message: %s\n&quot;, MESSAGE);       
    
    return 0;  
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Here is the message: You wish!</pre>
<hr>
<h2>参数化的宏</h2>
<p>CPP 一个强大的功能是可以使用参数化的宏来模拟函数。例如，下面的代码是计算一个数的平方：</p>
<pre><code class="c">int square(int x) 
{     
    return x * x;  
}</code></pre>
<p>我们可以使用宏重写上面的代码，如下：</p>
<pre><code class="c">#define square(x) ((x) * (x))</code></pre>
<p>在使用带有参数的宏之前，必须使用 <strong>#define</strong> 指令定义。参数列表是括在圆括号内，且必须紧跟在宏名称的后边。宏名称和左圆括号之间不允许有空格。例如：</p>
<pre><code class="c">#include &lt;stdio.h&gt;    

#define MAX(x,y) ((x) &gt; (y) ? (x) : (y))    

int main(void)  
{     
    printf(&quot;Max between 20 and 10 is %d\n&quot;, MAX(10, 20));       
    
    return 0;  
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Max between 20 and 10 is 20</pre>	  

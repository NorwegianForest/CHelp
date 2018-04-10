<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<h1>C 输入 &amp; 输出</h1>
<div>
  <p>当我们提到<strong>输入</strong>时，这意味着要向程序填充一些数据。输入可以是以文件的形式或从命令行中进行。C 语言提供了一系列内置的函数来读取给定的输入，并根据需要填充到程序中。</p>
  <p>当我们提到<strong>输出</strong>时，这意味着要在屏幕上、打印机上或任意文件中显示一些数据。C 语言提供了一系列内置的函数来输出数据到计算机屏幕上和保存数据到文本文件或二进制文件中。</p>
</div>
<hr>
<h2>标准文件</h2>
<p>C 语言把所有的设备都当作文件。所以设备（比如显示器）被处理的方式与文件相同。以下三个文件会在程序执行时自动打开，以便访问键盘和屏幕。</p>
<table border=1>
  <tbody>
    <tr>
      <th>标准文件</th>
      <th>文件指针</th>
      <th>设备</th>
    </tr>
    <tr>
      <td>标准输入</td>
      <td>stdin</td>
      <td>键盘</td>
    </tr>
    <tr>
      <td>标准输出</td>
      <td>stdout</td>
      <td>屏幕</td>
    </tr>
    <tr>
      <td>标准错误</td>
      <td>stderr</td>
      <td>您的屏幕</td>
    </tr>
  </tbody>
</table>
<p>文件指针是访问文件的方式，本节将讲解如何从屏幕读取值以及如何把结果输出到屏幕上。</p>
<p>C 语言中的 I/O (输入/输出) 通常使用 printf() 和 scanf() 两个函数。</p>
<p>scanf() 函数用于从标准输入（键盘）读取并格式化， printf() 函数发送格式化输出到标准输出（屏幕）。</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;      // 执行 printf() 函数需要该库   

int main()  
{      
    printf(&quot;C Help&quot;);  //显示引号中的内容      
     
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>编译以上程序，输出结果为：</p>
<pre>C Help</pre>
<p><strong>实例解析：</strong></p>
<ul>
  <li>所有的 C 语言程序都需要包含 <strong>main()</strong> 函数。 代码从 <strong>main()</strong> 函数开始执行。</li>
  <li><strong>printf()</strong> 用于格式化输出到屏幕。<strong>printf()</strong> 函数在 <strong>&quot;stdio.h&quot;</strong> 头文件中声明。</li>
  <li><strong>stdio.h</strong> 是一个头文件 (标准输入输出头文件) and <strong>#include</strong> 是一个预处理命令，用来引入头文件。 当编译器遇到 <strong>printf()</strong>函数时，如果没有找到 <strong>stdio.h</strong> 头文件，会发生编译错误。</li>
  <li><strong>return 0;</strong> 语句用于表示退出程序。</li>
</ul>
<div>
  <h2>%d 格式化输出整数</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;   
    
int main()  
{      
    int testInteger = 5;      
    printf(&quot;Number = %d&quot;, testInteger);      
    
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>编译以上程序，输出结果为：</p>
<pre>Number = 5</pre>
<p>在 printf() 函数的引号中使用 &quot;%d&quot; (整型) 来匹配整型变量 testInteger 并输出到屏幕。</p>
<div>
  <h2>%f 格式化输出浮点型数据</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;   
    
int main()  
{      
    float f;      
    printf(&quot;Enter a number: &quot;);      // %f 匹配浮点型数据       
    scanf(&quot;%f&quot;,&amp;f);      
    printf(&quot;Value = %f&quot;, f);      
    
    return 0;  
}</code></pre></div>
  </div>
</div>
<hr>
<h2>getchar() &amp; putchar() 函数</h2>
<p><strong>int getchar(void)</strong> 函数从屏幕读取下一个可用的字符，并把它返回为一个整数。这个函数在同一个时间内只会读取一个单一的字符。您可以在循环内使用这个方法，以便从屏幕上读取多个字符。</p>
<p><strong>int putchar(int c)</strong> 函数把字符输出到屏幕上，并返回相同的字符。这个函数在同一个时间内只会输出一个单一的字符。您可以在循环内使用这个方法，以便在屏幕上输出多个字符。</p>
<p>请看下面的实例：</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;      
    
int main( )  
{     
    int c;        
    printf( &quot;Enter a value :&quot;);     
    c = getchar( );        
    printf( &quot;\nYou entered: &quot;);     
    putchar( c );    
    printf( &quot;\n&quot;);     
    
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会等待您输入一些文本，当您输入一个文本并按下回车键时，程序会继续并只会读取一个单一的字符，显示如下：</p>
<pre>$./a.out  Enter a value :runoob    You entered: r</pre>
<hr>
<h2>gets() &amp; puts() 函数</h2>
<p><strong>char *gets(char *s)</strong> 函数从 <strong>stdin</strong> 读取一行到 <strong>s</strong> 所指向的缓冲区，直到一个终止符或 EOF。</p>
<p><strong>int puts(const char *s)</strong> 函数把字符串 s 和一个尾随的换行符写入到 <strong>stdout</strong>。</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;      
    
int main( )  
{     
    char str[100];        
    printf( &quot;Enter a value :&quot;);     
    gets( str );        
    printf( &quot;\nYou entered: &quot;);     
    puts( str );     
    
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会等待您输入一些文本，当您输入一个文本并按下回车键时，程序会继续并读取一整行直到该行结束，显示如下：</p>
<pre>$./a.out  Enter a value :runoob    You entered: runoob</pre>
<hr>
<h2>scanf() 和 printf() 函数</h2>
<p><strong>int scanf(const char *format, ...)</strong> 函数从标准输入流 <strong>stdin</strong> 读取输入，并根据提供的 <strong>format</strong> 来浏览输入。</p>
<p><strong>int printf(const char *format, ...)</strong> 函数把输出写入到标准输出流 <strong>stdout </strong>，并根据提供的格式产生输出。</p>
<p><strong>format</strong> 可以是一个简单的常量字符串，但是您可以分别指定 %s、%d、%c、%f 等来输出或读取字符串、整数、字符或浮点数。还有许多其他可用的格式选项，可以根据需要使用。如需了解完整的细节，可以查看这些函数的参考手册。现在让我们通过下面这个简单的实例来加深理解：</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;   
    
int main( ) 
{        
    char str[100];     
    int i;        
    printf( &quot;Enter a value :&quot;);     
    scanf(&quot;%s %d&quot;, str, &amp;i);        
    printf( &quot;\nYou entered: %s %d &quot;, str, i);     
    printf(&quot;\n&quot;);     
    
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会等待您输入一些文本，当您输入一个文本并按下回车键时，程序会继续并读取输入，显示如下：</p>
<pre>$./a.out  Enter a value :runoob 123    You entered: runoob 123 </pre>
<p>在这里，应当指出的是，scanf() 期待输入的格式与您给出的 %s 和 %d 相同，这意味着您必须提供有效的输入，比如 &quot;string integer&quot;，如果您提供的是 &quot;string string&quot; 或 &quot;integer integer&quot;，它会被认为是错误的输入。另外，在读取字符串时，只要遇到一个空格，scanf() 就会停止读取，所以 &quot;this is test&quot; 对 scanf() 来说是三个字符串。</p>	  

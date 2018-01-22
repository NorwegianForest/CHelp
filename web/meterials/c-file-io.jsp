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

	  
<h1>C 文件读写</h1>
<div>
  <p>上一章我们讲解了 C 语言处理的标准输入和输出设备。本章我们将介绍 C 程序员如何创建、打开、关闭文本文件或二进制文件。</p>
  <p>一个文件，无论它是文本文件还是二进制文件，都是代表了一系列的字节。C 语言不仅提供了访问顶层的函数，也提供了底层（OS）调用来处理存储设备上的文件。本章将讲解文件管理的重要调用。</p>
</div>
<hr>
<h2>打开文件</h2>
<p>您可以使用 <strong>fopen( )</strong> 函数来创建一个新的文件或者打开一个已有的文件，这个调用会初始化类型 <strong>FILE</strong> 的一个对象，类型 <strong>FILE</strong>包含了所有用来控制流的必要的信息。下面是这个函数调用的原型：</p>
<pre><code class="c">FILE *fopen( const char * filename, const char * mode );</code></pre>
<p>在这里，<strong>filename</strong> 是字符串，用来命名文件，访问模式 <strong>mode</strong> 的值可以是下列值中的一个：</p>
<table border=1>
  <tbody>
    <tr>
      <th>模式</th>
      <th>描述</th>
    </tr>
    <tr>
      <td>r</td>
      <td>打开一个已有的文本文件，允许读取文件。</td>
    </tr>
    <tr>
      <td>w</td>
      <td>打开一个文本文件，允许写入文件。如果文件不存在，则会创建一个新文件。在这里，您的程序会从文件的开头写入内容。</td>
    </tr>
    <tr>
      <td>a</td>
      <td>打开一个文本文件，以追加模式写入文件。如果文件不存在，则会创建一个新文件。在这里，您的程序会在已有的文件内容中追加内容。</td>
    </tr>
    <tr>
      <td>r+</td>
      <td>打开一个文本文件，允许读写文件。</td>
    </tr>
    <tr>
      <td>w+</td>
      <td>打开一个文本文件，允许读写文件。如果文件已存在，则文件会被截断为零长度，如果文件不存在，则会创建一个新文件。</td>
    </tr>
    <tr>
      <td>a+</td>
      <td>打开一个文本文件，允许读写文件。如果文件不存在，则会创建一个新文件。读取会从文件的开头开始，写入则只能是追加模式。</td>
    </tr>
  </tbody>
</table>
<p>如果处理的是二进制文件，则需使用下面的访问模式来取代上面的访问模式：</p>
<pre><code class="c">&quot;rb&quot;, &quot;wb&quot;, &quot;ab&quot;, &quot;rb+&quot;, &quot;r+b&quot;, &quot;wb+&quot;, &quot;w+b&quot;, &quot;ab+&quot;, &quot;a+b&quot;</code></pre>
<hr>
<h2>关闭文件</h2>

<p>为了关闭文件，请使用 fclose( ) 函数。函数的原型如下：</p>
<pre><code class="c"> int fclose( FILE *fp );</code></pre>
<p>如果成功关闭文件，<strong>fclose( )</strong> 函数返回零，如果关闭文件时发生错误，函数返回 <strong>EOF</strong>。这个函数实际上，会清空缓冲区中的数据，关闭文件，并释放用于该文件的所有内存。EOF 是一个定义在头文件 <strong>stdio.h</strong> 中的常量。</p>
<p>C 标准库提供了各种函数来按字符或者以固定长度字符串的形式读写文件。</p>
<hr>
<h2>写入文件</h2>
<p>下面是把字符写入到流中的最简单的函数：</p>
<pre><code class="c">int fputc( int c, FILE *fp );</code></pre>
<p>函数 <strong>fputc()</strong> 把参数 c 的字符值写入到 fp 所指向的输出流中。如果写入成功，它会返回写入的字符，如果发生错误，则会返回 <strong>EOF</strong>。您可以使用下面的函数来把一个以 null 结尾的字符串写入到流中：</p>
<pre><code class="c">int fputs( const char *s, FILE *fp );</code></pre>
<p>函数 <strong>fputs()</strong> 把字符串 <strong>s</strong> 写入到 fp 所指向的输出流中。如果写入成功，它会返回一个非负值，如果发生错误，则会返回 <strong>EOF</strong>。您也可以使用 <strong>int fprintf(FILE *fp,const char *format, ...)</strong> 函数来写把一个字符串写入到文件中。尝试下面的实例：</p>
<blockquote>
  <p><strong>注意：</strong>请确保您有可用的 <strong>/tmp</strong> 目录，如果不存在该目录，则需要在您的计算机上先创建该目录。</p>
</blockquote>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;      
    
int main()  
{     
    FILE *fp = NULL;        
    fp = fopen(&quot;/tmp/test.txt&quot;, &quot;w+&quot;);     
    fprintf(fp, &quot;This is testing for fprintf...\n&quot;);     
    fputs(&quot;This is testing for fputs...\n&quot;, fp);     
    fclose(fp);  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会在 /tmp 目录中创建一个新的文件 <strong>test.txt</strong>，并使用两个不同的函数写入两行。接下来让我们来读取这个文件。</p>
<hr>
<h2>读取文件</h2>
<p>下面是从文件读取单个字符的最简单的函数：</p>
<pre><code class="c">int fgetc( FILE * fp );</code></pre>
<p><strong>fgetc()</strong> 函数从 fp 所指向的输入文件中读取一个字符。返回值是读取的字符，如果发生错误则返回 <strong>EOF</strong>。下面的函数允许您从流中读取一个字符串：</p>
<pre><code class="c">char *fgets( char *buf, int n, FILE *fp );</code></pre>
<p>函数 <strong>fgets()</strong> 从 fp 所指向的输入流中读取 n - 1 个字符。它会把读取的字符串复制到缓冲区 <strong>buf</strong>，并在最后追加一个 <strong>null</strong> 字符来终止字符串。</p>
<p>如果这个函数在读取最后一个字符之前就遇到一个换行符 '\n' 或文件的末尾 EOF，则只会返回读取到的字符，包括换行符。您也可以使用 <strong>int fscanf(FILE *fp, const char *format, ...)</strong> 函数来从文件中读取字符串，但是在遇到第一个空格字符时，它会停止读取。</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;      
    
int main()  
{     
    FILE *fp = NULL;     
    char buff[255];        
    fp = fopen(&quot;/tmp/test.txt&quot;, &quot;r&quot;);     
    fscanf(fp, &quot;%s&quot;, buff);     
    printf(&quot;1 : %s\n&quot;, buff );        
    fgets(buff, 255, (FILE*)fp);     
    printf(&quot;2: %s\n&quot;, buff );          
    fgets(buff, 255, (FILE*)fp);     
    printf(&quot;3: %s\n&quot;, buff );    
    fclose(fp);     
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会读取上一部分创建的文件，产生下列结果：</p>
<pre>1 : This  2: is testing for fprintf...    3: This is testing for fputs...</pre>
<p>首先，<strong>fscanf()</strong> 方法只读取了 <strong>This</strong>，因为它在后边遇到了一个空格。其次，调用 <strong>fgets()</strong> 读取剩余的部分，直到行尾。最后，调用 <strong>fgets()</strong> 完整地读取第二行。</p>
<hr>
<h2>二进制 I/O 函数</h2>
<p>下面两个函数用于二进制输入和输出：</p>
<div>
  <div>
    <div><pre><code class="c">size_t fread(void *ptr, size_t size_of_elements, size_t number_of_elements, FILE *a_file);
    
size_t fwrite(const void *ptr, size_t size_of_elements, size_t number_of_elements, FILE *a_file);</code></pre></div>
  </div>
</div>
<p>这两个函数都是用于存储块的读写 - 通常是数组或结构体。</p>	  
	  
	  

</body>
</html>
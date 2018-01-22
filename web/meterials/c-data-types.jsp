<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
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

    <h1>C 数据类型</h1>
    <div>
      <p>在 C 语言中，数据类型指的是用于声明不同类型的变量或函数的一个广泛的系统。变量的类型决定了变量存储占用的空间，以及如何解释存储的位模式。</p>
      <p>C 中的类型可分为以下几种：</p>
      <table border="1">
        <tbody>
          <tr>
            <th>序号</th>
            <th>类型与描述</th>
          </tr>
          <tr>
            <td>1</td>
            <td><strong>基本类型：</strong><br />
              它们是算术类型，包括两种类型：整数类型和浮点类型。</td>
          </tr>
          <tr>
            <td>2</td>
            <td><strong>枚举类型：</strong><br />
              它们也是算术类型，被用来定义在程序中只能赋予其一定的离散整数值的变量。</td>
          </tr>
          <tr>
            <td>3</td>
            <td><strong>void 类型：</strong><br />
              类型说明符 <em>void</em> 表明没有可用的值。</td>
          </tr>
          <tr>
            <td>4</td>
            <td><strong>派生类型：</strong><br />
              它们包括：指针类型、数组类型、结构类型、共用体类型和函数类型。</td>
          </tr>
        </tbody>
      </table>
      <br />
      <p>数组类型和结构类型统称为聚合类型。函数的类型指的是函数返回值的类型。在本章节接下来的部分我们将介绍基本类型，其他几种类型会在后边几个章节中进行讲解。</p>
    </div>
    <hr />
    <h2>整数类型</h2>
    <p>下表列出了关于标准整数类型的存储大小和值范围的细节：</p>
    <table border="1"> 
      <tbody>
        <tr>
          <th>类型</th>
          <th>存储大小</th>
          <th>值范围</th>
        </tr>
        <tr>
          <td>char</td>
          <td>1 字节</td>
          <td>-128 到 127 或 0 到 255</td>
        </tr>
        <tr>
          <td>unsigned char</td>
          <td>1 字节</td>
          <td>0 到 255</td>
        </tr>
        <tr>
          <td>signed char</td>
          <td>1 字节</td>
          <td>-128 到 127</td>
        </tr>
        <tr>
          <td>int</td>
          <td>2 或 4 字节</td>
          <td>-32,768 到 32,767 或 -2,147,483,648 到 2,147,483,647</td>
        </tr>
        <tr>
          <td>unsigned int</td>
          <td>2 或 4 字节</td>
          <td>0 到 65,535 或 0 到 4,294,967,295</td>
        </tr>
        <tr>
          <td>short</td>
          <td>2 字节</td>
          <td>-32,768 到 32,767</td>
        </tr>
        <tr>
          <td>unsigned short</td>
          <td>2 字节</td>
          <td>0 到 65,535</td>
        </tr>
        <tr>
          <td>long</td>
          <td>4 字节</td>
          <td>-2,147,483,648 到 2,147,483,647</td>
        </tr>
        <tr>
          <td>unsigned long</td>
          <td>4 字节</td>
          <td>0 到 4,294,967,295</td>
        </tr>
      </tbody>
    </table>
    <blockquote>
      <p>注意，各种类型的存储大小与系统位数有关，但目前通用的以64位系统为主。</p>
      <p>以下列出了32位系统与64位系统的存储大小的差别（windows 相同）：</p>
      <p><img src="http://www.runoob.com/wp-content/uploads/2014/09/32-64.jpg" alt="" width="400" height="400"/></p>
    </blockquote>
    <p>为了得到某个类型或某个变量在特定平台上的准确大小，您可以使用 <strong>sizeof</strong> 运算符。表达式 <em>sizeof(type)</em> 得到对象或类型的存储字节大小。下面的实例演示了获取 int 类型的大小：</p>
    <div>
    <hr />
      <h2>实例</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;limits.h&gt;

int main()
{
	printf(&quot;int 存储大小 : %lu \n&quot;, sizeof(int));
	return 0;
}</code></pre></div>
      </div>
    </div>
    <p>当您在 Linux 上编译并执行上面的程序时，它会产生下列结果：</p>
    <pre>int 存储大小 : 4 </pre>
    <hr />
    <h2>浮点类型</h2>
    <p>下表列出了关于标准浮点类型的存储大小、值范围和精度的细节：</p>
    <table border="1">
      <tbody>
        <tr>
          <th>类型</th>
          <th>存储大小</th>
          <th>值范围</th>
          <th>精度</th>
        </tr>
        <tr>
          <td>float</td>
          <td>4 字节</td>
          <td>1.2E-38 到 3.4E+38</td>
          <td>6 位小数</td>
        </tr>
        <tr>
          <td>double</td>
          <td>8 字节</td>
          <td>2.3E-308 到 1.7E+308</td>
          <td>15 位小数</td>
        </tr>
        <tr>
          <td>long double</td>
          <td>16 字节</td>
          <td>3.4E-4932 到 1.1E+4932</td>
          <td>19 位小数</td>
        </tr>
      </tbody>
    </table>
    <p>头文件 float.h 定义了宏，在程序中可以使用这些值和其他有关实数二进制表示的细节。下面的实例将输出浮点类型占用的存储空间以及它的范围值：</p>
    <div>
    <hr />
      <h2>实例</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;float.h&gt;     
 
int main()  
{
     printf(&quot;float 存储最大字节数 : %lu \n&quot;, sizeof(float));
     printf(&quot;float 最小值: %E\n&quot;, FLT_MIN );
     printf(&quot;float 最大值: %E\n&quot;, FLT_MAX );
     printf(&quot;精度值: %d\n&quot;, FLT_DIG );
     return 0;  
}</code></pre></div>
      </div>
    </div>
    <p>当您在 Linux 上编译并执行上面的程序时，它会产生下列结果：</p>
    <pre>float 存储最大字节数 : 4
float 最小值: 1.175494E-38
float 最大值: 3.402823E+38
精度值: 6</pre>
<hr />
    <h2>void 类型</h2>
    <p>void 类型指定没有可用的值。它通常用于以下三种情况下：</p>
    <table border="1">
      <tbody>
        <tr>
          <th>序号</th>
          <th>类型与描述</th>
        </tr>
        <tr>
          <td>1</td>
          <td><strong>函数返回为空</strong><br />
            C 中有各种函数都不返回值，或者您可以说它们返回空。不返回值的函数的返回类型为空。例如 <strong>void exit (int status);</strong></td>
        </tr>
        <tr>
          <td>2</td>
          <td><strong>函数参数为空</strong><br />
            C 中有各种函数不接受任何参数。不带参数的函数可以接受一个 void。例如 <strong>int rand(void);</strong></td>
        </tr>
        <tr>
          <td>3</td>
          <td><strong>指针指向 void</strong><br />
            类型为 void * 的指针代表对象的地址，而不是类型。例如，内存分配函数 <strong>void *malloc( size_t size );</strong> 返回指向 void 的指针，可以转换为任何数据类型。</td>
        </tr>
      </tbody>
    </table>
    <p>如果现在您还是无法完全理解 void 类型，不用太担心，在后续的章节中我们将会详细讲解这些概念。</p>
    

    
</body>
</html>
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


	
    <h1>C 语言教程</h1>
    <p>C 语言是一种通用的、面向过程式的计算机程序设计语言。1972 年，为了移植与开发 UNIX 操作系统，丹尼斯里奇在贝尔电话实验室设计开发了 C 语言。
    <p>C 语言是一种广泛使用的计算机语言，它与 Java 编程语言一样普及，二者在现代软件程序员之间都得到广泛使用。
    <p>当前最新的C语言标准为 C11 ，在它之前的C语言标准为 C99。
    <hr />
    <h2>谁适合阅读本教程？</h2>
    <p>本教程是专门为需要从零开始了解 C 语言的软件程序员打造的。本教程将让您对 C 语言有足够的认识，从而提升您自己的专业知识水平。</p>
    <hr />
    <h2>阅读本教程前，您需要了解的知识：</h2>
    <p>在开始学习本教程之前，您需要对计算机编程术语有基本的了解。对任何一种编程语言有基本的了解将有助于您理解 C 语言编程概念，并有助于加快您的学习进度。</p>
    <hr />
    <h2>编译/执行 C 程序</h2>
    <h2>实例</h2>
    <pre><code class="c">
#include &lt;stdio.h&gt;
    
int main()
{
    /* 我的第一个 C 程序 */
    printf(&quot;Hello, World! \n&quot;);
    return 0;
}
    </code></pre>    
    <p><strong>实例解析：</strong></p>
    <ul>
      <li>所有的C语言程序都需要包含<strong>main()</strong>函数。代码从<strong>main()</strong>函数开始执行。</li>
      <li><strong>/* ... */</strong>用于注释说明。</li>
      <li><strong>printf()</strong>用于格式化输出到屏幕。<strong>printf()</strong>函数在<strong>&quot;stdio.h&quot;</strong>头文件中声明。</li>
      <li><strong>stdio.h</strong>是一个头文件(标准输入输出头文件),<strong>#include</strong>是一个预处理命令，用来引入头文件。当编译器遇到<strong>printf()</strong>函数时，如果没有找到<strong>stdio.h</strong>头文件，会发生编译错误。</li>
      <li><strong>return0;</strong>语句用于表示退出程序。</li>
    </ul>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    

    
</body>
</html>
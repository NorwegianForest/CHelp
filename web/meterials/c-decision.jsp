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


	  
    <h1>C 判断</h1>
    <div>
      <p>判断结构要求程序员指定一个或多个要评估或测试的条件，以及条件为真时要执行的语句（必需的）和条件为假时要执行的语句（可选的）。</p>
      <p>C 语言把任何<strong>非零</strong>和<strong>非空</strong>的值假定为 <strong>true</strong>，把<strong>零</strong>或 <strong>null</strong> 假定为 <strong>false</strong>。</p>
      <p>下面是大多数编程语言中典型的判断结构的一般形式：</p>
      <img src="http://www.runoob.com/wp-content/uploads/2015/12/if.png" alt="C 中的判断语句" /></div>
      
      <hr>
    <h2>判断语句</h2>
    <p>C 语言提供了以下类型的判断语句。点击链接查看每个语句的细节。</p>
    <table border=1>
      <tbody>
        <tr>
          <th>语句</th>
          <th>描述</th>
        </tr>
        <tr>
          <td><a target="_blank" href="http://www.runoob.com/cprogramming/c-if.html" title="C 中的 if 语句">if 语句</a></td>
          <td>一个 <strong>if 语句</strong> 由一个布尔表达式后跟一个或多个语句组成。</td>
        </tr>
        <tr>
          <td><a target="_blank" href="http://www.runoob.com/cprogramming/c-if-else.html" title="C 中的 if...else 语句">if...else 语句</a></td>
          <td>一个 <strong>if 语句</strong> 后可跟一个可选的 <strong>else 语句</strong>，else 语句在布尔表达式为假时执行。</td>
        </tr>
        <tr>
          <td><a target="_blank" href="http://www.runoob.com/cprogramming/c-nested-if.html" title="C 中的嵌套 if 语句">嵌套 if 语句</a></td>
          <td>您可以在一个 <strong>if</strong> 或 <strong>else if</strong> 语句内使用另一个 <strong>if</strong> 或 <strong>else if</strong> 语句。</td>
        </tr>
        <tr>
          <td><a target="_blank" href="http://www.runoob.com/cprogramming/c-switch.html" title="C 中的 switch 语句">switch 语句</a></td>
          <td>一个 <strong>switch</strong> 语句允许测试一个变量等于多个值时的情况。</td>
        </tr>
        <tr>
          <td><a target="_blank" href="http://www.runoob.com/cprogramming/c-nested-switch.html" title="C 中的嵌套 switch 语句">嵌套 switch 语句</a></td>
          <td>您可以在一个 <strong>switch</strong> 语句内使用另一个 <strong>switch </strong>语句。</td>
        </tr>
      </tbody>
    </table>
    <br />
    <hr>
    <h2>? : 运算符(三元运算符)</h2>
    <p>我们已经在前面的章节中讲解了 <strong>条件运算符 ? :</strong>，可以用来替代 <strong>if...else</strong> 语句。它的一般形式如下：</p>
    <pre><code class="c" >Exp1 ? Exp2 : Exp3;</code></pre>
    <p>其中，Exp1、Exp2 和 Exp3 是表达式。请注意，冒号的使用和位置。</p>
    <p>? 表达式的值是由 Exp1 决定的。如果 Exp1 为真，则计算 Exp2 的值，结果即为整个 ? 表达式的值。如果 Exp1 为假，则计算 Exp3 的值，结果即为整个 ? 表达式的值。</p>
    <p><img src="https://www.runoob.com/wp-content/uploads/2014/09/Conditional-Statement-in-C-Programming-Lanuage-Ternary-Operator.png" alt="" /></p>
    <h3>实例</h3>
    <p>以下实例通过输入一个数字来判断它是否为奇数或偶数</p>
    <div>
      <h2>实例</h2>
      <div>
        <div><pre><code class="c" >#include&lt;stdio.h&gt;      
int main()  
{      
    int num;         
    printf(&quot;输入一个数字 : &quot;);      
    scanf(&quot;%d&quot;,&amp;num);         
    (num%2==0)?printf(&quot;偶数&quot;):printf(&quot;奇数&quot;);  
}</code></pre></div>
      </div>
    </div>
    <p>&nbsp;</p>	  
	  
	  
	  

</body>
</html>
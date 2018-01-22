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


	  
    <h1>C 常量</h1>
    <div>
      <p>常量是固定值，在程序执行期间不会改变。这些固定的值，又叫做<strong>字面量</strong>。</p>
      <p>常量可以是任何的基本数据类型，比如整数常量、浮点常量、字符常量，或字符串字面值，也有枚举常量。</p>
      <p><strong>常量</strong>就像是常规的变量，只不过常量的值在定义后不能进行修改。</p>
    </div>
    <hr />
    <h2>整数常量</h2>
    <p>整数常量可以是十进制、八进制或十六进制的常量。前缀指定基数：0x 或 0X 表示十六进制，0 表示八进制，不带前缀则默认表示十进制。</p>
    <p>整数常量也可以带一个后缀，后缀是 U 和 L 的组合，U 表示无符号整数（unsigned），L 表示长整数（long）。后缀可以是大写，也可以是小写，U 和 L 的顺序任意。</p>
    <p>下面列举几个整数常量的实例：</p>
    <pre><code class="c">212         /* 合法的 */  
215u        /* 合法的 */  
0xFeeL      /* 合法的 */  
078         /* 非法的：8 不是八进制的数字 */  
032UU       /* 非法的：不能重复后缀 */</code></pre>
    <p>以下是各种类型的整数常量的实例：</p>
    <pre><code class="c">85         /* 十进制 */  
0213       /* 八进制 */  
0x4b       /* 十六进制 */  
30         /* 整数 */  
30u        /* 无符号整数 */  
30l        /* 长整数 */  
30ul       /* 无符号长整数 */</code></pre>
<hr />
    <h2>浮点常量</h2>
    <p>浮点常量由整数部分、小数点、小数部分和指数部分组成。您可以使用小数形式或者指数形式来表示浮点常量。</p>
    <p>当使用小数形式表示时，必须包含整数部分、小数部分，或同时包含两者。当使用指数形式表示时， 必须包含小数点、指数，或同时包含两者。带符号的指数是用 e 或 E 引入的。</p>
    <p>下面列举几个浮点常量的实例：</p>
    <pre><code class="c">3.14159       /* 合法的 */  
314159E-5L    /* 合法的 */  
510E          /* 非法的：不完整的指数 */  
210f          /* 非法的：没有小数或指数 */  
.e55          /* 非法的：缺少整数或分数 */</code></pre>
<hr />
    <h2>字符常量</h2>
    <p>字符常量是括在单引号中，例如，'x' 可以存储在 <strong>char</strong> 类型的简单变量中。</p>
    <p>字符常量可以是一个普通的字符（例如 'x'）、一个转义序列（例如 '\t'），或一个通用的字符（例如 '\u02C0'）。</p>
    <p>在 C 中，有一些特定的字符，当它们前面有反斜杠时，它们就具有特殊的含义，被用来表示如换行符（\n）或制表符（\t）等。下表列出了一些这样的转义序列码：</p>
    <table border="1">
      <tbody>
        <tr>
          <th>转义序列</th>
          <th>含义</th>
        </tr>
        <tr>
          <td>\\</td>
          <td>\ 字符</td>
        </tr>
        <tr>
          <td>\'</td>
          <td>' 字符</td>
        </tr>
        <tr>
          <td>\&quot;</td>
          <td>&quot; 字符</td>
        </tr>
        <tr>
          <td>\?</td>
          <td>? 字符</td>
        </tr>
        <tr>
          <td>\a</td>
          <td>警报铃声</td>
        </tr>
        <tr>
          <td>\b</td>
          <td>退格键</td>
        </tr>
        <tr>
          <td>\f</td>
          <td>换页符</td>
        </tr>
        <tr>
          <td>\n</td>
          <td>换行符</td>
        </tr>
        <tr>
          <td>\r</td>
          <td>回车</td>
        </tr>
        <tr>
          <td>\t</td>
          <td>水平制表符</td>
        </tr>
        <tr>
          <td>\v</td>
          <td>垂直制表符</td>
        </tr>
        <tr>
          <td>\ooo</td>
          <td>一到三位的八进制数</td>
        </tr>
        <tr>
          <td>\xhh . . .</td>
          <td>一个或多个数字的十六进制数</td>
        </tr>
      </tbody>
    </table>
    <p>下面的实例显示了一些转义序列字符：</p>
    <div>
    <hr />
      <h2>实例</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      

int main()  
{     
    printf(&quot;Hello\tWorld\n\n&quot;);        
    return 0;  
}</code></pre></div>
      </div>
    </div>
    <p>当上面的代码被编译和执行时，它会产生下列结果：</p>
    <pre>Hello   World  </pre>
    <hr />
    <h2>字符串常量</h2>
    <p>字符串字面值或常量是括在双引号 &quot;&quot; 中的。一个字符串包含类似于字符常量的字符：普通的字符、转义序列和通用的字符。</p>
    <p>您可以使用空格做分隔符，把一个很长的字符串常量进行分行。</p>
    <p>下面的实例显示了一些字符串常量。下面这三种形式所显示的字符串是相同的。</p>
    <pre><code class="c">&quot;hello, dear&quot;    
&quot;hello, \    
dear&quot;    
&quot;hello, &quot; &quot;d&quot; &quot;ear&quot;</code></pre>
<hr /> 
    <h2>定义常量</h2>
    <p>在 C 中，有两种简单的定义常量的方式：</p>
    <ol>
      <li>使用 <strong>#define</strong> 预处理器。</li>
      <li>使用 <strong>const</strong> 关键字。</li>
    </ol>
    <h3>#define 预处理器</h3>
    <p>下面是使用 #define 预处理器定义常量的形式：</p>
    <pre><code class="c">#define identifier value</code></pre>
    <p>具体请看下面的实例：</p>
    <div>
    <hr />
      <h2>实例</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      

#define LENGTH 10      
#define WIDTH  5   
#define NEWLINE '\n'      

int main()  
{        
    int area;           
    area = LENGTH * WIDTH;     
    printf(&quot;value of area : %d&quot;, area);     
    printf(&quot;%c&quot;, NEWLINE);        
    return 0;  
}</code></pre></div>
      </div>
    </div>
    <p>当上面的代码被编译和执行时，它会产生下列结果：</p>
    <pre>value of area : 50</pre>
    <h3>const 关键字</h3>
    <p>您可以使用 <strong>const</strong> 前缀声明指定类型的常量，如下所示：</p>
    <pre><code class="c">const type variable = value;</code></pre>
    <p>具体请看下面的实例：</p>
    <div>
    <hr />
      <h2>实例</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      

int main()  
{     
    const int  LENGTH = 10;     
    const int  WIDTH  = 5;     
    const char NEWLINE = '\n';     
    int area;            
    area = LENGTH * WIDTH;     
    printf(&quot;value of area : %d&quot;, area);     
    printf(&quot;%c&quot;, NEWLINE);        
    return 0;  
}</code></pre></div>
      </div>
    </div>
    <p>当上面的代码被编译和执行时，它会产生下列结果：</p>
    <pre>value of area : 50</pre>
    <p>请注意，把常量定义为大写字母形式，是一个很好的编程实践。</p>
    

    
</body>
</html>
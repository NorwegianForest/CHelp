<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<h1>C 字符串</h1>
<p>在 C 语言中，字符串实际上是使用 <strong>null</strong> 字符 '\0' 终止的一维字符数组。因此，一个以 null 结尾的字符串，包含了组成字符串的字符。</p>
<p>下面的声明和初始化创建了一个 &quot;Hello&quot; 字符串。由于在数组的末尾存储了空字符，所以字符数组的大小比单词 &quot;Hello&quot; 的字符数多一个。</p>
<pre><code class="c">char greeting[6] = {'H', 'e', 'l', 'l', 'o', '\0'};</code></pre>
<p>依据数组初始化规则，您可以把上面的语句写成以下语句：</p>
<pre><code class="c">char greeting[] = &quot;Hello&quot;;</code></pre>
<p>以下是 C/C++ 中定义的字符串的内存表示：</p>
<img src="http://www.runoob.com/wp-content/uploads/2014/08/string_representation.jpg" alt="C/C++ 中的字符串表示" />
<p>其实，您不需要把 <em>null</em> 字符放在字符串常量的末尾。C 编译器会在初始化数组时，自动把 '\0' 放在字符串的末尾。让我们尝试输出上面的字符串：</p>
<pre><code class="c">#include &lt;stdio.h&gt;    

int main ()  
{     
    char greeting[6] = {'H', 'e', 'l', 'l', 'o', '\0'};       
    printf(&quot;Greeting message: %s\n&quot;, greeting );       
    return 0;  
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Greeting message: Hello</pre>
<p>C 中有大量操作字符串的函数：</p>
<table border=1>
  <tbody>
    <tr>
      <th>序号</th>
      <th>函数 &amp; 目的</th>
    </tr>
    <tr>
      <td>1</td>
      <td><strong>strcpy(s1, s2);</strong><br />
        复制字符串 s2 到字符串 s1。</td>
    </tr>
    <tr>
      <td>2</td>
      <td><strong>strcat(s1, s2);</strong><br />
        连接字符串 s2 到字符串 s1 的末尾。</td>
    </tr>
    <tr>
      <td>3</td>
      <td><strong>strlen(s1);</strong><br />
        返回字符串 s1 的长度。</td>
    </tr>
    <tr>
      <td>4</td>
      <td><strong>strcmp(s1, s2);</strong><br />
        如果 s1 和 s2 是相同的，则返回 0；如果 s1&lt;s2 则返回小于 0；如果 s1&gt;s2 则返回大于 0。</td>
    </tr>
    <tr>
      <td>5</td>
      <td><strong>strchr(s1, ch);</strong><br />
        返回一个指针，指向字符串 s1 中字符 ch 的第一次出现的位置。</td>
    </tr>
    <tr>
      <td>6</td>
      <td><strong>strstr(s1, s2);</strong><br />
        返回一个指针，指向字符串 s1 中字符串 s2 的第一次出现的位置。</td>
    </tr>
  </tbody>
</table>
<p>下面的实例使用了上述的一些函数：</p>
<pre><code class="c">#include &lt;stdio.h&gt;  
#include &lt;string.h&gt;    
int main ()  
{     
    char str1[12] = &quot;Hello&quot;;     
    char str2[12] = &quot;World&quot;;     
    char str3[12];     
    int  len ;       
    /* 复制 str1 到 str3 */     
    strcpy(str3, str1);     
    printf(&quot;strcpy( str3, str1) :  %s\n&quot;, str3 );       
    /* 连接 str1 和 str2 */     
    strcat( str1, str2);     
    printf(&quot;strcat( str1, str2):   %s\n&quot;, str1 );       
    /* 连接后，str1 的总长度 */     
    len = strlen(str1);     
    printf(&quot;strlen(str1) :  %d\n&quot;, len );       
    return 0;  
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>strcpy( str3, str1) :  Hello  
strcat( str1, str2):   HelloWorld  
strlen(str1) :  10</pre>
<p>您可以在 C 标准库中找到更多字符串相关的函数。</p>	  
</body>
</html>
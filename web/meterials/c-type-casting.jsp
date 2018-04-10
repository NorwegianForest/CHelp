<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<h1>C 强制类型转换</h1>
<p>强制类型转换是把变量从一种类型转换为另一种数据类型。例如，如果您想存储一个 long 类型的值到一个简单的整型中，您需要把 long 类型强制转换为 int 类型。您可以使用<strong>强制类型转换运算符</strong>来把值显式地从一种类型转换为另一种类型，如下所示：</p>
<pre><code class="c">(type_name) expression</code></pre>
<p>请看下面的实例，使用强制类型转换运算符把一个整数变量除以另一个整数变量，得到一个浮点数：</p>
<pre><code class="c">#include &lt;stdio.h&gt;    

main()  
{     
    int sum = 17, count = 5;     
    double mean;       
    mean = (double) sum / count;     
    printf(&quot;Value of mean : %f\n&quot;, mean );    
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Value of mean : 3.400000</pre>
<p>这里要注意的是强制类型转换运算符的优先级大于除法，因此 <strong>sum</strong> 的值首先被转换为 <strong>double</strong> 型，然后除以 count，得到一个类型为 double 的值。</p>
<p>类型转换可以是隐式的，由编译器自动执行，也可以是显式的，通过使用<strong>强制类型转换运算符</strong>来指定。在编程时，有需要类型转换的时候都用上强制类型转换运算符，是一种良好的编程习惯。</p>
<hr>
<h2>整数提升</h2>
<p>整数提升是指把小于 <strong>int</strong> 或 <strong>unsigned int</strong> 的整数类型转换为 <strong>int</strong> 或 <strong>unsigned int</strong> 的过程。请看下面的实例，在 int 中添加一个字符：</p>
<pre><code class="c">#include &lt;stdio.h&gt;    

main()  
{     
    int  i = 17;     
    char c = 'c'; /* ascii 值是 99 */     
    int sum;       
    sum = i + c;     
    printf(&quot;Value of sum : %d\n&quot;, sum );    
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Value of sum : 116</pre>
<p>在这里，sum 的值为 116，因为编译器进行了整数提升，在执行实际加法运算时，把 'c' 的值转换为对应的 ascii 值。</p>
<hr>
<h2>常用的算术转换</h2>
<p><strong>常用的算术转换</strong>是隐式地把值强制转换为相同的类型。编译器首先执行<strong>整数提升</strong>，如果操作数类型不同，则它们会被转换为下列层次中出现的最高层次的类型：</p>
<img src="http://www.runoob.com/wp-content/uploads/2014/08/usual_arithmetic_conversion.png" alt="Usual Arithmetic Conversion" />
<p>常用的算术转换不适用于赋值运算符、逻辑运算符 &amp;&amp; 和 ||。让我们看看下面的实例来理解这个概念：</p>
<pre><code class="c">#include &lt;stdio.h&gt;    

main()  
{     
    int  i = 17;     
    char c = 'c'; /* ascii 值是 99 */     
    float sum;       
    sum = i + c;     
    printf(&quot;Value of sum : %f\n&quot;, sum );    
}</code></pre>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Value of sum : 116.000000</pre>
<p>在这里，c 首先被转换为整数，但是由于最后的值是 double 型的，所以会应用常用的算术转换，编译器会把 i 和 c 转换为浮点型，并把它们相加得到一个浮点数。</p>	  

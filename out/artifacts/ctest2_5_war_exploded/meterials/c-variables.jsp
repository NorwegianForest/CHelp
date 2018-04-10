<%@ page contentType="text/html; charset=utf-8" pageEncoding="gb2312"%>
    <h1>C 变量</h1>
    <div>
      <p>变量其实只不过是程序可操作的存储区的名称。C 中每个变量都有特定的类型，类型决定了变量存储的大小和布局，该范围内的值都可以存储在内存中，运算符可应用于变量上。</p>
      <p>变量的名称可以由字母、数字和下划线字符组成。它必须以字母或下划线开头。大写字母和小写字母是不同的，因为 C 是大小写敏感的。基于前一章讲解的基本类型，有以下几种基本的变量类型：</p>
      <table border="1">
        <tbody>
          <tr>
            <th>类型</th>
            <th>描述</th>
          </tr>
          <tr>
            <td>char</td>
            <td>通常是一个字节（八位）。这是一个整数类型。</td>
          </tr>
          <tr>
            <td>int</td>
            <td>对机器而言，整数的最自然的大小。</td>
          </tr>
          <tr>
            <td>float</td>
            <td>单精度浮点值。</td>
          </tr>
          <tr>
            <td>double</td>
            <td>双精度浮点值。</td>
          </tr>
          <tr>
            <td>void</td>
            <td>表示类型的缺失。</td>
          </tr>
        </tbody>
      </table>
      <br />
      <p>C 语言也允许定义各种其他类型的变量，比如枚举、指针、数组、结构、共用体等等，这将会在后续的章节中进行讲解，本章节我们先讲解基本变量类型。</p>
    </div>
    <hr />
    <h2>C 中的变量定义</h2>
    <p>变量定义就是告诉编译器在何处创建变量的存储，以及如何创建变量的存储。变量定义指定一个数据类型，并包含了该类型的一个或多个变量的列表，如下所示：</p>
    <pre>type variable_list;</pre>
    <p>在这里，<strong>type</strong> 必须是一个有效的 C 数据类型，可以是 char、w_char、int、float、double、bool 或任何用户自定义的对象，<strong>variable_list</strong> 可以由一个或多个标识符名称组成，多个标识符之间用逗号分隔。下面列出几个有效的声明：</p>
    <pre><code class="c">int    i, j, k;  
char   c, ch;  
float  f, salary;  
double d;</code></pre>
    <p>行 <strong>int i, j, k;</strong> 声明并定义了变量 i、j 和 k，这指示编译器创建类型为 int 的名为 i、j、k 的变量。</p>
    <p>变量可以在声明的时候被初始化（指定一个初始值）。初始化器由一个等号，后跟一个常量表达式组成，如下所示：</p>
    <pre>type variable_name = value;</pre>
    <p>下面列举几个实例：</p>
    <pre><code class="c">extern int d = 3, f = 5;    // d 和 f 的声明与初始化  
int d = 3, f = 5;           // 定义并初始化 d 和 f  
byte z = 22;                // 定义并初始化 z  
char x = 'x';               // 变量 x 的值为 'x'</code></pre>
    <p>不带初始化的定义：带有静态存储持续时间的变量会被隐式初始化为 NULL（所有字节的值都是 0），其他所有变量的初始值是未定义的。</p>
    <hr />
    <h2>C 中的变量声明</h2>
    <p>变量声明向编译器保证变量以指定的类型和名称存在，这样编译器在不需要知道变量完整细节的情况下也能继续进一步的编译。变量声明只在编译时有它的意义，在程序连接时编译器需要实际的变量声明。</p>
    <p>变量的声明有两种情况：</p>
    <ul>
      <li>1、一种是需要建立存储空间的。例如：int a 在声明的时候就已经建立了存储空间。</li>
      <li>2、另一种是不需要建立存储空间的，通过使用extern关键字声明变量名而不定义它。 例如：extern int a 其中变量 a 可以在别的文件中定义的。</li>
      <li>除非有extern关键字，否则都是变量的定义。</li>
    </ul>
    <pre><code class="c">extern int i; //声明，不是定义 
int i; //声明，也是定义</code></pre>
<hr />
    <h3>实例</h3>
    <p>尝试下面的实例，其中，变量在头部就已经被声明，但是定义与初始化在主函数内：</p>
    <div>
      <h2>实例</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;      
// 变量声明  
extern int a, b;  
extern int c;  
extern float f;     
int main ()
{    
    /* 变量定义 */    
    int a, b;    
    int c;    
    float f;       
    /* 初始化 */    
    a = 10;    
    b = 20;        
    c = a + b;    
    printf(&quot;value of c : %d \n&quot;, c);       
    f = 70.0/3.0;    
    printf(&quot;value of f : %f \n&quot;, f);       
    return 0;  
}</code></pre></div>
      </div>
    </div>
    <p>当上面的代码被编译和执行时，它会产生下列结果：</p>
    <pre>value of c : 30  
value of f : 23.333334</pre>
    <hr />
    <h2>C 中的左值（Lvalues）和右值（Rvalues）</h2>
    <p>C 中有两种类型的表达式：</p>
    <ol>
      <li><strong>左值（lvalue）：</strong>指向内存位置的表达式被称为左值（lvalue）表达式。左值可以出现在赋值号的左边或右边。</li>
      <li><strong>右值（rvalue）：</strong>术语右值（rvalue）指的是存储在内存中某些地址的数值。右值是不能对其进行赋值的表达式，也就是说，右值可以出现在赋值号的右边，但不能出现在赋值号的左边。</li>
    </ol>
    <p>变量是左值，因此可以出现在赋值号的左边。数值型的字面值是右值，因此不能被赋值，不能出现在赋值号的左边。下面是一个有效的语句：</p>
    <pre><code class="c">int g = 20;</code></pre>
    <p>但是下面这个就不是一个有效的语句，会生成编译时错误：</p>
    <pre><code class="c">10 = 20;</code></pre>

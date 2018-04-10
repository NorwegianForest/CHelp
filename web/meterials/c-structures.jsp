<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<h1>C 结构体</h1>
<div>
  <p>C 数组允许定义可存储相同类型数据项的变量，<strong>结构</strong>是 C 编程中另一种用户自定义的可用的数据类型，它允许您存储不同类型的数据项。</p>
  <p>结构用于表示一条记录，假设您想要跟踪图书馆中书本的动态，您可能需要跟踪每本书的下列属性：</p>
  <ul>
    <li>Title</li>
    <li>Author</li>
    <li>Subject</li>
    <li>Book ID</li>
  </ul>
</div>

<hr>
<h2>定义结构</h2>
<p>为了定义结构，您必须使用 <strong>struct</strong> 语句。struct 语句定义了一个包含多个成员的新的数据类型，struct 语句的格式如下：</p>
<div>
  <div>
    <div><pre><code class="c">struct [structure tag]  
{     
    member definition;     
    member definition;     
    ...     
    member definition;  
} [one or more structure variables];</code></pre></div>
  </div>
</div>
<p><strong>structure tag</strong> 是可选的，每个 member definition 是标准的变量定义，比如 int i; 或者 float f; 或者其他有效的变量定义。在结构定义的末尾，最后一个分号之前，您可以指定一个或多个结构变量，这是可选的。下面是声明 Book 结构的方式：</p>
<div>
  <div>
    <div><pre><code class="c">struct Books  
{     
    char  title[50];     
    char  author[50];     
    char  subject[100];     
    int   book_id;  
} book;</code></pre></div>
  </div>
</div>
<hr>
<h2>访问结构成员</h2>
<p>为了访问结构的成员，我们使用<strong>成员访问运算符（.）</strong>。成员访问运算符是结构变量名称和我们要访问的结构成员之间的一个句号。您可以使用 <strong>struct</strong> 关键字来定义结构类型的变量。下面的实例演示了结构的用法：</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;string.h&gt;      

struct Books  
{     
    char  title[50];     
    char  author[50];     
    char  subject[100];     
    int   book_id;  
};     

int main( )  
{     
    struct Books Book1;        /* 声明 Book1，类型为 Books */     
    struct Books Book2;        /* 声明 Book2，类型为 Books */ 
           
    /* Book1 详述 */     
    strcpy( Book1.title, &quot;C Programming&quot;);     
    strcpy( Book1.author, &quot;Nuha Ali&quot;);      
    strcpy( Book1.subject, &quot;C Programming Tutorial&quot;);     
    Book1.book_id = 6495407;     
       
    /* Book2 详述 */     
    strcpy( Book2.title, &quot;Telecom Billing&quot;);     
    strcpy( Book2.author, &quot;Zara Ali&quot;);     
    strcpy( Book2.subject, &quot;Telecom Billing Tutorial&quot;);     
    Book2.book_id = 6495700;   
         
    /* 输出 Book1 信息 */     
    printf( &quot;Book 1 title : %s\n&quot;, Book1.title);     
    printf( &quot;Book 1 author : %s\n&quot;, Book1.author);    
    printf( &quot;Book 1 subject : %s\n&quot;, Book1.subject);     
    printf( &quot;Book 1 book_id : %d\n&quot;, Book1.book_id);    
        
    /* 输出 Book2 信息 */     
    printf( &quot;Book 2 title : %s\n&quot;, Book2.title);     
    printf( &quot;Book 2 author : %s\n&quot;, Book2.author);     
    printf( &quot;Book 2 subject : %s\n&quot;, Book2.subject);     
    printf( &quot;Book 2 book_id : %d\n&quot;, Book2.book_id);    
        
    return 0;  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Book 1 title : C Programming  
Book 1 author : Nuha Ali  
Book 1 subject : C Programming Tutorial  
Book 1 book_id : 6495407  
Book 2 title : Telecom Billing  
Book 2 author : Zara Ali  
Book 2 subject : Telecom Billing Tutorial  
Book 2 book_id : 6495700</pre>
<hr>
<h2>结构作为函数参数</h2>
<p>您可以把结构作为函数参数，传参方式与其他类型的变量或指针类似。您可以使用上面实例中的方式来访问结构变量：</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;string.h&gt;      

struct Books  
{     
    char  title[50];     
    char  author[50];     
    char  subject[100];     
    int   book_id;  
};     

/* 函数声明 */  
void printBook( struct Books book );  

int main( )  
{     
    struct Books Book1;        /* 声明 Book1，类型为 Books */     
    struct Books Book2;        /* 声明 Book2，类型为 Books */        
    
    /* Book1 详述 */     
    strcpy( Book1.title, &quot;C Programming&quot;);     
    strcpy( Book1.author, &quot;Nuha Ali&quot;);      
    strcpy( Book1.subject, &quot;C Programming Tutorial&quot;);     
    Book1.book_id = 6495407;        
    
    /* Book2 详述 */     
    strcpy( Book2.title, &quot;Telecom Billing&quot;);     
    strcpy( Book2.author, &quot;Zara Ali&quot;);     
    strcpy( Book2.subject, &quot;Telecom Billing Tutorial&quot;);     
    Book2.book_id = 6495700;        
    
    /* 输出 Book1 信息 */     
    printBook( Book1 );        
    
    /* 输出 Book2 信息 */     
    printBook( Book2 );        
    
    return 0;  
}  

void printBook( struct Books book )  
{     
    printf( &quot;Book title : %s\n&quot;, book.title);     
    printf( &quot;Book author : %s\n&quot;, book.author);     
    printf( &quot;Book subject : %s\n&quot;, book.subject);     
    printf( &quot;Book book_id : %d\n&quot;, book.book_id);  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Book title : C Programming  
Book author : Nuha Ali  
Book subject : C Programming Tutorial  
Book book_id : 6495407  
Book title : Telecom Billing  
Book author : Zara Ali  
Book subject : Telecom Billing Tutorial  
Book book_id : 6495700</pre>
<hr>
<h2>指向结构的指针</h2>
<p>您可以定义指向结构的指针，方式与定义指向其他类型变量的指针相似，如下所示：</p>
<pre><code class="c">struct Books *struct_pointer;</code></pre>
<p>现在，您可以在上述定义的指针变量中存储结构变量的地址。为了查找结构变量的地址，请把 &amp; 运算符放在结构名称的前面，如下所示：</p>
<pre><code class="c">struct_pointer = &amp;Book1;</code></pre>
<p>为了使用指向该结构的指针访问结构的成员，您必须使用 -&gt; 运算符，如下所示：</p>
<pre><code class="c">struct_pointer-&gt;title;</code></pre>
<p>让我们使用结构指针来重写上面的实例，这将有助于您理解结构指针的概念：</p>

<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">#include &lt;stdio.h&gt;   
#include &lt;string.h&gt;      

struct Books  
{     
    char  title[50];     
    char  author[50];     
    char  subject[100];     
    int   book_id;  
};     

/* 函数声明 */  
void printBook( struct Books *book );  

int main( )  
{     
    struct Books Book1;        /* 声明 Book1，类型为 Books */     
    struct Books Book2;        /* 声明 Book2，类型为 Books */        
    
    /* Book1 详述 */     
    strcpy( Book1.title, &quot;C Programming&quot;);     
    strcpy( Book1.author, &quot;Nuha Ali&quot;);      
    strcpy( Book1.subject, &quot;C Programming Tutorial&quot;);     
    Book1.book_id = 6495407;        
    
    /* Book2 详述 */     
    strcpy( Book2.title, &quot;Telecom Billing&quot;);     
    strcpy( Book2.author, &quot;Zara Ali&quot;);     
    strcpy( Book2.subject, &quot;Telecom Billing Tutorial&quot;);     
    
    Book2.book_id = 6495700;        /* 通过传 Book1 的地址来输出 Book1 信息 */     
    printBook( &amp;Book1 );        /* 通过传 Book2 的地址来输出 Book2 信息 */     
    printBook( &amp;Book2 );        
    
    return 0;  
}  

void printBook( struct Books *book )  
{     
    printf( &quot;Book title : %s\n&quot;, book-&gt;title);     
    printf( &quot;Book author : %s\n&quot;, book-&gt;author);     
    printf( &quot;Book subject : %s\n&quot;, book-&gt;subject);     
    printf( &quot;Book book_id : %d\n&quot;, book-&gt;book_id);  
}</code></pre></div>
  </div>
</div>
<p>当上面的代码被编译和执行时，它会产生下列结果：</p>
<pre>Book title : C Programming  
Book author : Nuha Ali  
Book subject : C Programming Tutorial  
Book book_id : 6495407  
Book title : Telecom Billing  
Book author : Zara Ali  
Book subject : Telecom Billing Tutorial  
Book book_id : 6495700</pre>
<hr>
<h2>位域</h2>
<p>有些信息在存储时，并不需要占用一个完整的字节，而只需占几个或一个二进制位。例如在存放一个开关量时，只有 0 和 1 两种状态，用 1 位二进位即可。为了节省存储空间，并使处理简便，C 语言又提供了一种数据结构，称为&quot;位域&quot;或&quot;位段&quot;。</p>
<p>所谓&quot;位域&quot;是把一个字节中的二进位划分为几个不同的区域，并说明每个区域的位数。每个域有一个域名，允许在程序中按域名进行操作。这样就可以把几个不同的对象用一个字节的二进制位域来表示。</p>
<p>典型的实例：</p>
<ul>
  <li>用 1 位二进位存放一个开关量时，只有 0 和 1 两种状态。</li>
  <li>读取外部文件格式——可以读取非标准的文件格式。例如：9 位的整数。</li>
</ul>
<h3>位域的定义和位域变量的说明</h3>
<p>位域定义与结构定义相仿，其形式为：</p>
<pre><code class="c">struct 位域结构名   {     位域列表    };</code></pre>
<p>其中位域列表的形式为：</p>
<pre><code class="c">类型说明符 位域名: 位域长度 </code></pre>
<p>例如：</p>
<div>
  <div>
    <div><pre><code class="c">struct bs
{      
    int a:8;      
    int b:2;      
    int c:6;  
}data;</code></pre></div>
  </div>
</div>
<p>说明 data 为 bs 变量，共占两个字节。其中位域 a 占 8 位，位域 b 占 2 位，位域 c 占 6 位。</p>
<p>让我们再来看一个实例：</p>
<div>
  <div>
    <div><pre><code class="c">struct packed_struct 
{    
    unsigned int f1:1;    
    unsigned int f2:1;    
    unsigned int f3:1;    
    unsigned int f4:1;    
    unsigned int type:4;    
    unsigned int my_int:9;  
} pack;</code></pre></div>
  </div>
</div>
<p>在这里，packed_struct 包含了 6 个成员：四个 1 位的标识符 f1..f4、一个 4 位的 type 和一个 9 位的 my_int。</p>
<p><strong>对于位域的定义尚有以下几点说明：</strong></p>
<ul>
  <li>
    <p>一个位域必须存储在同一个字节中，不能跨两个字节。如一个字节所剩空间不够存放另一位域时，应从下一单元起存放该位域。也可以有意使某位域从下一单元开始。例如：</p>
    <div>
      <div>
        <div><pre><code class="c">struct bs
{      
    unsigned a:4;      
    unsigned  :4;/* 空域 */      
    unsigned b:4;/* 从下一单元开始存放 */      
    unsigned c:4  
}</code></pre></div>
      </div>
    </div>
    <p>在这个位域定义中，a 占第一字节的 4 位，后 4 位填 0 表示不使用，b 从第二字节开始，占用 4 位，c 占用 4 位。</p>
  </li>
  <li>由于位域不允许跨两个字节，因此位域的长度不能大于一个字节的长度，也就是说不能超过8位二进位。如果最大长度大于计算机的整数字长，一些编译器可能会允许域的内存重叠，另外一些编译器可能会把大于一个域的部分存储在下一个字中。</li>
  <li>
    <p>位域可以是无名位域，这时它只用来作填充或调整位置。无名的位域是不能使用的。例如：</p>
    <div>
      <div>
        <div><pre><code class="c">struct k
{      
    int a:1;      
    int  :2;    /* 该 2 位不能使用 */      
    int b:3;      
    int c:2;  
};</code></pre></div>
      </div>
    </div>
  </li>
</ul>
<p>从以上分析可以看出，位域在本质上就是一种结构类型，不过其成员是按二进位分配的。</p>
<h3>位域的使用</h3>
<p>位域的使用和结构成员的使用相同，其一般形式为：</p>
<pre><code class="c">位域变量名.位域名  位域变量名-&gt;位域名</code></pre>
<p>位域允许用各种格式输出。</p>
<p>请看下面的实例：</p>
<div>
  <h2>实例</h2>
  <div>
    <div><pre><code class="c">main()
{      
    struct bs
    {          
        unsigned a:1;          
        unsigned b:3;          
        unsigned c:4;      
    } bit,*pbit;      
    
    bit.a=1;    /* 给位域赋值（应注意赋值不能超过该位域的允许范围） */      
    bit.b=7;    /* 给位域赋值（应注意赋值不能超过该位域的允许范围） */      
    bit.c=15;    /* 给位域赋值（应注意赋值不能超过该位域的允许范围） */      
    
    printf(&quot;%d,%d,%d\n&quot;,bit.a,bit.b,bit.c);    /* 以整型量格式输出三个域的内容 */      
    pbit=&amp;bit;    /* 把位域变量 bit 的地址送给指针变量 pbit */      
    pbit-&gt;a=0;    /* 用指针方式给位域 a 重新赋值，赋为 0 */      
    pbit-&gt;b&amp;=3;    /* 使用了复合的位运算符 &quot;&amp;=&quot;，相当于：pbit-&gt;b=pbit-&gt;b&amp;3，
                  位域 b 中原有值为 7，与 3 作按位与运算的结果为 3（111&amp;011=011，十进制值为 3） */      
    pbit-&gt;c|=1;    /* 使用了复合位运算符&quot;|=&quot;，相当于：pbit-&gt;c=pbit-&gt;c|1，其结果为 15 */      
    printf(&quot;%d,%d,%d\n&quot;,pbit-&gt;a,pbit-&gt;b,pbit-&gt;c);    /* 用指针方式输出了这三个域的值 */
                            
}</code></pre></div>
  </div>
</div>
<p>上例程序中定义了位域结构 bs，三个位域为 a、b、c。说明了 bs 类型的变量 bit 和指向 bs 类型的指针变量 pbit。这表示位域也是可以使用指针的。</p>	  

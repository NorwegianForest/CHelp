<%@ page contentType="text/html; charset=utf-8" pageEncoding="gb2312"%>
    <h1>C 程序结构</h1>
    <p>在我们学习 C 语言的基本构建块之前，让我们先来看看一个最小的 C 程序结构，在接下来的章节中可以以此作为参考。</p>
    <hr />
    <h2>C Hello World 实例</h2>
    <p>C 程序主要包括以下部分：</p>
    <ul>
      <li>预处理器指令</li>
      <li>函数</li>
      <li>变量</li>
      <li>语句 &amp; 表达式</li>
      <li>注释</li>
    </ul>
    <p>让我们看一段简单的代码，可以输出单词 &quot;Hello World&quot;：</p>
    <div>
    <hr />
      <h2>实例</h2>
      <div>
        <div><pre><code class="c">#include &lt;stdio.h&gt;

int main()
{
    /* 我的第一个 C 程序 */
    printf(&quot;Hello, World! \n&quot;);
    return 0;
}</code></pre></div>
      </div>
    </div>
    <p>接下来我们讲解一下上面这段程序：</p>
    <ol>
      <li>程序的第一行 <em>#include &lt;stdio.h&gt;</em> 是预处理器指令，告诉 C 编译器在实际编译之前要包含 stdio.h 文件。</li>
      <li>下一行 <em>int main()</em> 是主函数，程序从这里开始执行。</li>
      <li>下一行 /*...*/ 将会被编译器忽略，这里放置程序的注释内容。它们被称为程序的注释。</li>
      <li>下一行 <em>printf(...)</em> 是 C 中另一个可用的函数，会在屏幕上显示消息 &quot;Hello, World!&quot;。</li>
      <li>下一行 <strong>return 0;</strong> 终止 main() 函数，并返回值 0。</li>
    </ol>
    <hr />
    <h2>编译 &amp; 执行 C 程序</h2>
    <p>接下来让我们看看如何把源代码保存在一个文件中，以及如何编译并运行它。下面是简单的步骤：</p>
    <ol>
      <li>打开一个文本编辑器，添加上述代码。</li>
      <li>保存文件为 <em>hello.c</em>。</li>
      <li>打开命令提示符，进入到保存文件所在的目录。</li>
      <li>键入 <em>gcc hello.c</em>，输入回车，编译代码。</li>
      <li>如果代码中没有错误，命令提示符会跳到下一行，并生成 <em>a.out</em> 可执行文件。</li>
      <li>现在，键入 <em>a.out</em> 来执行程序。</li>
      <li>您可以看到屏幕上显示 <em>&quot;Hello World&quot;</em>。</li>
    </ol>
    <pre>$ gcc hello.c<br>
$ ./a.out<br>
Hello, World!</pre>
    <p>请确保您的路径中已包含 gcc 编译器，并确保在包含源文件 hello.c 的目录中运行它。</p>

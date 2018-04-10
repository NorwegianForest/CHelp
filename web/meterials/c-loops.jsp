<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
  <h1>C 循环</h1>
  <div>
    <p>有的时候，我们可能需要多次执行同一块代码。一般情况下，语句是按顺序执行的：函数中的第一个语句先执行，接着是第二个语句，依此类推。</p>
    <p>编程语言提供了更为复杂执行路径的多种控制结构。</p>
    <p>循环语句允许我们多次执行一个语句或语句组，下面是大多数编程语言中循环语句的流程图：</p>
    <img src="http://www.runoob.com/wp-content/uploads/2015/12/loop.png" alt="循环结构" /></div>
    <hr>
  <h2>循环类型</h2>
  <p>C 语言提供了以下几种循环类型。点击链接查看每个类型的细节。</p>
  <table border=1>
    <tbody>
      <tr>
        <th>循环类型</th>
        <th>描述</th>
      </tr>
      <tr>
        <td><a href="http://www.runoob.com/cprogramming/c-while-loop.html" title="C 中的 while 循环">while 循环</a></td>
        <td>当给定条件为真时，重复语句或语句组。它会在执行循环主体之前测试条件。</td>
      </tr>
      <tr>
        <td><a href="http://www.runoob.com/cprogramming/c-for-loop.html" title="C 中的 for 循环">for 循环</a></td>
        <td>多次执行一个语句序列，简化管理循环变量的代码。</td>
      </tr>
      <tr>
        <td><a href="http://www.runoob.com/cprogramming/c-do-while-loop.html" title="C 中的 do...while 循环">do...while 循环</a></td>
        <td>除了它是在循环主体结尾测试条件外，其他与 while 语句类似。</td>
      </tr>
      <tr>
        <td><a href="http://www.runoob.com/cprogramming/c-nested-loops.html" title="C 中的嵌套循环">嵌套循环</a></td>
        <td>您可以在 while、for 或 do..while 循环内使用一个或多个循环。</td>
      </tr>
    </tbody>
  </table>
  <br />
  <hr>
  <h2>循环控制语句</h2>
  <p>循环控制语句改变你代码的执行顺序。通过它你可以实现代码的跳转。</p>
  <p>C 提供了下列的循环控制语句。点击链接查看每个语句的细节。</p>
  <table border=1>
    <tbody>
      <tr>
        <th>控制语句</th>
        <th>描述</th>
      </tr>
      <tr>
        <td><a href="http://www.runoob.com/cprogramming/c-break-statement.html" title="C 中的 break 语句">break 语句</a></td>
        <td>终止<strong>循环</strong>或 <strong>switch</strong> 语句，程序流将继续执行紧接着循环或 switch 的下一条语句。</td>
      </tr>
      <tr>
        <td><a href="http://www.runoob.com/cprogramming/c-continue-statement.html" title="C 中的 continue 语句">continue 语句</a></td>
        <td>告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。</td>
      </tr>
      <tr>
        <td><a href="http://www.runoob.com/cprogramming/c-goto-statement.html" title="C 中的 goto 语句">goto 语句</a></td>
        <td>将控制转移到被标记的语句。但是不建议在程序中使用 goto 语句。</td>
      </tr>
    </tbody>
  </table>
  <br />
  <hr>
  <h2>无限循环</h2>
  <p>如果条件永远不为假，则循环将变成无限循环。<strong>for</strong> 循环在传统意义上可用于实现无限循环。由于构成循环的三个表达式中任何一个都不是必需的，您可以将某些条件表达式留空来构成一个无限循环。</p>
  <div>
    <h2>实例</h2>
    <div>
      <div><pre><code class="c" >#include &lt;stdio.h&gt;      
      
int main ()  
{     
    for( ; ; )     
    {        
        printf(&quot;该循环会永远执行下去！\n&quot;);     
    }     
    return 0;  
}</code></pre></div>
    </div>
  </div>
  <p>当条件表达式不存在时，它被假设为真。您也可以设置一个初始值和增量表达式，但是一般情况下，C 程序员偏向于使用 for(;;) 结构来表示一个无限循环。</p>
  <p><strong>注意：</strong>您可以按 Ctrl + C 键终止一个无限循环。</p>	  

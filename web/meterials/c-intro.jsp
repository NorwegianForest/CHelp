<%@ page contentType="text/html; charset=utf-8" pageEncoding="gb2312"%>
    <h1>C 简介</h1>
    <div>
      <p>C 语言是一种通用的高级语言，最初是由丹尼斯里奇在贝尔实验室为开发 UNIX 操作系统而设计的。C 语言最开始是于 1972 年在 DEC PDP-11 计算机上被首次实现。</p>
      <p>在 1978 年，布莱恩柯林汉（Brian Kernighan）和丹尼斯里奇（Dennis Ritchie）制作了 C 的第一个公开可用的描述，现在被称为 K&amp;R 标准。</p>
      <p>UNIX 操作系统，C编译器，和几乎所有的 UNIX 应用程序都是用 C 语言编写的。由于各种原因，C 语言现在已经成为一种广泛使用的专业语言。</p>
      <ul>
        <li>易于学习。</li>
        <li>结构化语言。</li>
        <li>它产生高效率的程序。</li>
        <li>它可以处理底层的活动。</li>
        <li>它可以在多种计算机平台上编译。</li>
      </ul>
    </div>
    <hr />
    <h2>关于 C</h2>
    <ul>
      <li>C 语言是为了编写 UNIX 操作系统而被发明的。</li>
      <li>C 语言是以 B 语言为基础的，B 语言大概是在 1970 年被引进的。</li>
      <li>C 语言标准是于 1988 年由美国国家标准协会（ANSI，全称 American National Standard Institute）制定的。</li>
      <li>截至 1973 年，UNIX 操作系统完全使用 C 语言编写。</li>
      <li>目前，C 语言是最广泛使用的系统程序设计语言。</li>
      <li>大多数先进的软件都是使用 C 语言实现的。</li>
      <li>当今最流行的 Linux 操作系统和 RDBMS（Relational Database Management System：关系数据库管理系统） MySQL 都是使用 C 语言编写的。</li>
    </ul>
    <hr />
    <h2>为什么要使用 C？</h2>
    <p>C 语言最初是用于系统开发工作，特别是组成操作系统的程序。由于 C 语言所产生的代码运行速度与汇编语言编写的代码运行速度几乎一样，所以采用 C 语言作为系统开发语言。下面列举几个使用 C 的实例：</p>
    <ul>
      <li>操作系统</li>
      <li>语言编译器</li>
      <li>汇编器</li>
      <li>文本编辑器</li>
      <li>打印机</li>
      <li>网络驱动器</li>
      <li>现代程序</li>
      <li>数据库</li>
      <li>语言解释器</li>
      <li>实体工具</li>
    </ul>
    <hr />
    <h2>C 程序</h2>
    <p>一个 C 语言程序，可以是 3 行，也可以是数百万行，它可以写在一个或多个扩展名为 <strong>&quot;.c&quot;</strong> 的文本文件中，例如，<em>hello.c</em>。您可以使用 <strong>&quot;vi&quot;</strong>、<strong>&quot;vim&quot;</strong> 或任何其他文本编辑器来编写您的 C 语言程序。</p>
    <p>本教程假定您已经知道如何编辑一个文本文件，以及如何在程序文件中编写源代码。</p>
    <hr />
    <h2>C11</h2>
    <p>C11（也被称为C1X）指ISO标准ISO/IEC 9899:2011，是当前最新的C语言标准。在它之前的C语言标准为C99。</p>
    <h3>新特性</h3>
    <ul>
      <li>
        <p>对齐处理（Alignment）的标准化（包括_Alignas标志符，alignof运算符，aligned_alloc函数以及&lt;stdalign.h&gt;头文件）。</p>
      </li>
      <li>
        <p>_Noreturn 函数标记，类似于 gcc 的 __attribute__((noreturn))。</p>
      </li>
      <li>
        <p>_Generic 关键字。</p>
      </li>
      <li>
        <p>多线程（Multithreading）支持，包括：<br />
          _Thread_local存储类型标识符，&lt;threads.h&gt;头文件，里面包含了线程的创建和管理函数。<br />
          _Atomic类型修饰符和&lt;stdatomic.h&gt;头文件。</p>
      </li>
      <li>
        <p>增强的Unicode的支持。基于C Unicode技术报告ISO/IEC TR 19769:2004，增强了对Unicode的支持。包括为UTF-16/UTF-32编码增加了char16_t和char32_t数据类型，提供了包含unicode字符串转换函数的头文件&lt;uchar.h&gt;。</p>
      </li>
      <li>
        <p>删除了 gets() 函数，使用一个新的更安全的函数gets_s()替代。</p>
      </li>
      <li>
        <p>增加了边界检查函数接口，定义了新的安全的函数，例如 fopen_s()，strcat_s() 等等。</p>
      </li>
      <li>
        <p>增加了更多浮点处理宏(宏)。</p>
      </li>
      <li>
        <p>匿名结构体/联合体支持。这个在gcc早已存在，C11将其引入标准。</p>
      </li>
      <li>
        <p>静态断言（Static assertions），_Static_assert()，在解释 #if 和 #error 之后被处理。</p>
      </li>
      <li>
        <p>新的 fopen() 模式，(&quot;…x&quot;)。类似 POSIX 中的 O_CREAT|O_EXCL，在文件锁中比较常用。</p>
      </li>
      <li>
        <p>新增 quick_exit() 函数作为第三种终止程序的方式。当 exit()失败时可以做最少的清理工作。</p>
      </li>
    </ul>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <br />
    <p>      
    
    <br>

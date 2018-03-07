/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ctest2

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-07 09:11:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `name` varchar(16) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('szl', '123456');

-- ----------------------------
-- Table structure for backup
-- ----------------------------
DROP TABLE IF EXISTS `backup`;
CREATE TABLE `backup` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `a_option` varchar(255) DEFAULT NULL,
  `b_option` varchar(255) DEFAULT NULL,
  `c_option` varchar(255) DEFAULT NULL,
  `d_option` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backup
-- ----------------------------
INSERT INTO `backup` VALUES ('1', '下列描述中正确的是', '算法是指对解题方案的准确而完整的描述', '算法的有穷性是指算法程序的长度是有限的', '算法是否有效与拥有的情报无关', '算法的基本特征有可行性、确定性和有穷性', '1');
INSERT INTO `backup` VALUES ('2', '下列数据结构中属于非线性结构的是', '队列', '线性表', '二叉树', '栈', '3');
INSERT INTO `backup` VALUES ('3', '4个元素A、B.C.D依次入栈，入栈过程中允许栈顶元素出栈假设某一时刻栈\r\n的状态是C(栈页) B、A(栈底，则不可能的出栈顺序是', 'DCBA', 'CBDA', 'CADB', 'CDBA', '3');
INSERT INTO `backup` VALUES ('4', '下列叙述中正确的是', '顺予存储结构的存储一-定是连续的，链式存储结构的存储空问间不一定是连续的', '顺序存储结构只针对线性结构，链式存储结构只针对非线性结构', '顺序存储结构能存储有序表链式存储结构下能存储有序表', '链式存储结构比1顺序存储结构节省存储空间', '1');
INSERT INTO `backup` VALUES ('5', '下面概念中，不属于面向对象方法的是', '对象', '继承', '类', '过程调用', '4');
INSERT INTO `backup` VALUES ('6', '下列选项中属于软件生命周期开发阶段任务的是', '可行性研究', '需求分析', '详细设计', '软件维护', '3');
INSERT INTO `backup` VALUES ('7', '软件设计中衡量模块独立性的度量标准是', '抽象和信息隐蔽', '局部化和封装化', '内聚性和耦合性', '激活机制和控制方法', '3');
INSERT INTO `backup` VALUES ('8', '下列不属于过程设计工具中图形工的是', 'N-S\r\n', 'PAD', '程序流程图', 'DFD', '4');
INSERT INTO `backup` VALUES ('9', '下列叙述中错误的是', '数据库管理系统是故据库的核心', '数据库系统由数据库、数据库管理系统、数据库管理员三部分组成', '数据共享最好的是数据库系统阶段', '数据库中的数据独立于应用程序而不依赖于应用程序', '2');
INSERT INTO `backup` VALUES ('10', '在下列选项中，哪个不是- 一个剪法- -般应该具有的基本特征', '无穷性', '可行性', '确定性', '有穷性', '1');
INSERT INTO `backup` VALUES ('11', '在C语言中，合法的长整型常数是', '0.123456', '4962717', '9L', '5.321e2', '3');
INSERT INTO `backup` VALUES ('12', '执行语句X=(a=10，b=a--.后，x、a、b的值依次为', '10,10,9', '10,9,9', '9,10,9', '10,9,10', '4');
INSERT INTO `backup` VALUES ('13', '以下选项中非法的表达式是', 'a+1=a+1', 'a=b==0', '(Char.(100+ 100.', '7<=X<60', '1');
INSERT INTO `backup` VALUES ('14', '在以下选项中，不正确的赋值语句是', 'i++ ;', 'n1=(n2=(n3=0..;', 'm+n=1;', 'i=k==j ;', '3');
INSERT INTO `backup` VALUES ('15', '若有说明，double*m,n; 则能通过sCanf语句正确给输入项读人数据的程序段是', '*m= &n;scanf(\"%lf*m);', 'm= (double* )mallo (1 0);sc anf(\"%6f\'m);', 'm = &n;scant(%l*,n);', 'm = &n;scanf(\"%le\"\'m);', '4');
INSERT INTO `backup` VALUES ('16', '表示关系M<=N<=P的C语言表达式为', '(M<=N.AND(N<=P.', '(M<=N.&&(N<=P.', '(M<=N<=P.', '(M<=N.&(N<=P.', '2');
INSERT INTO `backup` VALUES ('17', '以下叙述中正确的是', '在scanf函数的格式串中，必须有与输入项一一对应的格式转换说明符', '只能在prinf函数中指定输入数据的宽度，而不能在scanf函数中指定输入数据占的宽度', 'scanf函数中的字符串，是提示程序员的，输入数据时不必管它', '复合语句也被称为语句块，它至少要包含两条语句', '1');
INSERT INTO `backup` VALUES ('18', '以下叙述中正确的是', '在scanf函数中的格式控制字符串是为了输入数据用的，不会输出到屏幕上', '在使用scanf函数输入整故或实故时，输入数据之间5 ?能用空格来分隔', '在Printf函数中，各个输出项只能是变量', '使用Printf函数无法输出百分号%', '1');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `exercise_id` mediumint(8) NOT NULL,
  `username` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('7', '11', 'szl');
INSERT INTO `collection` VALUES ('8', '21', 'szl');
INSERT INTO `collection` VALUES ('9', '1', 'szl');
INSERT INTO `collection` VALUES ('10', '1', 'suzelin');
INSERT INTO `collection` VALUES ('11', '10', 'suzelin');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `introduce` varchar(2048) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'C语言程序设计', '2014-05-22', '2014-09-01', '程序设计是一门基础课程。对于计算机相关专业而言，程序设计是专业基础知识，是进一步学习其他专业知识的第一步阶梯；对于非计算机专业而言，程序设计的学习有助于理解计算机的能力所在，理解哪些是计算机擅长解决的问题，怎样的方式方法是计算机擅长的手段，从而能更好地利用计算机来解决本专业领域内的问题。\r\n\r\nC语言是古老而长青的编程语言，它具备了现代程序设计的基础要求，它的语法是很多其他编程语言的基础，在系统程序、嵌入式系统等领域依然是无可替代的编程语言，在各类编程语言排行榜上常年占据前两名的位置。\r\n\r\n对于非计算机专业的学生，学习本课程的主要目的是掌握程序设计的基本方法，C语言是教学媒介。但是对于计算机专业的学生，本课程是向后续的计算机组成、操作系统、编译原理、体系结构等课程前进的基石，对于C语言本身甚至程序设计语言基础原理的深入理解都是应该掌握的。\r\n\r\n程序设计是实践性很强的课程，该课程的学习有其自身的特点，听不会，也看不会，只能练会。你必须通过大量的编程训练，在实践中掌握编程知识，培养编程能力，并逐步理解和掌握程序设计的思想和方法。在这里所提供的，只是基础的知识讲解，要想学会编程，还需要更多时间的投入和努力。\r\n\r\n  为了学习编程，你需要有一台计算机，安装必要的编程软件。无论是MS Windows、Mac OS X还是Linux，都有适合C语言编程的软件。', 'A065FC17D39ACEB56C1A94FAF6A3F543.png', '6');
INSERT INTO `course` VALUES ('2', 'C语言程序设计(上)', '2018-03-26', '2018-06-30', '我们一如既往还说C，因为它称霸于计算机语言，超乎我们的想象。\r\n\r\n        如果想深刻的理解这个时代，就要理解计算机编程! 编程完成了基于计算机的计算实现，改变着我们的思维方式！ 编程的日子上演着种种惊喜，让我们实现着梦想！\r\n       C 语言具备了面向过程程序设计的基本要求，在诸多领域无可替代，也适合于构建程序设计基础。所以它是一门程序设计的公共基础课程，相信也是热爱程序设计的朋友们会青睐的一门课。对于计算机类专业，程序设计是专业基础课，它是后续专业课程的基础；对于非计算机类专业，程序设计将会改变我们的思维，教给我们信息时代如何思考问题，从而能更好地利用计算机科学与技术解决本专业领域的计算相关、信息处理相关的问题。\r\n        为了循序渐进，我们将《C语言程序设计》这门课程分为上、下两部分完成。以数组为分割点，由《C语言程序设计（上）》和《C语言程序设计（下）》，前者8周，后者10周。采用分而治之，旨在由浅入深，坚固基础，追求完备。\r\n        我们的课堂将从零基础开始，为大家介绍“什么是程序设计？如何实现程序设计？”。本课程以计算思维为导向，以应用问题为牵引，以能力培养为目标，实施 “传授知识与思维训练相结合，编程语言与程序设计相结合，自主学习与平台引导相结合”的教学模式。', '4A5DADAAACFEEFE79DFF9C19E626C659.jpg', '7');
INSERT INTO `course` VALUES ('3', 'C语言程序设计（下）', '2018-03-26', '2018-06-30', '欢迎大家进入C语言程序设计第二部分的学习。\r\n\r\n相信大家已经掌握了C语言的基本语法，学会用三种基本结构编写程序，能够解决一般的数值处理问题、穷举问题等。 就如同学习汉语，大家已经学习了字、组词、造句，能够写短文了，接下来是怎样写长文章？对应C语言来说，我们如何设计较长的程序？如何解决相对复杂的问题？如何重复使用某一段代码？\r\n\r\n有人说编程是艺术，用C就可以写出很“美“的代码。例如如果我们不用循环结构，不用递归算法，能不能在屏幕上输出从1到1000？学完这部分，大家就可以试试啦。\r\n\r\n    C语言的基本结构是函数，其基本含义是：一个软件可以由多个源程序（文件）组成；一个源程序（文件）可以由多个函数组成；函数就是一段具有某种功能的程序，除主函数之外，用户写的这段程序叫做用户定义函数，由函数名，参数，说明语句和执行语句构成。定义后的函数可以重复被主函数或其他函数调用。所以说，函数是实现模块化设计的基础。\r\n\r\n更为神奇的是，如果我们把函数的组成部分细化，列出一个树状的结构，你会发现你学过的C语言的基础知识内容都在里面啦，学过函数后，你也可以试试啊。\r\n\r\n怎么使用函数呢？函数的递归调用是难点，要掌握编写递归算法的关键，通过典型的递归问题掌握编写递归程序的技巧；其次要将前面各章中的一些题目用递归算法实现，通过对比分析，加深对递归的理解和掌握。\r\n\r\n接下来，我们学习指针。指针是C语音的特色，也是C语言中最灵活的地方。\r\n\r\n如何学习指针呢？ C语言中指针就是地址。大家要掌握指向变量的指针，指向数组的指针，指向函数的指针，指向指针的指针,指针数组等。注意从定义和引用的形式上区分不同功能的指针，要理解指针与数组的关系，以及定义了指针之后，如何引用变量的值等具体问题，\r\n\r\n结构、联合与枚举都是C语言中的构造数据类型，是基本数据类型的某种组合。\r\n\r\n 链表是指针、结构体的高级应用，也是C语言各阶段语法知识的综合体现。链表就是动态的数据结构。要掌握链表如何定义，如何建立简单的单向链表，以及学会编写链表中节点的插入、删除等基本操作。在上述知识和练习基础上，练习编写小软件，例如：学生档案管理系统等。\r\n\r\n以往程序中对数据的操作均在内存上实现，随着程序运行的结束，变量的内存空间和变量的值均消失。C语言中可以利用文件实现数据在外存上的存取操作。\r\n\r\n  首先要掌握文件的基本概念，其中重要的是文件型指针，文件通过文件指针操作。要学会使用文件读写函数，分别实现文件的按字符读写、按字符串读写、按数据块读写和按格式读写；还有文件当前状态的测试函数等，必须熟练使用这些函数。', '4A5DADAAACFEEFE79DFF9C19E626C659.jpg', '7');
INSERT INTO `course` VALUES ('4', 'C语言程序设计精髓', '2018-02-05', '2018-06-10', '   对于这个地球上大多数人来说，真正的数字化革命还没有开始。在接下来的10年里，变化将无处不在，让我们一起来给这个世界编码吧！——Eric Schmidt Google执行主席    \r\n\r\n   我们会用15周的时间来深入讲解C语言，在授课过程中，我们会注重多解释一些“为什么”以及错误程序的分析，从环环相扣的问题入手，将一些易被忽视且对高水平程序设计很重要的“点”，沿着数据结构从简单到复杂的主线逐一展开，在实例的“不断深化和提升”中引出知识点，通过对问题的举一反三和前后知识点的融会贯通，由浅入深地引导你循序渐进地编写规模逐步增大的程序。\r\n\r\n   在过去30年90%的时间里，C语言独领风骚，仅偶尔被 Java 超越，可见其魅力。C语言作为一种高级语言，其实并不高级，但正是这种“低级”给我们更多思考的机会。期望通过本课程的学习，你不只是简单地能够掌握一种语言的语法，还能理解隐含在语法背后的思想，并初步具备灵活使用这些思想进行编写程序解决实际问题的能力。如果你掌握了这些，你会发现，迈向成功的最后一步不过是选择一种合适的编程工具而已。 \r\n\r\n   你想从“菜鸟”升级为“程序猿”吗？那就加入“稀饭”的行列，和我们一起踏上爱上C语言之旅吧。', '2983071803279791004.png', '8');
INSERT INTO `course` VALUES ('5', 'C语言程序设计', '2018-03-12', '2018-06-17', '\r\nC语言是一门结构化程序设计语言，是计算机程序语言的基础，兼有高级语言和低级语言的功能，不仅可用于编写应用软件，还可以编写系统软件以及嵌入式系统。目前流行的面向对象程序设计语言，如C++、Java、C#等都是在C语言的基础上发展派生而来的。通过学习C语言不仅能够掌握程序设计的基本思想，也可为今后学习Java、C++、VB等语言打下良好的基础。\r\n\r\nC语言可以用于开发比较底层的东西，比如驱动、通信协议之类，在Unix和Linux环境中也是不可或缺的，另外在嵌入式领域也大有作为。\r\n\r\n     本课程讲解C语言的基本数据类型及其运算、分支结构、循环结构、数组、函数、结构体、指针和文件等内容。\r\n\r\n     如果懂得C，就能很好地理解程序设计的思想，理解如何构造数组、链表、树、图等结构，才能体验程序设计的思想和算法的精髓。', '49BB70C94F0AA99BE0A0EE30E7B1B4E4.jpg', '9');
INSERT INTO `course` VALUES ('6', 'C语言程序设计进阶', '2017-11-06', '2018-01-16', '课程以一个Windows下的图形游戏程序入手，借助一个C语言图形库，展开全部的教学内容。\r\n\r\n作为计算机的基础语言，C语言有许多独特的地方。从1970年代诞生起，它的历史使命就是编写系统程序，它被设计成非常贴近底层、贴近硬件。它的很多独特的设计都是为了能够准确地反映硬件操作。但是历史又和C语言开了一个玩笑，它被当作了第一个通用型语言，曾经广泛地用于各种场合，解决各种问题。可是它之后的语言，再也没有像它那样贴近硬件，它们拿掉了那些硬件相关的东西，变得越来越远离底层了。\r\n\r\n这门课，就是要告诉你C语言到底有哪些独特的地方，为什么能长期占据15%上下的编程语言份额。它是在前序课程——《程序设计入门-C语言》或《程序设计入门-Java语言》的基础上，让你完全掌握C语言本身的课程。\r\n\r\n虽然我们会借助一个Windows下的图形库来展开教学内容，但是用C语言写Windows程序已经是过去式了，我们并不是要教大家如何用C语言来写Windows程序，只是借一下故事而已。', '6608226511143817333.jpg', '6');

-- ----------------------------
-- Table structure for exercises
-- ----------------------------
DROP TABLE IF EXISTS `exercises`;
CREATE TABLE `exercises` (
  `exercise_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `exercise_title` varchar(255) DEFAULT NULL,
  `a_option` varchar(255) DEFAULT NULL,
  `b_option` varchar(255) DEFAULT NULL,
  `c_option` varchar(255) DEFAULT NULL,
  `d_option` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `paper_id` int(11) DEFAULT NULL,
  `paper_title` varchar(255) DEFAULT NULL,
  `difficulty` mediumint(8) DEFAULT NULL,
  `analysis` varchar(1023) DEFAULT NULL,
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exercises
-- ----------------------------
INSERT INTO `exercises` VALUES ('1', '下列描述中正确的是', '算法是指对解题方案的准确而完整的描述', '算法的有穷性是指算法程序的长度是有限的', '算法是否有效与拥有的情报无关', '算法的基本特征有可行性、确定性和有穷性', 'A', '1', '第1章_程序设计基本概念', '2', '无解析');
INSERT INTO `exercises` VALUES ('2', '下列数据结构中属于非线性结构的是', '队列', '线性表', '二叉树', '栈', 'C', '1', '第1章_程序设计基本概念', '2', '无解析');
INSERT INTO `exercises` VALUES ('3', '在C语言中，合法的长整型常数是', '0.123456', '4962717', '9L', '5.321e2', 'C', '1', '第1章_程序设计基本概念', '3', '无解析');
INSERT INTO `exercises` VALUES ('4', '执行语句X=(a=10，b=a--.后，x、a、b的值依次为', '10,10,9', '10,9,9', '9,10,9', '10,9,10', 'D', '1', '第1章_程序设计基本概念', '4', '无解析');
INSERT INTO `exercises` VALUES ('5', '下面概念中，不属于面向对象方法的是', '对象', '继承', '类', '过程调用', 'D', '1', '第1章_程序设计基本概念', '5', '无解析');
INSERT INTO `exercises` VALUES ('6', '下列选项中属于软件生命周期开发阶段任务的是', '可行性研究', '需求分析', '详细设计', '软件维护', 'C', '1', '第1章_程序设计基本概念', '4', '无解析');
INSERT INTO `exercises` VALUES ('7', '软件设计中衡量模块独立性的度量标准是', '抽象和信息隐蔽', '局部化和封装化', '内聚性和耦合性', '激活机制和控制方法', 'C', '1', '第1章_程序设计基本概念', '3', '无解析');
INSERT INTO `exercises` VALUES ('8', '下列不属于过程设计工具中图形工的是', 'N-S', 'PAD', '程序流程图', 'DFD', 'D', '1', '第1章_程序设计基本概念', '4', '无解析');
INSERT INTO `exercises` VALUES ('9', '下列叙述中错误的是', '数据库管理系统是故据库的核心', '数据库系统由数据库、数据库管理系统、数据库管理员三部分组成', '数据共享最好的是数据库系统阶段', '数据库中的数据独立于应用程序而不依赖于应用程序', 'B', '1', '第1章_程序设计基本概念', '5', '无解析');
INSERT INTO `exercises` VALUES ('10', '在下列选项中，哪个不是-', '无穷性', '可行性', '确定性', '有穷性', 'A', '1', '第1章_程序设计基本概念', '5', '无解析');
INSERT INTO `exercises` VALUES ('11', '程序流程图中带有前头的线段表示的是', '图九美系', '教据漆', '控制疏', '调用关系', 'C', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '1', '在数据流图中，用标有名字的前头表示故据流。右程序流程图中，用标有名字的箭头表示控\r\n制流。所以选择C');
INSERT INTO `exercises` VALUES ('12', '结构化程序设计的基本原则不包括', '多态性', '自頂向下', '模块化', '逐步求精', 'A', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '2', '结构化程序设计的思想包括。自顶向下、逐步求精、模块化、限制使用goto语句，所以选择\r\nA\r\n');
INSERT INTO `exercises` VALUES ('13', '教件设计中模块划分应遵酒的准则是', '低内聚低耦合', '高内聚低耦合', '低内聚高耦合', '高内聚高耦合', 'B', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '4', '软件设计中模块划分应遵语的准贝是高内聚低偶台、模块大小规模适当、模块的依赖关系适\r\n当等。模块的划分应遵语一定的要求，以保证模块划分合理，并进一步保证以此为依据开发出的软件系统可\r\n靠性强，县于理解和维护。模块之间的耦合应尽可能的低，模块的內聚度应尽可能的高');
INSERT INTO `exercises` VALUES ('14', '在软件开发中，需家分析阶段产生的主要文档是', '可行性分析报告', '软件需求规格说明书', '概要设计说明书', '集成测试计划', 'B', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '3', '解析1A 增误，可行性分析阶码产生可行性分析报告。C)借误概要设计说明书是总体设计阶段产\r\n生的文档。D)错误，集成商试计划是在概要设计阶段编写的文档。B)正确，需求规格说明书是后续工作如设\r\nt、编码等需要的重要参考文档。');
INSERT INTO `exercises` VALUES ('15', '算法的有穷性是指', '算法程序的运行时间是有限的', '算法程序所处理的数据量是有限的', '算法程序的长度是有限的', '算法只能被有限的用户使用', 'A', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '5', '算法原贝上能够情确地运行.而且人们用笔和纸做有限次运算后即可完成。有方性是指算法\r\n程序的运行时间是有限的');
INSERT INTO `exercises` VALUES ('16', '对长度为r的线住表排序，在最坏情况下，比较次数不是a(n一D/2的排序方法是', '快速排序', '冒泡排序', '直接插入排序', '堆排序', 'D', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '3', '除了堆排序算法的比较次故是\r\nO(eleson)，其他的都是n(n一D/2.');
INSERT INTO `exercises` VALUES ('17', '下列关于栈的前述正确的是', '栈按“先进先出“组织数据', '栈按”先进后出“组织教据', '只能在栈底插入数据', '不能到际教据', 'B', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '2', '栈是按失进出的原则组乡数据的数据的板和田际都在核债进行操作、\r\n笔记');
INSERT INTO `exercises` VALUES ('18', '在数据库设计中，将E一图转换成关系故据模型的过程属于', '需求分析阶段', '概念设计阶段', '逻辑设计阶段', '物理设计阶段', 'C', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '2', 'E一R图转换成关系横型数据则是把图形分析出来的联系反映子数据库中，即设计出表，所以\r\n属于逻辑设计阶段。');
INSERT INTO `exercises` VALUES ('19', '有表示4 性选课的三张表，学生S( 学号，姓名，性別，年齡，身份证号)，课程C(课号，课名)，选课SC(学\r\n好，课号，成绩》，则表SC的关键字(健或码)为', '课号，成績', '学号，咸绩', '学号课号', '学号，姓名成绩', 'C', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '3', '学号是学生表S的王键，课号是课程表C的主键，所选课表$的关键字就应该是与前两表\r\n能够直接联系且能唯一定义的学号和评号，所以选择C');
INSERT INTO `exercises` VALUES ('20', '以下额述中错误的是', 'C语言中的每条可扶行语句和非执行语句最终都将被转换成二进制的机器指令', 'c程序经过编详、连接步黎之后才能形成一个真正可执行的二进制机器指令文件', '用C语言编写的程序称为源程序，它以ASCI代码形式存放在一个文本文件中', 'C语言源程序经编译后生成后握为ob的目标程序', 'B', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '3', 'C语言中的非执行语均不会被编评，不会生成二选制的机器指令，所以入)错误。由C语宫构\r\n成的指令予列称C源程序，C源程序经过C语言编译程序编评之后生成一个后援为。ORJ的二进制文件(称为目\r\n标文件) 最后委由“连接程序“把此。OBJ文件与C语言提供的各种库函数连接起来生成一个后提为，X的可\r\n执行文件。');
INSERT INTO `exercises` VALUES ('21', '以下选项中，合法的一组C语言效值常量是', '12.0Xa23 4 5e0', '028.5e-3-0xt', '，177 4o1.5 Oabc', '0x8A 10,000 3.e5', 'A', '6', '2015年9月计算机二级考试《C语言》真题及解析', '4', 'C语言中八选制整型常量的开头是故字0 十六进制整型常量的开头数字是OX。C语言中的实\r\n型常量有两种表示形式，小数形式，小数形式表示的实型常量必须要有小致点指数元式，以”。“或下“后\r\n跟一个整故来表示以10为底数的某故，且规定字母。或之前必须要有数字，且。或后面的指数必页为整\r\n故。B)选项中028错误，八进制中没有数字8。C)选项中41.5中6后面的指数不是整数。D)选项中3.e5小数\r\n点后面缺少数字。');
INSERT INTO `exercises` VALUES ('22', '以下选项中不台法的标识符是', '&a', 'FOR', 'print', '00', 'A', '6', '2015年9月计算机二级考试《C语言》真题及解析', '4', 'C 语言中标识符由字母、下切线、数字组成，且开4 必须是字母或下划线。另外，关键字不能\r\n作为标识符。因为C语言中区分大小写，所以B)法顶中的“FOR”可以作为标识符来用。A)选项中含有非法字符\r\nk，所以选择A');
INSERT INTO `exercises` VALUES ('23', '苦有定义，double 45 22 int i=0.k= 18r 则不符合C语言规定的赋值语句是', 'i- (a+k)< (i+k);', 'i=a%11', 'a=a++，i++', 'i=! a', 'B', '6', '2015年9月计算机二级考试《C语言》真题及解析', '2', '取模运算符“%”，二元运算符，具有左结合性，参与运算的量均为整型。选项肿中的变量是\r\ndouble实型，所以B)不符合规定。');
INSERT INTO `exercises` VALUES ('24', '下关干逻辑运算符两偶运算对象的叙述中正确的是', '可以是任意合法的表达式', '只能是整数0或非0整数', '可以是结构体类型的数据', '只能是整數0或1', 'A', '6', '2015年9月计算机二级考试《C语言》真题及解析', '4', 'C语言的逻辑运算符比较特别，它的操作数设有明确的故据夫型，可以是任意合法的表达式，\r\n所以选择A');
INSERT INTO `exercises` VALUES ('25', '以下毅述中错误的是', '可以给指针变量赋一个整数作为地址值', '函数可以返回地址值', '改变角数形参的值，不会改变对应实参的值', '当在程序的开头包含头文件stdio.h时，可以给指针变量財NULL', 'A', '6', '2015年9月计算机二级考试《C语言》真题及解析', '1', '不能行一个整故直接赋给指针变量作为地址，所w是错误的函数的返回值可以是地址，\r\n即指针。函数调用中形参值的变化不会传递给实梦');
INSERT INTO `exercises` VALUES ('26', '设已有定义，float x 则以下对指针支量p进行定义且财切值的语句中正确的是', 'int *p= (tloat)x:', 'tloat *p-bx', 'float D=&x;', 'f1oat *p= 1024', 'B', '6', '2015年9月计算机二级考试《C语言》真题及解析', '2', '指计是用来存放地址的支量，用(类型名+指针变量名)的无式定义。赋值时应将其个变量地\r\n址即紅x 賕給指针交量，所以选择B');
INSERT INTO `exercises` VALUES ('27', '以下数组定义中错误的是', 'int x[2][3]= [1,2,3,4,5,6}:', 'int x[[3]= (0);', 'int x[][3]= [{1,2,3).[4,5,61];', 'int x[2][3]= [[1.2].[3,4].[5,6});', 'D', '6', '2015年9月计算机二级考试《C语言》真题及解析', '3', '选项中x[2][3]定《的是一个两行三列的二维故组。而在给故组元素赋值时却赋成了三行，\r\n所以错误。');
INSERT INTO `exercises` VALUES ('28', '设有定义，charp[]=(\'1\'，\'2’，\'3\')，*q=p，以下不能计算出一个char型的操所占字节数的表达式是', 'sizeot(p)', 'sixeot(char)', 'sixeot(*q)', 'nixeot(p[0])', 'A', '6', '2015年9月计算机二级考试《C语言》真题及解析', '4', '根据慧目中的定义可(30港sizo of(o)，计算的是数组=中所有t素所占用的子节的，配不是\r\nchar型数据所占字节数。');
INSERT INTO `exercises` VALUES ('29', '以下权述中正确的是', '在C语言中，预处理命令行都以”开头', '预处理命令行必须位于C源程序的起始位置', 'Binc1ude <stdio.b>必须放在C程序的开头', 'C语言的预处理不能实现宏定义和条件编译的功能', 'A', '6', '2015年9月计算机二级考试《C语言》真题及解析', '1', '预处理命令是以“”号开头的命会它们不是C语言的可执行命令这些命令应该在函故之\r\n外书写，一般在源文件的景扩面书写，但不是必须在起始位置书写所以B) 0)错误。C)语言的预外理能够\r\n实现完定义和条件编译等功能，所以D)增误。');
INSERT INTO `exercises` VALUES ('30', '在C语言中，合法的长整型常数是', '0.123456', '4962717', '9L', '5.321e2', 'C', '6', '2015年9月计算机二级考试《C语言》真题及解析', '3', '无解析');
INSERT INTO `exercises` VALUES ('31', '执行语句X=(a=10，b=a--.后，x、a、b的值依次为', '10,10,9', '10,9,9', '9,10,9', '10,9,10', 'D', '4', '2017年9月计算机二级考试《C语言》考前猜想卷', '4', '无解析');
INSERT INTO `exercises` VALUES ('32', '以下选项中非法的表达式是', 'a+1=a+1', 'a=b==0', '(Char.(100+ 100.', '7<=X<60', 'A', '5', '2017年9月计算机二级考试《C语言》考前必做题', '5', '无解析');
INSERT INTO `exercises` VALUES ('33', '在以下选项中，不正确的赋值语句是', 'i++ ;', 'n1=(n2=(n3=0..;', 'm+n=1;', 'i=k==j ;', 'C', '7', '2015年3月计算机二级考试《C语言》真题及解析', '3', '无解析');
INSERT INTO `exercises` VALUES ('34', '若有说明，double*m,n; 则能通过sCanf语句正确给输入项读人数据的程序段是', '*m= &n;scanf(\"%lf*m);', 'm= (double* )mallo (1 0);sc anf(\"%6f\'m);', 'm = &n;scant(%l*,n);', 'm = &n;scanf(\"%le\"\'m);', 'D', '8', '2014年9月计算机二级考试《C语言》真题及解析', '3', '无解析');
INSERT INTO `exercises` VALUES ('35', '表示关系M<=N<=P的C语言表达式为', '(M<=N.AND(N<=P.', '(M<=N.&&(N<=P.', '(M<=N<=P.', '(M<=N.&(N<=P.', 'B', '2', '第2章_C程序设计的初步知识', '4', '无解析');
INSERT INTO `exercises` VALUES ('36', '以下叙述中正确的是', '在scanf函数的格式串中，必须有与输入项一一对应的格式转换说明符', '只能在prinf函数中指定输入数据的宽度，而不能在scanf函数中指定输入数据占的宽度', 'scanf函数中的字符串，是提示程序员的，输入数据时不必管它', '复合语句也被称为语句块，它至少要包含两条语句', 'A', '2', '第2章_C程序设计的初步知识', '2', '无解析');
INSERT INTO `exercises` VALUES ('37', '以下叙述中正确的是', '在scanf函数中的格式控制字符串是为了输入数据用的，不会输出到屏幕上', '在使用scanf函数输入整故或实故时，输入数据之间5 ?能用空格来分隔', '在Printf函数中，各个输出项只能是变量', '使用Printf函数无法输出百分号%', 'A', '2', '第2章_C程序设计的初步知识', '3', '无解析');
INSERT INTO `exercises` VALUES ('38', '下列描述中正确的是', '算法是指对解题方案的准确而完整的描述', '算法的有穷性是指算法程序的长度是有限的', '算法是否有效与拥有的情报无关', '算法的基本特征有可行性、确定性和有穷性', 'A', '29', '第1章_程序设计基本概念', '2', '无解析');
INSERT INTO `exercises` VALUES ('39', '下列数据结构中属于非线性结构的是', '队列', '线性表', '二叉树', '栈', 'C', '29', '第1章_程序设计基本概念', '2', '无解析');
INSERT INTO `exercises` VALUES ('40', '在C语言中，合法的长整型常数是', '0.123456', '4962717', '9L', '5.321e2', 'C', '29', '第1章_程序设计基本概念', '3', '无解析');
INSERT INTO `exercises` VALUES ('41', '表示关系M<=N<=P的C语言表达式为', '(M<=N.AND(N<=P.', '(M<=N.&&(N<=P.', '(M<=N<=P.', '(M<=N.&(N<=P.', 'B', '30', '第2章_C程序设计的初步知识', '4', '无解析');
INSERT INTO `exercises` VALUES ('42', '以下叙述中正确的是', '在scanf函数的格式串中，必须有与输入项一一对应的格式转换说明符', '只能在prinf函数中指定输入数据的宽度，而不能在scanf函数中指定输入数据占的宽度', 'scanf函数中的字符串，是提示程序员的，输入数据时不必管它', '复合语句也被称为语句块，它至少要包含两条语句', 'A', '30', '第2章_C程序设计的初步知识', '2', '无解析');

-- ----------------------------
-- Table structure for materials
-- ----------------------------
DROP TABLE IF EXISTS `materials`;
CREATE TABLE `materials` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_number` int(8) NOT NULL,
  `materials_title` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `creation_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of materials
-- ----------------------------
INSERT INTO `materials` VALUES ('1', '1', 'C语言教程', 'c-tutorial', '2017-10-31');
INSERT INTO `materials` VALUES ('2', '2', 'C简介', 'c-intro', '2017-10-31');
INSERT INTO `materials` VALUES ('3', '3', 'C环境设置', 'c-environment-setup', '2017-10-31');
INSERT INTO `materials` VALUES ('4', '4', 'C程序结构', 'c-program-structure', '2017-10-31');
INSERT INTO `materials` VALUES ('5', '5', 'C基本语法', 'c-basic-syntax', '2017-10-31');
INSERT INTO `materials` VALUES ('6', '6', 'C数据类型', 'c-data-types', '2017-10-31');
INSERT INTO `materials` VALUES ('7', '7', 'C变量', 'c-variables', '2017-10-31');
INSERT INTO `materials` VALUES ('8', '8', 'C常量', 'c-constants', '2017-10-31');
INSERT INTO `materials` VALUES ('9', '9', 'C存储类', 'c-storage-classes', '2017-10-31');
INSERT INTO `materials` VALUES ('10', '10', 'C运算符', 'c-operators', null);
INSERT INTO `materials` VALUES ('11', '11', 'C判断', 'c-decision', null);
INSERT INTO `materials` VALUES ('12', '12', 'C循环', 'c-loops', null);
INSERT INTO `materials` VALUES ('13', '13', 'C函数', 'c-functions', null);
INSERT INTO `materials` VALUES ('14', '14', 'C作用域规则', 'c-scope-rules', null);
INSERT INTO `materials` VALUES ('15', '15', 'C数组', 'c-arrays', null);
INSERT INTO `materials` VALUES ('16', '16', 'C指针', 'c-pointers', null);
INSERT INTO `materials` VALUES ('17', '17', 'C函数指针与回调指针', 'c-fun-pointer-callback', null);
INSERT INTO `materials` VALUES ('18', '18', 'C字符串', 'c-strings', null);
INSERT INTO `materials` VALUES ('19', '19', 'C结构体', 'c-structures', null);
INSERT INTO `materials` VALUES ('20', '20', 'C共同体', 'c-unions', null);
INSERT INTO `materials` VALUES ('21', '21', 'C位域', 'c-bit-fields', null);
INSERT INTO `materials` VALUES ('22', '22', 'C之typedef', 'c-typedef', null);
INSERT INTO `materials` VALUES ('23', '23', 'C输入输出', 'c-input-output', null);
INSERT INTO `materials` VALUES ('24', '24', 'C文件读写', 'c-file-io', null);
INSERT INTO `materials` VALUES ('25', '25', 'C预处理器', 'c-preprocessors', null);
INSERT INTO `materials` VALUES ('26', '26', 'C头文件', 'c-header-files', null);
INSERT INTO `materials` VALUES ('27', '27', 'C强制换行类型', 'c-type-casting', null);
INSERT INTO `materials` VALUES ('28', '28', 'C错误处理', 'c-error-handling', null);

-- ----------------------------
-- Table structure for mistakes
-- ----------------------------
DROP TABLE IF EXISTS `mistakes`;
CREATE TABLE `mistakes` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `exercise_id` mediumint(8) NOT NULL,
  `username` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mistakes
-- ----------------------------
INSERT INTO `mistakes` VALUES ('15', '1', 'suzelin');
INSERT INTO `mistakes` VALUES ('16', '2', 'suzelin');
INSERT INTO `mistakes` VALUES ('17', '3', 'suzelin');
INSERT INTO `mistakes` VALUES ('18', '4', 'szl');
INSERT INTO `mistakes` VALUES ('19', '5', 'szl');
INSERT INTO `mistakes` VALUES ('20', '6', 'szl');
INSERT INTO `mistakes` VALUES ('21', '7', 'szl');
INSERT INTO `mistakes` VALUES ('22', '8', 'szl');
INSERT INTO `mistakes` VALUES ('23', '9', 'szl');
INSERT INTO `mistakes` VALUES ('24', '10', 'szl');
INSERT INTO `mistakes` VALUES ('25', '34', 'szl');
INSERT INTO `mistakes` VALUES ('26', '38', 'wengkai');
INSERT INTO `mistakes` VALUES ('27', '39', 'wengkai');
INSERT INTO `mistakes` VALUES ('28', '40', 'wengkai');

-- ----------------------------
-- Table structure for papers
-- ----------------------------
DROP TABLE IF EXISTS `papers`;
CREATE TABLE `papers` (
  `paper_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `paper_title` varchar(255) NOT NULL,
  `paper_type` varchar(255) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of papers
-- ----------------------------
INSERT INTO `papers` VALUES ('1', '第1章_程序设计基本概念', 'chapter', '-1', '2017-11-02');
INSERT INTO `papers` VALUES ('2', '第2章_C程序设计的初步知识', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('3', '2017年9月二级《C语言》临考猜想卷', 'simulation', '-1', null);
INSERT INTO `papers` VALUES ('4', '2017年9月二级《C语言》考前猜想卷', 'simulation', '-1', null);
INSERT INTO `papers` VALUES ('5', '2017年9月二级《C语言》考前必做题', 'simulation', '-1', null);
INSERT INTO `papers` VALUES ('6', '2015年9月二级《C语言》真题及解析', 'old', '-1', null);
INSERT INTO `papers` VALUES ('7', '2015年3月二级《C语言》真题及解析', 'old', '-1', null);
INSERT INTO `papers` VALUES ('8', '2014年9月二级《C语言》真题及解析', 'old', '-1', null);
INSERT INTO `papers` VALUES ('10', '第3章_顺序结构', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('11', '第4章_选择结构', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('12', '第5章_循环结构', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('13', '第6章_字符型数据', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('14', '第7章_函数', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('15', '第8章_地址和指针', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('16', '第9章_数组', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('17', '第10章_字符串', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('18', '第11章_对函数的进一步讨论', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('19', '第12章_用户标识符', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('20', '第13章_编译预处理和动态存储分配', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('21', '第14章_结构体、共用体和用户定义类型', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('22', '第15章_位运算', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('23', '第16章_文件', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('24', '第17章_上机指导', 'chapter', '-1', null);
INSERT INTO `papers` VALUES ('25', '2017年9月二级《C语言》高频考点卷', 'simulation', '-1', null);
INSERT INTO `papers` VALUES ('26', '2017年9月二级《C语言》冲刺提分卷', 'simulation', '-1', null);
INSERT INTO `papers` VALUES ('27', '2017年9月二级《C语言》题库试题', 'simulation', '-1', null);
INSERT INTO `papers` VALUES ('28', '2014年3月二级《C语言》真题及解析', 'old', '-1', null);
INSERT INTO `papers` VALUES ('29', '第1章_程序设计基本概念', 'upload', '1', null);
INSERT INTO `papers` VALUES ('30', '第2章_C程序设计的初步知识', 'upload', '1', null);
INSERT INTO `papers` VALUES ('31', '2012年3月二级《C语言》真题及解析', 'old', '-1', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `introduce` varchar(2047) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'suzelin', '123456', 'user', 'student', null, null, null, null, null);
INSERT INTO `users` VALUES ('4', 'szl', '123456', 'admin', null, null, null, null, null, null);
INSERT INTO `users` VALUES ('5', 'teacher', '123456', 'user', 'teacher', '西安电子科技大学', '孙万蓉', '教授', '孙万蓉，西安电子科技大学教授，国家级精品课程“数字电路及系统设计”课程负责人，国家级精品课程“数字电路及系统设计”课程共享建设负责人,第三届校级教学名师。西安电子科技大学电子工程学院教授委员会常任委员。第二届全国高校青年教师教学竞赛决赛专家评委，第二届和第三届陕西省高校青年教师教学竞赛决赛专家评委。\r\n\r\n负责和参与了多项教育部、省级和学校教学改项目，主编了《数字电路与系统设计》一书，参与编写了《数字电子技术基础》国家十一五规划教材和《通讯电子线路》等教材，参与编译了电子工业出版社出版的《传感器及其应用》一书。“全方位、立体化、多视角课程建设研究与实践”获省教学成果二等奖；多项教改项目获校优秀教学成果一、二等奖。参与“全国大学生电子设计竞赛”赛前指导，指导的学生获得了国家级一等奖和二等奖。科研的主要研究方向为信号与图像处理、虚拟仪器和医学仪器、物联网感知层信息采集、传输与监测管理等。先后承担和参与了多项国家自然科学基金、863项目、省自然科学基金和横向科研项目。多个项目获省部级奖，在国内国外发表科研论文30余篇。', null);
INSERT INTO `users` VALUES ('6', 'wengkai', '123456', 'user', 'teacher', '浙江大学', '翁恺', '教师', '计算机博士，浙江大学计算机学院教师，ACM-ICPC优秀教练奖得主，2011世界总决赛金牌教练。主要讲授包括C、C++、Java程序设计，程序设计语言原理，计算机体系结构，嵌入式系统等课程。\r\n\r\n专业方向为嵌入式操作系统和嵌入式系统应用，是国内Arduino和树莓派应用的鼓吹者，翻译出版了多本相关书籍，在创客界交友广泛。\r\n\r\n2004年前后的Java教学视频在网络上流传甚广，现在在网易云课堂 上开设有Java、C++、Arduino等多门课程。\r\n\r\n业余爱好无线电，1988年开始玩业余电台，电台呼号BA5AG，主要玩莫尔斯码、短波、数据通信和卫星通信。是浙大传统毅行的发起者和早期组织者之一。', null);
INSERT INTO `users` VALUES ('7', 'lifengxia', '123456', 'user', 'teacher', '北京理工大学', '李凤霞', '教授', '北京理工大学计算机学院教授，北京市教学名师。任北京理工大学计算机学院基础教学部主任、教育部大学计算机虚拟仿真实验教学中心主任、 虚拟现实与仿真计算学科方向带头人。现担任教育部高等学校“大学计算机课程”教学指导委员会副主任；全国高等院校计算机基础教育研究会副会长；中国计算机学会虚拟现实与可视化专委会副主任。特聘为北京市教育委员会 “北京高等学校计算机与信息类专业群专家委员会委员兼教学协作委员会委员”。 目前是国家级精品课、国家级精品资源共享课程负责人、国家级优秀教学团队负责人。', null);
INSERT INTO `users` VALUES ('8', 'suxiaohong', '123456', 'user', 'teacher', '哈尔滨工业大学', '苏小红', '教授', '苏小红，女，博士，哈尔滨工业大学计算机科学与技术学院航天软件工程研究中心教授，博士生导师，中国计算机学会高级会员，计算机科学与技术国家实验教学示范中心副主任，计算机语言基础教研室主任，校教学带头人，校级教学名师奖和宝钢优秀教师奖获得者，2006-2010年教育部高等学校计算机专业教学指导委员会东北地区专家工作组成员，电子工业出版社特聘专家。曾先后被评为校“三育人”先进工作者、校优秀教师、校优秀共产党员、黑龙江省高校师德先进个人、黑龙江省优秀教师。现为国家级精品课C语言程序设计和黑龙江省省级精品课计算机图形学的主持人。', null);
INSERT INTO `users` VALUES ('9', 'zhangyuchun', '123456', 'user', 'teacher', '吉林大学', '张玉春', '教授', '暂无老师简介', null);

-- ----------------------------
-- Table structure for user_course
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_course
-- ----------------------------
INSERT INTO `user_course` VALUES ('1', '1', '6');
INSERT INTO `user_course` VALUES ('3', '1', '5');
INSERT INTO `user_course` VALUES ('4', '1', '4');
INSERT INTO `user_course` VALUES ('5', '1', '3');
INSERT INTO `user_course` VALUES ('6', '1', '2');
INSERT INTO `user_course` VALUES ('7', '1', '1');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_number` int(8) DEFAULT NULL,
  `video_title` varchar(255) NOT NULL,
  `youku_path` varchar(255) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('71', '32', '【郝斌C语言】- 32 对初学编程者的一些个人建议', 'http://player.youku.com/embed/XNjQ2NDI4MzE2', 'https://vthumb.ykimg.com/0541040852A6EED26A0A48589CDF9567', '10:44', null);
INSERT INTO `videos` VALUES ('72', '28', '【郝斌C语言】- 28 预备知识 之 不同类型数据之间相互赋值的问题', 'http://player.youku.com/embed/XNjQ2NDI3MTQw', 'https://vthumb.ykimg.com/0541040852A6EDEB6A0A4F5204185AE6', '09:43', null);
INSERT INTO `videos` VALUES ('73', '37', '【郝斌C语言】- 37  复习上节课内容', 'http://player.youku.com/embed/XNjQ2NDI5Nzc2', 'https://vthumb.ykimg.com/0541040852A6EF566A0A4C4C3D79E541', '08:41', null);
INSERT INTO `videos` VALUES ('74', '34', '【郝斌C语言】- 34 如何编写出更有保存价值 和 更有学习价值的程', 'http://player.youku.com/embed/XNjQ2NDI5Mjky', 'https://vthumb.ykimg.com/0541040852A6EEF96A0A424A69F01ABB', '06:56', null);
INSERT INTO `videos` VALUES ('75', '30', '【郝斌C语言】- 30 什么是ASCII & 字符的存储', 'http://player.youku.com/embed/XNjQ2NDI4NDE2', 'https://vthumb.ykimg.com/0541040852A6EE4E6A0A4744A09EAA38', '05:18', null);
INSERT INTO `videos` VALUES ('76', '36', '【郝斌C语言】- 36 printf为什么需要输出控制符', 'http://player.youku.com/embed/XNjQ2NDI5Mzky', 'https://vthumb.ykimg.com/0541040852A6EE996A0A4C4C337DBAD2', '03:09', null);
INSERT INTO `videos` VALUES ('77', '35', '【郝斌C语言】- 35_printf用法详解_2', 'http://player.youku.com/embed/XNjQ2NDI5MjI0', 'https://vthumb.ykimg.com/0541040852A6EE656A0A406370892689', '02:44', null);
INSERT INTO `videos` VALUES ('78', '23', '【郝斌C语言】- 23 预备计算机专业知识 之 常量在C语言中是如何', 'http://player.youku.com/embed/XNjQ2NDI1ODgw', 'https://vthumb.ykimg.com/0541040852A6ED8B6A0A4B124D61B78B', '10:51', null);
INSERT INTO `videos` VALUES ('79', '31', '【郝斌C语言】- 31 printf和scanf简介', 'http://player.youku.com/embed/XNjQ2NDI3OTI4', 'https://vthumb.ykimg.com/0541040852A6ED996A0A4E4BC2A9F85B', '01:36', null);
INSERT INTO `videos` VALUES ('80', '24', '【郝斌C语言】- 24 预知识 之 常量以什么样的二进制代码存储在计', 'http://player.youku.com/embed/XNjQ2NDI1MjA0', 'https://vthumb.ykimg.com/0541040852A6EC6A6A0A3F42BB5182CE', '05:14', null);
INSERT INTO `videos` VALUES ('81', '25', '【郝斌C语言】- 25  预备计算机专业知识 之 本讲知识回顾', 'http://player.youku.com/embed/XNjQ2NDI1NTU2', 'https://vthumb.ykimg.com/0541040852A6EC906A0A4377CDB7BC10', '04:39', null);
INSERT INTO `videos` VALUES ('82', '21', '【郝斌C语言】- 21 预备计算机专业知识 之 如何定义变量', 'http://player.youku.com/embed/XNjQ2NDIzNTg4', 'https://vthumb.ykimg.com/0541040852A6EB566A0A4123789DCF97', '02:58', null);
INSERT INTO `videos` VALUES ('83', '20', '【郝斌C语言】- 20变量为什么必须的初始化（高清）', 'http://player.youku.com/embed/XNjQ1OTQxNzEy', 'https://vthumb.ykimg.com/05410408571EABEC6A0A4E04E1C96FE9', '15:38', null);
INSERT INTO `videos` VALUES ('84', '19', '【郝斌C语言】- 17 C编程预备计算机专业知识 之 数据类型（高清', 'http://player.youku.com/embed/XNjQ1OTQwODg0', 'https://vthumb.ykimg.com/05410408571EAC216A0A48046155EDFD', '18:37', null);
INSERT INTO `videos` VALUES ('85', '18', '【郝斌C语言】- 18 预备计算机专业知识 之 什么是变量（高清）', 'http://player.youku.com/embed/XNjQ1OTQxMTI0', 'https://vthumb.ykimg.com/0541040852A59BF16A0A4455559E3000', '08:25', null);
INSERT INTO `videos` VALUES ('86', '16', '【郝斌C语言】- 16 HelloWorld程序如何运行起来的（高清）', 'http://player.youku.com/embed/XNjQ1OTQwMzIw', 'https://vthumb.ykimg.com/0541040852A59B156A0A485892C2F143', '05:26', null);
INSERT INTO `videos` VALUES ('87', '19', '【郝斌C语言】-19 预备计算机专业知识 之 cpu 内存条 vc++6.0 操', 'http://player.youku.com/embed/XNjQ1OTQxMjMy', 'https://vthumb.ykimg.com/0541040852A59B406A0A4604E3796DA7', '01:51', null);
INSERT INTO `videos` VALUES ('88', '14', '【郝斌C语言】- 14  C语言编程预备计算机专业知识（高清）', 'http://player.youku.com/embed/XNjQ1OTM4MTk2', 'https://vthumb.ykimg.com/0541040852A599BF6A0A4F5204B76EC4', '05:52', null);
INSERT INTO `videos` VALUES ('89', '15', '【郝斌C语言】- 15 cpu 内存条 硬盘 显卡 主板 显示器 之间的关', 'http://player.youku.com/embed/XNjQ1OTM4NDY4', 'https://vthumb.ykimg.com/0541040852A599AB6A0A4F51FA61E278', '03:49', null);
INSERT INTO `videos` VALUES ('90', '12', '【郝斌C语言】- 12  C语言概述 之 VC++6.0软件使用讲解（高清）', 'http://player.youku.com/embed/XNjQ1MjU4OTY0', 'https://vthumb.ykimg.com/0541040852A3C1486A0A4A56EFEDE8DB', '11:01', null);
INSERT INTO `videos` VALUES ('91', '13', '【郝斌C语言】- 13 C语言概述 之 回顾本讲内容（高清）', 'http://player.youku.com/embed/XNjQ1MjU5MDg0', 'https://vthumb.ykimg.com/0541040852A3C0976A0A485899E69F34', '03:27', null);
INSERT INTO `videos` VALUES ('92', '11', '【郝斌C语言】- 11  C语言概述 之 一元二次方程详解（高清）', 'http://player.youku.com/embed/XNjQ1MjU4NDI0', 'https://vthumb.ykimg.com/05410408571EACC16A0A4704E7463793', '28:43', null);
INSERT INTO `videos` VALUES ('93', '10', '【郝斌C语言】- 10 C语言概述 之 课程总纲要（高清）', 'http://player.youku.com/embed/XNjQ1MTc4OTUy', 'https://vthumb.ykimg.com/05410408519035E26A0A470A28BCDEC3', '01:58', null);
INSERT INTO `videos` VALUES ('94', '8', '【郝斌C语言】- 08 C语言概述 之 学习目标（高清）', 'http://player.youku.com/embed/XNjQ1MTc4NTQ0', 'https://vthumb.ykimg.com/05410408519034746A0A400DF24A12C8', '01:22', null);
INSERT INTO `videos` VALUES ('95', '7', '【郝斌C语言】- 07 C语言概述 之 怎样学C语言（高清）', 'http://player.youku.com/embed/XNjQ1MTc4NDMy', 'https://vthumb.ykimg.com/05410408519034CB6A0A4265903A0930', '07:14', null);
INSERT INTO `videos` VALUES ('96', '9', '【郝斌C语言】- 09 C语言概述 之 常见问题答疑（高清）', 'http://player.youku.com/embed/XNjQ1MTc4Nzk2', 'https://vthumb.ykimg.com/054104085190366A6A0A4E7312423952', '09:53', null);
INSERT INTO `videos` VALUES ('97', '5', '【郝斌C语言】- 05 C语言概述 之 应用领域（高清）', 'http://player.youku.com/embed/XNjQ1MTc3Mzcy', 'https://vthumb.ykimg.com/054104085190346D6A0A4966224775D5', '04:36', null);
INSERT INTO `videos` VALUES ('98', '4', '【郝斌C语言】- 04  C概述 之 C的特点（高清）', 'http://player.youku.com/embed/XNjQ1MTc2OTky', 'https://vthumb.ykimg.com/0541040851791E556A0A461668272B9E', '21:32', null);
INSERT INTO `videos` VALUES ('99', '2', '【郝斌C语言】 - 02  C语言概述之HelloWorld程序举例（高清）', 'http://player.youku.com/embed/XNjQ1MTc2MDg4', 'https://vthumb.ykimg.com/0541040851791CA96A0A4A045E592EF6', '05:12', null);
INSERT INTO `videos` VALUES ('100', '3', '【郝斌C语言】- 03 C语言概述 之 起源和发展（高清）', 'http://player.youku.com/embed/XNjQ1MTc2NDk2', 'https://vthumb.ykimg.com/0541040851791E4A6A0A4A045E346E6E', '20:21', null);
INSERT INTO `videos` VALUES ('101', '1', '【郝斌C语言】 - 01 C语言概述（高清）', 'http://player.youku.com/embed/XNjQ1MTcwMTIw', 'https://vthumb.ykimg.com/0541040851791C5D6A0A4364D81E0B66', '04:13', null);
INSERT INTO `videos` VALUES ('102', '6', '【郝斌C语言】- 06 C语言概述 之 重要性（高清）', 'http://player.youku.com/embed/XNjQ1MTc4Mjc2', 'https://vthumb.ykimg.com/0541040852A340EE6A0A4744A2552D1E', '15:07', null);
INSERT INTO `videos` VALUES ('103', '73', '【郝斌C语言】- 73 for循环之 6：for和if的嵌套使用四个习题的讲', 'http://player.youku.com/embed/XNjQ4MTQxODUy', 'https://vthumb.ykimg.com/0541040852AC32246A0A4744A21EA6C3', '26:47', null);
INSERT INTO `videos` VALUES ('104', '74', '【郝斌C语言】- 74 for循环之 7：多层for循环嵌套使用执行顺序', 'http://player.youku.com/embed/XNjQ4MTQxOTQw', 'https://vthumb.ykimg.com/0541040852AC31CD6A0A451E17287389', '25:05', null);
INSERT INTO `videos` VALUES ('105', '75', '【郝斌C语言】- 75 进制', 'http://player.youku.com/embed/XNjQ4MTQxODM2', 'https://vthumb.ykimg.com/0541040852AC30AA6A0A4604D8771CE8', '11:00', null);
INSERT INTO `videos` VALUES ('106', '83', '【郝斌C语言】- 83 for和while的比较', 'http://player.youku.com/embed/XNjQ4MTQ0MTEy', 'https://vthumb.ykimg.com/0541040852AC32076A0A4A56F4DA3C95', '08:32', null);
INSERT INTO `videos` VALUES ('107', '87', '【郝斌C语言】- 87 什么时候使用while，什么时候使用for', 'http://player.youku.com/embed/XNjQ4MTQ1MzMy', 'https://vthumb.ykimg.com/0541040852AC32176A0A4377C03A1AE2', '01:45', null);
INSERT INTO `videos` VALUES ('108', '72', '【郝斌C语言】- 72 for循环之 5：浮点数的存储所带来的问题', 'http://player.youku.com/embed/XNjQ4MTQwNDY0', 'https://vthumb.ykimg.com/0541040852AC304F6A0A4C4C42213676', '16:28', null);
INSERT INTO `videos` VALUES ('109', '79', '【郝斌C语言】- 79 for循环8：复习多个for循环嵌套使用时执行顺', 'http://player.youku.com/embed/XNjQ4MTQyODY0', 'https://vthumb.ykimg.com/0541040852AC31186A0A491BCC8312B7', '08:26', null);
INSERT INTO `videos` VALUES ('110', '78', '【郝斌C语言】- 78 运算符补充之 3：逗号表达式', 'http://player.youku.com/embed/XNjQ4MTQyNDMy', 'https://vthumb.ykimg.com/0541040852AC306B6A0A485899C19C6E', '04:10', null);
INSERT INTO `videos` VALUES ('111', '77', '【郝斌C语言】- 77 运算符补充之 2： 三目运算符', 'http://player.youku.com/embed/XNjQ4MTQyMTgw', 'https://vthumb.ykimg.com/0541040852AC30246A0A4F52045F742B', '02:43', null);
INSERT INTO `videos` VALUES ('112', '81', '【郝斌C语言】- 81 while循环之 1： while函数的概述', 'http://player.youku.com/embed/XNjQ4MTQzNTQw', 'https://vthumb.ykimg.com/0541040852AC30D46A0A445554EE0703', '01:11', null);
INSERT INTO `videos` VALUES ('113', '82', '【郝斌C语言】- 82 while循环之 2：while函数的执行顺序', 'http://player.youku.com/embed/XNjQ4MTQzNjY0', 'https://vthumb.ykimg.com/0541040852AC30E46A0A491BCFD1A72A', '01:00', null);
INSERT INTO `videos` VALUES ('114', '71', '【郝斌C语言】- 71 for循环之 4：强制类型转化和对初学者很重要', 'http://player.youku.com/embed/XNjQ4MTQwNzIw', 'https://vthumb.ykimg.com/0541040852AC313C6A0A4C4C42708C34', '24:15', null);
INSERT INTO `videos` VALUES ('115', '69', '【郝斌C语言】- 69 for循环之 3：for和if的嵌套使用', 'http://player.youku.com/embed/XNjQ3OTgxMDY0', 'https://vthumb.ykimg.com/0541040852ABCF4A6A0A451E2341C387', '21:02', null);
INSERT INTO `videos` VALUES ('116', '67', '【郝斌C语言】- 67 for循环之 1：为什么需要for循环', 'http://player.youku.com/embed/XNjQ3OTc5Nzk2', 'https://vthumb.ykimg.com/0541040852ABCEC66A0A4E4BD2F66855', '22:14', null);
INSERT INTO `videos` VALUES ('117', '70', '【郝斌C语言】- 70 复习上节课知识', 'http://player.youku.com/embed/XNjQ3OTgxNzI4', 'https://vthumb.ykimg.com/0541040852ABCEAD6A0A4E4BBFBB6C9B', '06:39', null);
INSERT INTO `videos` VALUES ('118', '63', '【郝斌C语言】- 63 选择执行9：if 函数常见问题解析', 'http://player.youku.com/embed/XNjQ3OTc3NTgw', 'https://vthumb.ykimg.com/0541040852ABCE156A0A41238BC859F2', '27:53', null);
INSERT INTO `videos` VALUES ('119', '68', '【郝斌C语言】- 68 for循环之 2：for循环最简单的用法', 'http://player.youku.com/embed/XNjQ3OTgwMDY4', 'https://vthumb.ykimg.com/0541040852ABCE1F6A0A451E11A54D50', '10:22', null);
INSERT INTO `videos` VALUES ('120', '65', '【郝斌C语言】- 65 循环的定义', 'http://player.youku.com/embed/XNjQ3OTc3Nzg4', 'https://vthumb.ykimg.com/0541040852ABCBA56A0A4C4C3E663C24', '01:30', null);
INSERT INTO `videos` VALUES ('121', '66', '【郝斌C语言】- 66 循环的分类', 'http://player.youku.com/embed/XNjQ3OTc3ODky', 'https://vthumb.ykimg.com/0541040852ABCBA86A0A424A68C730B0', '00:44', null);
INSERT INTO `videos` VALUES ('122', '62', '【郝斌C语言】- 62 选择执行8：空语句的问题', 'http://player.youku.com/embed/XNjQ3OTc2MTg4', 'https://vthumb.ykimg.com/0541040852ABCB3A6A0A424A52FFCC52', '06:18', null);
INSERT INTO `videos` VALUES ('123', '64', '【郝斌C语言】- 64 switch后面再讲', 'http://player.youku.com/embed/XNjQ3OTc3Njg4', 'https://vthumb.ykimg.com/0541040852ABCB766A0A4858A4B88414', '00:24', null);
INSERT INTO `videos` VALUES ('124', '61', '【郝斌C语言】- 61 复习上机课知识', 'http://player.youku.com/embed/XNjQ3OTc1OTgw', 'https://vthumb.ykimg.com/0541040852ABCAD76A0A4B124C750128', '04:59', null);
INSERT INTO `videos` VALUES ('125', '60', '【郝斌C语言】- 60 学习C语言常见误区', 'http://player.youku.com/embed/XNjQ3MzIyNjA0', 'https://vthumb.ykimg.com/0541040852A990706A0A48589655D3B3', '22:54', null);
INSERT INTO `videos` VALUES ('126', '57', '【郝斌C语言】- 57 选择执行7：if 函数举例--求分数的等级', 'http://player.youku.com/embed/XNjQ3MzE4NzMy', 'https://vthumb.ykimg.com/0541040852A98D946A0A3F42C61126B5', '18:05', null);
INSERT INTO `videos` VALUES ('127', '59', '【郝斌C语言】- 59 if 函数子2：对任意三个数字进行排序', 'http://player.youku.com/embed/XNjQ3MzE5MDE2', 'https://vthumb.ykimg.com/0541040852A98DA36A0A44554A57704B', '17:27', null);
INSERT INTO `videos` VALUES ('128', '53', '【郝斌C语言】- 53 选择执行3_：if 函数的范围问题', 'http://player.youku.com/embed/XNjQ3MzE2NzM2', 'https://vthumb.ykimg.com/0541040852A98C446A0A3F42CE729E7A', '14:22', null);
INSERT INTO `videos` VALUES ('129', '58', '【郝斌C语言】- 58 if 函数例子1：互换两个数字', 'http://player.youku.com/embed/XNjQ3MzE4MzUy', 'https://vthumb.ykimg.com/0541040852A98CC36A0A4A56D698385B', '10:47', null);
INSERT INTO `videos` VALUES ('130', '54', '【郝斌C语言】- 54 选择执行4：if..else的用法', 'http://player.youku.com/embed/XNjQ3MzE3MDQ4', 'https://vthumb.ykimg.com/0541040852A98C086A0A4F52002CC5E4', '10:27', null);
INSERT INTO `videos` VALUES ('131', '55', '【郝斌C语言】- 55 选择执行5：if..else ifelse..的用法', 'http://player.youku.com/embed/XNjQ3MzE3NDk2', 'https://vthumb.ykimg.com/0541040852A98C476A0A4377CBA42D6B', '09:47', null);
INSERT INTO `videos` VALUES ('132', '52', '【郝斌C语言】- 52 选择执行2：if 函数最简单的用法', 'http://player.youku.com/embed/XNjQ3MzE2MjUy', 'https://vthumb.ykimg.com/0541040852A98B526A0A4E4BBE6408C7', '06:51', null);
INSERT INTO `videos` VALUES ('133', '56', '【郝斌C语言】- 56 选择执行6：C语言对真假的处理', 'http://player.youku.com/embed/XNjQ3MzE3ODU2', 'https://vthumb.ykimg.com/0541040852A98B936A0A3F42C4954B6B', '00:33', null);
INSERT INTO `videos` VALUES ('134', '51', '【郝斌C语言】- 51 选择执行1：if 函数概述', 'http://player.youku.com/embed/XNjQ3MzE1OTQ4', 'https://vthumb.ykimg.com/0541040852A98AA46A0A4C4C27ED830C', '03:11', null);
INSERT INTO `videos` VALUES ('135', '46', '【郝斌C语言】- 46 回顾Scanf 函数', 'http://player.youku.com/embed/XNjQ2OTMxMDc2', 'https://vthumb.ykimg.com/0541040852A85B666A0A412389B41EE3', '15:00', null);
INSERT INTO `videos` VALUES ('136', '50', '【郝斌C语言】- 50 流程控制之4：流程控制为什么重要', 'http://player.youku.com/embed/XNjQ2OTMyMzgw', 'https://vthumb.ykimg.com/0541040852A85C006A0A491BD970D006', '10:32', null);
INSERT INTO `videos` VALUES ('137', '49', '【郝斌C语言】- 49  回顾Scanf及运算符', 'http://player.youku.com/embed/XNjQ2OTMyMDQ4', 'https://vthumb.ykimg.com/0541040852A85B8B6A0A4D4BFAE394F6', '07:53', null);
INSERT INTO `videos` VALUES ('138', '48', '【郝斌C语言】- 48 流程控制的分类', 'http://player.youku.com/embed/XNjQ2OTMxNzQw', 'https://vthumb.ykimg.com/0541040852A85AA06A0A451E0EF40C9B', '01:18', null);
INSERT INTO `videos` VALUES ('139', '47', '【郝斌C语言】- 47 流程控制 之1：什么是流程控制', 'http://player.youku.com/embed/XNjQ2OTMxMjg0', 'https://vthumb.ykimg.com/0541040852A85A916A0A4063716AD570', '03:35', null);
INSERT INTO `videos` VALUES ('140', '44', '【郝斌C语言】- 44 逻辑运算符 之 1', 'http://player.youku.com/embed/XNjQ2OTMwMzM2', 'https://vthumb.ykimg.com/0541040852A85B156A0A4063711E794A', '13:38', null);
INSERT INTO `videos` VALUES ('141', '42', '【郝斌C语言】- 42 运算符', 'http://player.youku.com/embed/XNjQ2OTI4ODc2', 'https://vthumb.ykimg.com/0541040852A859306A0A4377CD7DBDCB', '04:12', null);
INSERT INTO `videos` VALUES ('142', '45', '【郝斌C语言】- 45 逻辑运算符 之 2', 'http://player.youku.com/embed/XNjQ2OTMwNDQ0', 'https://vthumb.ykimg.com/0541040852A85A156A0A4D4C02959BBF', '03:46', null);
INSERT INTO `videos` VALUES ('143', '43', '【郝斌C语言】- 43 运算符_2：除法与取余运算符', 'http://player.youku.com/embed/XNjQ2OTI5NjQ0', 'https://vthumb.ykimg.com/0541040852A859BC6A0A41238B176CD1', '05:24', null);
INSERT INTO `videos` VALUES ('144', '41', '【郝斌C语言】- 41 sacnf用法 - 4 ： 如何使用scanf编写出高质', 'http://player.youku.com/embed/XNjQ2OTI4NzI0', 'https://vthumb.ykimg.com/0541040852A85A1C6A0A4B12519DF678', '14:20', null);
INSERT INTO `videos` VALUES ('145', '40', '【郝斌C语言】- 40  sacnf用法 - 3、 一次给多个变量键盘赋值', 'http://player.youku.com/embed/XNjQ2OTI3NjQ0', 'https://vthumb.ykimg.com/0541040852A858AF6A0A4858A786085E', '07:30', null);
INSERT INTO `videos` VALUES ('146', '38', '【郝斌C语言】- 38  scanf用法 - 1：不含输入控制符的用法', 'http://player.youku.com/embed/XNjQ2OTI2MDg0', 'https://vthumb.ykimg.com/0541040852A8582A6A0A4F5203571EAD', '11:46', null);
INSERT INTO `videos` VALUES ('147', '39', '【郝斌C语言】- 39  scanf用法 - 2：含有非输入控制符', 'http://player.youku.com/embed/XNjQ2OTI3MjQ0', 'https://vthumb.ykimg.com/0541040852A8585E6A0A4B12413297C2', '06:16', null);
INSERT INTO `videos` VALUES ('148', '22', '【郝斌C语言】- 22  预备计算机专业知识  之 什么叫进制', 'http://player.youku.com/embed/XNjQ2NDI0NTU2', 'https://vthumb.ykimg.com/05410408571EAC826A0A42472F55E86F', '31:27', null);
INSERT INTO `videos` VALUES ('149', '26', '【郝斌C语言】- 26 预备计算机专业知识 之 代码的规范化', 'http://player.youku.com/embed/XNjQ2NDI3NTg0', 'https://vthumb.ykimg.com/05410408571EABA76A0A490443DD45A6', '18:48', null);
INSERT INTO `videos` VALUES ('150', '33', '【郝斌C语言】- 33 printf函数的用法详解', 'http://player.youku.com/embed/XNjQ2NDI5MTQ0', 'https://vthumb.ykimg.com/0541040852A6EFA96A0A424A5BD47258', '17:53', null);
INSERT INTO `videos` VALUES ('151', '27', '【郝斌C语言】- 27 预备计算机专业知识 之 什么是字节', 'http://player.youku.com/embed/XNjQ2NDI2ODA0', 'https://vthumb.ykimg.com/0541040852A6EE1D6A0A491BCB896774', '11:27', null);
INSERT INTO `videos` VALUES ('152', '29', '【郝斌C语言】- 29 char使用常见问题解析', 'http://player.youku.com/embed/XNjQ2NDI3NjY0', 'https://vthumb.ykimg.com/0541040852A6EE6A6A0A4E4BD3A5B92A', '10:55', null);
INSERT INTO `videos` VALUES ('153', '135', '【郝斌C语言】- 135 指针之 15：复习上一节指针知识', 'http://player.youku.com/embed/XNjQ4MTg4NDYw', 'https://vthumb.ykimg.com/0541040852AC4DD36A0A474490A64A13', '11:41', null);
INSERT INTO `videos` VALUES ('154', '136', '【郝斌C语言】- 136 指针之 16：指针变量的运算', 'http://player.youku.com/embed/XNjQ4MTg4OTI0', 'https://vthumb.ykimg.com/0541040852AC4D906A0A424A69E85FDE', '05:27', null);
INSERT INTO `videos` VALUES ('155', '130', '【郝斌C语言】- 130 指针之 10：通过指针为什么可以使被调函数修', 'http://player.youku.com/embed/XNjQ4MTgyMzky', 'https://vthumb.ykimg.com/0541040852AC4AA76A0A47449CB69DDA', '11:55', null);
INSERT INTO `videos` VALUES ('156', '131', '【郝斌C语言】- 131 指针之 11：一维数组和指针关系概述', 'http://player.youku.com/embed/XNjQ4MTgzMDM2', 'https://vthumb.ykimg.com/0541040852AC4A976A0A451E23C61E09', '09:41', null);
INSERT INTO `videos` VALUES ('157', '132', '【郝斌C语言】- 132 指针之 12：下标和指针的关系', 'http://player.youku.com/embed/XNjQ4MTg0ODA0', 'https://vthumb.ykimg.com/0541040852AC4B116A0A485896DC0A4E', '05:56', null);
INSERT INTO `videos` VALUES ('158', '133', '【郝斌C语言】- 133 指针之 13：一维数组名的含义', 'http://player.youku.com/embed/XNjQ4MTg1MjE2', 'https://vthumb.ykimg.com/0541040852AC4B916A0A406370968C9D', '05:54', null);
INSERT INTO `videos` VALUES ('159', '121', '【郝斌C语言】- 121 指针之1：指针用法初次简单介绍', 'http://player.youku.com/embed/XNjQ4MTczMTg0', 'https://vthumb.ykimg.com/0541040852AC47DD6A0A3F42D212B240', '40:15', null);
INSERT INTO `videos` VALUES ('160', '123', '【郝斌C语言】- 123 指针之3：什么是地址', 'http://player.youku.com/embed/XNjQ4MTc3OTEy', 'https://vthumb.ykimg.com/0541040852AC48986A0A4744A31F6AB5', '14:56', null);
INSERT INTO `videos` VALUES ('161', '128', '【郝斌C语言】- 128 指针之8：星号的三种含义', 'http://player.youku.com/embed/XNjQ4MTgwMTI4', 'https://vthumb.ykimg.com/0541040852AC487C6A0A4A56F4A29AB6', '05:48', null);
INSERT INTO `videos` VALUES ('162', '125', '【郝斌C语言】- 125 指针之5：基本类型指针', 'http://player.youku.com/embed/XNjQ4MTc5MTI0', 'https://vthumb.ykimg.com/0541040852AC47AC6A0A4377D1422858', '03:55', null);
INSERT INTO `videos` VALUES ('163', '124', '【郝斌C语言】- 124 指针之4：什么是指针', 'http://player.youku.com/embed/XNjQ4MTc3NzM2', 'https://vthumb.ykimg.com/0541040852AC46CA6A0A4E4BBB9A2072', '03:49', null);
INSERT INTO `videos` VALUES ('164', '122', '【郝斌C语言】- 122 指针之2：指针的重要性', 'http://player.youku.com/embed/XNjQ4MTcxMjA4', 'https://vthumb.ykimg.com/0541040852AC432C6A0A451E245F49A2', '07:27', null);
INSERT INTO `videos` VALUES ('165', '115', '【郝斌C语言】-115 函数之 12：如何在开发中合理的设计函数来解', 'http://player.youku.com/embed/XNjQ4MTY0NTI0', 'https://vthumb.ykimg.com/0541040852AC41A66A0A41238E790A4F', '46:37', null);
INSERT INTO `videos` VALUES ('166', '120', '【郝斌C语言】-120 函数之 17：变量的作用域和存储方式', 'http://player.youku.com/embed/XNjQ4MTY3NDE2', 'https://vthumb.ykimg.com/0541040852AC427F6A0A412386FF1201', '22:15', null);
INSERT INTO `videos` VALUES ('167', '119', '【郝斌C语言】-119 函数之 16：函数复习', 'http://player.youku.com/embed/XNjQ4MTY2ODYw', 'https://vthumb.ykimg.com/0541040852AC41AB6A0A41238E25A723', '14:29', null);
INSERT INTO `videos` VALUES ('168', '117', '【郝斌C语言】-117 函数之 14：常用系统函数和如何通过书籍学习', 'http://player.youku.com/embed/XNjQ4MTY1NDk2', 'https://vthumb.ykimg.com/0541040852AC3FDE6A0A4E4BC3B8F70C', '08:33', null);
INSERT INTO `videos` VALUES ('169', '113', '【郝斌C语言】-113 函数之 10：函数的声明', 'http://player.youku.com/embed/XNjQ4MTYzMjUy', 'https://vthumb.ykimg.com/0541040852AC3ECC6A0A485896EF9A0B', '18:36', null);
INSERT INTO `videos` VALUES ('170', '118', '【郝斌C语言】-118 函数之 15：递归', 'http://player.youku.com/embed/XNjQ4MTY1NzU2', 'https://vthumb.ykimg.com/0541040852AC3F9B6A0A4604E584A11B', '06:32', null);
INSERT INTO `videos` VALUES ('171', '111', '【郝斌C语言】-111 函数之 8：判断一个数字是否是素数', 'http://player.youku.com/embed/XNjQ4MTYxNDIw', 'https://vthumb.ykimg.com/0541040852AC3F2F6A0A4E4BB6EC34CC', '25:36', null);
INSERT INTO `videos` VALUES ('172', '105', '【郝斌C语言】-105 函数之 2：函数使用简单介绍', 'http://player.youku.com/embed/XNjQ4MTU1NTgw', 'https://vthumb.ykimg.com/0541040852AC3BBF6A0A491BD7B03501', '26:03', null);
INSERT INTO `videos` VALUES ('173', '112', '【郝斌C语言】-112 函数之 9：复习', 'http://player.youku.com/embed/XNjQ4MTYxMjY4', 'https://vthumb.ykimg.com/0541040852AC3D5B6A0A424A66E2E17D', '15:08', null);
INSERT INTO `videos` VALUES ('174', '108', '【郝斌C语言】-108 函数之 5：如何定义函数', 'http://player.youku.com/embed/XNjQ4MTU3OTI0', 'https://vthumb.ykimg.com/0541040852AC3B886A0A48589E7EEFC1', '10:18', null);
INSERT INTO `videos` VALUES ('175', '116', '【郝斌C语言】-116 函数之 13：复习函数内容的知识', 'http://player.youku.com/embed/XNjQ4MTY0MDEy', 'https://vthumb.ykimg.com/0541040852AC3EB86A0A451E1B2B4244', '06:14', null);
INSERT INTO `videos` VALUES ('176', '114', '【郝斌C语言】-114 函数之11：形参和实参', 'http://player.youku.com/embed/XNjQ4MTYyODQw', 'https://vthumb.ykimg.com/0541040852AC3DB16A0A4B124616DE10', '05:41', null);
INSERT INTO `videos` VALUES ('177', '107', '【郝斌C语言】-107 函数之 4：什么是函数', 'http://player.youku.com/embed/XNjQ4MTU2NDY4', 'https://vthumb.ykimg.com/0541040852AC3B0E6A0A491BD56C23CC', '13:48', null);
INSERT INTO `videos` VALUES ('178', '110', '【郝斌C语言】-110 函数之 7：函数的分类', 'http://player.youku.com/embed/XNjQ4MTU4NzQw', 'https://vthumb.ykimg.com/0541040852AC3B476A0A4D4C05EE704D', '05:22', null);
INSERT INTO `videos` VALUES ('179', '109', '【郝斌C语言】-109 函数之6：return和break的区别', 'http://player.youku.com/embed/XNjQ4MTU3OTQ4', 'https://vthumb.ykimg.com/0541040852AC3B2D6A0A4A56F09D804F', '08:32', null);
INSERT INTO `videos` VALUES ('180', '106', '【郝斌C语言】-106 函数之 3：为什么需要函数', 'http://player.youku.com/embed/XNjQ4MTU1MTgw', 'https://vthumb.ykimg.com/0541040852AC39126A0A424A69B762F4', '07:24', null);
INSERT INTO `videos` VALUES ('181', '101', '【郝斌C语言】-101 数组之 4：数组之所以不是我们学习重点的原因', 'http://player.youku.com/embed/XNjQ4MTUzMzE2', 'https://vthumb.ykimg.com/0541040852AC38E56A0A4B12397053A7', '25:48', null);
INSERT INTO `videos` VALUES ('182', '103', '【郝斌C语言】-103 数组之 7：是否存在多维数组', 'http://player.youku.com/embed/XNjQ4MTU0MzA4', 'https://vthumb.ykimg.com/0541040852AC38196A0A3F42BCCF945C', '05:39', null);
INSERT INTO `videos` VALUES ('183', '102', '【郝斌C语言】-102 数组之 6：二维数组的使用', 'http://player.youku.com/embed/XNjQ4MTUzMzA0', 'https://vthumb.ykimg.com/0541040852AC38796A0A4C4C40EAC2A5', '19:09', null);
INSERT INTO `videos` VALUES ('184', '104', '【郝斌C语言】-104 函数之 1：函数概述', 'http://player.youku.com/embed/XNjQ4MTU0MzQ4', 'https://vthumb.ykimg.com/0541040852AC38296A0A4A56EF2B4462', '04:40', null);
INSERT INTO `videos` VALUES ('185', '96', '【郝斌C语言】-96 流程控制的总测试', 'http://player.youku.com/embed/XNjQ4MTQ4OTI0', 'https://vthumb.ykimg.com/0541040852AC36AF6A0A445554EDD007', '17:55', null);
INSERT INTO `videos` VALUES ('186', '92', '【郝斌C语言】-92 break的用法', 'http://player.youku.com/embed/XNjQ4MTQ3NjQ0', 'https://vthumb.ykimg.com/0541040852AC352B6A0A4C4C3997E016', '20:34', null);
INSERT INTO `videos` VALUES ('187', '99', '【郝斌C语言】-99 数组之 3：为什么需要数组', 'http://player.youku.com/embed/XNjQ4MTQ4ODUy', 'https://vthumb.ykimg.com/0541040852AC34EB6A0A406370E2D491', '08:15', null);
INSERT INTO `videos` VALUES ('188', '93', '【郝斌C语言】-93 continue的用法', 'http://player.youku.com/embed/XNjQ4MTQ3ODIw', 'https://vthumb.ykimg.com/0541040852AC35486A0A3F42D26DCA7F', '12:24', null);
INSERT INTO `videos` VALUES ('189', '95', '【郝斌C语言】-95 流程控制的总复习', 'http://player.youku.com/embed/XNjQ4MTQ3NjYw', 'https://vthumb.ykimg.com/0541040852AC34E36A0A4A56F459CDFE', '10:34', null);
INSERT INTO `videos` VALUES ('190', '98', '【郝斌C语言】-98 数组之 2：数组的简单使用', 'http://player.youku.com/embed/XNjQ4MTQ5MDI0', 'https://vthumb.ykimg.com/0541040852AC34BA6A0A3F42D2A86BE8', '05:17', null);
INSERT INTO `videos` VALUES ('191', '100', '【郝斌C语言】-100 数组之 4：数组之所以不是我们学习重点的原因', 'http://player.youku.com/embed/XNjQ4MTQ5NDg0', 'https://vthumb.ykimg.com/0541040852AC34BC6A0A4744A14B2C13', '02:36', null);
INSERT INTO `videos` VALUES ('192', '84', '【郝斌C语言】- 84 如何看懂一个程序举例之1：回文数', 'http://player.youku.com/embed/XNjQ4MTQ1MDI0', 'https://vthumb.ykimg.com/0541040852AC33B46A0A47449145E3AF', '21:37', null);
INSERT INTO `videos` VALUES ('193', '76', '【郝斌C语言】- 76 运算符补充之 1： 自增自减', 'http://player.youku.com/embed/XNjQ4MTQyOTc2', 'https://vthumb.ykimg.com/0541040852AC320E6A0A44553D04A4A6', '20:28', null);
INSERT INTO `videos` VALUES ('194', '89', '【郝斌C语言】- 89 一元二次方程 用do...while 实现', 'http://player.youku.com/embed/XNjQ4MTQ2MjQ4', 'https://vthumb.ykimg.com/0541040852AC33DD6A0A40636D42F5E7', '17:11', null);
INSERT INTO `videos` VALUES ('195', '80', '【郝斌C语言】- 80 复习多个for循环嵌套使用', 'http://player.youku.com/embed/XNjQ4MTQ0MDI0', 'https://vthumb.ykimg.com/0541040852AC32AF6A0A491BD0CF27BB', '16:34', null);
INSERT INTO `videos` VALUES ('196', '86', '【郝斌C语言】- 86 如何看懂一个程序举例之 2：菲波拉契序列-2-', 'http://player.youku.com/embed/XNjQ4MTQ1MTAw', 'https://vthumb.ykimg.com/0541040852AC33106A0A4377B8D30DCF', '12:13', null);
INSERT INTO `videos` VALUES ('197', '94', '【郝斌C语言】-94 学C语言为什么无法做出像样东西 和 各门课程之', 'http://player.youku.com/embed/XNjQ4MTQ2OTMy', 'https://vthumb.ykimg.com/0541040852AC34296A0A4123868DAA44', '09:55', null);
INSERT INTO `videos` VALUES ('198', '90', '【郝斌C语言】-90 switch函数用法的简介', 'http://player.youku.com/embed/XNjQ4MTQ2NDcy', 'https://vthumb.ykimg.com/0541040852AC33F16A0A4377CD7C9FBE', '10:09', null);
INSERT INTO `videos` VALUES ('199', '85', '【郝斌C语言】- 85 如何看懂一个程序举例之 2：菲波拉契序列', 'http://player.youku.com/embed/XNjQ4MTQ0ODAw', 'https://vthumb.ykimg.com/0541040852AC327F6A0A4604E56C794C', '09:38', null);
INSERT INTO `videos` VALUES ('200', '91', '【郝斌C语言】-91 switch琐碎非重点知识介绍', 'http://player.youku.com/embed/XNjQ4MTQ2MzY0', 'https://vthumb.ykimg.com/0541040852AC334E6A0A4A56F58E82CD', '06:38', null);
INSERT INTO `videos` VALUES ('201', '97', '【郝斌C语言】-97 数组之 1：数组概述', 'http://player.youku.com/embed/XNjQ4MTQ4MDMy', 'https://vthumb.ykimg.com/0541040852AC33D56A0A406368CC83C4', '01:29', null);
INSERT INTO `videos` VALUES ('202', '88', '【郝斌C语言】- 88 -do...while- 与 while和for的比较', 'http://player.youku.com/embed/XNjQ4MTQ1NTE2', 'https://vthumb.ykimg.com/0541040852AC32976A0A3F42D23E2FE8', '04:30', null);
INSERT INTO `videos` VALUES ('205', '179', '【郝斌C语言】- 178 试题讲解 (上)', 'http://player.youku.com/embed/XNjQ4MjE4MjUy', 'https://vthumb.ykimg.com/0541040852AC65F26A0A44554C96980D', '01:07:16', null);
INSERT INTO `videos` VALUES ('206', '176', '【郝斌C语言】- 176 位运算符', 'http://player.youku.com/embed/XNjQ4MjE1Njk2', 'https://vthumb.ykimg.com/0541040852AC60C66A0A445554865C26', '35:24', null);
INSERT INTO `videos` VALUES ('207', '172', '【郝斌C语言】- 172 链表 (中)', 'http://player.youku.com/embed/XNjQ4MjEzOTMy', 'https://vthumb.ykimg.com/0541040852AC5FBC6A0A4858A5B8AB4E', '38:29', null);
INSERT INTO `videos` VALUES ('208', '173', '【郝斌C语言】 - 173 链表 (下)', 'http://player.youku.com/embed/XNjQ4MjE0Mzk2', 'https://vthumb.ykimg.com/0541040852AC5FC86A0A3F42C61F1A1A', '30:40', null);
INSERT INTO `videos` VALUES ('209', '180', '【郝斌C语言】- 180  试题讲解 (下)', 'http://player.youku.com/embed/XNjQ4MjE2MjY0', 'https://vthumb.ykimg.com/0541040852AC5F3C6A0A3F42BFED22C0', '15:46', null);
INSERT INTO `videos` VALUES ('210', '179', '【郝斌C语言】- 179 NULL的含义', 'http://player.youku.com/embed/XNjQ4MjE1MzE2', 'https://vthumb.ykimg.com/0541040852AC5EAA6A0A4B1241BD1B31', '16:31', null);
INSERT INTO `videos` VALUES ('211', '168', '【郝斌C语言】- 168 补码 (上)', 'http://player.youku.com/embed/XNjQ4MjEwMTY4', 'https://vthumb.ykimg.com/0541040852AC5DAE6A0A4D4C03C4FCD1', '47:38', null);
INSERT INTO `videos` VALUES ('212', '167', '【郝斌C语言】- 167 进制转化', 'http://player.youku.com/embed/XNjQ4MjA5NDI4', 'https://vthumb.ykimg.com/0541040852AC5C386A0A451E22ECDF18', '32:33', null);
INSERT INTO `videos` VALUES ('213', '170', '【郝斌C语言】- 170 补码 (下)', 'http://player.youku.com/embed/XNjQ4MjEwNTg0', 'https://vthumb.ykimg.com/0541040852AC5C636A0A4C4C25B552E4', '27:09', null);
INSERT INTO `videos` VALUES ('214', '175', '【郝斌C语言】- 175 广义的算法', 'http://player.youku.com/embed/XNjQ4MjExNzY4', 'https://vthumb.ykimg.com/0541040852AC5C146A0A424A61619573', '09:01', null);
INSERT INTO `videos` VALUES ('215', '177', '【郝斌C语言】- 177 文件、宏和typedef', 'http://player.youku.com/embed/XNjQ4MjEzMTc2', 'https://vthumb.ykimg.com/0541040852AC5C456A0A4C4C3B7BEBC7', '02:17', null);
INSERT INTO `videos` VALUES ('216', '164', '【郝斌C语言】- 164 结构体11：综合应用_学生管理系统(存储，排', 'http://player.youku.com/embed/XNjQ4MjA4Njky', 'https://vthumb.ykimg.com/0541040852AC5B6F6A0A4377D05F80C2', '28:51', null);
INSERT INTO `videos` VALUES ('217', '171', '【郝斌C语言】- 171 链表 (上)', 'http://player.youku.com/embed/XNjQ4MjEwMTIw', 'https://vthumb.ykimg.com/0541040852AC5B6B6A0A491BD72E61AB', '18:08', null);
INSERT INTO `videos` VALUES ('218', '174', '【郝斌C语言】- 174 狭义的算法', 'http://player.youku.com/embed/XNjQ4MjExMjg4', 'https://vthumb.ykimg.com/0541040852AC5B2C6A0A4B1253DA3408', '03:55', null);
INSERT INTO `videos` VALUES ('219', '169', '【郝斌C语言】- 169 复习上节课补码知识', 'http://player.youku.com/embed/XNjQ4MjA5MTQw', 'https://vthumb.ykimg.com/0541040852AC5A2A6A0A4C4C2F746286', '08:33', null);
INSERT INTO `videos` VALUES ('220', '155', '【郝斌C语言】- 155 结构体5：如何取出结构体变量中的每一个成员', 'http://player.youku.com/embed/XNjQ4MjA1NTY4', 'https://vthumb.ykimg.com/0541040852AC592A6A0A4A56E1EEF4FC', '25:01', null);
INSERT INTO `videos` VALUES ('221', '159', '【郝斌C语言】- 159 结构体8：通过函数完成对结构体变量的输入和', 'http://player.youku.com/embed/XNjQ4MjA2ODA4', 'https://vthumb.ykimg.com/0541040852AC5A006A0A4744A2D0EA9B', '22:37', null);
INSERT INTO `videos` VALUES ('222', '163', '【郝斌C语言】- 163 冒泡排序', 'http://player.youku.com/embed/XNjQ4MjA3NjY0', 'https://vthumb.ykimg.com/0541040852AC59E86A0A4744993D6079', '20:47', null);
INSERT INTO `videos` VALUES ('223', '166', '【郝斌C语言】- 166 枚举（下）', 'http://player.youku.com/embed/XNjQ4MjA4MjEy', 'https://vthumb.ykimg.com/0541040852AC59ED6A0A4604C8DA7D74', '16:09', null);
INSERT INTO `videos` VALUES ('224', '162', '【郝斌C语言】- 162 结构体10：结构体变量的运算', 'http://player.youku.com/embed/XNjQ4MjA2MDA0', 'https://vthumb.ykimg.com/0541040852AC57B56A0A4E4BCEA5A870', '02:49', null);
INSERT INTO `videos` VALUES ('225', '143', '【郝斌C语言】- 143 指针之 23：动态内存分配举例(动态一维数组', 'http://player.youku.com/embed/XNjQ4MjAwNjY0', 'https://vthumb.ykimg.com/0541040852AC577A6A0A44554C03552E', '35:11', null);
INSERT INTO `videos` VALUES ('226', '165', '【郝斌C语言】- 165 枚举（上）', 'http://player.youku.com/embed/XNjQ4MjA2NDQw', 'https://vthumb.ykimg.com/0541040852AC57DF6A0A3F42BC16C529', '01:41', null);
INSERT INTO `videos` VALUES ('227', '161', '【郝斌C语言】- 161 指针优点大总结', 'http://player.youku.com/embed/XNjQ4MjA2NjQ0', 'https://vthumb.ykimg.com/0541040852AC59066A0A451E24F883F6', '12:31', null);
INSERT INTO `videos` VALUES ('228', '151', '【郝斌C语言】- 151 结构体之 1：为什么需要结构体和什么叫结构', 'http://player.youku.com/embed/XNjQ4MjA0MjM2', 'https://vthumb.ykimg.com/0541040852AC57A36A0A41237C08FB9C', '15:37', null);
INSERT INTO `videos` VALUES ('229', '149', '【郝斌C语言】- 149 指针之 29：动态内存可以跨函数使用详解', 'http://player.youku.com/embed/XNjQ4MjA0ODAw', 'https://vthumb.ykimg.com/0541040852AC58966A0A4604E06D5E93', '13:24', null);
INSERT INTO `videos` VALUES ('230', '160', '【郝斌C语言】- 160 结构体9：应该发送内容还是应该发送地址', 'http://player.youku.com/embed/XNjQ4MjA2MDY0', 'https://vthumb.ykimg.com/0541040852AC58366A0A4B1250DB3409', '08:48', null);
INSERT INTO `videos` VALUES ('231', '158', '【郝斌C语言】- 158 结构体7：复习上节课知识', 'http://player.youku.com/embed/XNjQ4MjA1NDQ4', 'https://vthumb.ykimg.com/0541040852AC57B66A0A4604E3A9D7D7', '08:09', null);
INSERT INTO `videos` VALUES ('232', '157', '【郝斌C语言】- 157 考前知识点概述', 'http://player.youku.com/embed/XNjQ4MjA0OTc2', 'https://vthumb.ykimg.com/0541040852AC570E6A0A3F42C0082E63', '04:39', null);
INSERT INTO `videos` VALUES ('233', '144', '【郝斌C语言】- 144 指针之 24-动态内存和静态内存的比较', 'http://player.youku.com/embed/XNjQ4MjAyMTk2', 'https://vthumb.ykimg.com/0541040852AC568C6A0A41238ABAA86B', '20:02', null);
INSERT INTO `videos` VALUES ('234', '148', '【郝斌C语言】- 148 指针之 28：静态变量不能跨函数使用详解', 'http://player.youku.com/embed/XNjQ4MjAzMTQw', 'https://vthumb.ykimg.com/0541040852AC56D96A0A445554E7C2AF', '12:26', null);
INSERT INTO `videos` VALUES ('235', '145', '【郝斌C语言】- 145 指针之 25：多级指针', 'http://player.youku.com/embed/XNjQ4MjAyNTg0', 'https://vthumb.ykimg.com/0541040852AC56A26A0A491BCC06B299', '16:06', null);
INSERT INTO `videos` VALUES ('236', '154', '【郝斌C语言】- 154 结构体4-结构体的赋值和初始化', 'http://player.youku.com/embed/XNjQ4MjA0MTQw', 'https://vthumb.ykimg.com/0541040852AC569C6A0A4F51FF98656B', '04:30', null);
INSERT INTO `videos` VALUES ('237', '156', '【郝斌C语言】- 156 结构体之 6：布置作业', 'http://player.youku.com/embed/XNjQ4MjA0NjUy', 'https://vthumb.ykimg.com/0541040852AC56956A0A4C4C3DA23B46', '02:05', null);
INSERT INTO `videos` VALUES ('238', '150', '【郝斌C语言】- 150 指针之 30：跨函数使用内存习题测试', 'http://player.youku.com/embed/XNjQ4MjAzMzE2', 'https://vthumb.ykimg.com/0541040852AC56336A0A491BD1C38E76', '05:50', null);
INSERT INTO `videos` VALUES ('239', '152', '【郝斌C语言】- 152 结构体之2：如何定义结构体', 'http://player.youku.com/embed/XNjQ4MjAzNjE2', 'https://vthumb.ykimg.com/0541040852AC563B6A0A3F42CE1E775E', '04:24', null);
INSERT INTO `videos` VALUES ('240', '147', '【郝斌C语言】- 147 指针之 27：闲聊', 'http://player.youku.com/embed/XNjQ4MjAyNjg4', 'https://vthumb.ykimg.com/0541040852AC55A36A0A406361C0EE61', '04:37', null);
INSERT INTO `videos` VALUES ('241', '153', '【郝斌C语言】- 153 结构体之3：怎样使用结构体变量概述', 'http://player.youku.com/embed/XNjQ4MjAzNjY0', 'https://vthumb.ykimg.com/0541040852AC561C6A0A4063729E0FAC', '02:34', null);
INSERT INTO `videos` VALUES ('242', '146', '【郝斌C语言】- 146 指针之 26-复习上节课知识', 'http://player.youku.com/embed/XNjQ4MjAyNjA4', 'https://vthumb.ykimg.com/0541040852AC55BB6A0A48588EC15A53', '04:42', null);
INSERT INTO `videos` VALUES ('243', '134', '【郝斌C语言】- 134 指针之 14：确定一个一维数组需要2个参数及', 'http://player.youku.com/embed/XNjQ4MTg2ODcy', 'https://vthumb.ykimg.com/0541040852AC515F6A0A41237073AB1E', '40:24', null);
INSERT INTO `videos` VALUES ('244', '141', '【郝斌C语言】- 141 指针之 21：malloc函数使用的简单介绍', 'http://player.youku.com/embed/XNjQ4MTkxNzEy', 'https://vthumb.ykimg.com/0541040852AC51236A0A4C4C3DBCB75B', '28:12', null);
INSERT INTO `videos` VALUES ('245', '137', '【郝斌C语言】- 137 指针之 17：何谓变量的地址 和 一个指针变量', 'http://player.youku.com/embed/XNjQ4MTkwMTM2', 'https://vthumb.ykimg.com/0541040852AC50336A0A3F42D183C2EF', '25:13', null);
INSERT INTO `videos` VALUES ('246', '142', '【郝斌C语言】- 142 指针之 22：malloc函数的用法(续)', 'http://player.youku.com/embed/XNjQ4MTkyMDg0', 'https://vthumb.ykimg.com/0541040852AC50776A0A406371B17DDB', '16:32', null);
INSERT INTO `videos` VALUES ('247', '139', '【郝斌C语言】- 139 指针之 19：传统数组的缺点', 'http://player.youku.com/embed/XNjQ4MTkwODg0', 'https://vthumb.ykimg.com/0541040852AC4FEA6A0A4744A2253828', '19:59', null);
INSERT INTO `videos` VALUES ('248', '126', '【郝斌C语言】- 126 指针之6：基本类型指针常见错误解析', 'http://player.youku.com/embed/XNjQ4MTgyNzgw', 'https://vthumb.ykimg.com/0541040852AC4CE56A0A4377CD8642E2', '26:26', null);
INSERT INTO `videos` VALUES ('249', '127', '【郝斌C语言】- 127 指针之7：经典指针程序_互换两个数字', 'http://player.youku.com/embed/XNjQ4MTgzMjE2', 'https://vthumb.ykimg.com/0541040852AC4D256A0A451E247A0AB6', '31:04', null);
INSERT INTO `videos` VALUES ('250', '138', '【郝斌C语言】- 138 指针之 18：动态内存分配概述', 'http://player.youku.com/embed/XNjQ4MTkwMzgw', 'https://vthumb.ykimg.com/0541040852AC4E316A0A4E4BCEAC89CB', '03:47', null);
INSERT INTO `videos` VALUES ('251', '140', '【郝斌C语言】- 140 指针之 20：为什么需要动态分配内存', 'http://player.youku.com/embed/XNjQ4MTkxMDA4', 'https://vthumb.ykimg.com/0541040852AC4E586A0A4604E2AD1853', '01:17', null);
INSERT INTO `videos` VALUES ('252', '129', '【郝斌C语言】- 129 指针之 9 复习前面所有指针知识 实参和形参', 'http://player.youku.com/embed/XNjQ4MTgzOTg0', 'https://vthumb.ykimg.com/0541040852AC4D926A0A4063602164A6', '34:59', null);

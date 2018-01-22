/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ctest2

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-22 12:26:37
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('4', '1', '1');
INSERT INTO `collection` VALUES ('5', '4', '1');
INSERT INTO `collection` VALUES ('6', '2', '1');
INSERT INTO `collection` VALUES ('7', '11', 'szl');
INSERT INTO `collection` VALUES ('8', '21', 'szl');
INSERT INTO `collection` VALUES ('9', '1', 'szl');

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
  `paper_title` varchar(255) DEFAULT NULL,
  `difficulty` mediumint(8) DEFAULT NULL,
  `analysis` varchar(1023) DEFAULT NULL,
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exercises
-- ----------------------------
INSERT INTO `exercises` VALUES ('1', '下列描述中正确的是', '算法是指对解题方案的准确而完整的描述', '算法的有穷性是指算法程序的长度是有限的', '算法是否有效与拥有的情报无关', '算法的基本特征有可行性、确定性和有穷性', '1', '第1章_程序设计基本概念', '3', '无解析');
INSERT INTO `exercises` VALUES ('2', '下列数据结构中属于非线性结构的是', '队列', '线性表', '二叉树', '栈', '3', '第1章_程序设计基本概念', '3', '无解析');
INSERT INTO `exercises` VALUES ('3', '在C语言中，合法的长整型常数是', '0.123456', '4962717', '9L', '5.321e2', '3', '第1章_程序设计基本概念', '3', '无解析');
INSERT INTO `exercises` VALUES ('4', '执行语句X=(a=10，b=a--.后，x、a、b的值依次为', '10,10,9', '10,9,9', '9,10,9', '10,9,10', '4', '第1章_程序设计基本概念', '1', '无解析');
INSERT INTO `exercises` VALUES ('5', '下面概念中，不属于面向对象方法的是', '对象', '继承', '类', '过程调用', '4', '第1章_程序设计基本概念', '2', '无解析');
INSERT INTO `exercises` VALUES ('6', '下列选项中属于软件生命周期开发阶段任务的是', '可行性研究', '需求分析', '详细设计', '软件维护', '3', '第1章_程序设计基本概念', '4', '无解析');
INSERT INTO `exercises` VALUES ('7', '软件设计中衡量模块独立性的度量标准是', '抽象和信息隐蔽', '局部化和封装化', '内聚性和耦合性', '激活机制和控制方法', '3', '第1章_程序设计基本概念', '3', '无解析');
INSERT INTO `exercises` VALUES ('8', '下列不属于过程设计工具中图形工的是', 'N-S', 'PAD', '程序流程图', 'DFD', '4', '第1章_程序设计基本概念', '4', '无解析');
INSERT INTO `exercises` VALUES ('9', '下列叙述中错误的是', '数据库管理系统是故据库的核心', '数据库系统由数据库、数据库管理系统、数据库管理员三部分组成', '数据共享最好的是数据库系统阶段', '数据库中的数据独立于应用程序而不依赖于应用程序', '2', '第1章_程序设计基本概念', '5', '无解析');
INSERT INTO `exercises` VALUES ('10', '在下列选项中，哪个不是-', '无穷性', '可行性', '确定性', '有穷性', '1', '第1章_程序设计基本概念', '5', '无解析');
INSERT INTO `exercises` VALUES ('11', '程序流程图中带有前头的线段表示的是', '图九美系', '教据漆', '控制疏', '调用关系', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '1', '在数据流图中，用标有名字的前头表示故据流。右程序流程图中，用标有名字的箭头表示控\r\n制流。所以选择C');
INSERT INTO `exercises` VALUES ('12', '结构化程序设计的基本原则不包括', '多态性', '自頂向下', '模块化', '逐步求精', '1', '2017年9月计算机二级考试《C语言》临考猜想卷', '2', '结构化程序设计的思想包括。自顶向下、逐步求精、模块化、限制使用goto语句，所以选择\r\nA\r\n');
INSERT INTO `exercises` VALUES ('13', '教件设计中模块划分应遵酒的准则是', '低内聚低耦合', '高内聚低耦合', '低内聚高耦合', '高内聚高耦合', '2', '2017年9月计算机二级考试《C语言》临考猜想卷', '4', '软件设计中模块划分应遵语的准贝是高内聚低偶台、模块大小规模适当、模块的依赖关系适\r\n当等。模块的划分应遵语一定的要求，以保证模块划分合理，并进一步保证以此为依据开发出的软件系统可\r\n靠性强，县于理解和维护。模块之间的耦合应尽可能的低，模块的內聚度应尽可能的高');
INSERT INTO `exercises` VALUES ('14', '在软件开发中，需家分析阶段产生的主要文档是', '可行性分析报告', '软件需求规格说明书', '概要设计说明书', '集成测试计划', '2', '2017年9月计算机二级考试《C语言》临考猜想卷', '3', '解析1A 增误，可行性分析阶码产生可行性分析报告。C)借误概要设计说明书是总体设计阶段产\r\n生的文档。D)错误，集成商试计划是在概要设计阶段编写的文档。B)正确，需求规格说明书是后续工作如设\r\nt、编码等需要的重要参考文档。');
INSERT INTO `exercises` VALUES ('15', '算法的有穷性是指', '算法程序的运行时间是有限的', '算法程序所处理的数据量是有限的', '算法程序的长度是有限的', '算法只能被有限的用户使用', '1', '2017年9月计算机二级考试《C语言》临考猜想卷', '5', '算法原贝上能够情确地运行.而且人们用笔和纸做有限次运算后即可完成。有方性是指算法\r\n程序的运行时间是有限的');
INSERT INTO `exercises` VALUES ('16', '对长度为r的线住表排序，在最坏情况下，比较次数不是a(n一D/2的排序方法是', '快速排序', '冒泡排序', '直接插入排序', '堆排序', '4', '2017年9月计算机二级考试《C语言》临考猜想卷', '3', '除了堆排序算法的比较次故是\r\nO(eleson)，其他的都是n(n一D/2.');
INSERT INTO `exercises` VALUES ('17', '下列关于栈的前述正确的是', '栈按“先进先出“组织数据', '栈按”先进后出“组织教据', '只能在栈底插入数据', '不能到际教据', '2', '2017年9月计算机二级考试《C语言》临考猜想卷', '2', '栈是按失进出的原则组乡数据的数据的板和田际都在核债进行操作、\r\n笔记');
INSERT INTO `exercises` VALUES ('18', '在数据库设计中，将E一图转换成关系故据模型的过程属于', '需求分析阶段', '概念设计阶段', '逻辑设计阶段', '物理设计阶段', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '2', 'E一R图转换成关系横型数据则是把图形分析出来的联系反映子数据库中，即设计出表，所以\r\n属于逻辑设计阶段。');
INSERT INTO `exercises` VALUES ('19', '有表示4 性选课的三张表，学生S( 学号，姓名，性別，年齡，身份证号)，课程C(课号，课名)，选课SC(学\r\n好，课号，成绩》，则表SC的关键字(健或码)为', '课号，成績', '学号，咸绩', '学号课号', '学号，姓名成绩', '3', '2017年9月计算机二级考试《C语言》临考猜想卷', '3', '学号是学生表S的王键，课号是课程表C的主键，所选课表$的关键字就应该是与前两表\r\n能够直接联系且能唯一定义的学号和评号，所以选择C');
INSERT INTO `exercises` VALUES ('20', '以下额述中错误的是', 'C语言中的每条可扶行语句和非执行语句最终都将被转换成二进制的机器指令', 'c程序经过编详、连接步黎之后才能形成一个真正可执行的二进制机器指令文件', '用C语言编写的程序称为源程序，它以ASCI代码形式存放在一个文本文件中', 'C语言源程序经编译后生成后握为ob的目标程序', '2', '2017年9月计算机二级考试《C语言》临考猜想卷', '3', 'C语言中的非执行语均不会被编评，不会生成二选制的机器指令，所以入)错误。由C语宫构\r\n成的指令予列称C源程序，C源程序经过C语言编译程序编评之后生成一个后援为。ORJ的二进制文件(称为目\r\n标文件) 最后委由“连接程序“把此。OBJ文件与C语言提供的各种库函数连接起来生成一个后提为，X的可\r\n执行文件。');
INSERT INTO `exercises` VALUES ('21', '以下选项中，合法的一组C语言效值常量是', '12.0Xa23 4 5e0', '028.5e-3-0xt', '，177 4o1.5 Oabc', '0x8A 10,000 3.e5', '1', '2015年9月计算机二级考试《C语言》真题及解析', '4', 'C语言中八选制整型常量的开头是故字0 十六进制整型常量的开头数字是OX。C语言中的实\r\n型常量有两种表示形式，小数形式，小数形式表示的实型常量必须要有小致点指数元式，以”。“或下“后\r\n跟一个整故来表示以10为底数的某故，且规定字母。或之前必须要有数字，且。或后面的指数必页为整\r\n故。B)选项中028错误，八进制中没有数字8。C)选项中41.5中6后面的指数不是整数。D)选项中3.e5小数\r\n点后面缺少数字。');
INSERT INTO `exercises` VALUES ('22', '以下选项中不台法的标识符是', '&a', 'FOR', 'print', '00', '1', '2015年9月计算机二级考试《C语言》真题及解析', '4', 'C 语言中标识符由字母、下切线、数字组成，且开4 必须是字母或下划线。另外，关键字不能\r\n作为标识符。因为C语言中区分大小写，所以B)法顶中的“FOR”可以作为标识符来用。A)选项中含有非法字符\r\nk，所以选择A');
INSERT INTO `exercises` VALUES ('23', '苦有定义，double 45 22 int i=0.k= 18r 则不符合C语言规定的赋值语句是', 'i- (a+k)< (i+k);', 'i=a%11', 'a=a++，i++', 'i=! a', '2', '2015年9月计算机二级考试《C语言》真题及解析', '2', '取模运算符“%”，二元运算符，具有左结合性，参与运算的量均为整型。选项肿中的变量是\r\ndouble实型，所以B)不符合规定。');
INSERT INTO `exercises` VALUES ('24', '下关干逻辑运算符两偶运算对象的叙述中正确的是', '可以是任意合法的表达式', '只能是整数0或非0整数', '可以是结构体类型的数据', '只能是整數0或1', '1', '2015年9月计算机二级考试《C语言》真题及解析', '4', 'C语言的逻辑运算符比较特别，它的操作数设有明确的故据夫型，可以是任意合法的表达式，\r\n所以选择A');
INSERT INTO `exercises` VALUES ('25', '以下毅述中错误的是', '可以给指针变量赋一个整数作为地址值', '函数可以返回地址值', '改变角数形参的值，不会改变对应实参的值', '当在程序的开头包含头文件stdio.h时，可以给指针变量財NULL', '1', '2015年9月计算机二级考试《C语言》真题及解析', '1', '不能行一个整故直接赋给指针变量作为地址，所w是错误的函数的返回值可以是地址，\r\n即指针。函数调用中形参值的变化不会传递给实梦');
INSERT INTO `exercises` VALUES ('26', '设已有定义，float x 则以下对指针支量p进行定义且财切值的语句中正确的是', 'int *p= (tloat)x:', 'tloat *p-bx', 'float D=&x;', 'f1oat *p= 1024', '2', '2015年9月计算机二级考试《C语言》真题及解析', '2', '指计是用来存放地址的支量，用(类型名+指针变量名)的无式定义。赋值时应将其个变量地\r\n址即紅x 賕給指针交量，所以选择B');
INSERT INTO `exercises` VALUES ('27', '以下数组定义中错误的是', 'int x[2][3]= [1,2,3,4,5,6}:', 'int x[[3]= (0);', 'int x[][3]= [{1,2,3).[4,5,61];', 'int x[2][3]= [[1.2].[3,4].[5,6});', '4', '2015年9月计算机二级考试《C语言》真题及解析', '3', '选项中x[2][3]定《的是一个两行三列的二维故组。而在给故组元素赋值时却赋成了三行，\r\n所以错误。');
INSERT INTO `exercises` VALUES ('28', '设有定义，charp[]=(\'1\'，\'2’，\'3\')，*q=p，以下不能计算出一个char型的操所占字节数的表达式是', 'sizeot(p)', 'sixeot(char)', 'sixeot(*q)', 'nixeot(p[0])', '1', '2015年9月计算机二级考试《C语言》真题及解析', '4', '根据慧目中的定义可(30港sizo of(o)，计算的是数组=中所有t素所占用的子节的，配不是\r\nchar型数据所占字节数。');
INSERT INTO `exercises` VALUES ('29', '以下权述中正确的是', '在C语言中，预处理命令行都以”开头', '预处理命令行必须位于C源程序的起始位置', 'Binc1ude <stdio.b>必须放在C程序的开头', 'C语言的预处理不能实现宏定义和条件编译的功能', '1', '2015年9月计算机二级考试《C语言》真题及解析', '1', '预处理命令是以“”号开头的命会它们不是C语言的可执行命令这些命令应该在函故之\r\n外书写，一般在源文件的景扩面书写，但不是必须在起始位置书写所以B) 0)错误。C)语言的预外理能够\r\n实现完定义和条件编译等功能，所以D)增误。');
INSERT INTO `exercises` VALUES ('30', '在C语言中，合法的长整型常数是', '0.123456', '4962717', '9L', '5.321e2', '3', '2015年9月计算机二级考试《C语言》真题及解析', '3', '无解析');
INSERT INTO `exercises` VALUES ('31', '执行语句X=(a=10，b=a--.后，x、a、b的值依次为', '10,10,9', '10,9,9', '9,10,9', '10,9,10', '4', '2017年9月计算机二级考试《C语言》考前猜想卷', '4', '无解析');
INSERT INTO `exercises` VALUES ('32', '以下选项中非法的表达式是', 'a+1=a+1', 'a=b==0', '(Char.(100+ 100.', '7<=X<60', '1', '2017年9月计算机二级考试《C语言》考前必做题', '5', '无解析');
INSERT INTO `exercises` VALUES ('33', '在以下选项中，不正确的赋值语句是', 'i++ ;', 'n1=(n2=(n3=0..;', 'm+n=1;', 'i=k==j ;', '3', '2015年3月计算机二级考试《C语言》真题及解析', '3', '无解析');
INSERT INTO `exercises` VALUES ('34', '若有说明，double*m,n; 则能通过sCanf语句正确给输入项读人数据的程序段是', '*m= &n;scanf(\"%lf*m);', 'm= (double* )mallo (1 0);sc anf(\"%6f\'m);', 'm = &n;scant(%l*,n);', 'm = &n;scanf(\"%le\"\'m);', '4', '2014年9月计算机二级考试《C语言》真题及解析', '3', '无解析');
INSERT INTO `exercises` VALUES ('35', '表示关系M<=N<=P的C语言表达式为', '(M<=N.AND(N<=P.', '(M<=N.&&(N<=P.', '(M<=N<=P.', '(M<=N.&(N<=P.', '2', '第2章_C程序设计的初步知识', '4', '无解析');
INSERT INTO `exercises` VALUES ('36', '以下叙述中正确的是', '在scanf函数的格式串中，必须有与输入项一一对应的格式转换说明符', '只能在prinf函数中指定输入数据的宽度，而不能在scanf函数中指定输入数据占的宽度', 'scanf函数中的字符串，是提示程序员的，输入数据时不必管它', '复合语句也被称为语句块，它至少要包含两条语句', '1', '第2章_C程序设计的初步知识', '2', '无解析');
INSERT INTO `exercises` VALUES ('37', '以下叙述中正确的是', '在scanf函数中的格式控制字符串是为了输入数据用的，不会输出到屏幕上', '在使用scanf函数输入整故或实故时，输入数据之间5 ?能用空格来分隔', '在Printf函数中，各个输出项只能是变量', '使用Printf函数无法输出百分号%', '1', '第2章_C程序设计的初步知识', '3', '无解析');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mistakes
-- ----------------------------
INSERT INTO `mistakes` VALUES ('1', '1', '1');
INSERT INTO `mistakes` VALUES ('2', '2', '1');
INSERT INTO `mistakes` VALUES ('3', '36', 'szl');
INSERT INTO `mistakes` VALUES ('4', '37', 'szl');

-- ----------------------------
-- Table structure for papers
-- ----------------------------
DROP TABLE IF EXISTS `papers`;
CREATE TABLE `papers` (
  `paper_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `paper_title` varchar(255) NOT NULL,
  `paper_type` varchar(255) NOT NULL,
  `creation_date` date DEFAULT NULL,
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of papers
-- ----------------------------
INSERT INTO `papers` VALUES ('1', '第1章_程序设计基本概念', 'chapter', '2017-11-02');
INSERT INTO `papers` VALUES ('2', '第2章_C程序设计的初步知识', 'chapter', null);
INSERT INTO `papers` VALUES ('3', '2017年9月计算机二级考试《C语言》临考猜想卷', 'simulation', null);
INSERT INTO `papers` VALUES ('4', '2017年9月计算机二级考试《C语言》考前猜想卷', 'simulation', null);
INSERT INTO `papers` VALUES ('5', '2017年9月计算机二级考试《C语言》考前必做题', 'simulation', null);
INSERT INTO `papers` VALUES ('6', '2015年9月计算机二级考试《C语言》真题及解析', 'old', null);
INSERT INTO `papers` VALUES ('7', '2015年3月计算机二级考试《C语言》真题及解析', 'old', null);
INSERT INTO `papers` VALUES ('8', '2014年9月计算机二级考试《C语言》真题及解析', 'old', null);
INSERT INTO `papers` VALUES ('10', '第3章_顺序结构', 'chapter', null);
INSERT INTO `papers` VALUES ('11', '第4章_选择结构', 'chapter', null);
INSERT INTO `papers` VALUES ('12', '第5章_循环结构', 'chapter', null);
INSERT INTO `papers` VALUES ('13', '第6章_字符型数据', 'chapter', null);
INSERT INTO `papers` VALUES ('14', '第7章_函数', 'chapter', null);
INSERT INTO `papers` VALUES ('15', '第8章_地址和指针', 'chapter', null);
INSERT INTO `papers` VALUES ('16', '第9章_数组', 'chapter', null);
INSERT INTO `papers` VALUES ('17', '第10章_字符串', 'chapter', null);
INSERT INTO `papers` VALUES ('18', '第11章_对函数的进一步讨论', 'chapter', null);
INSERT INTO `papers` VALUES ('19', '第12章_用户标识符', 'chapter', null);
INSERT INTO `papers` VALUES ('20', '第13章_编译预处理和动态存储分配', 'chapter', null);
INSERT INTO `papers` VALUES ('21', '第14章_结构体、共用体和用户定义类型', 'chapter', null);
INSERT INTO `papers` VALUES ('22', '第15章_位运算', 'chapter', null);
INSERT INTO `papers` VALUES ('23', '第16章_文件', 'chapter', null);
INSERT INTO `papers` VALUES ('24', '第17章_上机指导', 'chapter', null);
INSERT INTO `papers` VALUES ('25', '2017年9月计算机二级考试《C语言》高频考点卷', 'simulation', null);
INSERT INTO `papers` VALUES ('26', '2017年9月计算机二级考试《C语言》冲刺提分卷', 'simulation', null);
INSERT INTO `papers` VALUES ('27', '2017年9月计算机二级考试《C语言》题库试题', 'simulation', null);
INSERT INTO `papers` VALUES ('28', '2014年3月计算机二级考试《C语言》真题及解析', 'old', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `register_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'szl', '123456', null);
INSERT INTO `users` VALUES ('4', 'szl2', '123456', null);

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_number` int(8) NOT NULL,
  `video_title` varchar(255) NOT NULL,
  `youku_path` varchar(255) NOT NULL,
  `creation_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('1', '1', '【郝斌C语言】 - 01 C语言概述（高清）', 'http://player.youku.com/embed/XNjQ1MTcwMTIw', null);
INSERT INTO `videos` VALUES ('2', '2', '【郝斌C语言】 - 02 C语言概述之HelloWorld程序举例（高清）', 'http://player.youku.com/embed/XNjQ1MTc2MDg4', null);
INSERT INTO `videos` VALUES ('3', '3', '【郝斌C语言】- 03 C语言概述 之 起源和发展（高清）', 'http://player.youku.com/embed/XNjQ1MTc2NDk2', null);
INSERT INTO `videos` VALUES ('4', '4', '【郝斌C语言】- 04 C概述 之 C的特点（高清）', 'http://player.youku.com/embed/XNjQ1MTc2OTky', null);
INSERT INTO `videos` VALUES ('5', '5', '【郝斌C语言】- 05 C语言概述 之 应用领域（高清）', 'http://player.youku.com/embed/XNjQ1MTc3Mzcy', null);
INSERT INTO `videos` VALUES ('6', '6', '【郝斌C语言】- 06 C语言概述 之 重要性（高清）', 'http://player.youku.com/embed/XNjQ1MTc4Mjc2', null);
INSERT INTO `videos` VALUES ('7', '7', '【郝斌C语言】- 07 C语言概述 之 怎样学C语言（高清）', 'http://player.youku.com/embed/XNjQ1MTc4NDMy', null);
INSERT INTO `videos` VALUES ('8', '8', '【郝斌C语言】- 08 C语言概述 之 学习目标（高清）', 'http://player.youku.com/embed/XNjQ1MTc4NTQ0', null);
INSERT INTO `videos` VALUES ('9', '9', '【郝斌C语言】- 09 C语言概述 之 常见问题答疑（高清）', 'http://player.youku.com/embed/XNjQ1MTc4Nzk2', null);
INSERT INTO `videos` VALUES ('10', '10', '【郝斌C语言】- 10 C语言概述 之 课程总纲要（高清）', 'http://player.youku.com/embed/XNjQ1MTc4OTUy', null);
INSERT INTO `videos` VALUES ('11', '11', '【郝斌C语言】- 11 C语言概述 之 一元二次方程详解（高清）', 'http://player.youku.com/embed/XNjQ1MjU4NDI0', null);
INSERT INTO `videos` VALUES ('12', '12', '【郝斌C语言】- 12 C语言概述 之 VC++6.0软件使用讲解（高清）', 'http://player.youku.com/embed/XNjQ1MjU4OTY0', null);
INSERT INTO `videos` VALUES ('13', '13', '【郝斌C语言】- 13 C语言概述 之 回顾本讲内容（高清）', 'http://player.youku.com/embed/XNjQ1MjU5MDg0', null);
INSERT INTO `videos` VALUES ('14', '14', '【郝斌C语言】- 14 C语言编程预备计算机专业知识（高清）', 'http://player.youku.com/embed/XNjQ1OTM4MTk2', null);
INSERT INTO `videos` VALUES ('15', '15', '【郝斌C语言】- 15 cpu 内存条 硬盘 显卡 主板 显示器 之间的关系', 'http://player.youku.com/embed/XNjQ1OTM4NDY4', null);
INSERT INTO `videos` VALUES ('16', '16', '【郝斌C语言】- 16 HelloWorld程序如何运行起来的（高清）', 'http://player.youku.com/embed/XNjQ1OTQwMzIw', null);
INSERT INTO `videos` VALUES ('17', '17', '【郝斌C语言】- 17 C编程预备计算机专业知识 之 数据类型（高清）', 'http://player.youku.com/embed/XNjQ1OTQwODg0', null);
INSERT INTO `videos` VALUES ('18', '18', '【郝斌C语言】- 18 预备计算机专业知识 之 什么是变量（高清）', 'http://player.youku.com/embed/XNjQ1OTQxMTI0', null);
INSERT INTO `videos` VALUES ('19', '19', '【郝斌C语言】-19 预备计算机专业知识 之 cpu 内存条 vc++6.0 操', 'http://player.youku.com/embed/XNjQ1OTQxMjMy', null);
INSERT INTO `videos` VALUES ('20', '20', '【郝斌C语言】- 20变量为什么必须的初始化（高清）', 'http://player.youku.com/embed/XNjQ1OTQxNzEy', null);
INSERT INTO `videos` VALUES ('21', '21', '【郝斌C语言】- 21 预备计算机专业知识 之 如何定义变量', 'http://player.youku.com/embed/XNjQ2NDIzNTg4', null);
INSERT INTO `videos` VALUES ('22', '22', '【郝斌C语言】- 22 预备计算机专业知识 之 什么叫进制', 'http://player.youku.com/embed/XNjQ2NDI0NTU2', null);
INSERT INTO `videos` VALUES ('23', '23', '【郝斌C语言】- 23 预备计算机专业知识 之 常量在C语言中是如何', 'http://player.youku.com/embed/XNjQ2NDI1ODgw', null);
INSERT INTO `videos` VALUES ('24', '24', '【郝斌C语言】- 24 预知识 之 常量以什么样的二进制代码存储在计', 'http://player.youku.com/embed/XNjQ2NDI1MjA0', null);
INSERT INTO `videos` VALUES ('25', '25', '【郝斌C语言】- 25 预备计算机专业知识 之 本讲知识回顾', 'http://player.youku.com/embed/XNjQ2NDI1NTU2', null);
INSERT INTO `videos` VALUES ('26', '26', '【郝斌C语言】- 26 预备计算机专业知识 之 代码的规范化', 'http://player.youku.com/embed/XNjQ2NDI3NTg0', null);
INSERT INTO `videos` VALUES ('27', '27', '【郝斌C语言】- 27 预备计算机专业知识 之 什么是字节', 'http://player.youku.com/embed/XNjQ2NDI2ODA0', null);
INSERT INTO `videos` VALUES ('28', '28', '【郝斌C语言】- 28 预备知识 之 不同类型数据之间相互赋值的问题', 'http://player.youku.com/embed/XNjQ2NDI3MTQw', null);
INSERT INTO `videos` VALUES ('29', '29', '【郝斌C语言】- 29 char使用常见问题解析', 'http://player.youku.com/embed/XNjQ2NDI3NjY0', null);
INSERT INTO `videos` VALUES ('30', '30', '【郝斌C语言】- 30 什么是ASCII & 字符的存储', 'http://player.youku.com/embed/XNjQ2NDI4NDE2', null);
INSERT INTO `videos` VALUES ('31', '31', '【郝斌C语言】- 31 printf和scanf简介', 'http://player.youku.com/embed/XNjQ2NDI3OTI4', null);
INSERT INTO `videos` VALUES ('32', '32', '【郝斌C语言】- 32 对初学编程者的一些个人建议', 'http://player.youku.com/embed/XNjQ2NDI4MzE2', null);
INSERT INTO `videos` VALUES ('33', '33', '【郝斌C语言】- 33 printf函数的用法详解', 'http://player.youku.com/embed/XNjQ2NDI5MTQ0', null);
INSERT INTO `videos` VALUES ('34', '34', '【郝斌C语言】- 34 如何编写出更有保存价值 和 更有学习价值的程', 'http://player.youku.com/embed/XNjQ2NDI5Mjky', null);
INSERT INTO `videos` VALUES ('35', '35', '【郝斌C语言】- 35_printf用法详解_2', 'http://player.youku.com/embed/XNjQ2NDI5MjI0', null);
INSERT INTO `videos` VALUES ('36', '36', '【郝斌C语言】- 36 printf为什么需要输出控制符', 'http://player.youku.com/embed/XNjQ2NDI5Mzky', null);
INSERT INTO `videos` VALUES ('37', '37', '【郝斌C语言】- 37 复习上节课内容', 'http://player.youku.com/embed/XNjQ2NDI5Nzc2', null);
INSERT INTO `videos` VALUES ('38', '38', '【郝斌C语言】- 38 scanf用法 - 1：不含输入控制符的用法', 'http://player.youku.com/embed/XNjQ2OTI2MDg0', null);
INSERT INTO `videos` VALUES ('39', '39', '【郝斌C语言】- 39 scanf用法 - 2：含有非输入控制符', 'http://player.youku.com/embed/XNjQ2OTI3MjQ0', null);
INSERT INTO `videos` VALUES ('40', '40', '【郝斌C语言】- 40 sacnf用法 - 3、 一次给多个变量键盘赋值', 'http://player.youku.com/embed/XNjQ2OTI3NjQ0', null);
INSERT INTO `videos` VALUES ('41', '41', '【郝斌C语言】- 41 sacnf用法 - 4 ： 如何使用scanf编写出高质', 'http://player.youku.com/embed/XNjQ2OTI4NzI0', null);
INSERT INTO `videos` VALUES ('42', '42', '【郝斌C语言】- 42 运算符', 'http://player.youku.com/embed/XNjQ2OTI4ODc2', null);
INSERT INTO `videos` VALUES ('43', '43', '【郝斌C语言】- 43 运算符_2：除法与取余运算符', 'http://player.youku.com/embed/XNjQ2OTI5NjQ0', null);
INSERT INTO `videos` VALUES ('44', '44', '【郝斌C语言】- 44 逻辑运算符 之 1', 'http://player.youku.com/embed/XNjQ2OTMwMzM2', null);
INSERT INTO `videos` VALUES ('45', '45', '【郝斌C语言】- 45 逻辑运算符 之 2', 'http://player.youku.com/embed/XNjQ2OTMwNDQ0', null);
INSERT INTO `videos` VALUES ('46', '46', '【郝斌C语言】- 46 回顾Scanf 函数', 'http://player.youku.com/embed/XNjQ2OTMxMDc2', null);
INSERT INTO `videos` VALUES ('47', '47', '【郝斌C语言】- 47 流程控制 之1：什么是流程控制', 'http://player.youku.com/embed/XNjQ2OTMxMjg0', null);
INSERT INTO `videos` VALUES ('48', '48', '【郝斌C语言】- 48 流程控制的分类', 'http://player.youku.com/embed/XNjQ2OTMxNzQw', null);
INSERT INTO `videos` VALUES ('49', '49', '【郝斌C语言】- 49 回顾Scanf及运算符', 'http://player.youku.com/embed/XNjQ2OTMyMDQ4', null);
INSERT INTO `videos` VALUES ('50', '50', '【郝斌C语言】- 50 流程控制之4：流程控制为什么重要', 'http://player.youku.com/embed/XNjQ2OTMyMzgw', null);
INSERT INTO `videos` VALUES ('51', '51', '【郝斌C语言】- 51 选择执行1：if 函数概述', 'http://player.youku.com/embed/XNjQ3MzE1OTQ4', null);
INSERT INTO `videos` VALUES ('52', '52', '【郝斌C语言】- 52 选择执行2：if 函数最简单的用法', 'http://player.youku.com/embed/XNjQ3MzE2MjUy', null);
INSERT INTO `videos` VALUES ('53', '53', '【郝斌C语言】- 53 选择执行3_：if 函数的范围问题', 'http://player.youku.com/embed/XNjQ3MzE2NzM2', null);
INSERT INTO `videos` VALUES ('54', '54', '【郝斌C语言】- 54 选择执行4：if..else的用法', 'http://player.youku.com/embed/XNjQ3MzE3MDQ4', null);
INSERT INTO `videos` VALUES ('55', '55', '【郝斌C语言】- 55 选择执行5：if..else ifelse..的用法', 'http://player.youku.com/embed/XNjQ3MzE3NDk2', null);
INSERT INTO `videos` VALUES ('56', '56', '【郝斌C语言】- 56 选择执行6：C语言对真假的处理', 'http://player.youku.com/embed/XNjQ3MzE3ODU2', null);
INSERT INTO `videos` VALUES ('57', '57', '【郝斌C语言】- 57 选择执行7：if 函数举例--求分数的等级', 'http://player.youku.com/embed/XNjQ3MzE4NzMy', null);
INSERT INTO `videos` VALUES ('58', '58', '【郝斌C语言】- 58 if 函数例子1：互换两个数字', 'http://player.youku.com/embed/XNjQ3MzE4MzUy', null);
INSERT INTO `videos` VALUES ('59', '59', '【郝斌C语言】- 59 if 函数子2：对任意三个数字进行排序', 'http://player.youku.com/embed/XNjQ3MzE5MDE2', null);
INSERT INTO `videos` VALUES ('60', '60', '【郝斌C语言】- 60 学习C语言常见误区', 'http://player.youku.com/embed/XNjQ3MzIyNjA0', null);
INSERT INTO `videos` VALUES ('61', '61', '【郝斌C语言】- 61 复习上机课知识', 'http://player.youku.com/embed/XNjQ3OTc1OTgw', null);
INSERT INTO `videos` VALUES ('62', '62', '【郝斌C语言】- 62 选择执行8：空语句的问题', 'http://player.youku.com/embed/XNjQ3OTc2MTg4', null);
INSERT INTO `videos` VALUES ('63', '63', '【郝斌C语言】- 63 选择执行9：if 函数常见问题解析', 'http://player.youku.com/embed/XNjQ3OTc3NTgw', null);
INSERT INTO `videos` VALUES ('64', '64', '【郝斌C语言】- 64 switch后面再讲', 'http://player.youku.com/embed/XNjQ3OTc3Njg4', null);
INSERT INTO `videos` VALUES ('65', '65', '【郝斌C语言】- 65 循环的定义', 'http://player.youku.com/embed/XNjQ3OTc3Nzg4', null);
INSERT INTO `videos` VALUES ('66', '66', '【郝斌C语言】- 66 循环的分类', 'http://player.youku.com/embed/XNjQ3OTc3ODky', null);
INSERT INTO `videos` VALUES ('67', '67', '【郝斌C语言】- 67 for循环之 1：为什么需要for循环', 'http://player.youku.com/embed/XNjQ3OTc5Nzk2', null);
INSERT INTO `videos` VALUES ('68', '68', '【郝斌C语言】- 68 for循环之 2：for循环最简单的用法', 'http://player.youku.com/embed/XNjQ3OTgwMDY4', null);
INSERT INTO `videos` VALUES ('69', '69', '【郝斌C语言】- 69 for循环之 3：for和if的嵌套使用', 'http://player.youku.com/embed/XNjQ3OTgxMDY0', null);
INSERT INTO `videos` VALUES ('70', '70', '【郝斌C语言】- 70 复习上节课知识', 'http://player.youku.com/embed/XNjQ3OTgxNzI4', null);

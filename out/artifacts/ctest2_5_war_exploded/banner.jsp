<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 此页面为所有页面顶部的CHelp字样和搜索框，加上导航菜单栏，此文件定义了许多统一规范的css样式
	 其他页面的body标签下必须先include file此文件，即banner.jsp
	 其他文件的各标签样式都遵循此文件的设置 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Title</title>
<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-color: #42413C;
	margin: 0;
	padding: 0;
	color: #000;
}

/* ~~ 元素/标签选择器 ~~ */
ul, ol, dl { /* 由于浏览器之间的差异，最佳做法是在列表中将填充和边距都设置为零。为了保持一致，您可以在此处指定需要的数值，也可以在列表所包含的列表项（LI、DT 和 DD）中指定需要的数值。请注意，除非编写一个更为具体的选择器，否则您在此处进行的设置将会层叠到 .nav 列表。 */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* 删除上边距可以解决边距会超出其包含的 div 的问题。剩余的下边距可以使 div 与后面的任何元素保持一定距离。 */
	padding-right: 15px;
	padding-left: 15px; /* 向 div 内的元素侧边（而不是 div 自身）添加填充可避免使用任何方框模型数学。此外，也可将具有侧边填充的嵌套 div 用作替代方法。 */
}
a img { /* 此选择器将删除某些浏览器中显示在图像周围的默认蓝色边框（当该图像包含在链接中时） */
	border: none;
}
/* ~~ 站点链接的样式必须保持此顺序，包括用于创建悬停效果的选择器组在内。 ~~ */
a:link {
	color: #42413C;
	text-decoration: underline; /* 除非将链接设置成极为独特的外观样式，否则最好提供下划线，以便可从视觉上快速识别 */
}
a:visited {
	color: #6E6C64;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* 此组选择器将为键盘导航者提供与鼠标使用者相同的悬停体验。 */
	text-decoration: none;
}

/* ~~ 此固定宽度容器包含所有其它元素 ~~ */
.container {
	width: 960px;
	background-color: #FFF;
	margin: 0 auto; /* 侧边的自动值与宽度结合使用，可以将布局居中对齐 */
}

/* ~~ 标题未指定宽度。它将扩展到布局的完整宽度。标题包含一个图像占位符，该占位符应替换为您自己的链接徽标 ~~ */
.header {
	background-color: #B0C4DE;
}

.menu {
	background-color: #EEE;
}

/* ~~ 这是布局信息。 ~~ 

1) 填充只会放置于 div 的顶部和/或底部。此 div 中的元素侧边会有填充。这样，您可以避免使用任何“方框模型数学”。请注意，如果向 div 自身添加任何侧边填充或边框，这些侧边填充或边框将与您定义的宽度相加，得出 *总计* 宽度。您也可以选择删除 div 中的元素的填充，并在该元素中另外放置一个没有任何宽度但具有设计所需填充的 div。

*/
.content {

	padding: 10px 0;
}

-->
</style>
<link href="/css/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="/css/SpryMenuBar.js" type="text/javascript"></script>

</head>
<body>

  <div class="header">
  
    <table border="0" width="960" align="center">
      <tr>
        <td>
          <a href="index.jsp"><img src="/images/chelp.png" alt="insert logo" name="Insert_logo" width="400" height="100" id="Insert_logo" style="background-color: #B0C4DE; display:block;" /></a>
        </td>
        <td>
          <form name="searchForm" method="post" action="search_results.jsp">
			<label for="textfield"></label>
        	<input type="text" name="keyWord" id="textfield" />
        	<input type="submit" name="button" id="button" value="搜索" />
          </form>
        </td>
      </tr>
    </table>
    
  <!-- end .header --></div>
  
      <div class="menu">
	      <table width="960" border="0" align="center">
	        <tr>
	          <td><ul id="MenuBar1" class="MenuBarHorizontal">
	            <li><a href="index.jsp">首页</a>              </li>
	            <li><a href="#" class="MenuBarItemSubmenu">登录</a>
	              <ul>
	                <li><a href="user_login.jsp">学生登录</a></li>
	                <li><a href="register.jsp">注册新用户</a></li>
	                <li><a href="login.jsp">管理员登录</a></li>
	              </ul>
	            </li>
	            <li><a class="MenuBarItemSubmenu" href="#">在线学习</a>
	              <ul>
	                <li><a href="materials.jsp?file_name=c-tutorial">学习资料</a></li>
	                <li><a href="chapters.jsp">章节试题</a></li>
	                <li><a href="simulation.jsp">模拟试题</a></li>
	                <li><a href="olds.jsp">历年真题</a></li>
	              </ul>
	            </li>
	            <li><a href="#">模考训练</a></li>
	            <li><a href="videos.jsp?page=1">视频解析</a></li>
	            <li><a href="#">预测试题</a></li>
	          </ul></td>
	          <td>
	          
	          <%String username = (String)session.getAttribute("username"); 
				if (username == null || "".equals(username)) {
					out.print("<a href=\"user_login.jsp\">尚未登录</a>");
				} else {
					out.print("用户：" + username + "&nbsp;&nbsp;");
					out.print("<a href=\"personal.jsp\">[个人中心]</a>");
				}
			  %>
	          
	          </td>
	        </tr>
	      </table>
      </div>
      <div class="search"></div>

 <script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"/css/SpryMenuBarDownHover.gif", imgRight:"/css/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>
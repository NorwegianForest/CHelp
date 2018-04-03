<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.taglib.PapersTable" %>
<%@ page import="com.taglib.MaterialsTable" %>
<%@ page import="com.taglib.VideosTable" %>
<%@ page import="com.DBQuery.DataProcess" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 搜索结果页面，只能根据标题搜索，搜索结果也是标题，不能根据内容 -->
<html>
<head>
<title>搜索结果 | C Help</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%--需要转码，由于获取参数时有字符编码问题--%>
<%	String keyWord = DataProcess.transformToUTF8(request.getParameter("keyWord"));%>

	<div class="container">
	  	<div class="content">
			<h1>查找'<%=keyWord %>'的结果：</h1>
			<table>
				<tr><td>
					<h2>章节练习</h2>
                    <%--插入章节试题的所有搜索结果链接列表--%>
					<%= new PapersTable(PapersTable.CHAPTER, PapersTable.PAPER, keyWord).getHtmlCode() %>
					<br><br>
				</td></tr>
				<tr><td>
					<h2>模拟练习</h2>
					<%--插入模拟试题的所有搜索结果链接列表--%>
                    <%= new PapersTable(PapersTable.SIMULATION, PapersTable.PAPER, keyWord).getHtmlCode() %>
					<br><br>
				</td></tr>
				<tr><td>
					<h2>真题</h2>
					<%--插入真题的所有搜索结果链接列表--%>
                    <%= new PapersTable(PapersTable.OLD, PapersTable.PAPER, keyWord).getHtmlCode() %>
					<br><br>
				</td></tr>
				<tr><td>
					<h2>学习资源</h2>
					<%--插入学习资源的所有搜索结果链接列表--%>
                    <%= new MaterialsTable(keyWord).getHtmlCode() %>
					<br><br>
				</td></tr>
				<tr><td>
					<h2>视频资源</h2>
					<%--插入视频资源的所有搜索结果链接列表--%>
                    <%= new VideosTable(keyWord).getHtmlCode() %>
					<br><br>
				</td></tr>
			</table>
	  
      	<!-- end .content --></div>
    <!-- end .container --></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/WEB INF/mytag.tld" prefix="control"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>搜索结果 | C Help</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>

<%
	String keyWord = request.getParameter("keyWord");
	String transKeyWord = new String(keyWord.getBytes("ISO-8859-1"),"utf-8");
%>

<%@ include file = "banner.jsp" %>
	<div class="container">
	  	<div class="content">
			<h1>查找'<%=transKeyWord %>'的结果：</h1>
			<table>
				<tr><td>
					<h2>章节练习</h2>
					<control:papers paper_type="chapter" view_type="paper" count="5" key_word="<%=transKeyWord %>" /><br><br>
				</td></tr>
				<tr><td>
					<h2>模拟练习</h2>
					<control:papers paper_type="simulation" view_type="paper" count="5" key_word="<%=transKeyWord %>" /><br><br>
				</td></tr>
				<tr><td>
					<h2>真题</h2>
					<control:papers paper_type="old" view_type="paper" count="5" key_word="<%=transKeyWord %>" /><br><br>
				</td></tr>
				<tr><td>
					<h2>学习资源</h2>
					<control:materials count="5" key_word="<%=transKeyWord %>" /><br><br>
				</td></tr>
				<tr><td>
					<h2>视频资源</h2>
					<control:videos page="1" key_word="<%=transKeyWord %>" /><br><br>
				</td></tr>
			</table>
	  
      	<!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
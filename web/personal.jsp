<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/WEB INF/mytag.tld" prefix="control"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 个人中心页面，用以查看用户收藏题目和错题 -->
<html>
<head>
<title>个人中心 | C Help</title>
</head>

<body>
<%@ include file = "banner.jsp" %>
<div class="container">
	<div class="content">

		<%
			if (username == null || "".equals(username) || "null".equals(username)) {
				out.print("<SCRIPT language=javascript>alert('请先登录...');location.href='user_login.jsp';</SCRIPT>");
			}
		%>

		<div align=center>
			<h1>个人中心</h1>
			<br><br><br>
			<a href="personal_paper.jsp?type=collection">我的收藏</a>
			<a href="personal_paper.jsp?type=mistakes">我的错题</a>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
	<!-- end .content --></div>
<!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
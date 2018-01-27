<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.DBQuery.DataProcess, com.business.AdminUser"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 响应管理员的删除试题操作，操作完成后返回edit_paper.jsp页面 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<body>

<%--管理员登录检测--%>
<%=new AdminUser(session.getAttribute("adminname")).checkLogin() %>

<%
	String sql = "delete from exercises where exercise_id='" + request.getParameter("exercise_id") + "'";
	DataProcess.updateDatabase(sql);
%>

<SCRIPT language=javascript>
	var paper_title = '<%=request.getParameter("paper_title") %>';
	alert("该题目已删除!");
	location.href='edit_paper.jsp?paper_title=' + paper_title;
</SCRIPT>

</body>
</html>
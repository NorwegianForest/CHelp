<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 响应管理员的删除试题操作，操作完成后返回edit_paper.jsp页面 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<body>

<%
if (session.getAttribute("adminname") == null || "".equals(session.getAttribute("adminname"))) {
	response.sendRedirect("login.jsp");
}
%>

<%
	String exercise_id = (String)request.getParameter("exercise_id"); 
	String sql = "delete from exercises where exercise_id='" + exercise_id + "'";
	Connection con = DataProcess.getConnection();
	Statement state = con.createStatement();
	state.executeUpdate(sql);
	state.close();
	con.close();

	String paper_title = (String)session.getAttribute("paper_title");
	String transPaper_title = java.net.URLEncoder.encode(paper_title, "UTF-8");
%>

<SCRIPT language=javascript>
	var transPaper_title = '<%=transPaper_title %>';
	alert("该题目已删除!");
	location.href='edit_paper.jsp?paper_title=' + transPaper_title;
</SCRIPT>

</body>
</html>
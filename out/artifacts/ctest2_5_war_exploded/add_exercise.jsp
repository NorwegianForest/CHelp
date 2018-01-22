<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加试题 | C Help</title>
</head>

<body>
<%
if (session.getAttribute("adminname") == null || "".equals(session.getAttribute("adminname"))) {
	response.sendRedirect("login.jsp");
}
%>

<%
	String paper_title = request.getParameter("paper_title"); 
	if (!DataProcess.paperTitleExist(paper_title, "papers")) {
		paper_title = new String(request.getParameter("paper_title").getBytes("ISO-8859-1"),"utf-8");
	}
	
	String sql = "insert into exercises(exercise_title, a_option, b_option, c_option, d_option, answer, paper_title, difficulty, analysis)"
					+ "values('请输入题目','请输入A选项','请输入B选项','请输入C选项','请输入D选项','1','" + paper_title + "','1','无解析')";
	Connection con = DataProcess.getConnection();
	Statement state;
	state = con.createStatement();
	state.executeUpdate(sql);
	state.close();
	con.close();
	
	String transPaper_title = java.net.URLEncoder.encode(paper_title, "UTF-8");
	response.sendRedirect("edit_paper.jsp?paper_title=" + transPaper_title);
%>

</body>
</html>
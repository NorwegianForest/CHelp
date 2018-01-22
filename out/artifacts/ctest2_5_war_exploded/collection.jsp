<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
<%@ taglib uri="/WEB INF/mytag.tld" prefix="control"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>个人中心 | C Help</title>
</head>

<body>
<%@ include file = "banner.jsp" %>
	<div class="container">
	  <div class="content">
	  
<%if (username == null || "".equals(username) || "null".equals(username)) {
	out.print("<SCRIPT language=javascript>alert('请先登录...');location.href='/user_login.jsp';</SCRIPT>");
} else {
	String exercise_id = request.getParameter("exercise_id");
	String sql = "insert into collection(exercise_id,username)values('" + exercise_id + "','" + username + "')";
	Connection con = DataProcess.getConnection();
	Statement state = con.createStatement();
	state.executeUpdate(sql);
	state.close();
	con.close();
	
	String sql1 = "delete from collection where(exercise_id,username) in (select exercise_id,username from(select exercise_id,username from collection group by exercise_id,username having count(*)>1) s1) and id not in(select id from (select id from collection group by exercise_id,username having count(*)>1) s2)";
	Connection con1 = DataProcess.getConnection();
	Statement state1 = con1.createStatement();
	state1.executeUpdate(sql1);
	state1.close();
	con1.close();

	response.sendRedirect("personal_paper.jsp?type=collection"); 
}%>

      <!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	
</body>
</html>
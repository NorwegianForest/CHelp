<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.DBQuery.DataProcess, com.business.AdminUser"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 管理员添加试题页面，当管理员在编辑套题页面edit_paper.jsp点击添加试题时，转跳到此页面，数据库中先添加一条记录，所有字段为默认值，
	 然后返回到edit_paper.jsp页面，此时就会多了一道各参数都是默认值的试题，管理员再行修改即可 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加试题 | C Help</title>
</head>

<body>
<%--管理员登录检测--%>
<%=new AdminUser(session.getAttribute("adminname")).checkLogin() %>

<%	String paper_title = request.getParameter("paper_title");
	DataProcess.addExercise(paper_title);

	// 必须转码，否则不能跳转，不知道为什么
	response.sendRedirect("edit_paper.jsp?paper_title=" + java.net.URLEncoder.encode(paper_title, "UTF-8"));
%>

</body>
</html>
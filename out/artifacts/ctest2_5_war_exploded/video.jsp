<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>解析视频 | C Help</title>
</head>

<body>
<%@ include file = "banner.jsp" %>
	<div class="container">
		<div class="content">
			<%
				String sql = "select * from videos where youku_path='" + request.getParameter("path") + "'";
				Connection con = DataProcess.getConnection();
				Statement state = con.createStatement();
				ResultSet rs = state.executeQuery(sql);
				rs.next();
				String video_title = rs.getString("video_title");

			%>
			<div align="center">
				<h1>视频资源：<%=video_title %></h1>
				<iframe height=498 width=710 src='<%=request.getParameter("path") %>' frameborder=0 ></iframe>
			</div>
        <!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	
</body>
</html>
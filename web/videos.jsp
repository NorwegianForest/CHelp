<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
<%@ taglib uri="/WEB INF/mytag.tld" prefix="control"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 视频列表页面 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>视频列表 | C Help</title>
</head>

<body>
<%@ include file = "banner.jsp" %>
	<div class="container">
		<div class="content">
			<h1>视频列表</h1>

			<!-- 一页显示20个视频，其余采用翻页查看的形式 -->
			<%
				String sql = "select count(*) from videos";
				Connection con = DataProcess.getConnection();
				Statement state = con.createStatement();
				ResultSet rs = state.executeQuery(sql);
				rs.next();
				int count = Integer.parseInt(rs.getString("count(*)"));
				int numberOfPages = count / 20;
				if (count % 20 != 0) {
				    numberOfPages ++;
				}
				rs.close();
				state.close();
				con.close();
				int thisPage = Integer.parseInt(request.getParameter("page"));
			%>

			<!-- 采用自定义标签control中的videos标签，详见/WEB INF/mytag.tld和/com/taglib中的相关内容 -->
			<control:videos page="<%=thisPage %>"/>

			<div align=center>
				<%
					if (thisPage == 1) {
				%>
				[上一页]
				<%
					} else {
				%>
				<a href="videos.jsp?page=<%=(thisPage-1) %>" >[上一页]</a>
				<%
					}
				%>

				<%if ((thisPage - 3) > 0) {%>  <a href="videos.jsp?page=<%=(thisPage-3) %>" >[<%=(thisPage-3) %>]</a>   <%} %>
				<%if ((thisPage - 2) > 0) {%>  <a href="videos.jsp?page=<%=(thisPage-2) %>" >[<%=(thisPage-2) %>]</a>   <%} %>
				<%if ((thisPage - 1) > 0) {%>  <a href="videos.jsp?page=<%=(thisPage-1) %>" >[<%=(thisPage-1) %>]</a>   <%} %>
				<a>[<%=thisPage %>]</a>
				<%if (thisPage < numberOfPages) {%>  <a href="videos.jsp?page=<%=(thisPage+1) %>" >[<%=(thisPage+1) %>]</a>   <%} %>
				<%if ((thisPage+1) < numberOfPages) {%>  <a href="videos.jsp?page=<%=(thisPage+2) %>" >[<%=(thisPage+2) %>]</a>   <%} %>
				<%if ((thisPage+2) < numberOfPages) {%>  <a href="videos.jsp?page=<%=(thisPage+3) %>" >[<%=(thisPage+3) %>]</a>   <%} %>

				<%if (thisPage == numberOfPages) {%>
				[下一页]
				<%} else {%><a href="videos.jsp?page=<%=(thisPage+1) %>" >[下一页]</a>
				<%} %>
			</div>
	  
		<!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
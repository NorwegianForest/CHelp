<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.taglib.VideosTable"  %>
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
				int thisPage = Integer.parseInt(request.getParameter("page"));
				VideosTable videosTable = new VideosTable(thisPage);
				int numOfPages = videosTable.getNumOfPages();
			%>

            <%--插入视频列表--%>
			<%= videosTable.getHtmlCode() %>

			<div align=center>
				<% if (thisPage == 1) {	%>
				[上一页]
				<% } else { %>
				<a href="videos.jsp?page=<%=(thisPage-1) %>" >[上一页]</a>
				<% } %>

				<%if ((thisPage - 3) > 0) {%>  <a href="videos.jsp?page=<%=(thisPage-3) %>" >[<%=(thisPage-3) %>]</a>   <%} %>
				<%if ((thisPage - 2) > 0) {%>  <a href="videos.jsp?page=<%=(thisPage-2) %>" >[<%=(thisPage-2) %>]</a>   <%} %>
				<%if ((thisPage - 1) > 0) {%>  <a href="videos.jsp?page=<%=(thisPage-1) %>" >[<%=(thisPage-1) %>]</a>   <%} %>
				<a>[<%=thisPage %>]</a>
				<%if (thisPage < numOfPages) {%>  <a href="videos.jsp?page=<%=(thisPage+1) %>" >[<%=(thisPage+1) %>]</a>   <%} %>
				<%if ((thisPage+1) < numOfPages) {%>  <a href="videos.jsp?page=<%=(thisPage+2) %>" >[<%=(thisPage+2) %>]</a>   <%} %>
				<%if ((thisPage+2) < numOfPages) {%>  <a href="videos.jsp?page=<%=(thisPage+3) %>" >[<%=(thisPage+3) %>]</a>   <%} %>

				<%if (thisPage == numOfPages) {%>
				[下一页]
				<%} else {%><a href="videos.jsp?page=<%=(thisPage+1) %>" >[下一页]</a>
				<%} %>
			</div>
	  
		<!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
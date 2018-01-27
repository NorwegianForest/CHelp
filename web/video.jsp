<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.DBQuery.DataProcess, com.business.Video"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- 观看视频页面 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>解析视频 | C Help</title>
</head>

<body>
<%@ include file = "banner.jsp" %>
	<div class="container">
		<div class="content">
			<%
				String path = DataProcess.query(Video.TABLENAME, Video.ORDERNUMBER, request.getParameter("number"), Video.YOUKUPATH);
				String title = DataProcess.query(Video.TABLENAME, Video.ORDERNUMBER, request.getParameter("number"), Video.VIDEOTITLE);
			%>
			<div align="center">
				<h1>视频资源：<%=title %></h1>
				<iframe height=498 width=710 src='<%=path %>' frameborder=0 ></iframe>
			</div>
        <!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	
</body>
</html>
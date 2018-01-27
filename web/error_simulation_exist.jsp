<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 检查管理员添加的试题标题是否以存在，由CreatePaperServlet和CreateSimulationServlet转跳至此 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>该标题已存在 | C Help</title>
</head>
<body>
<%@ include file = "banner.jsp" %>
	<div class="container">
	  	<div class="content">
	  
	  	<h2>该标题已存在</h2>
	  	<a href="success.jsp">确定</a>
	  
      <!-- end .content --></div>
    <!-- end .container --></div>
      
<%@ include file = "footer.jsp" %>
</body>
</html>
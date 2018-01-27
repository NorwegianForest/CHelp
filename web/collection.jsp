<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.business.OrdinUser" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 响应收藏操作，由paper.jsp转跳至此 -->
<html>
<head>
<title>个人中心 | C Help</title>
</head>

<body>
<%@ include file = "banner.jsp" %>
	<div class="container">
	  <div class="content">
		<%--登录检测--%>
		<%=new OrdinUser(username).checkLogin() %>
		<%
            // 根据用户名和试题id收藏试题
			new OrdinUser(username).collection(request.getParameter("exercise_id"));
			response.sendRedirect("personal_paper.jsp?type=collection");
		%>

      <!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	
</body>
</html>
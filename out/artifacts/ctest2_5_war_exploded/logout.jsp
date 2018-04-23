<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/8
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>C | Help</title>
</head>
<body>
<%session.removeAttribute("username");%>
<%session.removeAttribute("admin");%>
<%response.sendRedirect("index.jsp");%>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/11
  Time: 14:03
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>管理中心 | C Help</title>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
  <jsp:include page="mdl_personal_head.jsp"/>
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
  <%String admin = (String)session.getAttribute("admin");%>
  <jsp:include page="mdl_manage_drawer.jsp">
    <jsp:param name="admin" value="<%=admin%>"/>
    <jsp:param name="title" value="chapter"/>
  </jsp:include>
  <main class="mdl-layout__content">
  </main>
</div>
</body>
</html>

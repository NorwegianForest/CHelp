<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/19
  Time: 17:50
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>个人中心 | C Help</title>
  <jsp:include page="mdl_personal_head.jsp"/>
</head>
<body>
  <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
    <%String username = (String)session.getAttribute("username");%>
    <jsp:include page="mdl_personal_drawer.jsp">
      <jsp:param name="username" value="<%=username%>"/>
      <jsp:param name="title" value="Home"/>
    </jsp:include>
    <main class="mdl-layout__content">
    </main>
  </div>
</body>
</html>

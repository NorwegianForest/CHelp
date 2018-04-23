<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/23
  Time: 18:12
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>联系我们 | C Help</title>
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
  <style type="text/css">@import url(css/contact_us.css);</style>
</head>
<body>
<div class="mdl-layout mdl-js-layout">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_header.jsp">
    <jsp:param name="tab" value="1"/>
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <div class="center">
      <div class="email">邮箱：1005719242@qq.com</div>
      <div class="others">小组开发，经验不佳</div>
      <div class="others">欢迎提bug，提意见</div>
      <div class="otherwise">当然，改不改就是另一回事了（逃）</div>
    </div>
    <jsp:include page="mdl_footer.jsp"/>
  </main>
</div>
</body>
</html>

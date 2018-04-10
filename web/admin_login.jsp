<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/8
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>管理员登录 | C Help</title>
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <style>@import url(css/login.css);</style>
  <script src="js/login.js"></script>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
</head>
<body>
<div class="mdl-layout mdl-js-layout">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_header.jsp">
    <jsp:param name="tab" value="1"/>
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <div id="content-div">
      <div id="center-div">
        <div id="login-div">
          <form id="login-form" name="login" method="post" action="${pageContext.request.contextPath}/UserLoginServlet">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
              <input class="mdl-textfield__input" type="text" id="username" name="username">
              <label class="mdl-textfield__label" for="username">用户名</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
              <input class="mdl-textfield__input" type="password" id="password" name="password">
              <label class="mdl-textfield__label" for="password">密码</label>
            </div>
          </form>
          <div id="button-div">
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onclick="checkLogin()">
              登录
            </button>
            <a href="register.jsp">
              <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                注册
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="mdl_footer.jsp"/>
  </main>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/8
  Time: 19:25
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>个人中心 | C Help</title>
  <jsp:include page="mdl_personal_head.jsp"/>
  <style type="text/css">@import url(css/register_teacher.css);</style>
  <script src="js/register_teacher.js"></script>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_personal_drawer.jsp">
    <jsp:param name="username" value="<%=username%>"/>
    <jsp:param name="title" value="register"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <div class="center">
      <form method="post" action="/register_teacher">
        <input type="hidden" name="username" value="<%=username%>">
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input class="mdl-textfield__input" type="text" id="name" name="name">
          <label class="mdl-textfield__label" for="name">姓名...</label>
        </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input class="mdl-textfield__input" type="text" id="university" name="university">
          <label class="mdl-textfield__label" for="university">任职高校...</label>
        </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input class="mdl-textfield__input" type="text" id="title" name="title">
          <label class="mdl-textfield__label" for="title">职称...</label>
        </div>
        <div class="mdl-textfield mdl-js-textfield">
          <textarea class="mdl-textfield__input" type="text" rows= "6" id="introduce" name="introduce"></textarea>
          <label class="mdl-textfield__label" for="introduce">个人简介...</label>
        </div>
        <div class="button">
          <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
                  onclick="return check();">
            注册
          </button>
        </div>
      </form>
    </div>
  </main>
</div>
</body>
</html>

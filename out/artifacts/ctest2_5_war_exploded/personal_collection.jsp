<%@ page import="com.business.OrdinUser" %>
<%@ page import="com.business.Exercise" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/21
  Time: 14:45
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>个人中心 | C Help</title>
  <style type="text/css">@import url(css/paper.css);@import url(css/personal.css);</style>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="images/android-desktop.png">

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Material Design Lite">
  <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
  <meta name="msapplication-TileColor" content="#3372DF">

  <link rel="shortcut icon" href="images/favicon.png">

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
  <header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
    <div class="mdl-layout__header-row">
      <span class="mdl-layout-title">收藏</span>
      <div class="mdl-layout-spacer"></div>
      <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
        <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
          <i class="material-icons">search</i>
        </label>
        <div class="mdl-textfield__expandable-holder">
          <input class="mdl-textfield__input" type="text" id="search">
          <label class="mdl-textfield__label" for="search">Enter your query...</label>
        </div>
      </div>
      <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
        <i class="material-icons">more_vert</i>
      </button>
      <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
        <a href="teacher_personal.jsp" style="text-decoration: none;">
          <li class="mdl-menu__item">进入教师中心</li>
        </a>
      </ul>
    </div>
  </header>
  <div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
    <header class="demo-drawer-header">
      <img src="images/user.jpg" class="demo-avatar">
      <div class="demo-avatar-dropdown">
        <%String username = (String)session.getAttribute("username");%>
        <span><%=username%></span>
        <div class="mdl-layout-spacer"></div>
        <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
          <i class="material-icons" role="presentation">arrow_drop_down</i>
          <span class="visuallyhidden">Accounts</span>
        </button>
        <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
          <li class="mdl-menu__item"><i class="material-icons">add</i>Add another account...</li>
        </ul>
      </div>
    </header>
    <nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
      <a class="mdl-navigation__link" href="index.jsp">
        <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>主页
      </a>
      <a class="mdl-navigation__link" href="personal_collection.jsp">
        <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">star</i>收藏
      </a>
      <a class="mdl-navigation__link" href="personal_mistake.jsp">
        <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">highlight_off</i>错题
      </a>
      <a class="mdl-navigation__link" href="personal_course.jsp">
        <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">library_books</i>参与课程
      </a>
      <div class="mdl-layout-spacer"></div>
      <a class="mdl-navigation__link" href="">
        <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i>
        <span class="visuallyhidden">Help</span>
      </a>
    </nav>
  </div>
  <main class="mdl-layout__content">
    <div class="center">
      <%OrdinUser ordinUser = new OrdinUser(username, "collection");
        int orderNumber = 1;
        for (Exercise exercise : ordinUser.getExerciseList()) {%>
      <div class="single" style="border: 1px solid #CCCCCC">
        <div class="title"><span class="order-number"><%=orderNumber%>&nbsp;[单选题]</span><%=exercise.getTitle()%></div>
        <div class="option-div">
          <div class="option">
            <span class="mdl-radio__label">A.&nbsp;<%=exercise.getaOption()%></span>
          </div>
          <div class="option">
            <span class="mdl-radio__label">B.&nbsp;<%=exercise.getbOption()%></span>
          </div>
          <div class="option">
            <span class="mdl-radio__label">C.&nbsp;<%=exercise.getcOption()%></span>
          </div>
          <div class="option">
            <span class="mdl-radio__label">D.&nbsp;<%=exercise.getdOption()%></span>
          </div>
          <div class="collection">
            <div>
              <label class="mdl-icon-toggle mdl-js-icon-toggle mdl-js-ripple-effect" for="icon-<%=orderNumber%>">
                <input type="checkbox" id="icon-<%=orderNumber++%>" class="mdl-icon-toggle__input" checked>
                <i class="mdl-icon-toggle__label material-icons">star</i>
              </label>
            </div>
            <div class="collection-text">取消收藏</div>
          </div>
        </div>
        <div class="answer">参考答案:&nbsp;<span class="answer-text"><%=exercise.getAnswer()%></span></div>
        <div class="analysis">
          <div class="analysis-inside">试题难度:&nbsp;<%=exercise.getDifficulty()%></div>
          <div class="analysis-inside">参考解析:&nbsp;<%=exercise.getAnalysis()%></div>
        </div>
      </div>
      <%}%>
    </div>
  </main>
</div>
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</body>
</html>

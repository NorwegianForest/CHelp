<%@ page import="com.business.TeacherUser" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/2
  Time: 15:59
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
  <div class="mdl-layout__header-row">
    <span class="mdl-layout-title">教师中心</span>
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
      <a href="personal.jsp" style="text-decoration: none;">
        <li class="mdl-menu__item">退出教师中心</li>
      </a>
      <a href="logout.jsp" style="text-decoration: none;">
        <li class="mdl-menu__item">退出登录</li>
      </a>
    </ul>
  </div>
</header>
<div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
  <header class="demo-drawer-header">
    <img src="images/logo112.png" class="demo-avatar">
    <div class="demo-avatar-dropdown">
      <%String username = request.getParameter("username");%>
      <%=new TeacherUser(username).checkTeacher()%>
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
    <a class="mdl-navigation__link" href="teacher_personal.jsp">
      <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">person</i>教师中心
    </a>
    <a class="mdl-navigation__link" href="create_course.jsp">
      <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">insert_drive_file</i>创建课程
    </a>
    <div class="mdl-layout-spacer"></div>
    <a class="mdl-navigation__link" href="">
      <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i>
      <span class="visuallyhidden">Help</span>
    </a>
  </nav>
</div>

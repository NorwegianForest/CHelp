<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/2
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<meta charset="utf-8">
<header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
  <div class="mdl-layout__header-row">
    <%String title = request.getParameter("title");
      switch (title) {
        case "collection": title = "收藏试题";break;
        case "mistake": title = "错题";break;
        case "course": title = "参与课程";break;
        case "register": title = "注册教师用户";break;
        case "test": title = "历史试卷";break;
        default:break;
      }%>
    <span class="mdl-layout-title"><%=title%></span>
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
      <span><%=request.getParameter("username")%></span>
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
    <a class="mdl-navigation__link" href="personal_test.jsp">
      <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">date_range</i>历史试卷
    </a>
    <a class="mdl-navigation__link" href="personal_collection.jsp">
      <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">star</i>收藏试题
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

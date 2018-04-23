<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/17
  Time: 13:50
  MDL风格的header
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String tab = request.getParameter("tab");
    String title = "C Help";
    String color = "#2E323E";
    String deColor = "#FF4081";
    switch (tab) {
        case "2":
            color = "#C2185B";
            deColor = "#18FFFF";
            title = "C语言学习资源";
            break;
        case "3":
            color = "#1A237E";
            title = "模拟试题";
            break;
        case "4":
            color = "#8E24AA";
            title = "课程列表";
            break;
        case "5":
            color = "#3E82F7";
            title = "视频解析";
            break;
        case "6":
            title = "推荐视频";
            break;
        default:
            break;
    }
%>
<style>
    @media screen and (max-width: 1050px) {
        .mdl-layout__header {
            display: block;
        }
    }
    .mdl-layout__tab-bar-button {
        background-color: <%=color%>;
    }
    .mdl-layout__tab:hover {
        color: #FFF;
    }
    #header {
        background-color: <%=color%>;
    }
    .mdl-layout__tab:hover {
        color: #FFF;
    }
    #tab-bar {
        background-color: <%=color%>;
    }
    .mdl-layout__tab-bar-button {
        background-color: <%=color%>;
    }
    .mdl-list__item:hover {
        cursor: pointer;
    }
    .mdl-layout.is-upgraded .mdl-layout__tab.is-active::after {
        background: <%=deColor%>;
    }
    .mdl-textfield--expandable {
        height: 67px;
    }
    .mdl-layout__drawer-button {
        height: 24px;
        margin: 20px 12px;
    }
</style>
<header class="mdl-layout__header mdl-layout__header--scroll" id="header">
    <div class="mdl-layout__header-row">
        <!-- Title -->
        <span class="mdl-layout-title"><%=title%></span>
        <div class="mdl-layout-spacer"></div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="waterfall-exp">
                <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
                <input class="mdl-textfield__input" type="text" name="sample" id="waterfall-exp">
            </div>
        </div>
        <%  String username = request.getParameter("username");
            String personalUrl;
            if (username == null || "".equals(username) || "null".equals(username)) { personalUrl = "login.jsp";%>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="login.jsp" id="login">登录&nbsp;·&nbsp;注册</a>
        </nav>
        <%  } else { personalUrl = "personal.jsp";%>
        <ul class="demo-list-icon mdl-list">
            <li class="mdl-list__item">
                <a href="personal.jsp" style="text-decoration: none;">
                    <span class="mdl-list__item-primary-content" style="color: #FFF;">
                        <i class="material-icons mdl-list__item-icon" style="color: #FFF; margin-right: 12px;">person</i>
                        <%=username%>
                    </span>
                </a>
            </li>
        </ul>
        <%  }%>
    </div>
    <!-- Tabs -->
    <div class="mdl-layout__tab-bar mdl-js-ripple-effect" id="tab-bar">
        <a href="index.jsp" class="mdl-layout__tab<%="1".equals(tab)?" is-active":""%>">首页</a>
        <a href="materials.jsp?file_name=c-tutorial" class="mdl-layout__tab<%="2".equals(tab)?" is-active":""%>">在线学习</a>
        <a href="papers.jsp" class="mdl-layout__tab<%="3".equals(tab)?" is-active":""%>">模考训练</a>
        <a href="courses.jsp" class="mdl-layout__tab<%="4".equals(tab)?" is-active":""%>">课程列表</a>
        <a href="videos.jsp?page=1" class="mdl-layout__tab<%="5".equals(tab)?" is-active":""%>">视频解析</a>
        <a href="recommend.jsp" class="mdl-layout__tab<%="6".equals(tab)?" is-active":""%>">推荐试题</a>
    </div>
</header>
<div class="mdl-layout__drawer">
    <span class="mdl-layout-title">C Help</span>
    <nav class="mdl-navigation">
        <a class="mdl-navigation__link" href="index.jsp">首页</a>
        <a class="mdl-navigation__link" href="<%=personalUrl%>">个人中心</a>
        <a class="mdl-navigation__link" href="materials.jsp?file_name=c-tutorial">在线学习</a>
        <a class="mdl-navigation__link" href="papers.jsp">模考训练</a>
        <a class="mdl-navigation__link" href="courses.jsp">课程列表</a>
        <a class="mdl-navigation__link" href="videos.jsp?page=1">视频解析</a>
        <a class="mdl-navigation__link" href="recommend.jsp">推荐试题</a>
    </nav>
</div>

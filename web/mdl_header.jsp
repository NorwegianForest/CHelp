<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/17
  Time: 13:50
  MDL风格的header
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>header</title>
    <style>
        @media screen and (max-width: 1050px) {
            .mdl-layout__header {
                display: block;
            }
        }
        .mdl-layout__tab-bar-button {
            background-color: #2E323E;
        }
        .mdl-layout__tab:hover {
            color: #FFF;
        }
    </style>
</head>
<body>

<header class="mdl-layout__header mdl-layout__header--scroll" style="background-color: #2E323E;">
    <div class="mdl-layout__header-row">
        <!-- Title -->
        <span class="mdl-layout-title">C Help</span>
        <div class="mdl-layout-spacer"></div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="waterfall-exp">
                <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
                <form name="searchForm" method="post" action="search_results.jsp" style="margin-bottom: 0;">
                    <input class="mdl-textfield__input" type="text" name="keyWord" id="waterfall-exp">
                </form>
            </div>
        </div>
        <%  String username = (String)session.getAttribute("username");
            if (username == null || "".equals(username)) { %>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="login.jsp">登录·注册</a>
        </nav>
        <%  } else { %>
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
        <!-- Add spacer, to align navigation to the right -->
        <!-- Navigation -->
    </div>
    <!-- Tabs -->
    <div class="mdl-layout__tab-bar mdl-js-ripple-effect  " style="background-color: #2E323E;">
        <a href="index.jsp" class="mdl-layout__tab">首页</a>
        <a href="materials.jsp?file_name=c-tutorial" class="mdl-layout__tab">在线学习</a>
        <a href="" class="mdl-layout__tab">模考训练</a>
        <a href="videos.jsp?page=1" class="mdl-layout__tab">视频解析</a>
        <a href="" class="mdl-layout__tab">预测试题</a>
    </div>
</header>

</body>
</html>

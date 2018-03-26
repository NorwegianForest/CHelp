<%@ page import="com.business.Material" %>
<%@ page import="com.taglib.MaterialsTable" %>
<%@ page import="com.business.PreNexPage" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/13
  Time: 21:14
  测试MDL显示学习资源
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Material Design Lite -->
    <link rel="stylesheet" href="mdl/material.min.css">
    <script src="mdl/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style type="text/css">
        @import url(css/material.css);
    </style>
    <title>C语言学习资源</title>

</head>
<body>
<!-- Uses a header that scrolls with the text, rather than staying locked at the top -->
<div class="mdl-layout mdl-js-layout">
    <header class="mdl-layout__header mdl-layout__header--scroll" id="header">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">C语言学习资源</span>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right">
                <label class="mdl-button mdl-js-button mdl-button--icon" for="waterfall-exp">
                    <i class="material-icons">search</i>
                </label>
                <div class="mdl-textfield__expandable-holder">
                    <input class="mdl-textfield__input" type="text" name="sample" id="waterfall-exp">
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

        <style>
            .mdl-layout.is-upgraded .mdl-layout__tab.is-active::after {
                background: #18FFFF;
            }
        </style>
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect " id="tab-bar">
            <a href="index.jsp" class="mdl-layout__tab">首页</a>
            <a href="materials.jsp?file_name=c-tutorial" class="mdl-layout__tab is-active">在线学习</a>
            <a href="" class="mdl-layout__tab">模考训练</a>
            <a href="videos.jsp?page=1" class="mdl-layout__tab">视频解析</a>
            <a href="recommend.jsp" class="mdl-layout__tab">推荐试题</a>
        </div>
    </header>
    <main class="mdl-layout__content">
        <div class="page-content"><!-- Your content goes here -->

            <div class="mdl-grid" id="div-grid">
                <div class="mdl-cell mdl-cell--2-col" id="div-2-col">
                    <div id="title">资源列表</div>
                    <%  String fileName = request.getParameter("file_name");%>
                    <!-- Simple list -->
                    <ul class="demo-list-item mdl-list">
                        <%  for (Material material : new MaterialsTable().getMaterialList()) { %>
                            <a href="materials.jsp?file_name=<%=material.getFileName()%>" class="a-list">
                                <li class="mdl-list__item" id="<%=material.getFileName().equals(fileName) ? "li-active":""%>">
                                  <span class="mdl-list__item-primary-content" id="<%=material.getFileName().equals(fileName) ? "span-active":""%>">
                                    <%=material.getTitle()%>
                                  </span>
                                </li>
                            </a>
                        <%
                        }%>
                    </ul>

                </div>
                <div class="mdl-cell mdl-cell--10-col" id="div-10-col">
                    <jsp:include page='<%="meterials/"+fileName+".jsp" %>' ></jsp:include>
                    <br><br><br><br><br><br>
                    <%  PreNexPage p = new PreNexPage(fileName);%>
                    <!-- Raised button -->
                    <div>
                        <a href="materials.jsp?file_name=<%=p.getNexName()%>" class="a-list">
                            <button class="mdl-button mdl-js-button mdl-button--raised" id="b-right" <%=p.isNex() ? "":"disabled"%>>
                                <%=p.isNex() ? "下一篇:"+p.getNexTitle() : "已经是最后一篇"%>
                            </button>
                        </a>
                        <!-- Raised disabled button -->
                        <a href="materials.jsp?file_name=<%=p.getPreName()%>" class="a-list">
                            <button class="mdl-button mdl-js-button mdl-button--raised" <%=p.isPre() ? "":"disabled"%>>
                                <%=p.isPre() ? "上一篇:"+p.getPreTitle() : "第一篇"%>
                            </button>
                        </a>
                    </div>
                </div>
            </div>

            <jsp:include page='mdl_footer.jsp' ></jsp:include>

        </div>
    </main>
</div>
</body>
</html>

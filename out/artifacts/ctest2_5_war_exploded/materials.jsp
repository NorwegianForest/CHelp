<%@ page import="com.business.Material" %>
<%@ page import="com.taglib.MaterialsTable" %>
<%@ page import="com.business.PreNexPage" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/13
  Time: 21:14
  测试MDL显示学习资源
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <!-- Material Design Lite -->
    <link rel="stylesheet" href="mdl/material.min.css">
    <script src="mdl/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style type="text/css">
        @import url(css/material.css);
    </style>
    <title>C语言学习资源 | C Help</title>
</head>
<body>
<!-- Uses a header that scrolls with the text, rather than staying locked at the top -->
<div class="mdl-layout mdl-js-layout">
    <%String username = (String)session.getAttribute("username");%>
    <jsp:include page="mdl_header.jsp">
        <jsp:param name="tab" value="2"/>
        <jsp:param name="username" value="<%=username%>"/>
    </jsp:include>
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
                    <jsp:include page='<%="meterials/"+fileName+".jsp" %>'/>
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

            <jsp:include page='mdl_footer.jsp'/>

        </div>
    </main>
</div>
</body>
</html>

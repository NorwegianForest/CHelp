<%@ page import="com.business.Paper" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/3
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>模考训练 | C Help</title>
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <style type="text/css">@import url(css/papers.css);</style>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
</head>
<body>
<div class="mdl-layout mdl-js-layout">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_header.jsp">
    <jsp:param name="tab" value="3"/>
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <div class="paper-center">
      <div class="type-title">
        <i class="material-icons">format_list_bulleted</i>
        <div class="title-text">章节试题</div>
      </div>
      <%for (Paper paper : Paper.getTenPaperList("chapter")) { %>
      <a href="paper.jsp?paper_id=<%=paper.getId()%>" class="paper-a" target="_blank">
        <div class="<%=Paper.type()%>">
          <%=paper.getTitle()%>
        </div>
      </a>
      <%}%>
      <div class="type-title">
        <i class="material-icons">format_list_bulleted</i>
        <div class="title-text">模拟试题</div>
      </div>
      <%for (Paper paper : Paper.getTenPaperList("simulation")) { %>
      <a href="paper.jsp?paper_id=<%=paper.getId()%>" class="paper-a" target="_blank">
        <div class="<%=Paper.type()%>">
          <%=paper.getTitle()%>
        </div>
      </a>
      <%}%>
      <div class="type-title">
        <i class="material-icons">format_list_bulleted</i>
        <div class="title-text">历年真题</div>
      </div>
      <%for (Paper paper : Paper.getTenPaperList("old")) { %>
      <a href="paper.jsp?paper_id=<%=paper.getId()%>" class="paper-a" target="_blank">
        <div class="<%=Paper.type()%>">
          <%=paper.getTitle()%>
        </div>
      </a>
      <%}%>
      <div class="space"></div>
    </div>
  </main>
  <jsp:include page="mdl_footer.jsp"/>
</div>
</body>
</html>

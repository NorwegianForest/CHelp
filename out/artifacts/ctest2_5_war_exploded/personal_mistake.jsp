<%@ page import="com.business.OrdinUser" %>
<%@ page import="com.business.Exercise" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/21
  Time: 14:46
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>个人中心 | C Help</title>
  <style type="text/css">@import url(css/paper.css);@import url(css/personal.css);</style>
  <script src="js/paper_card.js"></script>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
  <jsp:include page="mdl_personal_head.jsp"/>
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_personal_drawer.jsp">
    <jsp:param name="username" value="<%=username%>"/>
    <jsp:param name="title" value="mistake"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <div class="center">
      <%OrdinUser ordinUser = new OrdinUser(username, "mistakes");
        int orderNumber = 1;
        for (Exercise e : ordinUser.getExerciseList()) {%>
      <div class="single" style="border: 1px solid #CCCCCC">
        <div class="title"><span class="order-number"><%=orderNumber%>&nbsp;[单选题]</span><%=e.getHTMLTitle()%></div>
        <div class="option-div">
          <div class="option">
            <span class="mdl-radio__label">A.&nbsp;<%=e.getaOption()%></span>
          </div>
          <div class="option">
            <span class="mdl-radio__label">B.&nbsp;<%=e.getbOption()%></span>
          </div>
          <div class="option">
            <span class="mdl-radio__label">C.&nbsp;<%=e.getcOption()%></span>
          </div>
          <div class="option">
            <span class="mdl-radio__label">D.&nbsp;<%=e.getdOption()%></span>
          </div>
          <style>
            .mdl-icon-toggle.is-checked .mdl-icon-toggle__label{
              color: #FFC107;
            }
          </style>
          <div class="collection">
            <div>
              <label class="mdl-icon-toggle mdl-js-icon-toggle mdl-js-ripple-effect" for="icon-<%=orderNumber%>">
                <input type="checkbox" id="icon-<%=orderNumber++%>" class="mdl-icon-toggle__input"
                       onclick="clc(<%=e.getId()%>, '<%=username%>')" <%=e.getCollection(username)%>>
                <i class="mdl-icon-toggle__label material-icons">star</i>
              </label>
            </div>
            <div class="collection-text">收藏此题&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div>
              <label class="mdl-icon-toggle mdl-js-icon-toggle mdl-js-ripple-effect" for="icon-<%=orderNumber%>">
                <input type="checkbox" id="icon-<%=orderNumber++%>" class="mdl-icon-toggle__input"
                       onclick="del(<%=e.getId()%>, '<%=username%>')">
                <i class="mdl-icon-toggle__label material-icons" style="color: #FF1107;">clear</i>
              </label>
            </div>
            <div class="collection-text">移除错题</div>
          </div>
        </div>
        <div class="answer">参考答案:&nbsp;<span class="answer-text"><%=e.getAnswer()%></span></div>
        <div class="analysis">
          <div class="analysis-inside">试题来源:&nbsp;<%=e.getPaperTitle()%></div>
          <div class="analysis-inside">参考解析:&nbsp;<%=e.getAnalysis()%></div>
        </div>
      </div>
      <%}%>
    </div>
  </main>
</div>
</body>
</html>

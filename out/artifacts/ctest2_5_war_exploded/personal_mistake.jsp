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
                <input type="checkbox" id="icon-<%=orderNumber++%>" class="mdl-icon-toggle__input">
                <i class="mdl-icon-toggle__label material-icons">star</i>
              </label>
            </div>
            <div class="collection-text">收藏此题</div>
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
</body>
</html>

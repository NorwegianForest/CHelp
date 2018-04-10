<%@ page import="com.business.TestDetail" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/9
  Time: 17:28
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>教师中心 | C Help</title>
  <link rel="stylesheet" href="css/personal.css" type="text/css">
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
  <link rel="stylesheet" href="css/paper.css" type="text/css">
  <script src="js/paper_card.js"></script>
  <jsp:include page="mdl_personal_head.jsp"/>
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_teacher_drawer.jsp">
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <div class="center">
      <%int testId = Integer.parseInt(request.getParameter("id"));%>
      <%int order = 1;%>
      <%for (TestDetail t : TestDetail.getDetailList(testId)) {%>
      <div class="single" style="border: 1px solid #CCCCCC">
        <div class="title">
          <span class="order-number"><%=order%>&nbsp;[单选题]</span>
          <%=t.getExercise().getHTMLTitle()%>
        </div>
        <div class="option-div">
          <div class="option" <%=t.getBackground("A")%>>
            <span class="mdl-radio__label">A.&nbsp;<%=t.getExercise().getaOption()%></span>
          </div>
          <div class="option" <%=t.getBackground("B")%>>
            <span class="mdl-radio__label">B.&nbsp;<%=t.getExercise().getbOption()%></span>
          </div>
          <div class="option" <%=t.getBackground("C")%>>
            <span class="mdl-radio__label">C.&nbsp;<%=t.getExercise().getcOption()%></span>
          </div>
          <div class="option" <%=t.getBackground("D")%>>
            <span class="mdl-radio__label">D.&nbsp;<%=t.getExercise().getdOption()%></span>
          </div>
          <style>
            .mdl-icon-toggle.is-checked .mdl-icon-toggle__label{
              color: #FFC107;
            }
          </style>
          <div class="collection">
            <div>
              <label class="mdl-icon-toggle mdl-js-icon-toggle mdl-js-ripple-effect" for="icon-<%=order%>">
                <input type="checkbox" id="icon-<%=order++%>" class="mdl-icon-toggle__input"
                       onclick="clc(<%=t.getExercise().getId()%>, '<%=username%>')"
                  <%=t.getExercise().getCollection(username)%>>
                <i class="mdl-icon-toggle__label material-icons">star</i>
              </label>
            </div>
            <div class="collection-text">收藏此题&nbsp;&nbsp;&nbsp;&nbsp;</div>
          </div>
        </div>
        <div class="answer">参考答案:&nbsp;<span class="answer-text"><%=t.getExercise().getAnswer()%></span></div>
        <div class="analysis">
          <div class="analysis-inside">试题来源:&nbsp;<%=t.getExercise().getPaperTitle()%></div>
          <div class="analysis-inside">参考解析:&nbsp;<%=t.getExercise().getAnalysis()%></div>
        </div>
      </div>
      <%}%>
    </div>
  </main>
</div>
</body>
</html>

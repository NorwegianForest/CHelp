<%@ page import="com.business.Course" %>
<%@ page import="com.business.Paper" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/21
  Time: 17:06
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>课程详情 | C Help</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
<div class="mdl-layout mdl-js-layout">
  <%@ include file = "mdl_header.jsp" %>
  <style>@import url(css/course.css);</style>
  <%  String id = request.getParameter("id");
      Course course = new Course(Integer.parseInt(id));%>
  <div class="center-div">
    <div class="top-div">
      <div class="img-div">
        <img src="images/course/<%=course.getImgUrl()%>" width="100%" height="100%">
      </div>
      <div class="title-div">
        <div class="title"><%=course.getTitle()%></div>
        <div class="time">
          开课时间：<%=course.getStartDate()%> ~ <%=course.getEndDate()%><br>
          授课老师：<%=course.getTeacherUser().getUniversity()%>&nbsp;<%=course.getTeacherUser().getName()%>&nbsp;<%=course.getTeacherUser().getTitle()%>
        </div>
        <a href="">
          <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
            立即参与
          </button>
        </a>
      </div>
    </div>
    <div class="main-div">
      <div class="intro-title"><i class="material-icons">insert_comment</i>课程简介</div>
      <div class="intro"><%=course.getIntroduce()%></div>
      <div class="intro-title"><i class="material-icons">format_list_bulleted</i>试题列表</div>
      <div class="intro">
        <%if (!course.getPaperList().isEmpty()) {
            for (Paper paper : course.getPaperList()) { %>
        <a href="paper.jsp?paper_id=<%=paper.getId()%>"><%=paper.getTitle()%></a><br>
        <%  }
        }%>
      </div>
    </div>
  </div>
  <%@ include file = "mdl_footer.jsp" %>
</body>
</html>

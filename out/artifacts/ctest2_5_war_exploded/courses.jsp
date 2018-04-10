<%@ page import="com.business.Course" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/6
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>课程列表 | C Help</title>
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <style type="text/css">@import url(css/courses.css);</style>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
</head>
<body>
<div class="mdl-layout mdl-js-layout">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_header.jsp">
    <jsp:param name="tab" value="4"/>
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <div class="courses-center">
      <div class="courses-title">课程列表&nbsp;-&nbsp;C语言</div>
      <%for (Course c : Course.getAllCourseList()) {%>
      <a href="course.jsp?id=<%=c.getId()%>" class="course-a" target="_blank">
        <div class="course-single">
          <div class="image">
            <img src="images/course/<%=c.getImgUrl()%>" width="100%" height="100%">
          </div>
          <div class="intro-div">
            <div class="title"><%=c.getTitle()%></div>
            <div class="teacher"><%=c.getTeacher().getUniversity()%>&nbsp;&nbsp;&nbsp;&nbsp;<%=c.getTeacher().getName()%></div>
            <div class="intro"><%=c.getShotIntro()%></div>
            <div class="time">开课时间：&nbsp;&nbsp;<%=c.getStartDate()%>-<%=c.getEndDate()%></div>
          </div>
        </div>
      </a>
      <%}%>
    </div>
    <jsp:include page="mdl_footer.jsp"/>
  </main>
</div>
</body>
</html>

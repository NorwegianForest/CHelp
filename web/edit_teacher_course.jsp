<%@ page import="com.business.Course" %>
<%@ page import="com.business.TeacherUser" %>
<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/3/30
  Time: 13:10
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>教师个人中心 | C Help</title>
  <style>@import url(css/course.css);</style>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
  <jsp:include page="mdl_personal_head.jsp"/>
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_teacher_drawer.jsp">
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <%  TeacherUser teacher = new TeacherUser(username);teacher.loadCourseList();%>
    <%  String id = request.getParameter("id");
        Course course = new Course(Integer.parseInt(id));%>
    <div class="center-div">
      <form method="post" action="/edit_course">
        <input type="hidden" name="id" value="<%=id%>">
        <div class="top-div">
          <div class="img-div">
            <img src="images/course/<%=course.getImgUrl()%>" width="100%" height="100%">
          </div>
          <div class="title-div">
            <div class="title">
              <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" id="title" name="title" value="<%=course.getTitle()%>" style="font-size: 24px;">
                <label class="mdl-textfield__label" for="title">课程标题...</label>
              </div>
              <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" id="start" name="start" value="<%=course.getStartDate()%>">
                <label class="mdl-textfield__label" for="start">开始时间...</label>
              </div>
              <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" id="end" name="end" value="<%=course.getEndDate()%>">
                <label class="mdl-textfield__label" for="end">结束时间...</label>
              </div>
            </div>
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
              完成编辑
            </button>
          </div>
        </div>
        <div class="main-div">
          <div class="intro-title">
            <i class="material-icons">insert_comment</i>
            <div class="intro-title-text">课程简介</div>
          </div>
          <div class="intro">
            <div class="mdl-textfield mdl-js-textfield" style="width: 900px;">
              <textarea class="mdl-textfield__input" type="text" rows= "12" id="introduce" name="introduce"><%=course.getIntroduce()%></textarea>
              <label class="mdl-textfield__label" for="introduce">课程简介...</label>
            </div>
          </div>
        </div>
      </form>
    </div>
  </main>
</div>
</body>
</html>

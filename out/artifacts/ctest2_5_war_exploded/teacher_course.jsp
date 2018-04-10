<%@ page import="com.business.Course" %>
<%@ page import="com.business.Paper" %>
<%@ page import="com.business.TeacherUser" %>
<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/3/21
  Time: 18:14
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>教师个人中心 | C Help</title>
  <style>@import url(css/course.css);</style>
  <style>@import url(css/papers.css);</style>
  <script src="js/teacher_course.js"></script>
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
      <div class="top-div">
        <div class="img-div">
          <img src="images/course/<%=course.getImgUrl()%>" width="100%" height="100%">
        </div>
        <div class="title-div">
          <div class="course-title"><%=course.getTitle()%></div>
          <div class="time">
            开课时间：<%=course.getStartDate()%> ~ <%=course.getEndDate()%><br>
            授课老师：<%=course.getTeacherUser().getUniversity()%>&nbsp;<%=course.getTeacherUser().getName()%>&nbsp;<%=course.getTeacherUser().getTitle()%>
          </div>
          <a href="edit_teacher_course.jsp?id=<%=id%>" class="paper-a">
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
              编辑课程详情
            </button>
          </a>
          <a href="teacher_create_paper.jsp?id=<%=id%>" class="paper-a">
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
              创建课程试题
            </button>
          </a>
          <div class="delete">
            <form id="delete-form" method="post" action="/delete_course">
              <input type="hidden" name="course_id" value="<%=course.getId()%>">
              <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
                      onclick="return checkDelete();">
                删除课程
              </button>
            </form>
          </div>
        </div>
      </div>
      <div class="main-div">
        <div class="intro-title">
          <i class="material-icons">insert_comment</i>
          <div class="intro-title-text">课程简介</div>
        </div>
        <div class="intro"><%=course.getHTMLIntroduce()%></div>
        <div class="intro-title">
          <i class="material-icons">format_list_bulleted</i>
          <div class="intro-title-text">编辑试题</div>
        </div>
        <div class="edit-paper">
          <%if (!course.getPaperList().isEmpty()) {
            for (Paper paper : course.getPaperList()) { %>
          <div class="course-paper-<%=Paper.type()%>">
            <div class="to-paper">
              <a href="paper.jsp?paper_id=<%=paper.getId()%>" target="_blank"><%=paper.getTitle()%></a>
            </div>
            <div class="to-edit-paper">
              <a href="edit_course_paper.jsp?paper_id=<%=paper.getId()%>" target="_blank">编辑试卷</a>
            </div>
            <div class="to-edit-paper">
              <a href="teacher_test.jsp?id=<%=paper.getId()%>" target="_blank">查看作答情况</a>
            </div>
          </div>
          <%  }
          }%>
        </div>
      </div>
    </div>
  </main>
</div>
</body>
</html>

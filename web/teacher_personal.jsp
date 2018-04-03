<%@ page import="com.business.OrdinUser" %>
<%@ page import="com.business.TeacherUser" %>
<%@ page import="com.business.Course" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/11
  Time: 18:00
  教师个人中心
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
  <title>教师个人中心 | C Help</title>
  <style type="text/css">@import url(css/teacher_personal.css);@import url(css/personal.css);</style>
  <jsp:include page="mdl_personal_head.jsp"/>
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_teacher_drawer.jsp">
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <%--登录检测--%>
    <%=new OrdinUser(username).checkLogin() %>
    <%  TeacherUser teacher = new TeacherUser(username);
      teacher.loadCourseList();%>
      <div class="main-top">
        <div class="main-top-center">
          <span class="teacher-name"><%=teacher.getName()%>&nbsp;&nbsp;</span>
          <span class="teacher-intro"><%=teacher.getUniversity()%>&nbsp;-&nbsp;<%=teacher.getTitle()%></span>
          <br><br>
          <span class="teacher-intro"><%=teacher.getIntroduce()%></span>
        </div>
      </div>

      <div class="main-main">
        <div class="title">课程列表</div>
        <div class="line"></div>
        <div class="all-course">
          <%if (teacher.getCourseList().isEmpty()) {%>
          <p>暂无课程</p>
          <%} else {
              for (Course course : teacher.getCourseList()) {%>

          <a class="course-a" href="teacher_course.jsp?id=<%=course.getId()%>">
            <div class="course-div">
              <div class="imgdiv">
                <img src="images/course/<%=course.getImgUrl()%>" width="100%" height="100%">
              </div>
              <div class="introdiv">
                <div class="titlediv"><%=course.getTitle()%></div>
                <div class="teachdiv">
                  <%=teacher.getUniversity()%>-<%=teacher.getName()%>
                </div>
              </div>
            </div>
          </a>

            <%}%>
          <%}%>
        </div>
      </div>

  </main>
</div>
</body>
</html>

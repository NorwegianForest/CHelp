<%@ page import="com.business.OrdinUser" %>
<%@ page import="com.business.Course" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/21
  Time: 14:46
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>个人中心 | C Help</title>
  <style type="text/css">@import url(css/personal.css);</style>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
  <jsp:include page="mdl_personal_head.jsp"/>
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_personal_drawer.jsp">
    <jsp:param name="username" value="<%=username%>"/>
    <jsp:param name="title" value="course"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <div class="center">
      <div class="all-course">
        <%OrdinUser user = new OrdinUser(username);
          for (Course course : user.getCourseList()) {%>
        <a class="course-a" href="course.jsp?id=<%=course.getId()%>" target="_blank">
          <div class="course-div">
            <div class="imgdiv">
              <img src="images/course/<%=course.getImgUrl()%>" width="100%" height="100%">
            </div>
            <div class="introdiv">
              <div class="titlediv"><%=course.getTitle()%></div>
              <div class="teachdiv">
                <%=course.getTeacherUser().getUniversity()%>-<%=course.getTeacherUser().getName()%>
              </div>
            </div>
          </div>
        </a>
        <%}%>
      </div>
    </div>
  </main>
</div>
</body>
</html>

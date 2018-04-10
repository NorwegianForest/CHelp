<%@ page import="com.business.Course" %>
<%@ page import="com.business.Paper" %>
<%@ page import="com.business.TeacherUser" %>
<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/3/30
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>教师个人中心 | C Help</title>
  <style>@import url(css/course.css);</style>
  <style>@import url(css/papers.css);</style>
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
          <div class="title"><%=course.getTitle()%></div>
          <div class="time">
            开课时间：<%=course.getStartDate()%> ~ <%=course.getEndDate()%><br>
            授课老师：<%=course.getTeacherUser().getUniversity()%>&nbsp;<%=course.getTeacherUser().getName()%>&nbsp;<%=course.getTeacherUser().getTitle()%>
          </div>
        </div>
      </div>
      <div class="main-div">
        <div class="intro-title">
          <i class="material-icons">format_list_bulleted</i>
          <div class="intro-title-text">创建试卷</div>
        </div>
        <div class="intro">
          <form method="post" action="/create_course_paper">
            <input type="hidden" name="id" value="<%=id%>">
            <div class="mdl-textfield mdl-js-textfield">
              <input class="mdl-textfield__input" type="text" id="title" name="title">
              <label class="mdl-textfield__label" for="title">试卷标题...</label>
            </div>
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
              创建
            </button>
          </form>
        </div>
        <div class="intro-title">
          <i class="material-icons">format_list_bulleted</i>
          <div class="intro-title-text">试题列表</div>
        </div>
        <div class="intro">
          <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
            <thead><tr><th class="mdl-data-table__cell--non-numeric">试卷标题</th></tr></thead>
            <tbody>
            <%if (!course.getPaperList().isEmpty()) {
              for (Paper paper : course.getPaperList()) { %>
              <form method="post" action="/delete_course_paper">
                <input type="hidden" name="paper_id" value="<%=paper.getId()%>">
                <input type="hidden" name="course_id" value="<%=course.getId()%>">
                <tr>
                  <td class="mdl-data-table__cell--non-numeric"><%=paper.getTitle()%></td>
                  <td>
                    <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored"
                            style="height: 30px;width: 30px;min-width: 30px;">
                      <i class="material-icons">clear</i>
                    </button>
                  </td>
                </tr>
              </form>
            <%  }
            }%>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </main>
</div>
</body>
</html>

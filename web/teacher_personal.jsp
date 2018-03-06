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
</head>
<body>
<%@ include file = "banner.jsp" %>
<%--登录检测--%>
<%=new OrdinUser(username).checkLogin() %>
<%  TeacherUser teacher = new TeacherUser(username);
    teacher.loadCourseList();
%>
<div class="container">
    <div class="content">
        <div align="center">
            姓名：<%=teacher.getName()%><br>
            学校：<%=teacher.getUniversity()%><br>
            职称：<%=teacher.getTitle()%><br>
            简介：<%=teacher.getIntroduce()%><br><br>
            <a href="#">创建课程</a>
            <h3>课程列表</h3>
            <% if (teacher.getCourseList().isEmpty()) {%>
                <p>暂无课程</p>
            <%} else {
                for (Course course : teacher.getCourseList()) { %>
                    <a href="/course.jsp?id=<%=course.getId()%>"><%=course.getTitle()%></a>
            <%  }
            }%>

            <h3>最新动态</h3>
        </div>
    </div><!-- end .content -->
</div><!-- end .container -->
<%@ include file = "footer.jsp" %>
</body>
</html>

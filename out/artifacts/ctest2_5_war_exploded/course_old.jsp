<%@ page import="com.business.Course" %>
<%@ page import="com.business.Paper" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/11
  Time: 20:40
  课程详情
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <title>课程详情 | C Help</title>
</head>
<body>
<%@ include file = "banner.jsp" %>
<div class="container">
    <div class="content">
    <%  String id = request.getParameter("id");
        Course course = new Course(Integer.parseInt(id));
    %>
        <h3><%=course.getTitle()%></h3>
        <p>时间：<%=course.getStartDate()%>-<%=course.getEndDate()%></p>
        <p>简介：<%=course.getIntroduce()%></p>
        <form name="joinForm" action="/join_course" method="post">
            <input type="hidden" name="username" value="<%=username%>">
            <input type="hidden" name="course_id" value="<%=id%>">
            <input type="<%=course.isJoin(username) ? "hidden":"submit"%>" value="加入课程">
        </form>
        <p>试题列表：</p>
        <%
        if (!course.getPaperList().isEmpty()) {
            for (Paper paper : course.getPaperList()) { %>
            <a href="/paper.jsp?paper_id=<%=paper.getId()%>"><%=paper.getTitle()%></a><br>
        <%  }
        }%>

    </div><!-- end .content -->
</div><!-- end .container -->
<%@ include file = "footer.jsp" %>
</body>
</html>

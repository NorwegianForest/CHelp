<%@ page import="com.business.Test" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/9
  Time: 17:31
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>教师中心 | C Help</title>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
  <link rel="stylesheet" href="css/personal.css" type="text/css">
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
      <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
        <thead>
        <th>序号</th>
        <th class="mdl-data-table__cell--non-numeric">用户id</th>
        <th class="mdl-data-table__cell--non-numeric">作答时间</th>
        <th class="mdl-data-table__cell--non-numeric">详情</th>
        </thead>
        <tbody>
        <%int order = 1;%>
        <%int paperId = Integer.parseInt(request.getParameter("id"));%>
        <%for (Test t : Test.getTestList(paperId)) {%>
        <tr>
          <td><%=order++%></td>
          <td class="mdl-data-table__cell--non-numeric">
            <a href="" target="_blank"><%=t.getUsername()%></a>
          </td>
          <td class="mdl-data-table__cell--non-numeric"><%=t.getTestDate()%></td>
          <td class="mdl-data-table__cell--non-numeric">
            <a href="teacher_test_detail.jsp?id=<%=t.getId()%>">查看详情</a>
          </td>
        </tr>
        <%}%>
        </tbody>
      </table>
    </div>
  </main>
</div>
</body>
</html>

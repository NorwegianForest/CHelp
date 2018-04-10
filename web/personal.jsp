<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/19
  Time: 17:50
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>个人中心 | C Help</title>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
  <style type="text/css">@import url(css/home.css);</style>
  <jsp:include page="mdl_personal_head.jsp"/>
</head>
<body>
  <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
    <%String username = (String)session.getAttribute("username");%>
    <jsp:include page="mdl_personal_drawer.jsp">
      <jsp:param name="username" value="<%=username%>"/>
      <jsp:param name="title" value="Home"/>
    </jsp:include>
    <main class="mdl-layout__content">
      <div class="user-intro">
        <h4 align="center">用户须知</h4>
        <h5>您可以在个人中心中:</h5>
        <ul>
          <li>查看历史答题情况</li>
          <li>查看收藏试题与错题</li>
          <li>查看参与的课程</li>
        </ul>
        <h5>若您注册成为教师用户:</h5>
        <ul>
          <li>发布课程和试题</li>
          <li>获取所有参与课程的用户的答题情况</li>
        </ul>
        <p>推荐试题中，系统是根据您在本站的答题情况而进行的针对性组卷。</p>
        <p>您在课程中的作答情况将会被反映到开设课程的教师用户，多次作答则反映多次。</p>
      </div>
    </main>
  </div>
</body>
</html>

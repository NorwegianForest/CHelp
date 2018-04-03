<%@ page import="com.DBQuery.DataProcess" %>
<%@ page import="com.business.Video" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/23
  Time: 0:24
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>视频 | C Help</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <style>@import url(css/video.css);</style>
  <style type="text/css">
    @media screen and (max-width: 1050px) {
      .mdl-layout__header {
        display: block;
      }
    }
  </style>
</head>
<body>
<div class="mdl-layout mdl-js-layout">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_header.jsp">
    <jsp:param name="tab" value="5"/>
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>

  <%
    String path = DataProcess.query(Video.TABLENAME, Video.ORDERNUMBER, request.getParameter("number"), Video.YOUKUPATH);
    String title = DataProcess.query(Video.TABLENAME, Video.ORDERNUMBER, request.getParameter("number"), Video.VIDEOTITLE);
  %>
  <div class="top">
    <div class="center-div">
      <div class="video-title"><%=title%></div>
    </div>
  </div>
  <div class="center-div">
    <div class="main">
      <div class="video">
        <iframe height=525 width=700 src='<%=path%>' frameborder=0 'allowfullscreen'></iframe>
      </div>
      <div class="video-left">
        <div class="left-title">相关视频</div>
        <div class="scroll">
          <%  for (Video video : Video.getNextSixVideos(1)) {%>
          <a href="video.jsp?number=<%=video.getNumber()%>" class="video-a">
            <div class="left-video">
              <div class="left-img">
                <img src="<%=video.getImgUrl()%>" width="100%" height="100%">
              </div>
              <div class="left-video-title"><%=video.getTitle()%></div>
            </div>
          </a>
          <%  }%>
        </div>
      </div>
    </div>
  </div>
  <main class="mdl-layout__content">
  </main>
  <%@ include file = "mdl_footer.jsp" %>
</div>

</body>
</html>

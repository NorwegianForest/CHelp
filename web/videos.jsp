<%@ page import="com.DBQuery.DataProcess" %>
<%@ page import="com.business.Video" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/17
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>视频列表 | C Help</title>
    <link rel="stylesheet" href="mdl/material.min.css">
    <script src="mdl/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style type="text/css">
        @import url(css/videos.css);
    </style>
</head>
<body>

<div class="mdl-layout mdl-js-layout">
    <%String username = (String)session.getAttribute("username");%>
    <jsp:include page="mdl_header.jsp">
        <jsp:param name="tab" value="5"/>
        <jsp:param name="username" value="<%=username%>"/>
    </jsp:include>

    <script>
        window.onload=function () {
            var center = document.getElementById("center-div");
            var w = parseInt(center.clientWidth.toString());
            center.style.width = w + "px";
        }
    </script>

    <%  int pageNumber = Integer.parseInt(request.getParameter("page"));
        List<Video> videoList = DataProcess.getVideoList(pageNumber);%>

    <main class="mdl-layout__content">
        <div id="center-div">
            <div class="layer">
                <%  for (Video video : videoList) { %>

                <div class="video-div">
                    <a href="video.jsp?number=<%=video.getNumber()%>" class="video-a" target="_blank">
                        <div class="img-div" style="background: url(<%=video.getImgUrl()%>); background-size: 100% 100%;">
                            <div class="time-div"><%=video.getTime()%></div>
                        </div>
                    </a>
                    <div class="title-div"><a href="video.jsp?number=<%=video.getNumber()%>" class="video-a"><%=video.getShortTitle()%></a></div>
                </div>

                    <%  if (Integer.parseInt(video.getNumber()) % 5 == 0 && Integer.parseInt(video.getNumber()) % 30 != 0) { %>
            </div><div class="layer">
                    <%  }%>
                <%  }%>
            </div>

            <div class="page">
                <div><button class="mdl-button mdl-js-button mdl-button--raised" <%=Video.getPreDis(pageNumber)%>>上一页</button></div>
                <div><a href="videos.jsp?page=1"><button class="mdl-button mdl-js-button mdl-js-ripple-effect" style="color: <%=Video.getPageColor(pageNumber,1)%>">1</button></a></div>
                <div><a href="videos.jsp?page=2"><button class="mdl-button mdl-js-button mdl-js-ripple-effect" style="color: <%=Video.getPageColor(pageNumber,2)%>">2</button></a></div>
                <div><a href="videos.jsp?page=3"><button class="mdl-button mdl-js-button mdl-js-ripple-effect" style="color: <%=Video.getPageColor(pageNumber,3)%>">3</button></a></div>
                <div><a href="videos.jsp?page=4"><button class="mdl-button mdl-js-button mdl-js-ripple-effect" style="color: <%=Video.getPageColor(pageNumber,4)%>">4</button></a></div>
                <div><a href="videos.jsp?page=5"><button class="mdl-button mdl-js-button mdl-js-ripple-effect" style="color: <%=Video.getPageColor(pageNumber,5)%>">5</button></a></div>
                <div><a href="videos.jsp?page=6"><button class="mdl-button mdl-js-button mdl-js-ripple-effect" style="color: <%=Video.getPageColor(pageNumber,6)%>">6</button></a></div>
                <div><button class="mdl-button mdl-js-button mdl-button--raised" <%=Video.getNexDis(pageNumber)%>>下一页</button></div>
            </div>
        </div>

        <footer class="mdl-mini-footer">
            <div class="mdl-mini-footer__left-section">
                <div class="mdl-logo">C语言自学模考系统</div>
                <ul class="mdl-mini-footer__link-list">
                    <li><a href="#">Help</a></li>
                    <li><a href="#">Privacy & Terms</a></li>
                </ul>
            </div>
        </footer>

    </main>

</div>

</body>
</html>

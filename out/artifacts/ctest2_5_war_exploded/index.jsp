<%@ page import="com.business.Paper" %>
<%@ page import="com.business.Material" %>
<%@ page import="java.util.List" %>
<%@ page import="com.business.Course" %>
<%@ page import="com.business.TeacherUser" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/14
  Time: 16:37
  测试采用MDL重写主页
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>C语言自学模考系统 | C Help</title>
    <!-- Material Design Lite -->
    <link rel="stylesheet" href="mdl/material.min.css">
    <script src="mdl/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style type="text/css">
        @import url(css/index.css);
    </style>
</head>
<body>
<div class="mdl-layout mdl-js-layout">

    <%--<header class="mdl-layout__header mdl-layout__header--scroll" id="header">--%>
    <header class="mdl-layout__header mdl-layout__header--waterfall" style="background-color: #2E323E;">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">C Help</span>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right">
                <label class="mdl-button mdl-js-button mdl-button--icon" for="waterfall-exp">
                    <i class="material-icons">search</i>
                </label>
                <div class="mdl-textfield__expandable-holder">
                    <form name="searchForm" method="post" action="search_results.jsp" style="margin-bottom: 0;">
                        <input class="mdl-textfield__input" type="text" name="keyWord" id="waterfall-exp">
                    </form>
                </div>
            </div>
            <%  String username = (String)session.getAttribute("username");
                if (username == null || "".equals(username)) { %>
            <nav class="mdl-navigation">
                <a class="mdl-navigation__link" href="login.jsp">登录·注册</a>
            </nav>
            <%  } else { %>
            <ul class="demo-list-icon mdl-list">
                <li class="mdl-list__item">
                    <a href="personal.jsp" style="text-decoration: none;">
                    <span class="mdl-list__item-primary-content" style="color: #FFF;">
                        <i class="material-icons mdl-list__item-icon" style="color: #FFF; margin-right: 12px;">person</i>
                        <%=username%>
                    </span>
                    </a>
                </li>
            </ul>
            <%  }%>
            <!-- Add spacer, to align navigation to the right -->
            <!-- Navigation -->
        </div>
        <!-- Tabs -->
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect  " id="tab-bar">
            <a href="index.jsp" class="mdl-layout__tab is-active">首页</a>
            <a href="materials.jsp?file_name=c-tutorial" class="mdl-layout__tab">在线学习</a>
            <a href="" class="mdl-layout__tab">模考训练</a>
            <a href="videos.jsp?page=1" class="mdl-layout__tab">视频解析</a>
            <a href="" class="mdl-layout__tab">预测试题</a>
        </div>
    </header>
    <div class="mdl-layout__drawer">
        <span class="mdl-layout-title">C Help</span>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="index.jsp">首页</a>
            <a class="mdl-navigation__link" href="personal.jsp">个人中心</a>
            <a class="mdl-navigation__link" href="materials.jsp?file_name=c-tutorial">在线学习</a>
            <a class="mdl-navigation__link" href="videos.jsp?page=1">模考训练</a>
            <a class="mdl-navigation__link" href="">视频解析</a>
        </nav>
    </div>
    <main class="mdl-layout__content">
      <div class="center-content"><br><br>

          <script>
              var Fadeflag = true;
              function Fade() {
                  /**
                   * 淡入效果
                   * @param {Object} obj
                   */
                  this.show = function (obj) {
                      var num = 0;
                      if (Fadeflag) {
                          var st = setInterval(function () {
                              num++;
                              Fadeflag = false;
                              obj.style.opacity = num / 40;
                              if (num >= 40) {
                                  clearInterval(st);
                                  Fadeflag = true;
                              }
                          }, 30);
                      }
                  }
              }
              window.onload=function () {
                  var div_mid = document.getElementById("div-mid");
                  var mid_left = document.getElementById("mid-left");
                  var mid_right = document.getElementById("mid-right");
                  var cover = document.getElementById("cover");
                  var w = parseInt(document.getElementById("div-top").clientWidth.toString());
                  div_mid.style.width = w + "px";
                  div_mid.style.height = w + "px";
                  mid_left.style.height = w + "px";
                  mid_right.style.height = w + "px";
                  var r = w / 0.765;
                  cover.style.width = 2 * r + "px";
                  cover.style.height = 2 * r + "px";
                  var d1 = w * 0.5 - r;
                  var pad = 8;
                  cover.style.left = parseInt(document.getElementById("top-left").clientWidth.toString()) + d1 + pad + "px";
                  cover.style.top = parseInt(document.getElementById("top-left").clientHeight.toString()) + d1 + pad + "px";

                  var fade = new Fade();
                  fade.show(document.getElementById("paper-div"));
              };
              window.onresize=function(){
                  var div_mid = document.getElementById("div-mid");
                  var mid_left = document.getElementById("mid-left");
                  var mid_right = document.getElementById("mid-right");
                  var cover = document.getElementById("cover");
                  var w = parseInt(document.getElementById("div-top").clientWidth.toString());
                  div_mid.style.width = w + "px";
                  div_mid.style.height = w + "px";
                  mid_left.style.height = w + "px";
                  mid_right.style.height = w + "px";
                  var r = w / 0.765;
                  cover.style.width = 2 * r + "px";
                  cover.style.height = 2 * r + "px";
                  var d1 = w * 0.5 - r;
                  var pad = 8;
                  cover.style.left = parseInt(document.getElementById("top-left").clientWidth.toString()) + d1 + pad + "px";
                  cover.style.top = parseInt(document.getElementById("top-left").clientHeight.toString()) + d1 + pad + "px";
              }
          </script>

          <div id="paper-div">
              <div class="layer">
                  <div id="top-left">
                      <div class="left-left">
                          <div class="paper-title">章节试题</div>
                          <div id="letter-c">C</div>
                      </div>
                      <div class="left-right">
                          <div class="card-right-list">
                              <%  for (Paper paper : Paper.getFivePaperList("chapter")) {%>
                              <a href="paper.jsp?paper_id=<%=paper.getId()%>" class="paper-list" target="_blank">
                                  <div class="paper-list1"><%=paper.getTitle()%></div>
                              </a>
                              <%  }%>
                          </div>
                      </div>
                  </div>
                  <div id="div-top"></div>
                  <div id="top-right">
                      <div class="right-left">
                          <div class="paper-title">模拟试题</div>
                          <div id="letter-s">S</div>
                      </div>
                      <div class="right-right">
                          <div class="card-right-list">
                              <%  for (Paper paper : Paper.getFivePaperList("simulation")) {%>
                              <a href="paper.jsp?paper_id=<%=paper.getId()%>" class="paper-list" target="_blank">
                                  <div class="paper-list2"><%=paper.getTitle()%></div>
                              </a>
                              <%  }%>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="layer">
                  <div id="mid-left"></div>
                  <div id="div-mid"></div>
                  <div id="mid-right"></div>
              </div>
              <div class="layer">
                  <div id="bottom-left">
                      <div class="left-left">
                          <div class="paper-title">学习资源</div>
                          <div id="letter-r">R</div>
                      </div>
                      <div class="left-right">
                          <div class="card-right-list">
                              <%  for (Material material : Material.getFiveMaterialList()) {%>
                              <a href="materials.jsp?file_name=<%=material.getFileName()%>" class="paper-list" target="_blank">
                                  <div class="paper-list3"><%=material.getTitle()%></div>
                              </a>
                              <%  }%>
                          </div>
                      </div>
                  </div>
                  <div id="div-bottom"></div>
                  <div id="bottom-right">
                      <div class="right-left">
                          <div class="paper-title">真题练习</div>
                          <div id="letter-o">O</div>
                      </div>
                      <div class="right-right">
                          <div class="card-right-list">
                              <%  for (Paper paper : Paper.getFivePaperList("old")) {%>
                              <a href="paper.jsp?paper_id=<%=paper.getId()%>" class="paper-list" target="_blank">
                                  <div class="paper-list4"><%=paper.getTitle()%></div>
                              </a>
                              <%  }%>
                          </div>
                      </div>
                  </div>
              </div>
              <div id="cover">
                  <img src="images/course/wtf.png" width="100%" height="100%">
              </div>
          </div>

          <div class="c-title">新开课程-C语言</div>
          <table cellspacing="0" cellpadding="0" class="table1">
              <tr><td width="25%">
                  <table cellspacing="0" cellpadding="0" class="table2">
                      <tr><td class="td2">
                          <div class="cdiv">
                              <img src="images/course/c1.jpg" width="100%" height="100%">
                          </div>
                          <div class="c-center">C语言</div>
                          <div class="cdiv">
                              <img src="images/course/c2.jpg" width="100%" height="100%">
                          </div>
                      </td>
                      </tr>
                  </table>
              </td>
                  <td width="75%">
                      <table cellspacing="0" cellpadding="0" class="table2">
                          <%  List<Course> courseList = Course.getFirstSixCourseList();%>
                          <tr>
                              <td class="td1">
                              <%  int n = 1;
                                  for (Course course : courseList) {%>
                                <a href="course.jsp?id=<%=course.getId()%>" class="course-a">
                                  <div class="course-div">
                                    <div class="imgdiv">
                                      <img src="images/course/<%=course.getImgUrl()%>" width="100%" height="100%">
                                    </div>
                                    <div class="introdiv">
                                      <div class="titlediv"><%=course.getTitle()%></div>
                                      <% TeacherUser teacher = new TeacherUser(course.getTeacherName());%>
                                      <div class="teachdiv"><%=teacher.getUniversity()%>-<%=teacher.getName()%></div>
                                    </div>
                                  </div>
                                </a>
                              </td>
                                  <%  if (n == 3) {%>
                          </tr><tr>
                                  <%  }%>
                                  <%  if (n == 6) {%>
                          </tr>
                                  <%  }%>
                                  <%  if (n != 6) {%>
                              <td class="td1">
                                  <%  }%>
                              <%  n++;}%>
                      </table>
                  </td>
              </tr>
          </table><br><br>

      </div>

      <jsp:include page='mdl_footer.jsp' ></jsp:include>

    </main>

</div>
</body>
</html>

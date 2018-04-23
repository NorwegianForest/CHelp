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
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <style type="text/css">@import url(css/index.css);</style>
  <script src="js/index.js"></script>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
</head>
<body>
<div class="mdl-layout mdl-js-layout">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_header.jsp">
    <jsp:param name="tab" value="1"/>
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <div class="center-content"><br><br>
      <div id="paper-div">
        <div class="layer">
          <div id="top-left">
            <div class="left-left">
              <div class="paper-title">章节试题</div>
              <div id="letter-c"><i class="material-icons icons">chrome_reader_mode</i></div>
            </div>
            <div class="left-right">
              <div class="card-right-list">
                <%for (Paper paper : Paper.getFivePaperList("chapter")) {%>
                <a href="paper.jsp?paper_id=<%=paper.getId()%>" class="paper-list" target="_blank">
                  <div class="paper-list1"><%=paper.getTitle()%></div>
                </a>
                <%}%>
              </div>
            </div>
          </div>
          <div id="div-top"></div>
          <div id="top-right">
            <div class="right-left">
              <div class="paper-title">模拟试题</div>
              <div id="letter-s"><i class="material-icons icons">description</i></div>
            </div>
            <div class="right-right">
              <div class="card-right-list">
                <%for (Paper paper : Paper.getFivePaperList("simulation")) {%>
                <a href="paper.jsp?paper_id=<%=paper.getId()%>" class="paper-list" target="_blank">
                  <div class="paper-list2"><%=paper.getTitle()%></div>
                </a>
                <%}%>
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
              <div id="letter-r"><i class="material-icons icons">import_contacts</i></div>
            </div>
            <div class="left-right">
              <div class="card-right-list">
                <%for (Material material : Material.getFiveMaterialList()) {%>
                <a href="materials.jsp?file_name=<%=material.getFileName()%>" class="paper-list" target="_blank">
                  <div class="paper-list3"><%=material.getTitle()%></div>
                </a>
                <%}%>
              </div>
            </div>
          </div>
          <div id="div-bottom"></div>
          <div id="bottom-right">
            <div class="right-left">
              <div class="paper-title">真题练习</div>
              <div id="letter-o"><i class="material-icons icons">library_books</i></div>
            </div>
            <div class="right-right">
              <div class="card-right-list">
                <%for (Paper paper : Paper.getFivePaperList("old")) {%>
                <a href="paper.jsp?paper_id=<%=paper.getId()%>" class="paper-list" target="_blank">
                  <div class="paper-list4"><%=paper.getTitle()%></div>
                </a>
                <%}%>
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
              <%List<Course> courseList = Course.getFirstSixCourseList();%>
              <tr>
                <td class="td1">
                  <%int n = 1;
                  for (Course course : courseList) {%>
                  <a href="course.jsp?id=<%=course.getId()%>" class="course-a">
                    <div class="course-div">
                      <div class="imgdiv">
                        <img src="images/course/<%=course.getImgUrl()%>" width="100%" height="100%">
                      </div>
                      <div class="introdiv">
                        <div class="titlediv"><%=course.getTitle()%></div>
                        <% TeacherUser teacher = course.getTeacher();%>
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
    <jsp:include page='mdl_footer.jsp'/>
  </main>
</div>
</body>
</html>

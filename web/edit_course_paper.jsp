<%@ page import="com.business.Course" %>
<%@ page import="com.business.Exercise" %>
<%@ page import="com.business.Paper" %>
<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/4/2
  Time: 14:55
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>教师个人中心 | C Help</title>
  <jsp:include page="mdl_personal_head.jsp"/>
  <style>@import url(css/paper.css);</style>
  <style>@import url(css/edit_course_paper.css);</style>
  <script src="js/edit_course_paper.js"></script>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_teacher_drawer.jsp">
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <%String paper_id = request.getParameter("paper_id");
      Paper paper = new Paper(Integer.parseInt(paper_id));%>
    <form method="post" id="update" action="/edit_course_paper" onsubmit="check()">
      <input type="hidden" name="paper_id" value="<%=paper_id%>">
      <input type="hidden" name="delete_id" id="delete_id">
      <input type="hidden" name="add" id="add">
      <div class="paper-title-div">
        <div class="paper-title">
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input title-input" type="text" id="title" name="title" value="<%=paper.getTitle()%>">
            <label class="mdl-textfield__label" for="title">试卷标题</label>
          </div>
        </div>
        <div class="paper-detial"><%=new Course(paper.getCourseId()).getTitle()%></div>
      </div>
      <div class="main-div">
        <div class="right-bottom">
          <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" onclick="addSub()">
            <i class="material-icons">add</i>
          </button>
          <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" onclick="upSub()">
            <i class="material-icons">done</i>
          </button>
        </div>
        <div class="main-left">
          <div class="title1">一、选择题</div>
          <%int num = 0; int count = 1;
            for (Exercise e : paper.getExerciseList()) { %>
          <div class="single" id="single-<%=++num%>">
            <div class="title">
              <span class="order-number"><%=num%>&nbsp;[单选题]</span>
              <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored clear-button"
                      style="height: 35px;min-width: 35px;width: 35px;" onclick="delSub(<%=e.getId()%>)">
                <i class="material-icons">clear</i>
              </button>
              <input type="hidden" name="exercise_id" value="<%=e.getId()%>">
              <div class="mdl-textfield mdl-js-textfield">
                <textarea class="mdl-textfield__input" type="text" rows= "8" name="<%="tit"+e.getId()%>"
                          id="<%=count%>"><%=e.getTitle()%></textarea>
                <label class="mdl-textfield__label" for="<%=count++%>">题目...</label>
              </div>
            </div>
            <div class="option-div">
              <div class="option">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                  <input class="mdl-textfield__input" type="text" id="<%=count%>" name="<%="opa"+e.getId()%>"
                         value="<%=e.getaOption()%>">
                  <label class="mdl-textfield__label" for="<%=count++%>">A选项</label>
                </div>
              </div>
              <div class="option">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                  <input class="mdl-textfield__input" type="text" id="<%=count%>" name="<%="opb"+e.getId()%>"
                         value="<%=e.getbOption()%>">
                  <label class="mdl-textfield__label" for="<%=count++%>">B选项</label>
                </div>
              </div>
              <div class="option">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                  <input class="mdl-textfield__input" type="text" id="<%=count%>" name="<%="opc"+e.getId()%>"
                         value="<%=e.getcOption()%>">
                  <label class="mdl-textfield__label" for="<%=count++%>">C选项</label>
                </div>
              </div>
              <div class="option">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                  <input class="mdl-textfield__input" type="text" id="<%=count%>" name="<%="opd"+e.getId()%>"
                         value="<%=e.getdOption()%>">
                  <label class="mdl-textfield__label" for="<%=count++%>">D选项</label>
                </div>
              </div>
            </div>
            <div class="answer">参考答案:&nbsp;
              <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=count%>">
                <input type="radio" id="<%=count++%>" class="mdl-radio__button" name="<%="ans"+e.getId()%>"
                       value="A" <%=e.getCheck(1)%>>
                <span class="mdl-radio__label">A</span>
              </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=count%>">
                <input type="radio" id="<%=count++%>" class="mdl-radio__button" name="<%="ans"+e.getId()%>"
                       value="B" <%=e.getCheck(2)%>>
                <span class="mdl-radio__label">B</span>
              </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=count%>">
                <input type="radio" id="<%=count++%>" class="mdl-radio__button" name="<%="ans"+e.getId()%>"
                       value="C" <%=e.getCheck(3)%>>
                <span class="mdl-radio__label">C</span>
              </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=count%>">
                <input type="radio" id="<%=count++%>" class="mdl-radio__button" name="<%="ans"+e.getId()%>"
                       value="D" <%=e.getCheck(4)%>>
                <span class="mdl-radio__label">D</span>
              </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="analysis">
              <div class="analysis-inside">参考解析:&nbsp;
                <div class="mdl-textfield mdl-js-textfield">
                  <textarea class="mdl-textfield__input analysis-input" type="text" rows= "4" name="<%="ana"+e.getId()%>"
                            id="<%=count%>"><%=e.getAnalysis()%></textarea>
                  <label class="mdl-textfield__label" for="<%=count++%>">参考解析...</label>
                </div>
              </div>
            </div>
          </div>
          <%}%>
        </div>
      </div>
    </form>
  </main>
</div>
</body>
</html>

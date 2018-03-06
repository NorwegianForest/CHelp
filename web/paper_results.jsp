<%@ page import="com.business.Paper" %>
<%@ page import="com.business.Exercise" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/19
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>测试结果 | C Help</title>
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<div class="mdl-layout mdl-js-layout">
  <%@ include file = "mdl_header.jsp" %>
  <style>
    @import url(css/paper.css);
  </style>
  <main class="mdl-layout__content">
    <div class="center-div">

      <%String paper_id = request.getParameter("paper_id");
        Paper paper = new Paper(Integer.parseInt(paper_id), request, username);%>
      <div class="paper-title-div">
        <div class="paper-title"><div><%=paper.getExerciseList().get(0).getPaperTitle()%></div></div>
        <div class="paper-detial">本卷共分为 4大题 43小题，作答时间为 120分钟，总分 100 分，60 分及格。</div>
      </div>
      <div class="main-div">
        <div class="main-left">
          <div class="title1">一、选择题(每小题1分，共40分)</div>
          <%int orderNumer = 0;
            int optionCount = 1;
            for (Exercise exercise : paper.getExerciseList()) { orderNumer++;%>
          <div class="single">
            <div class="title"><span class="order-number"><%=orderNumer%>&nbsp;[单选题]</span><%=exercise.getTitle()%></div>
            <div class="option-div">
              <div class="option">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                  <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="1" <%=exercise.getUserCheck()==1?"Checked":"" %>>
                  <span class="mdl-radio__label">A.&nbsp;<%=exercise.getaOption()%></span>
                </label>
              </div>
              <div class="option">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                  <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="2" <%=exercise.getUserCheck()==2?"Checked":"" %>>
                  <span class="mdl-radio__label">B.&nbsp;<%=exercise.getbOption()%></span>
                </label>
              </div>
              <div class="option">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                  <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="3" <%=exercise.getUserCheck()==3?"Checked":"" %>>
                  <span class="mdl-radio__label">C.&nbsp;<%=exercise.getcOption()%></span>
                </label>
              </div>
              <div class="option">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                  <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="4" <%=exercise.getUserCheck()==4?"Checked":"" %>>
                  <span class="mdl-radio__label">D.&nbsp;<%=exercise.getdOption()%></span>
                </label>
              </div>

              <div class="collection">
                <div>
                  <label class="mdl-icon-toggle mdl-js-icon-toggle mdl-js-ripple-effect" for="icon-<%=orderNumer%>">
                    <input type="checkbox" id="icon-<%=orderNumer%>" class="mdl-icon-toggle__input">
                    <i class="mdl-icon-toggle__label material-icons">star</i>
                  </label>
                </div>
                <div class="collection-text">收藏此题</div>
              </div>

            </div>
            <div class="answer">参考答案:&nbsp;<span class="answer-text"><%=exercise.getAnswer()%></span></div>
            <div class="analysis">
              <div class="analysis-inside">试题难度:&nbsp;<%=exercise.getDifficulty()%></div>
              <div class="analysis-inside">参考解析:&nbsp;<%=exercise.getAnalysis()%></div>
            </div>
          </div>
          <%}%>
        </div>
        <div class="main-right">
          <div class="card-title">答题卡&nbsp;&nbsp;&nbsp;<span class="progress">0/43</span></div>
          <div class="card">
            <div class="card-top">
              <div class="number">1</div>
              <div class="number">2</div>
              <div class="number">3</div>
              <div class="number">4</div>
              <div class="number">5</div>
              <div class="number">6</div>
              <div class="number">7</div>
              <div class="number">8</div>
              <div class="number">9</div>
              <div class="number">10</div>
              <div class="number">11</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <%@ include file = "mdl_footer.jsp" %>
</div>
</body>
</html>

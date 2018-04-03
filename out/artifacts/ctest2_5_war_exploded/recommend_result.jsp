<%@ page import="com.business.RecommendPaper" %>
<%@ page import="com.business.Exercise" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/3/24
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>推荐试题 | C Help</title>
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <SCRIPT>
      window.onload = function () {
          var wide = document.body.clientWidth - 20;
          var right = document.getElementById('right');
          if (wide > 1000)
          {
              right.style.left = (wide - 1000) / 2 + 717;
          }
          else
          {
              right.style.left = 717;
          }
      };
      window.onresize = function () {
          var wide = document.body.clientWidth - 20;
          var right = document.getElementById('right');
          if (wide > 1000)
          {
              right.style.left = (wide - 1000) / 2 + 717;
          }
          else
          {
              right.style.left = 717;
          }
      };
  </SCRIPT>
</head>
<body>
<div class="mdl-layout mdl-js-layout">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_header.jsp">
    <jsp:param name="tab" value="6"/>
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <style type="text/css">
    @import url(css/paper.css);
  </style>
  <main class="mdl-layout__content">
    <div class="center-div" id="center">
      <div class="paper-title-div">
        <div class="paper-title"><div>推荐试题</div></div>
        <div class="paper-detial">本卷根据您的作答情况，自动推荐。</div>
        <%
          String listStr = request.getParameter("list");
          RecommendPaper paper = new RecommendPaper(listStr.split(" "), request);
        %>
      </div>
      <div class="main-div">
        <div class="main-left">
          <div class="title1">一、选择题</div>
          <%int orderNumer = 0;
            int optionCount = 1;
            for (Exercise exercise : paper.getExerciseList()) {%>

          <div class="single" id="single-<%=++orderNumer%>">
            <div class="title"><span class="order-number"><%=orderNumer%>&nbsp;[单选题]</span><%=exercise.getHTMLTitle()%></div>
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
              <div class="analysis-inside">参考解析:&nbsp;<%=exercise.getAnalysis()%></div>
            </div>
          </div>
          <%}%>
        </div>
        <div class="main-right" id="right">
          <div class="card-title">答题卡&nbsp;&nbsp;&nbsp;<span class="progress"><%=paper.getCheckCount()%>/<%=orderNumer++%></span></div>
          <div class="card">
            <div class="card-top" id="card-top">
              <script>
                  var card_top = document.getElementById('card-top');
                  var resultArrayStr = '<%=paper.getResultArray()%>';
                  var resultArray = resultArrayStr.split(" ");
                  for (var i = 1; i < <%=orderNumer%>; i++)
                  {
                      var number_a = document.createElement('a');
                      number_a.href = '#single-' + i.toString();
                      number_a.className = 'number-a';
                      var number_div = document.createElement('div');
                      number_div.className = 'number';
                      number_div.id = 'number-' + i.toString();
                      number_div.innerText = i.toString();
                      if ('0' === resultArray[i-1])
                      {
                          number_div.style.backgroundColor = '#FF4040';
                          number_div.style.color = '#FFF';
                      }
                      if ('1' === resultArray[i-1])
                      {
                          number_div.style.backgroundColor = '#7CCD7C';
                          number_div.style.color = '#FFF';
                      }
                      number_a.appendChild(number_div);
                      card_top.appendChild(number_a);
                  }
              </script>
            </div>
            <div class="card-bottom">
              <%int size = paper.getExerciseList().size();%>
              选择题:共<%=size%>道,正确<%=size-paper.getWrongCount()%>道，错误<%=paper.getWrongCount()%>道
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

<%@ page import="com.business.RecommendPaper" %>
<%@ page import="com.business.Exercise" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/3/24
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>推荐试题 | C Help</title>
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <style type="text/css">@import url(css/paper.css);</style>
  <script src="js/paper_card.js"></script>
  <link rel="icon" href="images/logo16.png" type="image/x-icon">
</head>
<body>
<div class="mdl-layout mdl-js-layout">
  <%String username = (String)session.getAttribute("username");%>
  <jsp:include page="mdl_header.jsp">
    <jsp:param name="tab" value="6"/>
    <jsp:param name="username" value="<%=username%>"/>
  </jsp:include>
  <main class="mdl-layout__content">
    <div class="center-div" id="center">
      <div class="paper-title-div">
        <div class="paper-title"><div>推荐试题</div></div>
        <div class="paper-detial">本卷根据您的作答情况，自动推荐。</div>
        <%String listStr = request.getParameter("list");
          RecommendPaper paper = new RecommendPaper(listStr.split(" "), request);%>
      </div>
      <div class="main-div">
        <div class="main-left">
          <div class="title1">一、选择题</div>
          <%int orderNumer = 0;
            int optionCount = 1;
            for (Exercise e : paper.getExerciseList()) {%>
          <div class="single" id="single-<%=++orderNumer%>">
            <div class="title"><span class="order-number"><%=orderNumer%>&nbsp;[单选题]</span><%=e.getHTMLTitle()%></div>
            <div class="option-div">
              <div class="option">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                  <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=e.getId()%> value="1"
                    <%=e.getUserCheck()==1?"Checked":"" %>>
                  <span class="mdl-radio__label">A.&nbsp;<%=e.getaOption()%></span>
                </label>
              </div>
              <div class="option">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                  <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=e.getId()%> value="2"
                    <%=e.getUserCheck()==2?"Checked":"" %>>
                  <span class="mdl-radio__label">B.&nbsp;<%=e.getbOption()%></span>
                </label>
              </div>
              <div class="option">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                  <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=e.getId()%> value="3"
                    <%=e.getUserCheck()==3?"Checked":"" %>>
                  <span class="mdl-radio__label">C.&nbsp;<%=e.getcOption()%></span>
                </label>
              </div>
              <div class="option">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                  <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=e.getId()%> value="4"
                    <%=e.getUserCheck()==4?"Checked":"" %>>
                  <span class="mdl-radio__label">D.&nbsp;<%=e.getdOption()%></span>
                </label>
              </div>
              <div class="collection">
                <div>
                  <label class="mdl-icon-toggle mdl-js-icon-toggle mdl-js-ripple-effect" for="icon-<%=orderNumer%>">
                    <input type="checkbox" id="icon-<%=orderNumer%>" class="mdl-icon-toggle__input"
                           onclick="clc(<%=e.getId()%>, '<%=username%>')" <%=e.getCollection(username)%>>
                    <i class="mdl-icon-toggle__label material-icons">star</i>
                  </label>
                </div>
                <div class="collection-text">收藏此题</div>
              </div>
            </div>
            <div class="answer">参考答案:&nbsp;<span class="answer-text"><%=e.getAnswer()%></span></div>
            <div class="analysis">
              <div class="analysis-inside">参考解析:&nbsp;<%=e.getAnalysis()%></div>
            </div>
          </div>
          <%}%>
        </div>
        <div class="main-right" id="right">
          <div class="card-title">
            答题卡&nbsp;&nbsp;&nbsp;
            <span class="progress"><%=paper.getCheckCount()%>/<%=orderNumer++%></span>
          </div>
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
    <jsp:include page="mdl_footer.jsp"/>
  </main>
</div>
</body>
</html>

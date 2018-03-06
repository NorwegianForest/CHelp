<%@ page import="com.business.Paper" %>
<%@ page import="com.business.Exercise" %><%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/19
  Time: 13:43
  MDL
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>模考训练 | C Help</title>
  <link rel="stylesheet" href="mdl/material.min.css">
  <script src="mdl/material.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <script src="jquery/jquery-3.3.1.js"></script>
</head>
<body>

<div class="mdl-layout mdl-js-layout">

  <%@ include file = "mdl_header.jsp" %>

  <style>
    @import url(css/paper.css);
  </style>

  <script>
      function checkboxOnclick(checkbox)
      {
          if (checkbox.checked === true)
          {
              var checkbox_id = checkbox.id;
              var num = checkbox_id.split('-')[1];
              var form_id = 'form-' + num;
              console.log(form_id);
              checkbox.form.submit();
          }
          else
          {
          }
      }
  </script>
  <main class="mdl-layout__content">
    <div class="center-div">

      <%  String paper_id = request.getParameter("paper_id");
          Paper paper = new Paper(Integer.parseInt(paper_id));%>

      <div class="paper-title-div">
        <div class="paper-title"><div><%=paper.getExerciseList().get(0).getPaperTitle()%></div></div>
        <div class="paper-detial">本卷共分为 4大题 43小题，作答时间为 120分钟，总分 100 分，60 分及格。</div>
      </div>

      <div class="main-div">
        <div class="main-left">
          <div class="title1">一、选择题(每小题1分，共40分)</div>
          <form name="paper" action="paper_results.jsp?paper_id=<%=paper_id %>" method="post">

            <%int orderNumer = 0;
              int optionCount = 1;
              for (Exercise exercise : paper.getExerciseList()) { orderNumer++;%>

            <div class="single" id="single-<%=orderNumer%>">
              <div class="title"><span class="order-number"><%=orderNumer%>&nbsp;[单选题]</span><%=exercise.getTitle()%></div>

              <div class="option-div">
                <div class="option">
                  <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                    <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="1">
                    <span class="mdl-radio__label">A.&nbsp;<%=exercise.getaOption()%></span>
                  </label>
                </div>
                <div class="option">
                  <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                    <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="2">
                    <span class="mdl-radio__label">B.&nbsp;<%=exercise.getbOption()%></span>
                  </label>
                </div>
                <div class="option">
                  <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                    <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="3">
                    <span class="mdl-radio__label">C.&nbsp;<%=exercise.getcOption()%></span>
                  </label>
                </div>
                <div class="option">
                  <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                    <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="4">
                    <span class="mdl-radio__label">D.&nbsp;<%=exercise.getdOption()%></span>
                  </label>
                </div>

                <div class="collection">
                  <div>
                    <label class="mdl-icon-toggle mdl-js-icon-toggle mdl-js-ripple-effect" for="icon-<%=orderNumer%>">
                      <iframe  id="submitFrame" style="display: none;width:0; height:0" name="submitFrame"  src="about:blank"></iframe>
                      <form id="form-<%=orderNumer%>" method="post" action="/collection" target="submitFrame">
                        <input type="checkbox" id="icon-<%=orderNumer%>" class="mdl-icon-toggle__input" onclick="checkboxOnclick(this)">
                        <i class="mdl-icon-toggle__label material-icons">star</i>
                      </form>
                    </label>
                  </div>
                  <div class="collection-text">收藏此题</div>
                </div>

              </div>
            </div>

            <%}%>

          </form>
          <label class="mdl-icon-toggle mdl-js-icon-toggle mdl-js-ripple-effect" for="icon-233">
          <form id="form-233" method="post" action="/collection" target="submitFrame">
            <input type="checkbox" id="icon-233" class="mdl-icon-toggle__input" onclick="checkboxOnclick(this)">
            <i class="mdl-icon-toggle__label material-icons">star</i>
          </form>
          </label>
        </div>
        <div class="main-right">
          <div class="card-title">答题卡&nbsp;&nbsp;&nbsp;<span class="progress">0/<%=orderNumer++%></span></div>
          <div class="card">
            <div class="card-top" id="card-top">
              <script>
                var card_top = document.getElementById('card-top');
                for (var i = 1; i < <%=orderNumer%>; i++)
                {
                    var number_a = document.createElement('a');
                    number_a.href = '#single-' + i.toString();
                    number_a.className = 'number-a';
                    var number_div = document.createElement('div');
                    number_div.className = 'number';
                    number_div.innerText = i.toString();
                    number_a.appendChild(number_div);
                    card_top.appendChild(number_a);
                }
              </script>
            </div>
            <script>
              function Submit()
              {
                  document.paper.submit();
              }
            </script>
            <div class="card-bottom">
              <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" onclick="Submit()">
                完成测试
              </button>
            </div>
          </div>
        </div>
      </div>

    </div>
    <jsp:include page="mdl_footer.jsp"></jsp:include>
  </main>
</div>

</body>
</html>

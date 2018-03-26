<%@ page import="com.business.Paper" %>
<%@ page import="com.business.Exercise" %>
<%@ page import="com.business.Program" %>
<%@ page import="java.util.List" %><%--
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
    <div class="center-div" id="center">

      <%  String paper_id = request.getParameter("paper_id");
          Paper paper = new Paper(Integer.parseInt(paper_id));%>

      <div class="paper-title-div">
        <div class="paper-title"><div><%=paper.getExerciseList().get(0).getPaperTitle()%></div></div>
        <div class="paper-detial">本卷共分为 4大题 43小题，作答时间为 120分钟，总分 100 分，60 分及格。</div>
      </div>

      <div class="main-div">
        <div class="main-left">
          <div class="title1">一、选择题(每小题1分，共40分)</div>
          <script type="text/javascript">
              var radios = [];
              function radioCheck(radio_id)
              {
                  var number_div = document.getElementById('number-' + radio_id.toString());
                  number_div.style.backgroundColor = '#B1B6BF';
                  number_div.style.color = '#FFF';

                  var flag = 1;
                  if (radios.contains(radio_id))
                  {
                      flag = 0;
                  }
                  if (flag)
                  {
                      var progress = document.getElementById('progress');
                      var num = parseInt(progress.innerHTML);
                      num = num + 1;
                      progress.innerHTML = String(num);
                      radios.push(radio_id);
                  }
              }
              Array.prototype.contains = function ( needle ) {
                  for (i in this) {
                      if (this[i] == needle) return true;
                  }
                  return false;
              }
          </script>
          <form name="paper" action="paper_results.jsp?paper_id=<%=paper_id %>" method="post">

            <%int orderNumer = 0;
              int optionCount = 1;
              for (Exercise exercise : paper.getExerciseList()) { orderNumer++;%>

            <div class="single" id="single-<%=orderNumer%>">
              <div class="title"><span class="order-number"><%=orderNumer%>&nbsp;[单选题]</span>
                <span><%=exercise.getHTMLTitle()%></span>
              </div>

              <div class="option-div">
                <div class="option">
                  <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                    <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="1" onchange="radioCheck(<%=orderNumer%>);">
                    <span class="mdl-radio__label">A.&nbsp;<%=exercise.getaOption()%></span>
                  </label>
                </div>
                <div class="option">
                  <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                    <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="2" onchange="radioCheck(<%=orderNumer%>);">
                    <span class="mdl-radio__label">B.&nbsp;<%=exercise.getbOption()%></span>
                  </label>
                </div>
                <div class="option">
                  <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                    <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="3" onchange="radioCheck(<%=orderNumer%>);">
                    <span class="mdl-radio__label">C.&nbsp;<%=exercise.getcOption()%></span>
                  </label>
                </div>
                <div class="option">
                  <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%=optionCount%>">
                    <input type="radio" id="<%=optionCount++%>" class="mdl-radio__button" name=<%=exercise.getId()%> value="4" onchange="radioCheck(<%=orderNumer%>);">
                    <span class="mdl-radio__label">D.&nbsp;<%=exercise.getdOption()%></span>
                  </label>
                </div>

                <%--收藏功能暂不可用--%>
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
            </div>

            <%}%>

            <%List<Program> programList = paper.getProgramList();%>
            <%if (!programList.isEmpty()) {%>
            <div class="single" id="single-<%=++orderNumer%>">
              <div class="title"><span class="order-number"><%=orderNumer%>&nbsp;[程序填空题]&nbsp;</span>
                <%=programList.get(0).getProgramTitle()%>
              </div>
              <div class="code-div">
                <div class="mdl-textfield mdl-js-textfield">
                  <textarea class="mdl-textfield__input" type="text" rows= "20" id="code1" name="code<%=programList.get(0).getProgramId()%>"><%=programList.get(0).getProgramCode()%>
                  </textarea>
                  <label class="mdl-textfield__label" for="code1">code...</label>
                </div>
              </div>
            </div>

            <div class="single" id="single-<%=++orderNumer%>">
              <div class="title"><span class="order-number"><%=orderNumer%>&nbsp;[程序改错题]&nbsp;</span>
                <%=programList.get(1).getProgramTitle()%>
              </div>
              <div class="code-div">
                <div class="mdl-textfield mdl-js-textfield">
                  <textarea class="mdl-textfield__input" type="text" rows= "20" id="code2" name="code<%=programList.get(1).getProgramId()%>"><%=programList.get(1).getProgramCode()%>
                  </textarea>
                  <label class="mdl-textfield__label" for="code2">code...</label>
                </div>
              </div>
            </div>

            <div class="single" id="single-<%=++orderNumer%>">
              <div class="title"><span class="order-number"><%=orderNumer%>&nbsp;[程序设计题]&nbsp;</span>
                <%=programList.get(2).getProgramTitle()%>
              </div>
              <div class="code-div">
                <div class="mdl-textfield mdl-js-textfield">
                  <textarea class="mdl-textfield__input" type="text" rows= "20" id="code3" name="code<%=programList.get(2).getProgramId()%>"><%=programList.get(2).getProgramCode()%>
                  </textarea>
                  <label class="mdl-textfield__label" for="code3">code...</label>
                </div>
              </div>
            </div>
            <%}%>
          </form>

        </div>
        <div class="main-right" id="right">
          <div class="card-title">答题卡&nbsp;&nbsp;&nbsp;<span class="progress" id="progress">0</span><span class="progress">/<%=orderNumer++%></span></div>
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
                    number_div.id = 'number-' + i.toString();
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

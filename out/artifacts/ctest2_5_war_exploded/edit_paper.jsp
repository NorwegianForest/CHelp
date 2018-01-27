<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.business.AdminUser, com.business.Exercise" import="com.business.Paper" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 编辑试题页面，无论章节、模拟、真题，都由此页面编辑，采用?paper_title属性区分，故所有套题的标题必须唯一 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>编辑试题 | C Help</title>
</head>

<body>
<%--管理员登录检测--%>
<%=new AdminUser(session.getAttribute("adminname")).checkLogin() %>

<%	String paper_title = request.getParameter("paper_title");
	session.setAttribute("paper_title", paper_title);
%>

<%@ include file = "banner.jsp" %>
	<div class="container">
	  	<div class="content">
	  
	  	<h2>编辑章节试题</h2>
	  	<a href="add_exercise.jsp?paper_title=<%=paper_title %>">[添加题目]</a>
	  	<form name="edit_paper" action="/EditPaperServlet" method="post">
			<%
				int orderNumber = 1;
				for (Exercise exercise : new Paper(paper_title).getExerciseList()) {
			%>
			<fieldset>
			    <legend align="left"><%=orderNumber++ %>.&nbsp;&nbsp;<input type=text size = 70 name=title value=<%=exercise.getTitle() %>><br></legend>
			    <input type="hidden" name="exercise_id" value=<%=exercise.getId() %>>
			    A.&nbsp;&nbsp;<input type=text size = "70" name=option_a value=<%=exercise.getaOption() %>><br>
			    B.&nbsp;&nbsp;<input type=text size = "70" name=option_b value=<%=exercise.getbOption() %>><br>
			    C.&nbsp;&nbsp;<input type=text size = "70" name=option_c value=<%=exercise.getcOption() %>><br>
			    D.&nbsp;&nbsp;<input type=text size = "70" name=option_d value=<%=exercise.getdOption() %>><br>
				正确答案：	<input type=radio name=<%=exercise.getId() %> <%=exercise.parseAnswerToInt()==1?"Checked":"" %> value="A"/>A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%=exercise.getId() %> <%=exercise.parseAnswerToInt()==2?"Checked":"" %> value="B"/>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%=exercise.getId() %> <%=exercise.parseAnswerToInt()==3?"Checked":"" %> value="C"/>C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%=exercise.getId() %> <%=exercise.parseAnswerToInt()==4?"Checked":"" %> value="D"/>D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<br>
				难度系数：	<input type=radio name=<%="dif"+exercise.getId() %> <%=exercise.getDifficulty()==1?"Checked":"" %> value="1"/>1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%="dif"+exercise.getId() %> <%=exercise.getDifficulty()==2?"Checked":"" %> value="2"/>2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%="dif"+exercise.getId() %> <%=exercise.getDifficulty()==3?"Checked":"" %> value="3"/>3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%="dif"+exercise.getId() %> <%=exercise.getDifficulty()==4?"Checked":"" %> value="4"/>4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%="dif"+exercise.getId() %> <%=exercise.getDifficulty()==5?"Checked":"" %> value="5"/>5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<br>
				参考解析：	<textarea rows="3" cols="60" name="analysis" ><%=exercise.getAnalysis() %></textarea><br>

				<a href="delete_exercise.jsp?exercise_id=<%=exercise.getId() %>&paper_title=<%=paper_title %>" onclick="{if(confirm('确定删除吗?')){return true;}return false;}">[删除本题]</a>
			</fieldset>
			<% 	}%>
			<p>
			<button type="submit">完成编辑</button>
		</form>			
				  
      <!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
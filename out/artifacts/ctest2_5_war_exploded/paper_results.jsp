<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.business.Exercise, com.business.Paper"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 显示一套试题的测试结果，由paper.jsp转跳至此 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>测试结果 | C Help</title>
</head>

<body>

<%@ include file = "banner.jsp" %>
	<div class="container">
	<div class="content">
	<table width=880 align=center ><tr><td>
	<%
		Paper paper = new Paper(request.getParameter("paper_title"), request, username);
		int orderNumber = 1;
		for (Exercise exercise : paper.getExerciseList()) {
	%>
		<fieldset style="border-radius:8px">
			<legend align="left"><%=orderNumber++ %>.&nbsp;&nbsp;<%=exercise.getTitle() %></legend>
			<input type=radio name="<%=exercise.getId() %>" <%= exercise.getUserCheck()==1?"Checked":"" %> >A.&nbsp;&nbsp;<%=exercise.getaOption() %><br>
			<input type=radio name="<%=exercise.getId() %>" <%= exercise.getUserCheck()==2?"Checked":"" %> >B.&nbsp;&nbsp;<%=exercise.getbOption() %><br>
			<input type=radio name="<%=exercise.getId() %>" <%= exercise.getUserCheck()==3?"Checked":"" %> >C.&nbsp;&nbsp;<%=exercise.getcOption() %><br>
			<input type=radio name="<%=exercise.getId() %>" <%= exercise.getUserCheck()==4?"Checked":"" %> >D.&nbsp;&nbsp;<%=exercise.getdOption() %><br>
			<font color=<%=exercise.isCorrect()?"#00FF00":"#FF0000" %>>
                <%=exercise.isCorrect()?Exercise.CORRECT:Exercise.WRONG+exercise.getAnswer() %>
			</font><br>
			试题难度：<%=exercise.getDifficulty() %><br>
			参考解析：<%=exercise.getAnalysis() %><br>
			<a href="collection.jsp?exercise_id=<%=exercise.getId() %>" target="_blank" >[收藏此题]</a><br>
		</fieldset>
		<br>
	<%	}
	%>
		<div align=center><h3><%="共" + paper.getExerciseList().size() + "题，正确" + paper.getRightCount() + "道题"%></h3></div>
	</td></tr></table>
	<br><br><br><br><br><br><br><br><br><br>
	<!-- end .content --></div>
    <!-- end .container --></div>    		
<%@ include file = "footer.jsp" %>	  
</body>
</html>
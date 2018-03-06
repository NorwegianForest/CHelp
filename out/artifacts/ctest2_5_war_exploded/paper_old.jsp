<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.business.Exercise" import="com.business.Paper" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 显示可供作答的一套试题的页面，无论章节、模拟、真题和教师上传的套题，都使用此页面，采用?paper_title参数表示显示那一套试题，
故每套试题的标题唯一 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>章节练习 | C Help</title>
</head>

<body>
<%
String paper_id = request.getParameter("paper_id");
%>

<SCRIPT language=javascript>
function CheckForm(){
	document.papersForm.submit();
}
</SCRIPT>

<%@ include file = "banner.jsp" %>
	<div class="container">
	<div class="content">
		<table width=880 align=center ><tr><td>
		<form name=papersForm action="paper_results.jsp?paper_id=<%=paper_id %>" method="post" target="_blank">
			<%
				Paper paper = new Paper(Integer.parseInt(paper_id));
				int orderNumer = 1;
				for (Exercise exercise : paper.getExerciseList()) {
			%>
			<fieldset style=border-radius:8px>
				<legend align=left><%=orderNumer++ %>.&nbsp;&nbsp;<%=exercise.getTitle() %></legend>
				<input type=radio name="<%=exercise.getId() %>" value="1" >A.&nbsp;&nbsp;<%=exercise.getaOption() %><br>
				<input type=radio name="<%=exercise.getId() %>" value="2" >B.&nbsp;&nbsp;<%=exercise.getbOption() %><br>
				<input type=radio name="<%=exercise.getId() %>" value="3" >C.&nbsp;&nbsp;<%=exercise.getcOption() %><br>
				<input type=radio name="<%=exercise.getId() %>" value="4" >D.&nbsp;&nbsp;<%=exercise.getdOption() %><br>
				<a href="collection.jsp?exercise_id=<%=exercise.getId() %>" target="_blank" >[收藏此题]</a><br>

			</fieldset>
			<p>
			<% 	}
				if (paper.getExerciseList().isEmpty()) {
			%>
			<h2>该卷为空</h2>

			<%	} else {
			%>
			<div align="center"><input type="button" value="完成测试并提交" onClick="CheckForm()"></div>
			<%} %>

		</form>
		</td></tr></table>
		<br><br><br><br><br><br><br><br><br><br>

	<!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
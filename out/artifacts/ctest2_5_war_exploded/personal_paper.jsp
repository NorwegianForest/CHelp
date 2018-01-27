<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.business.Exercise, com.business.OrdinUser"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 显示用户所有收藏的题目或者所有错题，使用?tpye参数，collection表示收藏，mistakes表示错题 -->
<html>
<head>
<title>个人中心 | C Help</title>
</head>

<body>
<%@ include file = "banner.jsp" %>
<div class="container">
	<div class="content">
		<div align="center">
			<h1><%=request.getParameter("type").equals("collection") ? "我的收藏" : "我的错题" %></h1>
		</div>
		<table width=880 align=center ><tr><td>
            <%--登录检测--%>
			<%=new OrdinUser(username).checkLogin() %>
			<%
				OrdinUser ordinUser = new OrdinUser(username, request.getParameter("type"));
				int orderNumber = 1;
				for (Exercise exercise : ordinUser.getExerciseList()) {
			%>
			<fieldset style="border-radius:8px" >
				<legend align="left"><%=orderNumber++ %>.&nbsp;&nbsp;<%=exercise.getTitle() %></legend>
				<font color=<%=exercise.getAnswer().equals("A") ? "#00FF00" : "#000000" %> >A.&nbsp;&nbsp;<%=exercise.getaOption() %></font><br>
				<font color=<%=exercise.getAnswer().equals("B") ? "#00FF00" : "#000000" %> >B.&nbsp;&nbsp;<%=exercise.getbOption() %></font><br>
				<font color=<%=exercise.getAnswer().equals("C") ? "#00FF00" : "#000000" %> >C.&nbsp;&nbsp;<%=exercise.getcOption() %></font><br>
				<font color=<%=exercise.getAnswer().equals("D") ? "#00FF00" : "#000000" %> >D.&nbsp;&nbsp;<%=exercise.getdOption() %></font><br>
				试题难度：<%=exercise.getDifficulty() %><br>
				参考解析：<%=exercise.getAnalysis() %><br>
				试题来源：<a href="paper.jsp?paper_title=<%=exercise.getPaperTitle() %>" ><%=exercise.getPaperTitle() %></a><br>
			</fieldset>

			<%	}
			%>

		</td></tr></table>

		<!-- end .content --></div>
	<%-- end .container --%></div>
<%@ include file = "footer.jsp" %>	
</body>
</html>
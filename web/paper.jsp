<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.DBQuery.DataProcess" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 显示可供作答的一套试题的页面，无论章节、模拟、真题，都使用此页面，采用?paper_title参数表示显示那一套试题，故每套试题的标题唯一 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>章节练习 | C Help</title>
</head>

<body>
<%
String paper_title = request.getParameter("paper_title");
if (!DataProcess.isExist("papers", "paper_title", paper_title)) {
	paper_title = new String(request.getParameter("paper_title").getBytes("ISO-8859-1"),"utf-8");
}
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
		<form name=papersForm action="paper_results.jsp?paper_title=<%=paper_title %>" method="post" target="_blank">
			<%
				String sql = "select * from exercises where paper_title='" + paper_title + "'";
				Connection con = DataProcess.getConnection();
				Statement state = con.createStatement();
				ResultSet rs = state.executeQuery(sql);
				int orderNumber = 1;
				while (rs.next()) {
			%>
			<fieldset style="border-radius:8px">
			    <legend align="left"><%=orderNumber %>.&nbsp;&nbsp;<%=rs.getString("exercise_title") %></legend>
			    <input type=radio name="<%=rs.getString("exercise_id") %>" value="1" >A.&nbsp;&nbsp;<%=rs.getString("a_option") %><br>
			    <input type=radio name="<%=rs.getString("exercise_id") %>" value="2" >B.&nbsp;&nbsp;<%=rs.getString("b_option") %><br>
			    <input type=radio name="<%=rs.getString("exercise_id") %>" value="3" >C.&nbsp;&nbsp;<%=rs.getString("c_option") %><br>
			    <input type=radio name="<%=rs.getString("exercise_id") %>" value="4" >D.&nbsp;&nbsp;<%=rs.getString("d_option") %><br>
			    
			    <a href="collection.jsp?exercise_id=<%=rs.getString("exercise_id") %>" target="_blank" >[收藏此题]</a><br>
			    
			</fieldset>
			<p>
			<%	orderNumber ++;} 
				rs.close();
				state.close();
				con.close();
				if (orderNumber == 1) {
			%>
			
			<h2>该卷为空</h2>
			
			<%} else { %>
			
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
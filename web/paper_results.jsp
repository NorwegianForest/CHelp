<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 显示一套试题的测试结果，由paper.jsp转跳至此 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>测试结果 | C Help</title>
</head>

<body>
<%
String paper_title = request.getParameter("paper_title");
if (!DataProcess.isExist("papers", "paper_title", paper_title)) {
	paper_title = new String(request.getParameter("paper_title").getBytes("ISO-8859-1"),"utf-8");
}
%>

<%@ include file = "banner.jsp" %>
	<div class="container">
	<div class="content">
	<table width=880 align=center ><tr><td>
	<%
		String sql = "select * from exercises where paper_title='" + paper_title + "'";
		Connection con = DataProcess.getConnection();
		Statement state = con.createStatement();
		ResultSet rs = state.executeQuery(sql);
		int orderNumber = 1;
		int rightCount = 0;
		while (rs.next()) {
			String i = rs.getString("exercise_id");
			String checkSub;
			int sub = 0;
			if (request.getParameter(i) != null) {
				checkSub = request.getParameter(i);
				sub = Integer.parseInt(checkSub);
			}
			int answer = Integer.parseInt(rs.getString("answer"));
	%>
	  
		<fieldset style="border-radius:8px">
		    <legend align="left"><%=orderNumber %>.&nbsp;&nbsp;<%=rs.getString("exercise_title") %></legend>
		    <input type=radio name="<%=rs.getString("exercise_id") %>" <%= sub==1?"Checked":"" %> >A.&nbsp;&nbsp;<%=rs.getString("a_option") %><br>
		    <input type=radio name="<%=rs.getString("exercise_id") %>" <%= sub==2?"Checked":"" %> >B.&nbsp;&nbsp;<%=rs.getString("b_option") %><br>
		    <input type=radio name="<%=rs.getString("exercise_id") %>" <%= sub==3?"Checked":"" %> >C.&nbsp;&nbsp;<%=rs.getString("c_option") %><br>
		    <input type=radio name="<%=rs.getString("exercise_id") %>" <%= sub==4?"Checked":"" %> >D.&nbsp;&nbsp;<%=rs.getString("d_option") %><br>
			<font color=<%= answer==sub?"#00FF00":"#FF0000" %>>
			<%
				if (answer == sub) {
					out.print("正确");
					rightCount ++;
				}
				else{
					out.print("错误！正确答案：");
					switch(answer) {
					case 1:out.print("A");break;
					case 2:out.print("B");break;
					case 3:out.print("C");break;
					case 4:out.print("D");break;
					default:break;
					}
					if (username == null || "".equals(username) || "null".equals(username)) {
					} else {
						String mistakesCollectionSql = "insert into mistakes(exercise_id,username)values('" + rs.getString("exercise_id") + "','" + username + "')";
						DataProcess.updateDatabase(mistakesCollectionSql);
						String arrangementSql = "delete from mistakes where(exercise_id,username) in (select exercise_id,username from(select exercise_id,username from mistakes group by exercise_id,username having count(*)>1) s1) and id not in(select id from (select id from mistakes group by exercise_id,username having count(*)>1) s2)";
						DataProcess.updateDatabase(arrangementSql);
					}
				}
			%>			
			</font><br>
			试题难度：<%=rs.getString("difficulty") %><br>
			参考解析：<%=rs.getString("analysis") %><br>
			<a href="collection.jsp?exercise_id=<%=rs.getString("exercise_id") %>" target="_blank" >[收藏此题]</a><br>
		</fieldset>
		<br>			
		<%orderNumber ++;} %>			
		<div align=center><h3><%="共" + --orderNumber + "题，正确" + rightCount + "道题"%></h3></div>		
	</td></tr></table>
	<br><br><br><br><br><br><br><br><br><br>
	<!-- end .content --></div>
    <!-- end .container --></div>    		
<%@ include file = "footer.jsp" %>	  
</body>
</html>
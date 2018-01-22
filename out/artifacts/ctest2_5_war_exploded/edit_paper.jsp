<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>编辑章节试题 | C Help</title>
</head>

<body>
<%
if (session.getAttribute("adminname") == null || "".equals(session.getAttribute("adminname"))) {
	response.sendRedirect("login.jsp");
}
%>

<%
String paper_title = request.getParameter("paper_title");
if (!DataProcess.paperTitleExist(paper_title, "papers")) {
	paper_title = new String(request.getParameter("paper_title").getBytes("ISO-8859-1"),"utf-8");
}
session.setAttribute("paper_title", paper_title);
%>

<%@ include file = "banner.jsp" %>
	<div class="container">
	  	<div class="content">
	  
	  	<h2>编辑章节试题</h2>
	  	<a href="add_exercise.jsp?paper_title=<%=paper_title %>">[添加题目]</a>
	  	<form name="edit_paper" action="/EditPaperServlet" method="post">
			<%
				String sql = "select * from exercises where paper_title='" + paper_title + "'";
				Connection con = DataProcess.getConnection();
				Statement state = con.createStatement();
				ResultSet rs = state.executeQuery(sql);
				int orderNumber = 1;
				while (rs.next()) {
					int answer = Integer.parseInt(rs.getString("answer"));
					int difficulty = Integer.parseInt(rs.getString("difficulty"));
					String name = rs.getString("exercise_id");					
					String difficultyName = "difficulty" + name;
			%>	  
			<fieldset>
			    <legend align="left"><%=orderNumber %>.&nbsp;&nbsp;<input type=text size = 70 name=title value=<%=rs.getString("exercise_title") %>><br></legend>
			    <input type="hidden" name="exercise_id" value=<%=name %>>
			    A.&nbsp;&nbsp;<input type=text size = "70" name=option_a value=<%=rs.getString("a_option") %>><br>
			    B.&nbsp;&nbsp;<input type=text size = "70" name=option_b value=<%=rs.getString("b_option") %>><br>
			    C.&nbsp;&nbsp;<input type=text size = "70" name=option_c value=<%=rs.getString("c_option") %>><br>
			    D.&nbsp;&nbsp;<input type=text size = "70" name=option_d value=<%=rs.getString("d_option") %>><br>
				正确答案：	<input type=radio name=<%=name %> <%= answer==1?"Checked":"" %> value="A"/>A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%=name %> <%= answer==2?"Checked":"" %> value="B"/>B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%=name %> <%= answer==3?"Checked":"" %> value="C"/>C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%=name %> <%= answer==4?"Checked":"" %> value="D"/>D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
						
				难度系数：	<input type=radio name=<%=difficultyName %> <%= difficulty==1?"Checked":"" %> value="1"/>1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%=difficultyName %> <%= difficulty==2?"Checked":"" %> value="2"/>2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%=difficultyName %> <%= difficulty==3?"Checked":"" %> value="3"/>3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%=difficultyName %> <%= difficulty==4?"Checked":"" %> value="4"/>4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=radio name=<%=difficultyName %> <%= difficulty==5?"Checked":"" %> value="5"/>5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
						
				参考解析：	<textarea rows="3" cols="60" name="analysis" ><%=rs.getString("analysis") %></textarea><br>

				<a href="delete_exercise.jsp?exercise_id=<%=rs.getString("exercise_id") %>" onclick="{if(confirm('确定删除吗?')){return true;}return false;}">[删除本题]</a>
			</fieldset>
			<p>
			<%orderNumber++;} %>
			<button type="submit">完成编辑</button>
		</form>			
				  
      <!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
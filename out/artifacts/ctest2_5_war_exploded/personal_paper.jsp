<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/WEB INF/mytag.tld" prefix="control"%>
<%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
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
		<%
			String type = request.getParameter("type");
			String pageTitle = null;
			if (type.equals("collection")) {
			    pageTitle = "我的收藏";
			} else if (type.equals("mistakes")) {
			    pageTitle = "我的错题";
			}
		%>
		<div align="center">
			<h1><%=pageTitle %></h1>
		</div>
		<table width=880 align=center ><tr><td>
			<%
				if (username == null || "".equals(username) || "null".equals(username)) {
					out.print("<SCRIPT language=javascript>alert('请先登录...');location.href='user_login.jsp';</SCRIPT>");;
				} else {
				    String sql = "select * from " + type + " where username='" + username + "'";
					Connection con = DataProcess.getConnection();
					Statement state = con.createStatement();
					ResultSet rs = state.executeQuery(sql);
					int orderNumber = 1;
					while (rs.next()) {
						String exercise_id = rs.getString("exercise_id");
						String sql1 = "select * from exercises where exercise_id='" + exercise_id + "'";
						Connection con1 = DataProcess.getConnection();
						Statement state1 = con1.createStatement();
						ResultSet rs1 = state1.executeQuery(sql1);
						rs1.next();
						String color_a = "#000000";String color_b = "#000000";String color_c = "#000000";String color_d = "#000000";
						switch (Integer.parseInt(rs1.getString("answer"))) {
						case 1:color_a = "#00FF00";break;
						case 2:color_b = "#00FF00";break;
						case 3:color_c = "#00FF00";break;
						case 4:color_d = "#00FF00";break;
						default:break;
						}
			%>
			<fieldset style="border-radius:8px" >
			    <legend align="left"><%=orderNumber %>.&nbsp;&nbsp;<%=rs1.getString("exercise_title") %></legend>
			    <font color=<%=color_a %> >A.&nbsp;&nbsp;<%=rs1.getString("a_option") %></font><br>
			    <font color=<%=color_b %> >B.&nbsp;&nbsp;<%=rs1.getString("b_option") %></font><br>
			    <font color=<%=color_c %> >C.&nbsp;&nbsp;<%=rs1.getString("c_option") %></font><br>
			    <font color=<%=color_d %> >D.&nbsp;&nbsp;<%=rs1.getString("d_option") %></font><br>
			    
				试题难度：<%=rs1.getString("difficulty") %><br>
				参考解析：<%=rs1.getString("analysis") %><br>
				试题来源：<a href="paper.jsp?paper_title=<%=rs1.getString("paper_title") %>" ><%=rs1.getString("paper_title") %></a><br>
			</fieldset>			
			
			<%
						rs1.close();
						state1.close();
						con1.close();
						orderNumber ++;
					}
					rs.close();
					state.close();
					con.close();
			%>

		</td></tr></table>

			<%
				}
			%>
		<!-- end .content --></div>
	<%-- end .container --%></div>
<%@ include file = "footer.jsp" %>	
</body>
</html>
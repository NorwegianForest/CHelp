<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/WEB INF/mytag.tld" prefix="control"%>
<%@page import="com.business.QuestionsList" import="com.DBQuery.DataProcess" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="highlight/styles/default.css" rel="stylesheet">   
<title>学习资料 | C Help</title>
</head>

<body>
<script src="highlight/highlight.pack.js"></script>  
<script >hljs.initHighlightingOnLoad();</script>

<%@ include file = "banner.jsp" %>	
	<div class="container">
	<div class="content">
	  
	<%String file_name = request.getParameter("file_name"); %>

		<table align=center width=960 style="border-collapse:separate; border-spacing:30px 10px;">
			<tr>
	  		<td valign="top" >
	  			<table bgColor=#F0F8FF >
	  				<tr height=40 ><td align=center ><strong>资料列表</strong></td></tr>
	  				<%String sql = "select * from materials order by order_number";
	  				Connection con = DataProcess.getConnection();
	  				Statement state = con.createStatement();
	  				ResultSet rs = state.executeQuery(sql);
	  				while (rs.next()) {
	  					String bgColor = "#FFFFFF";
	  					String fontColor = "#000000";
	  					if (rs.getString("file_name").equals(file_name)){
	  						bgColor = "#528B8B";
	  						fontColor = "#FFFFFF";
	  					}
	  				%>
	  				<tr><td bgColor=<%=bgColor %> ><a href="materials.jsp?file_name=<%=rs.getString("file_name") %>" ><font color=<%=fontColor %> ><%=rs.getString("materials_title") %></font></a></td></tr>
	  				<%}
	  				rs.close();
	  				state.close();
	  				con.close();
	  				%>
	  	
	  			</table>
	  		</td>
	  
	  		<td >

			<%boolean previous = true;
	  		boolean next = true;
	  		String previousMaterialsTitle = null;
	  		String nextMaterialsTitle = null;
	  		String previousFileName = null;
	  		String nextFileName = null;
	  	
	  		sql = "select * from materials where file_name='" + file_name + "'";
	  		int orderNumber = Integer.parseInt(DataProcess.getSingleResult(sql, "order_number"));
	  	  	
	  		sql = "select count(*) from materials";
	  		int count = Integer.parseInt(DataProcess.getSingleResult(sql, "count(*)"));
	  	
	  		if (orderNumber == 1) {
	  			previous = false;
	  		} else {
	  			int previousOrderNumber = orderNumber - 1;
	  			sql = "select * from materials where order_number='" + previousOrderNumber + "'";
	  			previousMaterialsTitle = DataProcess.getSingleResult(sql, "materials_title");
	  			previousFileName = DataProcess.getSingleResult(sql, "file_name");
	  		}
	  		if (orderNumber == count) {
	  			next = false;
	  		} else {
	  			int nextOrderNumber = orderNumber + 1;
	  			sql = "select * from materials where order_number='" + nextOrderNumber + "'";
	  			nextMaterialsTitle = DataProcess.getSingleResult(sql, "materials_title");
	  			nextFileName = DataProcess.getSingleResult(sql, "file_name");
	  		}
	  		%>

				<table align=center width=750 ><tr>
					<td align=left >
						<%if (previous) {%>
						<a href="materials.jsp?file_name=<%=previousFileName %>">上一篇 <%=previousMaterialsTitle %></a>
						<%} else { %>
						第一篇
						<%} %>
					</td>
					<td align=right >
						<%if (next) {%>
						<a href="materials.jsp?file_name=<%=nextFileName %> ">下一篇 <%=nextMaterialsTitle %></a>
						<%} else { %>
						最后一篇
						<%} %>
					</td>
				</tr></table><br>

				<%String url = "meterials/" + file_name + ".jsp";%>

				<jsp:include page='<%="meterials/"+file_name+".jsp" %>' ></jsp:include>

				<br>
				<table align=center width=750 ><tr>
					<td align=left >
						<%if (previous) {%>
						<a href="materials.jsp?file_name=<%=previousFileName %>">上一篇 <%=previousMaterialsTitle %></a>
						<%} else { %>
						第一篇
						<%} %>
					</td>
					<td align=right >
						<%if (next) {%><a href="materials.jsp?file_name=<%=nextFileName %> ">下一篇 <%=nextMaterialsTitle %></a>
						<%} else { %>
						最后一篇
						<%} %>
					</td>
				</tr></table>

			</td>
			</tr>
		</table>
	  
    <!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
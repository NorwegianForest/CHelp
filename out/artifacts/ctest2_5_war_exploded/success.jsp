<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
<%@ taglib uri="/WEB INF/mytag.tld" prefix="control"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管理员 | C Help</title>
<%@ include file = "banner.jsp" %>
</head>

<body>
<%
	if (session.getAttribute("adminname") == null || "".equals(session.getAttribute("adminname"))) {
		response.sendRedirect("login.jsp");
	}
%>
	<div class="container">
		<div class="content">
			<div align="center">
				<table width="900" border="1" bordercolor="#D3D3D3" style="border-collapse:collapse;">
					<tr>
						<td width="50%" valign="top">
							<table width=440 >
								<tr><td align="center" ><h2>编辑章节试题</h2></td></tr>
								<tr><td>
									<control:papers paper_type="chapter" view_type="edit_paper" count="100" />
								</td></tr>
							</table>
						</td>
						<td width="50%" valign="top">
							<table width=440 >
								<tr><td align="center" ><h2>编辑模拟试题</h2></td></tr>
								<tr><td align="right"><a href="create_paper.jsp?paper_type=simulation" >创建新试题</a></td></tr>
								<tr><td><control:papers paper_type="simulation" view_type="edit_paper" count="100" /></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="50%" valign="top">
							<table width=440 >
								<tr><td align="center" ><h2>编辑历年真题</h2></td></tr>
								<tr><td align="right"><a href="create_paper.jsp?paper_type=old">创建新试题</a></td></tr>
								<tr><td><control:papers paper_type="old" view_type="edit_paper" count="100" /></td></tr>
							</table>
						</td>
						<td width="50%" valign="top">
							<table width=440 >
								<tr><td align="center" ><h2>编辑学习资料</h2></td></tr>
								<tr><td></td></tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		
    	<!-- end .content --></div>
    <!-- end .container --></div>		
	
<%@ include file = "footer.jsp" %>
</body>
</html>
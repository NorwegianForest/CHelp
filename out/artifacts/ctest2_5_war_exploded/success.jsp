<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.taglib.PapersTable"  %>
<%@ page import="com.business.AdminUser" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 管理员登录成功页面，实际上以进入管理员的管理中心 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管理员 | C Help</title>
<%@ include file = "banner.jsp" %>
</head>

<body>
<%--管理员登录检测--%>
<%=new AdminUser(session.getAttribute("adminname")).checkLogin() %>
	<div class="container">
		<div class="content">
			<div align="center">
				<table width="900" border="1" bordercolor="#D3D3D3" style="border-collapse:collapse;">
					<tr>
						<td width="50%" valign="top">
							<table width=440 >
								<tr><td align="center" ><h2>编辑章节试题</h2></td></tr>
								<tr><td>
                                    <%--插入编辑章节试题链接列表--%>
                                    <%= new PapersTable(PapersTable.CHAPTER, PapersTable.EDIT_PAPER).getHtmlCode() %>
								</td></tr>
							</table>
						</td>
						<td width="50%" valign="top">
							<table width=440 >
								<tr><td align="center" ><h2>编辑模拟试题</h2></td></tr>
								<tr><td align="right"><a href="create_paper.jsp?paper_type=simulation" >创建新试题</a></td></tr>
								<tr><td>
									<%--插入编辑模拟试题链接列表--%>
									<%= new PapersTable(PapersTable.SIMULATION, PapersTable.EDIT_PAPER).getHtmlCode() %>
								</td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="50%" valign="top">
							<table width=440 >
								<tr><td align="center" ><h2>编辑历年真题</h2></td></tr>
								<tr><td align="right"><a href="create_paper.jsp?paper_type=old">创建新试题</a></td></tr>
								<tr><td>
									<%--插入编辑真题链接列表--%>
                                    <%= new PapersTable(PapersTable.OLD, PapersTable.EDIT_PAPER).getHtmlCode() %>
								</td></tr>
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
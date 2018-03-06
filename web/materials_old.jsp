<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page  import="com.business.Material" import="com.business.PreNexPage" %>
<%@ page import="com.taglib.MaterialsTable" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 学习资料页面，显示不同的学习资料采用?filename参数表示，详细的各个学习资料文件在meterials文件夹中 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="highlight/styles/default.css" rel="stylesheet">   
<title>学习资料 | C Help</title>
</head>

<body>
<!-- 用于代码高亮的JavaScript -->
<script src="highlight/highlight.pack.js"></script>  
<script >hljs.initHighlightingOnLoad();</script>

<%@ include file = "banner.jsp" %>
	<div class="container">
	<div class="content">
	  
		<table align=center width=960 style="border-collapse:separate; border-spacing:30px 10px;">
			<tr>
	  		<td valign="top" >
	  			<table bgColor=#F0F8FF >
	  				<tr height=40 ><td align=center ><strong>资料列表</strong></td></tr>
	  				<%
                        String file_name = request.getParameter("file_name");
						for (Material material : new MaterialsTable().getMaterialList()) {
					%>
					<tr><td bgColor=<%=material.getFileName().equals(file_name) ? "#528B8B" : "#FFFFFF" %> >
						<a href="materials.jsp?file_name=<%=material.getFileName() %>" >
							<font color=<%=material.getFileName().equals(file_name) ? "#FFFFFF" : "#000000" %> >
								<%=material.getTitle() %>
							</font>
						</a>
					</td></tr>
					<%	}
					%>
	  			</table>
	  		</td>
	  
	  		<td >

			<!-- 学习资源上下方的“上/下一篇”的翻页功能 -->
			<%
				PreNexPage p = new PreNexPage(file_name);
	  		%>

				<table align=center width=750 ><tr>
					<td align=left >
						<%if (p.isPre()) {%>
						<a href="materials.jsp?file_name=<%=p.getPreName() %>">上一篇 <%=p.getPreTitle() %></a>
						<%} else { %>
						第一篇
						<%} %>
					</td>
					<td align=right >
						<%if (p.isNex()) {%>
						<a href="materials.jsp?file_name=<%=p.getNexName() %> ">下一篇 <%=p.getNexTitle() %></a>
						<%} else { %>
						最后一篇
						<%} %>
					</td>
				</tr></table><br>

                <!-- 从meterials文件夹中导入对应的学习资源 -->
				<jsp:include page='<%="meterials/"+file_name+".jsp" %>' ></jsp:include>

				<br>
				<table align=center width=750 ><tr>
					<td align=left >
						<%if (p.isPre()) {%>
						<a href="materials.jsp?file_name=<%=p.getPreName() %>">上一篇 <%=p.getPreTitle() %></a>
						<%} else { %>
						第一篇
						<%} %>
					</td>
					<td align=right >
						<%if (p.isNex()) {%>
						<a href="materials.jsp?file_name=<%=p.getNexName() %> ">下一篇 <%=p.getNexTitle() %></a>
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
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/WEB INF/mytag.tld" prefix="control"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 网站主页 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>C语言自学模考系统 | C Help</title>
</head>

<body>
<%@ include file = "banner.jsp" %>
	
	<div class="container">
	<div class="content">
   	<div align="center"><br>
		<table width="900" border="1" bordercolor="#D3D3D3" style="border-collapse:collapse;">
       	  <tr>
       		<td width="50%" valign="top">
       		  <table width=440 >
       			<tr><td align="center" ><h2>章节试题</h2></td></tr>
       			<tr><td><control:papers paper_type="chapter" view_type="paper" count="5" /></td></tr>
       		  </table>
       		</td>
       		<td width="50%" valign="top">
       		  <table width=440 >
       			<tr><td align="center" ><h2>模拟试题</h2></td></tr>
       			<tr><td><control:papers paper_type="simulation" view_type="paper" count="5" /></td></tr>
       		  </table>
       		</td>
       	  </tr>
       	  <tr>
       		<td width="50%" valign="top">
       		  <table width=440 >
       			<tr><td align="center" ><h2>历年真题</h2></td></tr>
       			<tr><td><control:papers paper_type="old" view_type="paper" count="5" /></td></tr>
       		  </table>
       		</td>
       		<td width="50%" valign="top">
       		  <table width=440 >
       			<tr><td align="center" ><h2>学习资料</h2></td></tr>
       			<tr><td><control:materials count="5" /></td></tr>
       		  </table>
       		</td>
       	  </tr>
		</table><br><br><br>
   	</div>
   	<!-- end .content --></div>
    <!-- end .container --></div>
      
<%@ include file = "footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/WEB INF/mytag.tld" prefix="control"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 真题列表页面，olds表示旧的，也用来表示真题 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>真题练习 | C Help</title>
</head>
<body>
<%@ include file = "banner.jsp" %>	
	<div class="container">
		<div class="content">
	  
	  	<table align=center>
	  	<tr><td><h1>真题练习</h1></td></tr>
		<!-- 采用自定义标签control中的papers标签，详见/WEB INF/mytag.tld和/com/taglib中的相关内容 -->
	  	<tr><td align="left" ><control:papers paper_type="old" view_type="paper" count="100" /></td></tr>
	  	</table>
	  	<br><br><br><br><br><br><br><br><br><br><br><br>
      	<!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
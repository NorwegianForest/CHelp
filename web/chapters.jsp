<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.taglib.PapersTable" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 显示所有章节练习 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>章节练习 | C Help</title>
</head>

<body>
<%@ include file = "banner.jsp" %>	
	<div class="container">
	  	<div class="content">
	  
	  	<table align=center>
	  	<tr><td><h1>章节练习</h1></td></tr>
	  	<tr><td align="left" >
			<%--插入所有章节试题链接列表--%>
            <%= new PapersTable(PapersTable.CHAPTER, PapersTable.PAPER).getHtmlCode() %>
		</td></tr>
	  	</table>
	  	<br><br><br><br><br><br><br><br><br><br><br><br>
      	<!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
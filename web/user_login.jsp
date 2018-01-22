<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 用户登录页面 -->
<html>
<head>
<title>用户登录 | C Help</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<style type="text/css">
	<!--
	@import url("../css/OSX.css");
	-->
	</style>
</head>

<SCRIPT language=javascript>
function CheckForm(){
	if(document.user_login.username.value==""){
		alert("请输入用户名！");
		document.user_login.username.focus();
		return false;
	}
	if(document.user_login.password.value == ""){
		alert("请输入密码！");
		document.user_login.password.focus();
		return false;
	}
	document.user_login.submit();
}
</SCRIPT>

<body topmargin="100">
<%@ include file = "banner.jsp" %>
	<div class="container">
		<div class="content">
			<br><br><br><br><br>
			<div align="center">
				<form name="user_login" method="post" action="/UserLoginServlet">
					<table width="480" border="0" cellspacing="1" cellpadding="1" class="tableBorder">
						<tr><td height="40" colspan="2" align="center" class="whitenormal" bgcolor="E4EEFA">C语言自学模考系统用户登陆</td></tr>
						<tr bgcolor="F2F3F5">
							<td height="40" width="30%" align="right" class="normalText">用户名:</td>
							<td height="40" width="70%"><input type="text" name="username" class="textBox"></td>
						</tr>
						<tr bgcolor="F2F3F5">
							<td height="40" align="right" class="normalText">密&nbsp;&nbsp;码:</td>
							<td height="40"><input type="password" name="password" class="textBox"></td>
						</tr>
						<tr align="center">
							<td height="40" colspan="2" bgcolor="E4EEFA">
								<input type="button" name="Submit" value="登录" onClick="CheckForm()">
							</td>
						</tr>
					</table>
				</form>
			</div>
			<br><br><br><br><br><br><br><br><br><br>
	  
	    <!-- end .content --></div>
    <!-- end .container --></div>
<%@ include file = "footer.jsp" %>	  
</body>
</html>
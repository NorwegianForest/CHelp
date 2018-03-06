<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 管理员登录页面 -->
<html>
<head>
<title>管理登录 | C Help</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ include file = "banner.jsp" %>
</head>

<!-- 检测用户名和密码是否输入完整 -->
<SCRIPT language=javascript>
function CheckForm(){
	if(document.loginForm.adminname.value==""){
		alert("请输入用户名！");
		document.loginForm.adminname.focus();
		return false;
	}
	if(document.loginForm.password.value == ""){
		alert("请输入密码！");
		document.loginForm.password.focus();
		return false;
	}
	document.loginForm.submit();
}
</SCRIPT>

<body topmargin="100">

	<div class="container">
	<div class="content">
	<br><br><br><br><br>
		<div align="center">
			<form name="loginForm" method="post" action="LoginServlet">
				<table width="480" border="0" cellspacing="1" cellpadding="1" class="tableBorder">
					<tr><td height="40" colspan="2" align="center" class="whitenormal" bgcolor="E4EEFA">C语言自学模考系统管理登陆</td></tr>
					<tr bgcolor="F2F3F5">
					  <td height="40" width="30%" align="right" class="normalText">用户名:</td>
					  <td height="40" width="70%"><input type="text" name="adminname" class="textBox"></td>
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
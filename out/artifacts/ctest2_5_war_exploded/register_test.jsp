<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 用户注册页面 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户注册 | C Help</title>
</head>

<!-- 检查用户是否输入准确 -->
<SCRIPT language=javascript>
function CheckForm(){
	if(document.registerForm.username.value==""){
		alert("请输入用户名！");
		document.registerForm.username.focus();
		return false;
	}
	if(document.registerForm.password.value == ""){
		alert("请输入密码！");
		document.registerForm.password.focus();
		return false;
	}
	if(document.registerForm.confirm.value == ""){
		alert("请确认密码！");
		document.registerForm.confirm.focus();
		return false;
	}	
	document.registerForm.submit();
}
</SCRIPT>

<body>
<%@ include file = "banner.jsp" %>
	<div class="container">
	  	<div class="content">
	  
	  	<br><br><br><br><br>
		<div align="center">
			<form name="registerForm" method="post" action="/UserRegisterServlet">
				<table width="480" border="0" cellspacing="1" cellpadding="1" class="tableBorder">
					<tr><td height="40" colspan="2" align="center" class="whitenormal" bgcolor="E4EEFA">C语言自学模考系统用户注册</td></tr>
					<tr bgcolor="F2F3F5">
					  <td height="40" width="30%" align="right" class="normalText">用户名:</td>
					  <td height="40" width="70%"><input type="text" name="username" class="textBox"></td>
					</tr>
					<tr bgcolor="F2F3F5">
						<td height="40" align="right" class="normalText">密&nbsp;&nbsp;码:</td>
						<td height="40"><input type="password" name="password" class="textBox"></td>
					</tr>
					<tr bgcolor="F2F3F5">
						<td height="40" align="right" class="normalText">确认密码:</td>
						<td height="40"><input type="password" name="confirm" class="textBox"></td>
					</tr>					
					<tr align="center">
						<td height="40" colspan="2" bgcolor="E4EEFA">
							<input type="button" name="Submit" value="注册" onClick="CheckForm()">
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
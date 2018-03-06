<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/17
  Time: 15:48
  注册页面
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>注册 | C Help</title>
    <link rel="stylesheet" href="mdl/material.min.css">
    <script src="mdl/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<div class="mdl-layout mdl-js-layout">

    <jsp:include page="mdl_header.jsp"></jsp:include>

    <style>
        @import url(css/register.css);
    </style>

    <script>
        window.onload=function () {
            var content = document.getElementById("content-div");
            var w = parseInt(content.clientWidth.toString());
            content.style.height = (w * 0.625) + "px";
        };

        /**
         * @return {boolean}
         */
        function CheckForm(){
            if(document.register.username.value === ""){
                alert("请输入用户名！");
                document.register.username.focus();
                return false;
            } else {
                if (document.register.password.value === "") {
                    alert("请输入密码！");
                    document.register.password.focus();
                    return false;
                } else {
                    if (document.register.confirm.value === "") {
                        alert("请再次输入密码！");
                        document.register.confirm.focus();
                        return false;
                    } else {
                        if (document.register.confirm.value === document.register.password.value) {
                            document.register.submit();
                        } else {
                            alert("两次密码输入有误！");
                            document.register.confirm.focus();
                            return false;
                        }
                    }
                }
            }
        }
    </script>

    <main class="mdl-layout__content">

        <div id="content-div">
            <div id="center-div">
                <div id="login-div">
                    <form name="register" method="post" action="${pageContext.request.contextPath}/UserRegisterServlet">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" id="username" name="username">
                            <label class="mdl-textfield__label" for="username">用户名</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" id="password" name="password">
                            <label class="mdl-textfield__label" for="password">密码</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" id="confirm" name="confirm">
                            <label class="mdl-textfield__label" for="confirm">确认密码</label>
                        </div>
                    </form>
                    <div id="button-div">
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onclick="CheckForm()">
                            注册
                        </button>
                        <a href="login.jsp">
                            <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                                登录
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="mdl_footer.jsp"></jsp:include>

    </main>

</div>

</body>
</html>

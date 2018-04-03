<%--
  Created by IntelliJ IDEA.
  User: szl
  Date: 2018/2/17
  Time: 13:47
  测试使用MDL的登录页面
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录 | C Help</title>
    <link rel="stylesheet" href="mdl/material.min.css">
    <script src="mdl/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<div class="mdl-layout mdl-js-layout">

    <%String username = (String)session.getAttribute("username");%>
    <jsp:include page="mdl_header.jsp">
      <jsp:param name="tab" value="1"/>
      <jsp:param name="username" value="<%=username%>"/>
    </jsp:include>

    <script>
        window.onload=function () {
            var content = document.getElementById("content-div");
            var w = parseInt(content.clientWidth.toString());
            content.style.height = (w * 0.625) + "px";
        }
    </script>
    <style>
        @import url(css/login.css);
    </style>

    <script>
        /**
         * @return {boolean}
         */
       function CheckForm(){
            if(document.login.username.value === ""){
                alert("请输入用户名！");
                document.login.username.focus();
                return false;
            } else {
                if (document.login.password.value === "") {
                    alert("请输入密码！");
                    document.login.password.focus();
                    return false;
                } else {
                    document.login.submit();
                }
            }
        }
    </script>

    <main class="mdl-layout__content">
        <div id="content-div">
            <div id="center-div">
                <div id="login-div">
                    <form name="login" method="post" action="${pageContext.request.contextPath}/UserLoginServlet">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" id="username" name="username">
                            <label class="mdl-textfield__label" for="username">用户名</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" id="password" name="password">
                            <label class="mdl-textfield__label" for="password">密码</label>
                        </div>
                    </form>
                    <div id="button-div">
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onclick="CheckForm()">
                            登录
                        </button>
                        <a href="register.jsp">
                            <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                                注册
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="mdl_footer.jsp"/>

    </main>

</div>
</body>
</html>

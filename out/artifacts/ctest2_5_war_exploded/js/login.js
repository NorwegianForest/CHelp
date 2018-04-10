window.onload=function () {
    var content = document.getElementById("content-div");
    var w = parseInt(content.clientWidth.toString());
    content.style.height = (w * 0.625) + "px";
};
/**
 * @returns {boolean}
 */
function checkLogin(){
    var form = document.getElementById("login-form");
    var username = document.getElementById("username");
    var password = document.getElementById("password");
    if(username.value === ""){
        alert("请输入用户名！");
        username.focus();
        return false;
    } else {
        if (password.value === "") {
            alert("请输入密码！");
            password.focus();
            return false;
        } else {
            form.submit();
        }
    }
}
/**
 * @returns {boolean}
 */
function checkRegister(){
    var form = document.getElementById("register-form");
    var username = document.getElementById("username");
    var password = document.getElementById("password");
    var confirm = document.getElementById("confirm");
    if(username.value === ""){
        alert("请输入用户名！");
        username.focus();
        return false;
    } else {
        if (password.value === "") {
            alert("请输入密码！");
            password.focus();
            return false;
        } else {
            if (confirm.value === "") {
                alert("请再次输入密码！");
                confirm.focus();
                return false;
            } else {
                if (confirm.value === password.value) {
                    form.submit();
                } else {
                    alert("两次密码输入有误！");
                    confirm.focus();
                    return false;
                }
            }
        }
    }
}

window.onload = function () {
    var wide = document.body.clientWidth - 20;
    var right = document.getElementById('right');
    if (right != null) {
        if (wide > 1000) {
            right.style.left = (wide - 1000) / 2 + 717;
        }
        else {
            right.style.left = 717;
        }
    }
};
window.onresize = function () {
    var wide = document.body.clientWidth - 20;
    var right = document.getElementById('right');
    if (right != null) {
        if (wide > 1000) {
            right.style.left = (wide - 1000) / 2 + 717;
        }
        else {
            right.style.left = 717;
        }
    }
};
function clc(exercise_id, username) {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp=new XMLHttpRequest();
    }
    else {
        // IE6, IE5 浏览器执行代码
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }

    var url = '/collection';
    xmlhttp.open("POST", url, true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("exercise_id=" + exercise_id + "&username=" + username);
}
function del(exercise_id, username) {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp=new XMLHttpRequest();
    }
    else {
        // IE6, IE5 浏览器执行代码
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }

    var url = '/delete_mistake';
    xmlhttp.open("POST", url, true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("exercise_id=" + exercise_id + "&username=" + username);

    window.location.href = 'personal_mistake.jsp';
}
function getResult(userProgramId) {
    var text = document.getElementById('text-' + userProgramId);

    var xmlhttp;
    if (window.XMLHttpRequest) {
        //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp=new XMLHttpRequest();
    }
    else {
        // IE6, IE5 浏览器执行代码
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }

    var url = '/program_result';
    xmlhttp.open("POST", url, true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("user_program_id=" + userProgramId);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4) {
            if (xmlhttp.status === 200) {
                if (xmlhttp.responseText === '1') {
                    text.innerText = '正确';
                } else if (xmlhttp.responseText === '-1') {
                    text.innerText = '错误';
                } else if (xmlhttp.responseText === '0') {
                    text.innerText = '尚未判题';
                } else {
                    text.innerText = '未知';
                }
            } else {
                text.innerText = '获取结果失败';
            }
        }

    };
}
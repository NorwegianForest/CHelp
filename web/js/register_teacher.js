function check() {
    var name = document.getElementById('name');
    var university = document.getElementById('university');
    var title = document.getElementById('title');
    var introduce = document.getElementById('introduce');
    if (name.value === "") {
        alert('请输入姓名');
        name.focus();
        return false;
    }
    if (university.value === "") {
        alert('请输入任职高校');
        university.focus();
        return false;
    }
    if (title.value === "") {
        alert('请输入职称');
        title.focus();
        return false;
    }
    if (introduce.value === "") {
        alert('请输入个人简介');
        introduce.focus();
        return false;
    }
    return true;
}
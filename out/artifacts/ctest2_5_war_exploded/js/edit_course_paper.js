function delSub (exercise_id) {
    var upForm = document.getElementById("update");
    var delInput = document.getElementById("delete_id");
    var addInput = document.getElementById("add");
    delInput.value = exercise_id;
    addInput.value = 0;
    upForm.submit();
}
function addSub () {
    var upForm = document.getElementById("update");
    var delInput = document.getElementById("delete_id");
    var addInput = document.getElementById("add");
    delInput.value = 0;
    addInput.value = 1;
    upForm.submit();
}
function upSub () {
    var upForm = document.getElementById("update");
    var delInput = document.getElementById("delete_id");
    var addInput = document.getElementById("add");
    delInput.value = 0;
    addInput.value = 0;
    upForm.submit();
}
function check () {
    var delInput = document.getElementById("delete_id");
    var addInput = document.getElementById("add");
    return !(delInput.value == null || addInput.value == null);
}

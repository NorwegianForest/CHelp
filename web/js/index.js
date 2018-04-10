var Fadeflag = true;
function Fade() {
    /**
     * 淡入效果
     * @param {Object} obj
     */
    this.show = function (obj) {
        var num = 0;
        if (Fadeflag) {
            var st = setInterval(function () {
                num++;
                Fadeflag = false;
                obj.style.opacity = num / 40;
                if (num >= 40) {
                    clearInterval(st);
                    Fadeflag = true;
                }
            }, 30);
        }
    }
}
window.onload=function () {
    var div_mid = document.getElementById("div-mid");
    var mid_left = document.getElementById("mid-left");
    var mid_right = document.getElementById("mid-right");
    var cover = document.getElementById("cover");
    var w = parseInt(document.getElementById("div-top").clientWidth.toString());
    div_mid.style.width = w + "px";
    div_mid.style.height = w + "px";
    mid_left.style.height = w + "px";
    mid_right.style.height = w + "px";
    var r = w / 0.765;
    cover.style.width = 2 * r + "px";
    cover.style.height = 2 * r + "px";
    var d1 = w * 0.5 - r;
    var pad = 8;
    cover.style.left = parseInt(document.getElementById("top-left").clientWidth.toString()) + d1 + pad + "px";
    cover.style.top = parseInt(document.getElementById("top-left").clientHeight.toString()) + d1 + pad + "px";

    var fade = new Fade();
    fade.show(document.getElementById("paper-div"));
};
window.onresize=function(){
    var div_mid = document.getElementById("div-mid");
    var mid_left = document.getElementById("mid-left");
    var mid_right = document.getElementById("mid-right");
    var cover = document.getElementById("cover");
    var w = parseInt(document.getElementById("div-top").clientWidth.toString());
    div_mid.style.width = w + "px";
    div_mid.style.height = w + "px";
    mid_left.style.height = w + "px";
    mid_right.style.height = w + "px";
    var r = w / 0.765;
    cover.style.width = 2 * r + "px";
    cover.style.height = 2 * r + "px";
    var d1 = w * 0.5 - r;
    var pad = 8;
    cover.style.left = parseInt(document.getElementById("top-left").clientWidth.toString()) + d1 + pad + "px";
    cover.style.top = parseInt(document.getElementById("top-left").clientHeight.toString()) + d1 + pad + "px";
};

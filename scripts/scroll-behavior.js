$(window).scroll(function () {
    var winTop = $(window).scrollTop();
    if (winTop >= 50) {
        $("#menu").css("background-color", "rgba(25, 25, 25, 0.9)");
        console.log("more than 100");
    } else {
        $("#menu").css("background-color", "rgba(51,51,51)");
        console.log("no");
    }
});
var displayed = 0;
$(".fa-bars").click(function () {
    if (displayed === 0) {
        $("#menu>nav>div").css("display", "block");
        $("#menu").css("height", "250px");
        displayed = 1;
    }
    else {
        $("#menu>nav>div:not(:first-child)").css("display", "none");
        $("#menu").css("height", "50px");
        displayed = 0;
    }
    
})
$(document).ready(() => {
    var displayed = 0;
    $(".fa-bars").click(() => {
        $("#nav>ul>li").css("display", "block");
        $("#nav>ul").css("padding-top", "70px");
        $("#nav").css({ "height": "100vh" });
        console.log('displayed')
        displayed = 1;
        $(".fa-bars").css("display", "none");
        $(".fa-times").css("display", "inline-block");


    });

    $(".fa-times").click(() => {
        $("#nav>ul>li").css("display", "none");
        $("#nav>ul").css("padding-top", "20px");
        $("#nav").css("height", "0px");
        console.log('not displayed')
        displayed = 0;
        $(".fa-times").css("display", "none");
        $(".fa-bars").css("display", "inline-block");

    });

})
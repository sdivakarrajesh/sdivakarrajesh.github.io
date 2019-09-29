$(document).ready(() => {
    var displayed = 0;
    $(".fa-bars").click(() => {
        if (displayed === 0) {
            $("#nav>ul>li").css("display", "block");
            $("#nav").css({ "height": "100vh" });
            console.log('displayed')
            displayed = 1;
        } else {
            $("#nav>ul>li").css("display", "none");
            $("#nav").css("height", "0px");
            console.log('not displayed')

            displayed = 0;
        }
    });
})
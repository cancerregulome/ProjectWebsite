$(document).ready(function() {
    var currentPage = 0;
    var pages = $(".page");
    var maxPage = pages.length - 1;

    $(".previous").on("click", "a", function (e) {
        pages.eq(currentPage).hide();
        currentPage = Math.max(0, --currentPage);
        insertPage(pages.eq(currentPage));
        updatePager();
    });
    $(".next").on("click", "a", function (e) {
        pages.eq(currentPage).hide();
        currentPage = Math.min(maxPage, ++currentPage);
        insertPage(pages.eq(currentPage));
        updatePager();
    });

    function insertPage(selection) {
        $(".sideEvents-body").html($(selection).innerHTML);
        $(selection).show();
    }

    function updatePager() {
        var top;
        if (currentPage <= 0) {
            $(".previous").addClass("disabled");
        } else {
            $(".previous").removeClass("disabled");
        }
        if (currentPage >= maxPage) {
            $(".next").addClass("disabled");
        } else {
            $(".next").removeClass("disabled");
        }
    }
    insertPage(pages.eq(0));
    updatePager();
});
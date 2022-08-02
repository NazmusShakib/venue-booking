!(function (e) {
    "use strict";
    var t = e(window);
    t.on("load", function () {
        var l = e(document),
            a = e("html, body"),
            n = e("#preloader"),
            i = e(".main-menu-content .dropdown-menu-item"),
            o = document.querySelector(".header-menu-wrapper"),
            s = e("#back-to-top"),
            r = e("#single-content-nav .scroll-link");
        if (
            (n.delay("500").fadeOut(2e3),
                l.on("click", ".down-button", function () {
                    e(this).toggleClass("active"), e(".header-top-bar").slideToggle(200);
                }),
                l.on("click", ".menu-toggler", function () {
                    e(this).toggleClass("active"), e(".main-menu-content").slideToggle(200);
                }),
                i
                    .parent("li")
                    .children("a")
                    .append(function () {
                        return '<button class="drop-menu-toggler" type="button"><i class="la la-angle-down"></i></button>';
                    }),
                l.on("click", ".main-menu-content .drop-menu-toggler", function () {
                    return e(this).parent().parent().children(".dropdown-menu-item").toggle(), !1;
                }),
                e(".main-menu-content .dropdown-menu-item .sub-menu")
                    .parent("li")
                    .children("a")
                    .append(function () {
                        return '<button class="sub-menu-toggler" type="button"><i class="la la-plus"></i></button>';
                    }),
                l.on("click", ".main-menu-content .dropdown-menu-item .sub-menu-toggler", function () {
                    return e(this).parent().parent().children(".sub-menu").toggle(), !1;
                }),
                l.on("click", ".user-menu-open", function () {
                    e(".user-canvas-container").addClass("active");
                }),
                l.on("click", ".side-menu-close", function () {
                    e(".user-canvas-container, .sidebar-nav").removeClass("active");
                }),
                l.on("click", ".menu-toggler", function () {
                    e(".sidebar-nav").toggleClass("active");
                }),
                t.on("resize", function () {
                    t.width() > 991
                        ? (e(".main-menu-content").show(), e(".dropdown-menu-item").show(), e(".sub-menu").show(), e(".header-top-bar").show())
                        : (e(".main-menu-content").hide(), e(".dropdown-menu-item").hide(), e(".sub-menu").hide(), e(".header-top-bar").hide());
                }),
                e(o).length)
        )
            var z = o.offsetTop;
        t.on("scroll", function () {
            t.scrollTop() >= z ? ((document.body.style.paddingTop = o.offsetHeight + "px"), document.body.classList.add("fixed-nav")) : ((document.body.style.paddingTop = "0px"), document.body.classList.remove("fixed-nav")),
                t.scrollTop() > 500 ? e(s).addClass("active") : e(s).removeClass("active"),
                e(".page-scroll").each(function () {
                    e(this).offset().top - e(window).scrollTop() < 20 &&
                    (r.removeClass("active"),
                        e("#single-content-nav")
                            .find('[components-scroll="' + e(this).attr("id") + '"]')
                            .addClass("active"));
                });
        }),
        r.on("click", function (t) {
            var l = e(e(this).attr("href"));
            e(a).animate({ scrollTop: l.offset().top }, 600), e(this).addClass("active"), t.preventDefault();
        }),
        l.on("click", "#back-to-top", function () {
            return e(a).animate({ scrollTop: 0 }, 800), !1;
        }),

        l.on("click", ".toggle-menu > li .toggle-menu-icon", function (t) {
            return (
                t.preventDefault(),
                e(this).closest("li").siblings().removeClass("active").find(".toggle-drop-menu, .dropdown-menu-item").slideUp(200),
                e(this).closest("li").toggleClass("active").find(".toggle-drop-menu, .dropdown-menu-item").slideToggle(200),
                !1
            );
        }),
        e(".dropdown-btn").on("click", function (t) {
            t.preventDefault(), e(this).next(".dropdown-menu-wrap").slideToggle(300), t.stopPropagation();
        }),
        l.on("click", function (t) {
            var l = e(".dropdown-contain");
            l === t.target || l.has(t.target).length || e(".dropdown-menu-wrap").slideUp(300);
        });
    });
})(jQuery);
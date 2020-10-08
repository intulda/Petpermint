"use strict";
(($, exports) => {

    $.extend(true, window, {
        "Main": Main
    })

    function Main() {

        function init() {
            $('.story__card-wrap').click(function (e) {
                const link = $(this).data('link');
                if(link !== undefined) {
                    location.href = link;
                }
            })
        }

        $.extend(this, {
            init: init
        })
    }

    const main = new Main();
    main.init();

})(jQuery, window);
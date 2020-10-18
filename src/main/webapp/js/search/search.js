"use strict";
(($, exports) => {

    $.extend(true, window, {
        "Search": Search
    })

    function Search() {

        function init() {

        }

        $.extend(this, {
            init: init
        })
    }

    const search = new Search();
    search.init();

})(jQuery, window);
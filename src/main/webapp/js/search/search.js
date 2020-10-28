"use strict";
(($, exports) => {

    $.extend(true, window, {
        "Search": Search
    })

    function Search() {

        function init() {
            $('.search__contents-list').on('click', 'li', goToLink);
            $('.search__more').click(goToLink);
        }

        function goToLink(e) {
            const link = $(this).data('link');
            if(link !== undefined) {
                location.href = link;
            }
        }

        $.extend(this, {
            init: init
        })
    }

    $(document).ready(function () {
        const search = new Search();
        search.init();
    });
})(jQuery, window);
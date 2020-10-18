"use strict";
(($, exports) => {

    $.extend(true, window, {
        "Main": Main
    })

    function Main() {

        function init() {
            $('.story__card-wrap').click(goToLink);
            $('.lostPet__card-wrap').click(goToLink);
            $('.story__more').click(goToLink);
            $('#headerSearchBtn').click(search);
        }

        function search(e) {
            $.ajax({
                url: '/search',
                type: 'POST',
                data: JSON.stringify({
                    keyword: $('#headerSearch').val()
                }),
                contentType: 'application/json',
                success: function (response) {
                    $('#mainContainer').html(response);
                }

            })
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
        const main = new Main();
        main.init();
    });
})(jQuery, window);
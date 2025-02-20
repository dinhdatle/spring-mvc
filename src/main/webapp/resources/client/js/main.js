(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow').css('top', -55);
            } else {
                $('.fixed-top').removeClass('shadow').css('top', 0);
            }
        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })
    });


    // Product Quantity
    // $('.quantity button').on('click', function () {
    //     let change = 0;
    //     var button = $(this);
    //     var oldValue = button.parent().parent().find('input').val();
    //     if (button.hasClass('btn-plus')) {
    //         var newVal = parseFloat(oldValue) + 1;
    //         change = 1;
    //     } else {
    //         if (oldValue > 1) {
    //             var newVal = parseFloat(oldValue) - 1;
    //             change = -1;
    //         } else {
    //             newVal = 1;
    //         }
    //     }

    //     button.parent().parent().find('input').val(newVal);

    //     //get price 
    //     const price = button.parent().parent().find('input').attr('data-cart-detail-price');
    //     const id = button.parent().parent().find('input').attr('data-cart-detail-id');

    //     const priceElement = $(`p[data-cart-detail-id="${id}"]`);
    //     if (priceElement) {
    //         const newPrice = +price * newVal;
    //         priceElement.text(newPrice.toLocaleString('it-IT', { style: 'currency', currency: 'VND' }));
    //     }

    //     const totalPriceElement = $('p[data-cart-total-price]');

    //     if (totalPriceElement && totalPriceElement.length) {
    //         const currentTotal = totalPriceElement.first().attr("data-cart-total-price");
    //         let newTotal = +currentTotal;
    //         if (change === 0) {
    //             newTotal = +currentTotal;
    //         } else {
    //             newTotal = change * (+price) + (+currentTotal);
    //         }

    //         // change 
    //         change = 0;

    //         // ipdate total 

    //         totalPriceElement?.each(function (index, element) {
    //             $(totalPriceElement[index]).text(newTotal.toLocaleString('it-IT', { style: 'currency', currency: 'VND' }));
    //             $(totalPriceElement[index]).attr("data-cart-total-price", newTotal);


    //         });
    //     }
    // })

    $('.quantity button').on('click', function () {
        let button = $(this);
        let input = button.parent().parent().find('input');
        let oldValue = parseInt(input.val());
        let newVal = oldValue;

        if (button.hasClass('btn-plus')) {
            newVal = oldValue + 1;
        } else if (button.hasClass('btn-minus') && oldValue > 1) {
            newVal = oldValue - 1;
        }

        input.val(newVal);

        let price = parseFloat(input.attr('data-cart-detail-price'));
        let id = input.attr('data-cart-detail-id');

        let priceElement = $(`p[data-cart-detail-id="${id}"]`);
        if (priceElement.length) {
            let newPrice = price * newVal;
            priceElement.text(newPrice.toLocaleString('it-IT', { style: 'currency', currency: 'VND' }));
        }

        // Cập nhật tổng tiền từ tất cả các sản phẩm thay vì dùng `change`
        let totalPrice = 0;
        $('input[data-cart-detail-price]').each(function () {
            let quantity = parseInt($(this).val());
            let unitPrice = parseFloat($(this).attr('data-cart-detail-price'));
            totalPrice += quantity * unitPrice;
        });

        let totalPriceElement = $('p[data-cart-total-price]');
        totalPriceElement.each(function () {
            $(this).text(totalPrice.toLocaleString('it-IT', { style: 'currency', currency: 'VND' }));
            $(this).attr("data-cart-total-price", totalPrice);
        });
    });


})(jQuery);





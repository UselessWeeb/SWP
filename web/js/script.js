(function ($) {

    "use strict";

    var searchPopup = function () {
        // open search box
        $('#header-nav').on('click', '.search-button', function (e) {
            $('.search-popup').toggleClass('is-visible');
        });

        $('#header-nav').on('click', '.btn-close-search', function (e) {
            $('.search-popup').toggleClass('is-visible');
        });

        $(".search-popup-trigger").on("click", function (b) {
            b.preventDefault();
            $(".search-popup").addClass("is-visible"),
                    setTimeout(function () {
                        $(".search-popup").find("#search-popup").focus()
                    }, 350)
        }),
                $(".search-popup").on("click", function (b) {
            ($(b.target).is(".search-popup-close") || $(b.target).is(".search-popup-close svg") || $(b.target).is(".search-popup-close path") || $(b.target).is(".search-popup")) && (b.preventDefault(),
                    $(this).removeClass("is-visible"))
        }),
                $(document).keyup(function (b) {
            "27" === b.which && $(".search-popup").removeClass("is-visible")
        })
    }

    var countdownTimer = function () {
        function getTimeRemaining(endtime) {
            const total = Date.parse(endtime) - Date.parse(new Date());
            const seconds = Math.floor((total / 1000) % 60);
            const minutes = Math.floor((total / 1000 / 60) % 60);
            const hours = Math.floor((total / (1000 * 60 * 60)) % 24);
            const days = Math.floor(total / (1000 * 60 * 60 * 24));
            return {
                total,
                days,
                hours,
                minutes,
                seconds
            };
        }

        function initializeClock(id, endtime) {
            const clock = document.getElementById(id);
            const daysSpan = clock.querySelector('.days');
            const hoursSpan = clock.querySelector('.hours');
            const minutesSpan = clock.querySelector('.minutes');
            const secondsSpan = clock.querySelector('.seconds');

            function updateClock() {
                const t = getTimeRemaining(endtime);
                daysSpan.innerHTML = t.days;
                hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
                minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
                secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);
                if (t.total <= 0) {
                    clearInterval(timeinterval);
                }
            }
            updateClock();
            const timeinterval = setInterval(updateClock, 1000);
        }

        $('#countdown-clock').each(function () {
            const deadline = new Date(Date.parse(new Date()) + 28 * 24 * 60 * 60 * 1000);
            initializeClock('countdown-clock', deadline);
        });
    }

    var initProductQty = function () {

        $('.product-qty').each(function () {

            var $el_product = $(this);
            var quantity = 0;

            $el_product.find('.quantity-right-plus').click(function (e) {
                e.preventDefault();
                var quantity = parseInt($el_product.find('#quantity').val());
                $el_product.find('#quantity').val(quantity + 1);
            });

            $el_product.find('.quantity-left-minus').click(function (e) {
                e.preventDefault();
                var quantity = parseInt($el_product.find('#quantity').val());
                if (quantity > 0) {
                    $el_product.find('#quantity').val(quantity - 1);
                }
            });

        });

    }

    $(document).ready(function () {

        searchPopup();
        initProductQty();
        countdownTimer();

        /* Video */
        var $videoSrc;
        $('.play-btn').click(function () {
            $videoSrc = $(this).data("src");
        });

        $('#myModal').on('shown.bs.modal', function (e) {

            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#myModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })

        var mainSwiper = new Swiper(".main-swiper", {
            speed: 500,
            navigation: {
                nextEl: ".main-slider-button-next",
                prevEl: ".main-slider-button-prev",
            },
        });

        var productSwiper = new Swiper(".product-swiper", {
            slidesPerView: 1,
            navigation: {
                nextEl: ".product-slider-button-next",
                prevEl: ".product-slider-button-prev",
            }
//            breakpoints: {
//                0: {
//                    slidesPerView: 1,
//                },
//                270: {
//                    slidesPerView: 2,
//                },
//                660: {
//                    slidesPerView: 3,
//                },
//                980: {
//                    slidesPerView: 4,
//                },
//                1500: {
//                    slidesPerView: 5,
//                }
//            },
        });

        var testimonialSwiper = new Swiper(".testimonial-swiper", {
            spaceBetween: 20,
            navigation: {
                nextEl: ".testimonial-button-next",
                prevEl: ".testimonial-button-prev",
            },
            breakpoints: {
                0: {
                    slidesPerView: 1,
                },
                270: {
                    slidesPerView: 2,
                },
                800: {
                    slidesPerView: 3,
                },
                1000: {
                    slidesPerView: 4,
                }
            },
        });

        var thumb_slider = new Swiper(".thumb-swiper", {
            slidesPerView: 1,
        });
        var large_slider = new Swiper(".large-swiper", {
            spaceBetween: 10,
            effect: 'fade',
            thumbs: {
                swiper: thumb_slider,
            },
        });

    }); // End of a document ready

    window.onload = function () {
        setTimeout(function () {
            var loader = document.querySelector('.preloader-container');
            loader.classList.add("active_new");
        }, 4000);

        const spans = document.querySelectorAll('.preloader-text span');
        spans.forEach((span, index) => {
            setTimeout(() => {
                span.style.opacity = '1';
                span.style.animation = ' expandWidth 10s forwards, fadeOut 5s forwards';
            }, index * 200);
        });
    };
    
    function sendForm(){
        $("#form").submit();
    }
})(jQuery);

window.onload = function () {
    slideOne();
    slideTwo();
};

let sliderOne = document.getElementById("slider-1");
let sliderTwo = document.getElementById("slider-2");
let displayValOne = document.getElementById("range1");
let displayValTwo = document.getElementById("range2");
let minGap = 0;
let sliderTrack = document.querySelector(".slider-track");
let sliderMaxValue = document.getElementById("slider-1").max;
function slideOne() {
    if (parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap) {
        sliderOne.value = parseInt(sliderTwo.value) - minGap;
    }
    displayValOne.textContent = sliderOne.value;
    fillColor();
}
function slideTwo() {
    if (parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap) {
        sliderTwo.value = parseInt(sliderOne.value) + minGap;
    }
    displayValTwo.textContent = sliderTwo.value;
    fillColor();
}
function fillColor() {
    percent1 = (sliderOne.value / sliderMaxValue) * 100;
    percent2 = (sliderTwo.value / sliderMaxValue) * 100;
    sliderTrack.style.background = `linear-gradient(to right, #dadae5 ${percent1}% , #ff6543 ${percent1}% , #ff6543 ${percent2}%, #dadae5 ${percent2}%)`;
}
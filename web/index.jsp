
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>ShopLite - Simple eCommerce Website</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
    </head>

    <body>
        <%@include file = "view/header.jsp" %>
        <section id="billboard" class="position-relative d-flex align-items-center py-5 bg-light-gray" style="background-image: url(images/banner-image-bg.jpg); background-size: cover; background-repeat: no-repeat; background-position: center;">
            <div class="position-absolute end-0 pe-0 pe-xxl-5 me-0 me-xxl-5 swiper-next main-slider-button-next">
                <svg class="chevron-forward-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                <use xlink:href="#alt-arrow-right-outline"></use>
                </svg>
            </div>
            <div class="position-absolute start-0 ps-0 ps-xxl-5 ms-0 ms-xxl-5 swiper-prev main-slider-button-prev">
                <svg class="chevron-back-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                <use xlink:href="#alt-arrow-left-outline"></use>
                </svg>
            </div>
            <div class="swiper main-swiper">
                <div class="swiper-wrapper d-flex align-items-center">
                    <c:forEach items="${sliderList}" var="slider">
                        <div class="swiper-slide">
                            <div class="container">
                                <div class="row d-flex flex-column-reverse flex-md-row align-items-center">
                                    <div class="col-md-5 offset-md-1">
                                        <div class="banner-content">
                                            <h2>${slider.title}</h2>
                                            <p>${slider.details}</p>
                                            <a href="${slider.backlink}" class="btn mt-3">Shop Collection</a>
                                        </div>
                                    </div>
                                    <div class="col-md-6 text-center">
                                        <div class="image-holder">
                                            <img src="${slider.images}" class="img-fluid" alt="banner">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <section id="company-services" class="padding-large">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 pb-3 pb-lg-0">
                        <div class="icon-box d-flex">
                            <div class="icon-box-icon pe-3 pb-3">
                                <svg class="cart-outline">
                                <use xlink:href="#cart-outline" />
                                </svg>
                            </div>
                            <div class="icon-box-content">
                                <h4 class="card-title mb-1 text-uppercase text-dark">Free delivery</h4>
                                <p>Consectetur adipi elit lorem ipsum dolor sit amet.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 pb-3 pb-lg-0">
                        <div class="icon-box d-flex">
                            <div class="icon-box-icon pe-3 pb-3">
                                <svg class="quality">
                                <use xlink:href="#quality" />
                                </svg>
                            </div>
                            <div class="icon-box-content">
                                <h4 class="card-title mb-1 text-uppercase text-dark">Quality guarantee</h4>
                                <p>Dolor sit amet orem ipsu mcons ectetur adipi elit.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 pb-3 pb-lg-0">
                        <div class="icon-box d-flex">
                            <div class="icon-box-icon pe-3 pb-3">
                                <svg class="price-tag">
                                <use xlink:href="#price-tag" />
                                </svg>
                            </div>
                            <div class="icon-box-content">
                                <h4 class="card-title mb-1 text-uppercase text-dark">Daily offers</h4>
                                <p>Amet consectetur adipi elit loreme ipsum dolor sit.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 pb-3 pb-lg-0">
                        <div class="icon-box d-flex">
                            <div class="icon-box-icon pe-3 pb-3">
                                <svg class="shield-plus">
                                <use xlink:href="#shield-plus" />
                                </svg>
                            </div>
                            <div class="icon-box-content">
                                <h4 class="card-title mb-1 text-uppercase text-dark">100% secure payment</h4>
                                <p>Rem Lopsum dolor sit amet, consectetur adipi elit.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="categories">
            <div class="container">
                <div class="section-title overflow-hidden mb-4">
                    <h3 class="d-flex align-items-center">Categories</h3>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="card text-center py-4 mb-3 border rounded-3">
                            <a href="shop.html">
                                <img src="images/cat-item1.png" class="img-fluid" alt="cart item">
                                <h5 class="mt-2"><a href="shop.html">Phones</a></h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card text-center py-4 mb-3 border rounded-3">
                            <a href="shop.html">
                                <img src="images/cat-item2.png" class="img-fluid" alt="cart item">
                                <h5 class="mt-2"><a href="shop.html">PlayStations</a></h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card text-center py-4 mb-3 border rounded-3">
                            <a href="shop.html">
                                <img src="images/cat-item3.png" class="img-fluid" alt="cart item">
                                <h5 class="mt-2"><a href="shop.html">Digital watches</a></h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card text-center py-4 mb-3 border rounded-3">
                            <a href="shop.html">
                                <img src="images/cat-item4.png" class="img-fluid" alt="cart item">
                                <h5 class="mt-2"><a href="shop.html">Joysticks</a></h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card text-center py-4 mb-3 border rounded-3">
                            <a href="shop.html">
                                <img src="images/cat-item5.png" class="img-fluid" alt="cart item">
                                <h5 class="mt-2"><a href="shop.html">EarPods</a></h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card text-center py-4 mb-3 border rounded-3">
                            <a href="shop.html">
                                <img src="images/cat-item6.png" class="img-fluid" alt="cart item">
                                <h5 class="mt-2"><a href="shop.html">Laptops</a></h5>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="best-selling-items" class="position-relative padding-top-medium padding-bottom-small">
            <div class="container">
                <div class="section-title overflow-hidden mb-4">
                    <h3 class="d-flex align-items-center">Best selling items</h3>
                </div>
                <div class="position-absolute top-50 end-0 pe-0 pe-xxl-5 me-0 me-xxl-5 swiper-next testimonial-button-next">
                    <svg class="chevron-forward-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                    <use xlink:href="#alt-arrow-right-outline"></use>
                    </svg>
                </div>
                <div class="position-absolute top-50 start-0 ps-0 ps-xxl-5 ms-0 ms-xxl-5 swiper-prev testimonial-button-prev">
                    <svg class="chevron-back-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                    <use xlink:href="#alt-arrow-left-outline"></use>
                    </svg>
                </div>
                
                <div class="swiper testimonial-swiper">
                    <div class="swiper-wrapper d-flex">
                        <c:forEach items="${laptopList}" var="laptop">
                            <div class="swiper-slide">
                                <div class="card position-relative text-center py-4 border rounded-3">
                                    <img src="${laptop.mainImage}" class="img-fluid" alt="product item" style="max-height: 350px; width: 100%;">
                                    <h5 class="mt-2"><a href="single-product.html">${laptop.title}</a></h5>
                                    <span class="price text-primary fw-light mb-2">
                                        <c:if test="${laptop.salePrice != laptop.originalPrice}">
                                            <s class="fs-5 fw-lighter text-muted">$${laptop.originalPrice}</s>
                                            </c:if>
                                        $${laptop.salePrice}
                                    </span>
                                    <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                        <button type="button" href="#" class="btn btn-dark" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Tooltip on top">
                                            <svg class="cart">
                                            <use xlink:href="#cart"></use>
                                            </svg>
                                        </button>
                                        <a href="#" class="btn btn-dark">
                                            <span>
                                                <svg class="wishlist">
                                                <use xlink:href="#heart"></use>
                                                </svg>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <section id="hot-posts" class="padding-large">
            <div class="container">
                <div class="section-title overflow-hidden mb-4">
                    <h3 class="d-flex align-items-center">Hot posts</h3>
                </div>
                <div class="row">
                    <c:set var="bloglists" value="${requestScope.blogFeatured}" />
                    <c:choose>
                        <c:when test="${not empty bloglists}">
                            <c:forEach items="${bloglists}" var="blog">
                                <div class="col-md-3 posts mb-4">
                                    <a href="blog.html" class="btn rounded-0 py-0 px-2">
                                        <c:forEach items = "${category}" var = "blog.category">
                                            ${category} 
                                        </c:forEach>

                                    </a>
                                    <img src="${blog.thumbnail}" alt="post image" class="img-fluid">
                                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark">
                                        <a href="single-post.jsp">${blog.title}</a>
                                    </h4>
                                    <p class="mb-2">${blog.blogContent}</p>
                                    <a class="text-decoration-underline" href="single-post.html">Read More</a>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h5 class="d-flex align-items-center">Currently no post to display, please come back later</h5>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>

        <section id="latest-posts" class="padding-large">
            <div class="container">
                <div class="section-title overflow-hidden mb-4">
                    <h3 class="d-flex align-items-center">Latest posts</h3>
                </div>

                <section id="billboard" class="position-relative d-flex align-items-center py-5 bg-light-gray" style="background-image: url(images/banner-image-bg.jpg); background-size: cover; background-repeat: no-repeat; background-position: center;">
                    <div class="position-absolute end-0 pe-0 pe-xxl-5 me-0 me-xxl-5 swiper-next main-slider-button-next">
                        <svg class="chevron-forward-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                        <use xlink:href="#alt-arrow-right-outline"></use>
                        </svg>
                    </div>
                    <div class="position-absolute start-0 ps-0 ps-xxl-5 ms-0 ms-xxl-5 swiper-prev main-slider-button-prev">
                        <svg class="chevron-back-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                        <use xlink:href="#alt-arrow-left-outline"></use>
                        </svg>
                    </div>
                    <div class="swiper main-swiper">
                        <div class="swiper-wrapper d-flex align-items-center">
                            <c:forEach items="${bloglists}" var="blog">
                                <div class="swiper-slide">
                                    <div class="container">
                                        <div class="row d-flex flex-column-reverse flex-md-row align-items-center">
                                            <div class="col-md-5 offset-md-1">
                                                <div class="banner-content">
                                                    <h2>${blog.title}</h2>
                                                    <p>${blog.blogContent}</p>
                                                    <a href="single-post.jsp" class="btn mt-3">Read</a>
                                                </div>
                                            </div>
                                            <div class="col-md-6 text-center">
                                                <div class="image-holder">
                                                    <img src="${blog.thumbnail}" class="img-fluid" alt="banner">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>
            </div>
        </section>

        <section id="brands" class="py-5 border-top border-bottom">
            <div class="container">
                <div class="brand-images my-5 d-flex align-items-center justify-content-between flex-wrap">
                    <a href="#" class="brand">
                        <img src="images/brand1.png" alt="brand" class="img-fluid">
                    </a>
                    <a href="#" class="brand">
                        <img src="images/brand2.png" alt="brand" class="img-fluid">
                    </a>
                    <a href="#" class="brand">
                        <img src="images/brand3.png" alt="brand" class="img-fluid">
                    </a>
                    <a href="#" class="brand">
                        <img src="images/brand4.png" alt="brand" class="img-fluid">
                    </a>
                    <a href="#" class="brand">
                        <img src="images/brand5.png" alt="brand" class="img-fluid">
                    </a>
                </div>
            </div>
        </section>

        <section id="instagram" class="padding-large">
            <div class="container">
                <div class="text-center mb-4">
                    <h3>Instagram #shoplite</h3>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item1.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item2.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item3.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item4.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item5.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item6.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                </div>
            </div>
        </section>
        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>
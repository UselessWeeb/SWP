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
        <div class ="row">
            <div class = "col-md-9 ps-5">
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

                <section id="company-services" class="padding-small"> 
                </section>
                <section id="best-selling-items" class="position-relative padding-top-medium padding-bottom-small">
                    <div class="container">
                        <div class="section-title overflow-hidden mb-4">
                            <h3 class="d-flex align-items-center">Featured Items</h3>
                        </div>
                        <div class="position-absolute top-50 end-0 pe-0 me-0 me-xxl-5 swiper-next testimonial-button-next">
                            <svg class="chevron-forward-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                            <use xlink:href="#alt-arrow-right-outline"></use>
                            </svg>
                        </div>
                        <div class="position-absolute top-50 start-0 ps-0 ms-0 ms-xxl-5 swiper-prev testimonial-button-prev">
                            <svg class="chevron-back-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                            <use xlink:href="#alt-arrow-left-outline"></use>
                            </svg>
                        </div>

                        <div class="swiper testimonial-swiper">
                            <div class="swiper-wrapper d-flex">
                                <c:forEach items="${laptopList}" var="laptop">
                                    <div class="swiper-slide">
                                        <div class="card position-relative text-center py-4 border rounded-3">
                                            <img src="${laptop.mainImage}" class="img-fluid productdetails-image" alt="productdetails item" style="max-height: 350px; width: 100%;">
                                            <h5 class="mt-2"><a href="/app-name/productdetails?laptopId=${laptop.laptopId}">${laptop.title}</a></h5>
                                            <span class="price text-primary fw-light mb-2">
                                                <c:if test="${laptop.salePrice != laptop.originalPrice}">
                                                    <s class="fs-5 fw-lighter text-muted">$${laptop.originalPrice}</s>
                                                    </c:if>
                                                $${laptop.salePrice}
                                            </span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="hot-posts" class="padding-medium">
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
                                            <a href="/app-name/blog?search=&category=
                                               <c:forEach items = "${blog.category}" var = "category">
                                                   ${category.category} 
                                               </c:forEach> 
                                               &minPrice=0&maxPrice=" class="btn rounded-0 py-0 px-2">
                                            </a>
                                            <img src="${blog.thumbnail}" alt="post image productdetails-image" class="img-fluid">
                                            <h4 class="card-title mt-3 mb-2 text-uppercase text-dark">
                                                <a href="blogdetails?id=${blog.blogId}">${blog.title}</a>
                                            </h4>
                                            <p class="mb-2" >...</p>
                                            </svg>   ${blog.views} views
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
            </div>
            <jsp:include page = "/mainSider" />
        </div>
        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>
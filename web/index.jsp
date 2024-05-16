
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>ShopLite - Simple eCommerce Website Template</title>
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
                <div class="swiper-slide">
                    <div class="container">
                        <div class="row d-flex flex-column-reverse flex-md-row align-items-center">
                            <div class="col-md-5 offset-md-1">
                                <div class="banner-content">
                                    <h2>GoPro hero9 Black</h2>
                                    <p>Limited stocks available. Grab it now!</p>
                                    <a href="shop.html" class="btn mt-3">Shop Collection</a>
                                </div>
                            </div>
                            <div class="col-md-6 text-center">
                                <div class="image-holder">
                                    <img src="images/banner-image.png" class="img-fluid" alt="banner">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="container">
                        <div class="row d-flex flex-column-reverse flex-md-row align-items-center">
                            <div class="col-md-5 offset-md-1">
                                <div class="banner-content">
                                    <h2>Iphone 15 Pro Max</h2>
                                    <p>Discount available. Grab it now!</p>
                                    <a href="shop.html" class="btn mt-3">Shop Product</a>
                                </div>
                            </div>
                            <div class="col-md-6 text-center">
                                <div class="image-holder">
                                    <img src="images/banner-image1.png" class="img-fluid" alt="banner">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="container">
                        <div class="row d-flex flex-column-reverse flex-md-row align-items-center">
                            <div class="col-md-5 offset-md-1">
                                <div class="banner-content">
                                    <h2>Macbook Collection</h2>
                                    <p>Limited stocks available. Grab it now!</p>
                                    <a href="shop.html" class="btn mt-3">Shop Collection</a>
                                </div>
                            </div>
                            <div class="col-md-6 text-center">
                                <div class="image-holder">
                                    <img src="images/banner-image2.png" class="img-fluid" alt="banner">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

    <section id="best-selling-items" class="position-relative padding-large">
        <div class="container">
            <div class="section-title overflow-hidden mb-4">
                <h3 class="d-flex align-items-center">Best selling items</h3>
            </div>
            <div class="position-absolute top-50 end-0 pe-0 pe-xxl-5 me-0 me-xxl-5 swiper-next product-slider-button-next">
                <svg class="chevron-forward-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
            <use xlink:href="#alt-arrow-right-outline"></use>
          </svg>
            </div>
            <div class="position-absolute top-50 start-0 ps-0 ps-xxl-5 ms-0 ms-xxl-5 swiper-prev product-slider-button-prev">
                <svg class="chevron-back-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
            <use xlink:href="#alt-arrow-left-outline"></use>
          </svg>
            </div>
            <div class="swiper product-swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="card position-relative text-center py-4 border rounded-3">
                            <img src="images/product-item1.png" class="img-fluid" alt="product item">
                            <h5 class="mt-2"><a href="single-product.html">IPad (9th Gen)</a></h5>
                            <span class="price text-primary fw-light mb-2">$870</span>
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
                    <div class="swiper-slide">
                        <div class="card position-relative text-center py-4 border rounded-3">
                            <img src="images/product-item2.png" class="img-fluid" alt="product item">
                            <h5 class="mt-2"><a href="single-product.html">Drone With Camera</a></h5>
                            <span class="price text-primary fw-light mb-2">$600</span>
                            <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                <a href="#" class="btn btn-dark">
                    <svg class="cart">
                      <use xlink:href="#cart"></use>
                    </svg>
                  </a>
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
                    <div class="swiper-slide">
                        <div class="card position-relative text-center py-4 border rounded-3">
                            <img src="images/product-item3.png" class="img-fluid" alt="product item">
                            <h5 class="mt-2"><a href="single-product.html">Apple Watch (2nd Gen)</a></h5>
                            <span class="price text-primary fw-light mb-2">$400</span>
                            <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                <a href="#" class="btn btn-dark">
                    <svg class="cart">
                      <use xlink:href="#cart"></use>
                    </svg>
                  </a>
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
                    <div class="swiper-slide">
                        <div class="card position-relative text-center py-4 border rounded-3">
                            <img src="images/product-item4.png" class="img-fluid" alt="product item">
                            <h5 class="mt-2"><a href="single-product.html">Ultra HD TV</a></h5>
                            <span class="price text-primary fw-light mb-2">$2000</span>
                            <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                <a href="#" class="btn btn-dark">
                    <svg class="cart">
                      <use xlink:href="#cart"></use>
                    </svg>
                  </a>
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
                    <div class="swiper-slide">
                        <div class="card position-relative text-center py-4 border rounded-3">
                            <img src="images/product-item5.png" class="img-fluid" alt="product item">
                            <h5 class="mt-2"><a href="single-product.html">Bluetooth Speaker</a></h5>
                            <span class="price text-primary fw-light mb-2">$75</span>
                            <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                <a href="#" class="btn btn-dark">
                    <svg class="cart">
                      <use xlink:href="#cart"></use>
                    </svg>
                  </a>
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
                    <div class="swiper-slide">
                        <div class="card position-relative text-center py-4 border rounded-3">
                            <img src="images/product-item6.png" class="img-fluid" alt="product item">
                            <h5 class="mt-2"><a href="single-product.html">White Headset</a></h5>
                            <span class="price text-primary fw-light mb-2">$99</span>
                            <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                <a href="#" class="btn btn-dark">
                    <svg class="cart">
                      <use xlink:href="#cart"></use>
                    </svg>
                  </a>
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
                    <div class="swiper-slide">
                        <div class="card position-relative text-center py-4 border rounded-3">
                            <img src="images/product-item7.png" class="img-fluid" alt="product item">
                            <h5 class="mt-2"><a href="single-product.html">Black Bluetooth Speaker</a></h5>
                            <span class="price text-primary fw-light mb-2">$80</span>
                            <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                <a href="#" class="btn btn-dark">
                    <svg class="cart">
                      <use xlink:href="#cart"></use>
                    </svg>
                  </a>
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
                    <div class="swiper-slide">
                        <div class="card position-relative text-center py-4 border rounded-3">
                            <img src="images/product-item8.png" class="img-fluid" alt="product item">
                            <h5 class="mt-2"><a href="single-product.html">Large Speaker</a></h5>
                            <span class="price text-primary fw-light mb-2">$450</span>
                            <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                <a href="#" class="btn btn-dark">
                    <svg class="cart">
                      <use xlink:href="#cart"></use>
                    </svg>
                  </a>
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
                    <div class="swiper-slide">
                        <div class="card position-relative text-center py-4 border rounded-3">
                            <img src="images/product-item9.png" class="img-fluid" alt="product item">
                            <h5 class="mt-2"><a href="single-product.html">White EarPods</a></h5>
                            <span class="price text-primary fw-light mb-2">$600</span>
                            <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                <a href="#" class="btn btn-dark">
                    <svg class="cart">
                      <use xlink:href="#cart"></use>
                    </svg>
                  </a>
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
                    <div class="swiper-slide">
                        <div class="card position-relative text-center py-4 border rounded-3">
                            <img src="images/product-item10.png" class="img-fluid" alt="product item">
                            <h5 class="mt-2"><a href="single-product.html">Laptop</a></h5>
                            <span class="price text-primary fw-light mb-2">$1200</span>
                            <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                <a href="#" class="btn btn-dark">
                    <svg class="cart">
                      <use xlink:href="#cart"></use>
                    </svg>
                  </a>
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
                </div>
            </div>
        </div>
    </section>

    <section id="limited-offer" class="bg-light padding-large">
        <div class="container">
            <div class="row d-flex align-items-center">
                <div class="col-md-6 text-center">
                    <div class="image-holder">
                        <img src="images/banner-image3.png" class="img-fluid" alt="banner">
                    </div>
                </div>
                <div class="col-md-5 offset-md-1">
                    <h2>30% Discount on apple collection</h2>
                    <div id="countdown-clock" class="text-dark d-flex align-items-center my-3">
                        <div class="time d-grid pe-3">
                            <span class="days fs-1 fw-normal"></span>
                            <small>Days</small>
                        </div>
                        <span class="fs-1 text-primary">:</span>
                        <div class="time d-grid pe-3 ps-3">
                            <span class="hours fs-1 fw-normal"></span>
                            <small>Hrs</small>
                        </div>
                        <span class="fs-1 text-primary">:</span>
                        <div class="time d-grid pe-3 ps-3">
                            <span class="minutes fs-1 fw-normal"></span>
                            <small>Min</small>
                        </div>
                        <span class="fs-1 text-primary">:</span>
                        <div class="time d-grid ps-3">
                            <span class="seconds fs-1 fw-normal"></span>
                            <small>Sec</small>
                        </div>
                    </div>
                    <a href="shop.html" class="btn mt-3">Shop Collection</a>
                </div>
            </div>
        </div>
        </div>
    </section>

    <section id="items-listing" class="padding-large">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mb-4 mb-lg-0 col-lg-3">
                    <div class="featured border rounded-3 p-4">
                        <div class="section-title overflow-hidden mb-4 mt-2">
                            <h3 class="d-flex flex-column mb-0">Featured</h3>
                        </div>
                        <div class="items-lists">
                            <div class="item d-flex">
                                <img src="images/item-image1.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">Wireless headset</a></h5>
                                    <span class="price text-primary fw-light mb-2">$500</span>
                                </div>
                            </div>
                            <hr class="gray-400">
                            <div class="item d-flex">
                                <img src="images/item-image2.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">Iphone x Pro Max</a></h5>
                                    <span class="price text-primary fw-light mb-2">$820</span>
                                </div>
                            </div>
                            <hr>
                            <div class="item d-flex">
                                <img src="images/item-image3.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">Iphone 11 Pro</a></h5>
                                    <span class="price text-primary fw-light mb-2">$960</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4 mb-lg-0 col-lg-3">
                    <div class="latest-items border rounded-3 p-4">
                        <div class="section-title overflow-hidden mb-4 mt-2">
                            <h3 class="d-flex flex-column mb-0">Latest items</h3>
                        </div>
                        <div class="items-lists">
                            <div class="item d-flex">
                                <img src="images/item-image4.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">Apple airPod</a></h5>
                                    <span class="price text-primary fw-light mb-2">$450</span>
                                </div>
                            </div>
                            <hr class="gray-400">
                            <div class="item d-flex">
                                <img src="images/item-image5.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">Screen touch watch</a></h5>
                                    <span class="price text-primary fw-light mb-2">$750</span>
                                </div>
                            </div>
                            <hr>
                            <div class="item d-flex">
                                <img src="images/item-image6.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">Digital watch</a></h5>
                                    <span class="price text-primary fw-light mb-2">$660</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4 mb-lg-0 col-lg-3">
                    <div class="best-reviewed border rounded-3 p-4">
                        <div class="section-title overflow-hidden mb-4 mt-2">
                            <h3 class="d-flex flex-column mb-0">Best reviewed</h3>
                        </div>
                        <div class="items-lists">
                            <div class="item d-flex">
                                <img src="images/item-image7.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">Wireless Joysticks</a></h5>
                                    <span class="price text-primary fw-light mb-2">$350</span>
                                </div>
                            </div>
                            <hr class="gray-400">
                            <div class="item d-flex">
                                <img src="images/item-image8.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">Apple White AirPod</a></h5>
                                    <span class="price text-primary fw-light mb-2">$330</span>
                                </div>
                            </div>
                            <hr>
                            <div class="item d-flex">
                                <img src="images/item-image9.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">Gimbal stabilizer</a></h5>
                                    <span class="price text-primary fw-light mb-2">$920</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4 mb-lg-0 col-lg-3">
                    <div class="on-sale border rounded-3 p-4">
                        <div class="section-title overflow-hidden mb-4 mt-2">
                            <h3 class="d-flex flex-column mb-0">On sale</h3>
                        </div>
                        <div class="items-lists">
                            <div class="item d-flex">
                                <img src="images/item-image10.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">Iphone 15 pro max</a></h5>
                                    <span class="price text-primary fw-light mb-2"><s class="fs-5 fw-lighter text-muted">$1666</s> $999</span>
                                </div>
                            </div>
                            <hr class="gray-400">
                            <div class="item d-flex">
                                <img src="images/item-image11.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">White AirPods</a></h5>
                                    <span class="price text-primary fw-light mb-2"><s class="fs-5 fw-lighter text-muted">$500</s> $410</span>
                                </div>
                            </div>
                            <hr>
                            <div class="item d-flex">
                                <img src="images/item-image12.jpg" class="img-fluid rounded-3" alt="product item">
                                <div class="item-content ms-3">
                                    <h5 class="mt-2"><a href="single-product.html">CCTV camera</a></h5>
                                    <span class="price text-primary fw-light mb-2"><s class="fs-5 fw-lighter text-muted">$600</s> $500</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="customers-reviews" class="position-relative">
        <div class="container">
            <div class="section-title overflow-hidden mb-4">
                <h3 class="d-flex align-items-center">Customers reviews</h3>
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
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="card position-relative text-left p-5 border rounded-3">
                            <blockquote>“I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                needs. Highly recommended!”</blockquote>
                            <div class="rating text-primary">
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                            </div>
                            <h5 class="mt-1 fw-normal">Emma Chamberlin</h5>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card position-relative text-left p-5 border rounded-3">
                            <blockquote>“This tech store is my go-to for all things tech! Whether it's a new smartphone, accessories, or even troubleshooting advice, they've always got me covered. The staff is friendly, and their expertise is unmatched. Trust me;
                                you won't regret shopping here!”</blockquote>
                            <div class="rating text-primary">
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                            </div>
                            <h5 class="mt-1 fw-normal">Thomas John</h5>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card position-relative text-left p-5 border rounded-3">
                            <blockquote>“I recently purchased a smartwatch from this tech store, and I'm absolutely thrilled find the perfect fit with my purchase! Not only did they have an extensive find the perfect fit selection to choose from, but their team helped
                                me find the perfect fit for my lifestyle.”</blockquote>
                            <div class="rating text-primary">
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                            </div>
                            <h5 class="mt-1 fw-normal">Kevin Bryan</h5>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card position-relative text-left p-5 border rounded-3">
                            <blockquote>“I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                needs. Highly recommended!”</blockquote>
                            <div class="rating text-primary">
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                            </div>
                            <h5 class="mt-1 fw-normal">Stevin</h5>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card position-relative text-left p-5 border rounded-3">
                            <blockquote>“I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                needs. Highly recommended!”</blockquote>
                            <div class="rating text-primary">
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                                <svg class="star star-fill">
                    <use xlink:href="#star-fill"></use>
                  </svg>
                            </div>
                            <h5 class="mt-1 fw-normal">Roman</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="latest-posts" class="padding-large">
        <div class="container">
            <div class="section-title overflow-hidden mb-4">
                <h3 class="d-flex align-items-center">Latest posts</h3>
            </div>
            <div class="row">
                <div class="col-md-3 posts mb-4">
                    <a href="blog.html" class="btn rounded-0 py-0 px-2">Gadgets</a>
                    <img src="images/post-item1.jpg" alt="post image" class="img-fluid">
                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.html">5 Must-Have Gadgets for the Modern Home</a></h4>
                    <p class="mb-2">Dive into the world of cutting-edge technology with our latest blog post, where we highlight five essential gadg</p>
                    <a class="text-decoration-underline" href="single-post.html">Read More</a>
                </div>
                <div class="col-md-3 posts mb-4">
                    <a href="blog.html" class="btn rounded-0 py-0 px-2">Phones</a>
                    <img src="images/post-item2.jpg" alt="post image" class="img-fluid">
                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.html">Eco-Friendly Innovations Making a Difference</a></h4>
                    <p class="mb-2">Explore the intersection of technology and sustainability in our latest blog post. Learn about the innovative</p>
                    <a class="text-decoration-underline" href="single-post.html">Read More</a>
                </div>
                <div class="col-md-3 posts mb-4">
                    <a href="blog.html" class="btn rounded-0 py-0 px-2">Tech</a>
                    <img src="images/post-item3.jpg" alt="post image" class="img-fluid">
                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.html">The Future of Wearable Tech: Trends to Watch</a></h4>
                    <p class="mb-2">Stay ahead of the curve with our insightful look into the rapidly evolving landscape of wearable technology.</p>
                    <a class="text-decoration-underline" href="single-post.html">Read More</a>
                </div>
                <div class="col-md-3 posts mb-4">
                    <a href="blog.html" class="btn rounded-0 py-0 px-2">Digital Watch</a>
                    <img src="images/post-item4.jpg" alt="post image" class="img-fluid">
                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark"><a href="single-post.html">Top Apps and Tools for Remote Work</a></h4>
                    <p class="mb-2">In today's remote work environment, productivity is key. Discover the top apps and tools that can help you stay</p>
                    <a class="text-decoration-underline" href="single-post.html">Read More</a>
                </div>
            </div>
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
    <hr>
    <div id="footer-bottom" class="mb-2">
        <div class="container">
            <div class="d-flex flex-wrap justify-content-between">
                <div class="ship-and-payment d-flex gap-md-5 flex-wrap">
                    <div class="shipping d-flex">
                        <p>We ship with:</p>
                        <div class="card-wrap ps-2">
                            <img src="images/dhl.png" alt="visa">
                            <img src="images/shippingcard.png" alt="mastercard">
                        </div>
                    </div>
                    <div class="payment-method d-flex">
                        <p>Payment options:</p>
                        <div class="card-wrap ps-2">
                            <img src="images/visa.jpg" alt="visa">
                            <img src="images/mastercard.jpg" alt="mastercard">
                            <img src="images/paypal.jpg" alt="paypal">
                        </div>
                    </div>
                </div>
                <div class="copyright">
                    <p>© Copyright 2024 ShopLite. HTML Template by <a href="https://templatesjungle.com/" target="_blank">TemplatesJungle</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
</body>

</html>
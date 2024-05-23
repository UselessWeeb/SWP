<%-- 
    Document   : shop
    Created on : May 16, 2024, 3:29:06 PM
    Author     : M7510
--%>

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

        <section class="hero-section position-relative bg-light-gray padding-medium">
            <div class="hero-content">
                <div class="container">
                    <div class="row">
                        <div class="text-center">
                            <h1>Shop</h1>
                            <div class="breadcrumbs">
                                <span class="item">
                                    <a href="index.html">Home > </a>
                                </span>
                                <span class="item text-decoration-underline">Shop</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="shopify-grid padding-large">
            <div class="container">
                <div class="row">
                    <main class="col-md-9">
                        <div class="filter-shop d-flex flex-wrap justify-content-between">
                            <div class="showing-product">
                                <p>Showing 1–9 of 55 results</p>
                            </div>
                            <div class="sort-by">
                                <select id="sorting" class="form-select" data-filter-sort="" data-filter-order="">
                                    <option value="">Default sorting</option>
                                    <option value="">Name (A - Z)</option>
                                    <option value="">Name (Z - A)</option>
                                    <option value="">Price (Low-High)</option>
                                    <option value="">Price (High-Low)</option>
                                    <option value="">Rating (Highest)</option>
                                    <option value="">Rating (Lowest)</option>
                                    <option value="">Model (A - Z)</option>
                                    <option value="">Model (Z - A)</option>   
                                </select>
                            </div>
                        </div>
                        <div class="row product-content product-store">
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
                                    <img src="images/product-item11.png" class="img-fluid" alt="product item">
                                    <h5 class="mt-2"><a href="single-product.html">Iphone 13 Pro</a></h5>
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
                            <div class="col-lg-3 col-md-4">
                                <div class="card position-relative text-center py-4 mb-4 border rounded-3">
                                    <img src="images/product-item12.png" class="img-fluid" alt="product item">
                                    <h5 class="mt-2"><a href="single-product.html">Digital Watch</a></h5>
                                    <span class="price text-primary fw-light mb-2">$860</span>
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
                        <nav class="py-5" aria-label="Page navigation">
                            <ul class="pagination justify-content-center gap-4">
                                <li class="page-item disabled">
                                    <a class="page-link">Prev</a>
                                </li>
                                <li class="page-item active" aria-current="page">
                                    <span class="page-link">1</span>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </main>
                    <aside class="col-md-3">
                        <div class="sidebar ps-lg-5">
                            <div class="widget-menu">
                                <div class="widget-search-bar">
                                    <form class="d-flex border rounded-3 p-2" role="search">
                                        <input class="form-control border-0 me-2" type="search" placeholder="Search" aria-label="Search">
                                        <button class="btn rounded-3 px-4 d-flex align-items-center" type="submit">
                                            <svg class="search text-light" width="18" height="18">
                                            <use xlink:href="#search"></use>
                                            </svg>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div class="widget-product-categories pt-5">
                                <div class="section-title overflow-hidden mb-2">
                                    <h3 class="d-flex flex-column mb-0">Categories</h3>
                                </div>
                                <ul class="product-categories mb-0 sidebar-list list-unstyled">
                                    <li class="cat-item">
                                        <a href="/collections/categories">All</a>
                                    </li>
                                    <li class="cat-item">
                                        <a href="#">Phones</a>
                                    </li>
                                    <li class="cat-item">
                                        <a href="#">Accessories</a>
                                    </li>
                                    <li class="cat-item">
                                        <a href="#">Tablets</a>
                                    </li>
                                    <li class="cat-item">
                                        <a href="#">Watches</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="widget-product-tags pt-5">
                                <div class="section-title overflow-hidden mb-2">
                                    <h3 class="d-flex flex-column mb-0">Tags</h3>
                                </div>
                                <ul class="product-tags mb-0 sidebar-list list-unstyled">
                                    <li class="tags-item">
                                        <a href="#">White</a>
                                    </li>
                                    <li class="tags-item">
                                        <a href="#">Cheap</a>
                                    </li>
                                    <li class="tags-item">
                                        <a href="#">Mobile</a>
                                    </li>
                                    <li class="tags-item">
                                        <a href="#">Modern</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="widget-product-brands pt-5">
                                <div class="section-title overflow-hidden mb-2">
                                    <h3 class="d-flex flex-column mb-0">Brands</h3>
                                </div>
                                <ul class="product-tags mb-0 sidebar-list list-unstyled">
                                    <li class="tags-item">
                                        <a href="#">Apple</a>
                                    </li>
                                    <li class="tags-item">
                                        <a href="#">Samsung</a>
                                    </li>
                                    <li class="tags-item">
                                        <a href="#">Huwai</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="widget-price-filter pt-5">
                                <div class="section-title overflow-hidden mb-2">
                                    <h3 class="d-flex flex-column mb-0">Filter by price</h3>
                                </div>
                                <ul class="product-tags mb-0 sidebar-list list-unstyled">
                                    <li class="tags-item">
                                        <a href="#">Less than $10</a>
                                    </li>
                                    <li class="tags-item">
                                        <a href="#">$10- $20</a>
                                    </li>
                                    <li class="tags-item">
                                        <a href="#">$20- $30</a>
                                    </li>
                                    <li class="tags-item">
                                        <a href="#">$30- $40</a>
                                    </li>
                                    <li class="tags-item">
                                        <a href="#">$40- $50</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </div>

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

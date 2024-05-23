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
        <%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                                <c:set var= "laptopList" value= "${requestScope.laptopList}" />
                                <c:set var= "totalPage" value= "${requestScope.totalPage}" />
                                <c:set var= "currentPage" value= "${requestScope.currentPage}" />
                                <c:set var= "totalProducts" value = "${requestScope.totalProducts}" />
                                <c:set var= "totalPerPage" value= "${requestScope.totalPerPage}" />
                                <c:set var = "searchQuery" value= "${requestScope.searchQuery}"/>
                                <c:choose>
                                    <c:when test="${not empty laptopList and not empty totalPage and not empty currentPage}">
                                        <p>Showing ${currentPage * totalPerPage + 1}–${(currentPage * totalPerPage) + laptopList.size()} of ${totalProducts} results</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>No results found.</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="sort-by">
                                <select id="sorting" class="form-select" data-filter-sort="" data-filter-order="" onchange = "updateSort()">
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
                            <c:forEach items="${laptopList}" var="laptop">
                                <div class="col-lg-3 col-md-4">
                                    <div class="card position-relative text-center py-4 mb-4 border rounded-3">
                                        <img src="${laptop.image}" class="mw-100 p-3 img-fluid" alt="${laptop.title}">
                                        <h5 class="mt-2"><a href="single-product.html?laptopId=${laptop.laptopId}">${laptop.title}</a></h5>
                                            <c:if test = "${laptop.salePrice != laptop.originalPrice}">
                                            <s class="fs-5 fw-lighter text-muted">$${laptop.originalPrice}</s>
                                            </c:if>
                                        <span class="price text-primary fw-light mb-2">$${laptop.salePrice}</span>
                                        <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                            <button type="button" class="btn btn-dark" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart">
                                                <svg class="cart">
                                                <use xlink:href="#cart"></use>
                                                </svg>
                                            </button>
                                            <button type="button" class="btn btn-dark" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist">
                                                <svg class="wishlist">
                                                <use xlink:href="#heart"></use>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <nav class="py-5" aria-label="Page navigation">
                                <ul class="pagination justify-content-center gap-4">
                                    <c:if test="${currentPage > 0}">
                                        <li class="page-item">
                                            <a class="page-link" href="yourPage.jsp?page=${currentPage - 1}">Prev</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${currentPage == 0}">
                                        <li class="page-item disabled">
                                            <span class="page-link">Prev</span>
                                        </li>
                                    </c:if>

                                    <c:forEach begin="0" end="${totalPage - 1}" var="i">
                                        <li class="page-item ${currentPage == i ? 'active' : ''}" aria-current="${currentPage == i ? 'page' : ''}">
                                            <c:choose>
                                                <c:when test="${currentPage == i}">
                                                    <span class="page-link">${i + 1}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <a class="page-link" href="productList?page=${i}&search=${searchQuery}">${i + 1}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${currentPage < totalPage - 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="productList?page=${currentPage + 1}&search=${searchQuery}">Next</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${currentPage >= totalPage - 1}">
                                        <li class="page-item disabled">
                                            <span class="page-link">Next</span>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                    </main>
                    <aside class="col-md-3">
                        <div class="sidebar ps-lg-5">
                            <div class="widget-menu">
                                <div class="widget-search-bar">
                                    <form class="d-flex border rounded-3 p-2" role="search" action="productList">
                                        <input class="form-control border-0 me-2" type="search" placeholder="Search" name="search" aria-label="Search" value="${fn:escapeXml(searchQuery)}">
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
                            <section id="customers-reviews" class="position-relative">
                                <div class="container">
                                    <div class="section-title overflow-hidden mb-2">
                                    <h3 class="d-flex flex-column mb-0">Latest products</h3>
                                </div>
                                    <div class="swiper product-swiper">
                                        <div class="swiper-wrapper">
                                            <c:set var="latestProducts" value="${requestScope.latestProducts}" />
                                            <c:forEach items="${latestProducts}" var="laptop">
                                                <div class="swiper-slide">
                                                    <div class="card position-relative text-left p-5 border rounded-3">
                                                        <img src="${laptop.image}" class="mw-100 p-3 img-fluid" alt="${laptop.title}">
                                                        <h5 class="mt-2"><a href="single-product.jsp?laptopId=${laptop.laptopId}">${laptop.title}</a></h5>
                                                            <c:if test="${laptop.salePrice != laptop.originalPrice}">
                                                            <s class="fs-5 fw-lighter text-muted">$${laptop.originalPrice}</s>
                                                            </c:if>
                                                        <span class="price text-primary fw-light mb-2">$${laptop.salePrice}</span>
                                                        <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                                            <button type="button" class="btn btn-dark" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart">
                                                                <svg class="cart">
                                                                <use xlink:href="#cart"></use>
                                                                </svg>
                                                            </button>
                                                            <button type="button" class="btn btn-dark" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist">
                                                                <svg class="wishlist">
                                                                <use xlink:href="#heart"></use>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </aside>
                </div>
            </div>
        </div> 

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

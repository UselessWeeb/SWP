<%@page import="dao.OrderDAO,java.util.Vector,model.User,java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
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

        <c:if test="${not empty successMsg}">
            <p class="text-center text-success">${successMsg}</p>
            <c:remove var="successMsg" scope="session"/>
        </c:if>
        <c:if test="${not empty failedMsg }">
            <p class="text-center text-danger">${failedMsg}</p>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>

        <c:set var="orderList" value = "${requestScope.orderList}" />
        <c:set var="user" value = "${sessionScope.user}" />
        <div class="row">
            <div class="col-md-9 ">
                <h3 class="text-primary text-center pt-5">Your Order</h3>
                <div class="card">
                    <div class="card-body">
                        <table class="table table-striped mt-5 p-2">
                            <thead class="bg-primary text-white">
                                <tr class="text-center">
                                    <th scope="col"><b>ID</b></th>
                                    <th scope="col"><b>Order Date</b></th>
                                    <th scope="col"><b>Product</b></th>
                                    <th scope="col"><b>Price</b></th>
                                    <th scope="col"><b>Quality</b></th>
                                    <th scope="col"><b>Total</b></th>
                                    <th scope="col"><b>Status</b></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var = "totalPrice" value="0"/>
                                <c:forEach items= "${orderList}" var = "o">
                                    <tr class="text-center">
                                        <td><a href="orderdetail?id=${o.order_id}"><u>${o.order_id}</u></a></td>
                                        <td>${o.order_date}</td>
                                        <td>${o.laptop.title}</td>
                                        <td>$${o.laptop.originalPrice}</td>
                                        <td>${o.quality}</td>
                                        <c:set var = "totalPrice" value = "${(o.laptop.originalPrice * o.quality)}" />
                                        <td>$${totalPrice}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test = "${o.status == 1}">
                                                    <span class="text-warning text-center">Wait</span>
                                                </c:when>
                                                <c:when test = "${o.status == 2}">
                                                    <span class="text-primary text-center">Process</span>
                                                </c:when>
                                                <c:when test = "${o.status == 3}">
                                                    <span class="text-success text-center">Done</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-danger text-center">Canceled</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <form class="sidebar ps-lg-1 pt-3" role="search" action="productList">
                            <div class="widget-menu">
                                <div class="widget-search-bar">
                                    <div class="d-flex border rounded-5 p-2">
                                        <input class="form-control border-0 me-2" type="search" placeholder="Search" name="search" aria-label="Search" value="${fn:escapeXml(searchQuery)}">
                                        <button class="btn rounded-5 px-4 d-flex align-items-center" type="submit">
                                            <svg class="search text-light" width="18" height="18">
                                            <use xlink:href="#search"></use>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-product-categories pt-2">
                                <section id="customers-reviews" class="position-relative">
                                    <div class="container">
                                        <div class="section-title overflow-hidden mb-2">
                                            <h5 class="d-flex flex-column mb-0">Latest</h5>
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
                            <div class="widget-product-categories pt-2">
                                <div class="section-title overflow-hidden mb-2">
                                    <h5 class="d-flex flex-column mb-0">Categories</h5>
                                </div>
                                <ul class="product-categories mb-0 sidebar-list list-unstyled">
                                    <c:forEach var="entry" items="${categoryMap}">
                                        <li class="cat-item">
                                            <c:set var="selectedCategoriesString" value="${fn:join(selectedCategories, ',')}" />
                                            <input type="checkbox" name="category" value="${entry.key}" 
                                                   ${fn:contains(selectedCategoriesString, entry.key) ? 'checked' : ''}>
                                            <label>${entry.key} (${entry.value})</label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="widget-price-filter pt-2 pb-4">
                                <div class="section-title overflow-hidden mb-2">
                                    <h5 class="d-flex flex-column mb-0">Filter by price</h5>
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
                        </form>
                    </div>
                </div>
            </div>
        </div>            

        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>
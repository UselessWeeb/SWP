<%-- 
    Document   : single-product
    Created on : May 16, 2024, 3:37:16 PM
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
        <section class="single-product padding-large">
            <div class="container">
                <div class="row">
                    <jsp:include page = "/Sidebar" />
                    <c:set var = "Product" value = "${requestScope.Product}" />
                    <div class="col-lg-9">
                        <div class="gap-3 product-preview">
                            <div class = "thumbnail">
                                <div>
                                    <div class="hero-image ">
                                        <img src="${Product.mainImage}" alt="single-post" class="img-fluid thumbnail">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product-info ps-lg-5 pt-3 pt-lg-0">
                            <div class="element-header">
                                <h1 class="product-title">${Product.title}</h1>
                                <div class="product-price d-flex align-items-center mt-2">
                                    <c:if test = "${Product.salePrice != Product.originalPrice}">
                                        <s class="fs-5 fw-lighter text-muted">$${Product.originalPrice}</s>
                                        </c:if>            
                                    <span class="price text-primary fw-light mb-2">$${Product.salePrice}</span>
                                </div>
                            </div>
                            <div class="slash-divider"></div>
                            <div class="cart-wrap">
                                <div class="product-quantity my-3">
                                    <div class="item-title">
                                        <l>${Product.stock} in stock</l>
                                    </div>
                                    <div class="stock-button-wrap mt-2 d-flex flex-wrap align-items-center">
                                        <div class="product-quantity">
                                            <div class="input-group product-qty align-items-center">
                                                <span class="input-group-btn">
                                                    <button type="button" class="bg-white shadow border rounded-3 fw-light quantity-left-minus" data-type="minus" data-field="">
                                                        <svg width="16" height="16"><use xlink:href="#minus"></use></svg>
                                                    </button>
                                                </span>
                                                <input type="text" id="quantity" name="quantity" class="form-control bg-white shadow border rounded-3 py-2 mx-2 input-number text-center" value="1" min="1" max="100" required>
                                                <span class="input-group-btn">
                                                    <button type="button" class="bg-white shadow border rounded-3 fw-light quantity-right-plus" data-type="plus" data-field="">
                                                        <svg width="16" height="16"><use xlink:href="#plus"></use></svg>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="action-buttons my-3 d-flex flex-wrap gap-3">
                                    <form action="someAction" method="post">
                                        <input type="hidden" id="orderQuantity" name="quantity" class="form-control bg-white shadow border rounded-3 py-2 mx-2 input-number text-center" value="1" min="1" max="100" required>
                                        <input type="hidden" name="id" value="${Product.laptopId}">
                                        <button type="submit" class="btn">Order now</button>
                                    </form>

                                    <!-- Form for the "Add to cart" button -->
                                    <form action="addtocart" method="post">
                                        <input type="hidden" id="cartQuantity" name="quantity" class="form-control bg-white shadow border rounded-3 py-2 mx-2 input-number text-center" value="1" min="1" max="100" required>
                                        <input type="hidden" name="id" value="${Product.laptopId}">
                                        <button type="submit" class="btn btn-dark">Add to cart</button>
                                    </form>
                                </div>
                            </div>
                            <div class="slash-divider"></div>
                            <div class="meta-product my-3">
                                <div class="meta-item d-flex mb-1">
                                    <span class="fw-medium me-2">SKU:</span>
                                    <ul class="select-list list-unstyled d-flex mb-0">
                                        <li data-value="S" class="select-item">${Product.laptopId}</li>
                                    </ul>
                                </div>
                                <div class="meta-item d-flex mb-1">
                                    <span class="fw-medium me-2">Category:</span>
                                    <ul class="select-list list-unstyled d-flex mb-0">
                                        <c:forEach var="productCategory" items="${requestScope.Product.category}">
                                            <li data-value="S" class="select-item">
                                                <a href="#">${productCategory.category}</a><c:if test="${!productCategoryStatus.last}">,</c:if>
                                                </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

        <section class="product-tabs">
            <div class="container">
                <div class="row">
                    <div class="tabs-listing">
                        <div class="tab-content border-bottom py-4" id="nav-tabContent">
                            <div class="tab-pane fade active show d-flex justify-content-center" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                ${Product.productsDetail}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script>
            document.querySelector('.quantity-left-minus').addEventListener('click', function () {
                let quantity = document.getElementById('quantity');
                updateQuantities(quantity.value);
            });

            document.querySelector('.quantity-right-plus').addEventListener('click', function () {
                let quantity = document.getElementById('quantity');
                updateQuantities(quantity.value);
            });

            function updateQuantities(value) {
                let numericValue = Number(value);
                document.getElementById('orderQuantity').value = numericValue + 1;
                document.getElementById('cartQuantity').value = numericValue + 1;
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>

<%-- 
    Document   : cart
    Created on : May 16, 2024, 3:33:46 PM
    Author     : M7510
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <%@include file ="view/header.jsp" %>
        <section class="hero-section position-relative bg-light-gray padding-medium">
            <div class="hero-content">
                <div class="container">
                    <div class="row">
                        <div class="text-center">
                            <h1>Cart</h1>
                            <div class="breadcrumbs">
                                <span class="item">
                                    <a href="index.html">Home > </a>
                                </span>
                                <span class="item text-decoration-underline">Cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="cart padding-large">
            <div class="container">
                <div class="row">
                    <div class="cart-table">
                        <div class="cart-header">
                            <div class="row d-flex text-uppercase">
                                <h4 class="col-lg-4 pb-3">Product</h4>
                                <h4 class="col-lg-3 pb-3">Quantity</h4>
                                <h4 class="col-lg-4 pb-3">Subtotal</h4>
                            </div>
                        </div>
                        <div class="slash-divider"></div>
                        <div class="cart-table">
                            <c:forEach var="cart" items="${carts}">
                                <div class="cart-item border-bottom padding-small">
                                    <div class="row align-items-center">
                                        <div class="col-lg-4 col-md-3">
                                            <div class="cart-info d-flex gap-2 flex-wrap align-items-center">
                                                <div class="col-lg-5">
                                                    <div class="card-image">
                                                        <img src="${cart.laptop.image}" alt="cart-img" class="img-fluid border rounded-3">
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="card-detail">
                                                        <h5 class="mt-2"><a href="single-product.html">${cart.laptop.name}</a></h5>
                                                        <div class="card-price">
                                                            <span class="price text-primary fw-light" data-currency-usd="${cart.laptop.price}">${cart.laptop.price}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-7">
                                            <div class="row d-flex">
                                                <div class="col-md-6">
                                                    <div class="product-quantity my-2 my-2">
                                                        <div class="input-group product-qty align-items-center" style="max-width: 150px;">
                                                            <input type="text" id="quantity" name="quantity" class="form-control bg-white shadow border rounded-3 py-2 mx-2 input-number text-center" value="${cart.quantity}" min="1" max="100" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="total-price">
                                                        <span class="money fs-2 fw-light text-primary">${cart.laptop.price * cart.quantity}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    <div class="cart-totals padding-medium pb-0">
                        <h3 class="mb-3">Cart Totals</h3>
                        <div class="total-price pb-3">
                            <table cellspacing="0" class="table text-uppercase">
                                <tbody>
                                    <tr class="subtotal pt-2 pb-2 border-top border-bottom">
                                        <th>Subtotal</th>
                                        <td data-title="Subtotal">
                                            <span class="price-amount amount text-primary ps-5 fw-light">
                                                <bdi>
                                                    <span class="price-currency-symbol">$</span>2,400.00
                                                </bdi>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr class="order-total pt-2 pb-2 border-bottom">
                                        <th>Total</th>
                                        <td data-title="Total">
                                            <span class="price-amount amount text-primary ps-5 fw-light">
                                                <bdi>
                                                    <span class="price-currency-symbol">$</span>2,400.00</bdi>
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="button-wrap d-flex flex-wrap gap-3">
                            <button class="btn">Update Cart</button>
                            <button class="btn">Continue Shopping</button>
                            <button class="btn">Proceed to checkout</button>
                        </div>
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

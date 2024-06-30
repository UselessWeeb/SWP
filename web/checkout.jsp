<%-- 
    Document   : checkout
    Created on : May 16, 2024, 3:32:20 PM
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
                            <h1>Checkout</h1>
                            <div class="breadcrumbs">
                                <span class="item">
                                    <a href="index.html">Home > </a>
                                </span>
                                <span class="item text-decoration-underline">Checkout</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="checkout-wrap padding-large">
            <div class="container">
                <form class="form-group">
                    <div class="row d-flex flex-wrap">
                        <div class="col-lg-9">
                            <div class="cart-header">
                                <div class="row d-flex text-uppercase">
                                    <h4 class="col-lg-2 pb-2">Id</h4>
                                    <h4 class="col-lg-3 pb-2">Product</h4>
                                    <h4 class="col-lg-3 pb-2">Quantity</h4>
                                    <h4 class="col-lg-3 pb-3">Subtotal</h4>
                                </div>
                            </div>
                            <div class="slash-divider"></div>
                            <div class="cart-table">
                                <c:set var="totalQuantity" value="0"/>
                                <c:set var="totalPrice" value="0"/>
                                <c:forEach var="cart" items="${carts}">
                                    <c:set var="totalQuantity" value="${totalQuantity + cart.value}"/>
                                    <c:set var="totalPrice" value="${totalPrice + (cart.key.salePrice * cart.value)}"/>
                                    <div class="cart-item border-bottom padding-small">
                                        <div class="row align-items-center">
                                            <div class="col-lg-6 col-md-3">
                                                <div class="cart-info d-flex gap-2 flex-wrap align-items-center">
                                                    <div class="col-lg-3">
                                                        <div class="card-detail">
                                                            <h5 class="mt-2"><a href="single-product.html">${cart.key.laptopId}</a></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="card-image">
                                                            <img src="${cart.key.mainImage}" alt="cart-img" class="img-fluid border rounded-3">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="card-detail">
                                                            <h5 class="mt-2"><a href="single-product.html">${cart.key.title}</a></h5>
                                                            <div class="card-price">
                                                                <span class="price text-primary fw-light" data-currency-usd="${cart.key.salePrice}">${cart.key.salePrice}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-7">
                                                <div class="row d-flex">
                                                    <div class="col-md-6">
                                                        <div class="product-quantity my-2 my-2">
                                                            <p id="quantity" name="quantity">${cart.value}</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="total-price">
                                                            <span class="money fs-2 fw-light text-primary">${cart.key.salePrice * cart.value}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="button-wrap m-3">
                                    <a href = "cart" class="btn">Change</a>
                                </div>
                            </div>
                            <h3 class="mb-3">Billing Details</h3>
                            <div class="billing-details">
                                <label for="fname">Full name*</label>
                                <input type="text" id="fname" name="firstname" class="form-control mt-2 mb-4 ps-3" value="${sessionScope.user.fullName}">
                                <label for="cname">Address*</label>
                                <input type="text" id="cname" name="companyname" class="form-control mt-2 mb-4" value="${sessionScope.user.address}">
                                <label for="phone">Phone *</label>
                                <input type="text" id="phone" name="phone" class="form-control mt-2 mb-4 ps-3" value="${sessionScope.user.phoneNumber}">
                                <label for="email">Email address *</label>
                                <input type="text" id="email" name="email" class="form-control mt-2 mb-4 ps-3" value="${sessionScope.user.email}">
                            </div>
                            <div class="form-control">
                                <h3 class="mb-3">Additional Information</h3>
                                <div class="billing-details">
                                    <label for="fname">Order notes (optional)</label>
                                    <textarea class="form-control pt-3 pb-3 ps-3 mt-2" placeholder="Notes about your order. Like special notes for delivery."></textarea>
                                </div>
                            </div>
                        </div>
                        <jsp:include page="/Sidebar" flush="true"/>
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
                                                        <span class="price-currency-symbol">$</span>${totalPrice}
                                                    </bdi>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr class="order-total pt-2 pb-2 border-bottom">
                                            <th>Total</th>
                                            <td data-title="Total">
                                                <span class="price-amount amount text-primary ps-5 fw-light">
                                                    <bdi>
                                                        <span class="price-currency-symbol">$</span>${totalPrice}</bdi>
                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="list-group">
                                <label class="list-group-item d-flex gap-2 border-0">
                                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios" id="listGroupRadios1" value="" checked>
                                    <span>
                                        <p class="mb-1">Direct bank transfer</p>
                                        <small>Make your payment directly into our bank account. Please use your Order ID. Your order will shipped after funds have cleared in our account.</small>
                                    </span>
                                </label>
                                <label class="list-group-item d-flex gap-2 border-0">
                                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios" id="listGroupRadios2" value="">
                                    <span>
                                        <p class="mb-1">Check payments</p>
                                        <small>Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</small>
                                    </span>
                                </label>
                                <label class="list-group-item d-flex gap-2 border-0">
                                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios" id="listGroupRadios3" value="">
                                    <span>
                                        <p class="mb-1">Cash on delivery</p>
                                        <small>Pay with cash upon delivery.</small>
                                    </span>
                                </label>
                                <label class="list-group-item d-flex gap-2 border-0">
                                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios" id="listGroupRadios3" value="">
                                    <span>
                                        <p class="mb-1">Paypal</p>
                                        <small>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</small>
                                    </span>
                                </label>
                            </div>
                            <div class="button-wrap mt-3">
                                <button type="submit" name="submit" class="btn">Place an order</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>

        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
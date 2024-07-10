<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Order Confirmation</title>
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
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <section class="order-confirmation">
        <div class="container">
            <div class="row">
                <jsp:include page = "/Sidebar" />
                <div class="col-lg-9">
                    <div class="confirmation-info ps-lg-5 pt-3 pt-lg-0">
                        <div class="order-details my-4">
                            <h2 class="fw-bold">Thank you for your purchase!</h2>
                            <p class="mt-3">Your order has been placed successfully. Below are your order details:</p>
                            <ul class="list-unstyled">
                                <li><strong>Order ID:</strong> ${orderId}</li>
                                <li><strong>Total Price:</strong> ${totalPrice}VND</li>
                                <li><strong>Payment Method:</strong> ${paymentMethod}</li>
                                <li><strong>Shipping Method:</strong> ${shipMethod}</li>
                                <li><strong>Estimated Delivery Date:</strong> <fmt:formatDate value="${deliveryDate}" pattern="dd/MM/yyyy"/></li>
                            </ul>
                        </div>
                        <div class="order-items my-4">
                            <h3 class="fw-bold">Items in your order:</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Item</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="entry" items="${carts}">
                                        <tr>
                                            <td>${entry.key.title}</td>
                                            <td>${entry.value}</td>
                                            <td>$${entry.key.salePrice}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <c:choose>
                                <c:when test="${paymentMethod == 'online'}">
                                    <p>Note that this order will be remove if you don't pay it in 24 hours</p>
                                    <p>Please click on <a href = "http://localhost:9999/app-name/payment?total=${fn:replace(totalPrice, ',', '')}&order=${orderId}">This</a> to complete the order</p>
                                    <p>You can also pay later by access the <strong>My Order</strong> page, then click on one order, as long as it's in 24 hours</p>
                                </c:when>
                                <c:otherwise>
                                    <p>Thank you for your purchase! Your order will be delivered to you soon.</p>
                                </c:otherwise>
                            </c:choose>
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
<%-- 
    Document   : orderdetails
    Created on : Jun 23, 2024, 9:22:09 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import = "dao.OrderDetailDAO" %>

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
        <p>Order ID: ${order.order_id}</p>
        <p>Customer Fullname: ${orderUser.fullname}</p>
        <p>Customer Email: ${orderUser.email}</p>
        <p>Order Date: <fmt:formatDate value="${order.order_date}" pattern="dd-MM-yyyy" /></p>
        <p>Gender: Male</p>
        <!--TO DO ADD GENDER-->
        <p>Status: ${order.status}</p>
        <p>Sales Name: ${sales.fullName}</p>
        <table class="table table-striped mt-5">
            <thead class="bg-primary text-white">
                <tr class="text-center">
                    <th scope="col"><b>ID</b></th>
                    <th scope="col"><b>Product Name</b></th>
                    <th scope="col"><b>Price</b></th>
                    <th scope="col"><b>Quantity</b></th>                       
                </tr>
            </thead>
            <tbody>
                <c:set var="totalPrice" value="0"/>
                <c:forEach items="${orderItems}" var="od">
                    <tr>
                        <td>${od.orderItemId}</td>
                        <td>${od.laptopId.title}</td>
                        <td>${od.price}</td>
                        <td>${od.quantity}</td>
                        <c:set var="totalPrice" value="${totalPrice + (od.price * od.quantity)}"/>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <%@include file="view/footer.jsp" %>
    </body>
</html>

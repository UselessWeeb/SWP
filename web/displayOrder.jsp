
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
        <div class="container p-1">
            <h3 class="text-center text-primary ">
                Your Order
            </h3>
            <table class="table table-striped mt-5">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Date</th>
                        <th scope="col">Address</th>
                        <th scope="col">Status</th>
                        <th scope="col">Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items= "${orderList}" var = "order">
                        <tr>
                            <td>${order.order_id}</td>
                            <td>${user.fullName}</td>
                            <td>${user.email}</td>
                            <td>${order.order_date}</td>
                            <td>${user.address}</td>
                            <td 
                                <c:choose>
                                    <c:when test = "${order.status == 1}">
                                        class="text-warning text-center">Wait
                                    </c:when>
                                    <c:when test = "${order.status == 2}">
                                        class="text-primary text-center">Process
                                    </c:when>
                                    <c:when test = "${order.status == 3}">
                                        class="text-success text-center">Done
                                    </c:when>
                                    <c:otherwise>
                                        class="text-danger text-center">Canceled
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="row">
                                <a class="col-md-6 btn btn-sm btn-primary" href="orderdetail.jsp?id=${order.order_id}" class="btn btn-sm btn-primary">Detail</a>
                                <a class="col-md-6 btn btn-sm btn-danger" href="status?id=${order.order_id}&&status=4 " class="btn btn-sm btn-primary">Cancel</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>
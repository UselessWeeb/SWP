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
    
    <c:set var="orderList" value="${requestScope.orderList}" />
    <c:set var="user" value="${sessionScope.user}" />
    <div class="container p-1">
        <h3 class="text-center text-primary ">Your Order</h3>
        <table class="table table-striped mt-5">
            <thead class="bg-primary text-white">
                <tr class="text-center">
                    <th scope="col"><b>ID</b></th>
                    <th scope="col"><b>Order Date</b></th>
                    <th scope="col"><b>Price</b></th>
                    <th scope="col"><b>Status</b></th>
                </tr>
            </thead>
            <tbody>
                <c:set var="totalPrice" value="0"/>
                <c:forEach items="${orderList}" var="o">
                    <tr class="text-center">
                        <td><a href="orderdetail?id=${o.order_id}"><u>${o.order_id}</u></a></td>
                        <td>${o.order_date}</td>
                        <td>${o.total_price}</td>
                        <td>
                            <c:choose>
                                <c:when test="${o.status == 1}">
                                    <span class="text-warning text-center">Wait</span>
                                </c:when>
                                <c:when test="${o.status == 2}">
                                    <span class="text-primary text-center">Process</span>
                                </c:when>
                                <c:when test="${o.status == 3}">
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

    <%@include file = "view/footer.jsp" %>

    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
</body>

</html>

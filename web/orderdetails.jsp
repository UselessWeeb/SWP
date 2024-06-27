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
    <style>
        tr td:first-child{
            padding: 0px 20px;
        }
        
        .table{
            max-width: 90%;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <body>
        <%@include file = "view/header.jsp" %>
        <!--Test-->
        <c:if test = "${isAbleToEdit == true}">
            <p>You might be able to edit this page</p>
        </c:if>
        <div class = "d-flex justify-content-between">
            <div>
                <table>
                    <tr>
                        <td><h3 class = "bg-primary text-white rounded px-1">Order Information</h3></td>
                    </tr>
                    <tr>
                        <td><b>Order ID:</b></td>
                        <td>${order.order_id}</td>
                    </tr>
                    <tr>
                        <td><b>Customer Fullname:</b></td>
                        <td>${orderUser.fullname}</td>
                    </tr>
                    <tr>
                        <td><b>Customer Email:</b></td>
                        <td>${orderUser.email}</td>
                    </tr>
                    <tr>
                        <td><b>Order Date:</b></td>
                        <td><fmt:formatDate value="${order.order_date}" pattern="dd-MM-yyyy" /></td>
                    </tr>
                    <tr>
                        <td><b>Gender:</b></td>
                        <td>Male</td>
                    </tr>
                    <tr>
                        <td><b>Total Price:</b></td>
                        <td>${order.price}</td>
                    </tr>
                    <!-- TO DO: ADD GENDER -->
                    <tr>
                        <td><b>Status:</b></td>
                        <td>${order.status}</td>
                    </tr>
                    <tr>
                        <td><b>Sales Name:</b></td>
                        <td>${sales.fullName}</td>
                    </tr>
                    <tr>
                        <td><b>Notes:</b></td>
                        <td><textarea style ="height:200%"  class="form-control" placeholder="Notes for the order"></textarea></td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td><h3 class = "bg-primary text-white rounded px-1">User Information</h3></td>
                    </tr>
                    <tr>
                        <td style = "visibility:hidden"> A </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><b>Customer Fullname:</b></td>
                        <td>${orderUser.fullname}</td>
                    </tr>
                    <tr>
                        <td><b>Customer Email:</b></td>
                        <td>${orderUser.email}</td>
                    </tr>
                    <tr>
                        <td><b>Customer Phone:</b></td>
                        <td>${orderUser.phoneNumber}</td>
                    </tr>
                    <tr>
                        <td><b>Gender:</b></td>
                        <td>Male</td>
                    </tr>
                    <!-- TO DO: ADD GENDER -->
                    <tr>
                        <td><b>Address:</b></td>
                        <td>${orderUser.address}</td>
                    </tr>
                </table>
            </div>
        </div>
        <table class="table table-striped mt-5">
            <thead class="bg-primary text-white">
                <tr class="text-center">
                    <th scope="col"><b>Thumbnail</b></th>
                    <th scope="col"><b>Product Name</b></th>
                    <th scope="col"><b>Category</b></th>
                    <th scope="col"><b>Price</b></th>
                    <th scope="col"><b>Quantity</b></th>
                    <th scope="col"><b>Total Cost</b></th>
                </tr>
            </thead>
            <tbody>
                <c:set var="totalPrice" value="0"/>
                <c:forEach items="${orderItems}" var="od">
                    <tr>
                        <td><img style ="max-width: 200px" src = "${od.laptopId.mainImage}"></td>
                        <td>${od.laptopId.title}</td>
                        <td>
                            <c:forEach items = "${od.laptopId.category}" var = "category">
                                ${category.category}
                            </c:forEach>
                        </td>
                        <td>${od.price}</td>
                        <td>${od.quantity}</td>
                        <td>${od.quantity * od.price}</td>
                        <c:set var="totalPrice" value="${totalPrice + (od.price * od.quantity)}"/>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <%@include file="view/footer.jsp" %>
    </body>
</html>

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

        .btn{
            padding: 10px !important;
            font-size:20px !important;
        }

        .dropdown-toggle::after {
            margin: 0 !important;
            padding: 0  !important;
        }

        input{
            border:none;
            max-width:50%;
        }

        .table-container {
            margin: 2rem;
        }

        .table th,
        .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table th {
            background: #ff6543 !important;
        }

        .table th,
        .table td {
            padding-top: 20px !important;
            padding-bottom: 20px !important;
        }
    </style>
    <body>
        <%@include file = "view/header.jsp" %>

        <!-- Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Assign Sale for Order :${order.order_id}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <c:choose>
                            <c:when test = '${sessionScope.user.role.role_id != 2}'>
                                <p> You can't access this page because your current role (${sessionScope.user.role.role_purpose}) is not able to view this</p>
                            </c:when>
                            <c:otherwise>
                                <p>Select one sale to assign this order to:</p>
                                <c:forEach items = "${salesUser}" var = "sale">
                                    <div>
                                        <a href = "addAuth?user_id=${sale.userId}&order_id=${order.order_id}">${sale.fullName}</a>
                                        <c:if test = "${currentEdit == sale.userId}">
                                            <span>Current</span>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            var myModal = document.getElementById('editModal');
            var myInput = document.getElementById('edit');

            myModal.addEventListener('shown.bs.modal', function () {
                myInput.focus();
            });
        </script>
        <div class = "d-flex justify-content-between">
            <form action = "updateorder">
                <table>
                    <tr>
                        <td class="py-2">
                            <button type="button" id="edit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal">
                                Assign Role
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3 class = "bg-primary text-white rounded px-1">Order Information</h3>
                        </td>
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
                        <td style = "max-width:200px;">
                            <input type = "text" readonly id="orderStatus-${order.order_id}" name = "status" value = "${order.status}"></span>
                            <c:if test="${isAbleToEdit == true}">
                                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <c:if test="${order.status != 'Pending'}">
                                        <a class="dropdown-item" href="#" onclick="updateOrderStatus(${order.order_id}, 'Pending')">Pending</a>
                                    </c:if>
                                    <c:if test="${order.status != 'Delivered'}">
                                        <a class="dropdown-item" href="#" onclick="updateOrderStatus(${order.order_id}, 'Delivered')">Delivered</a>
                                    </c:if>
                                    <c:if test="${order.status != 'Shipped'}">
                                        <a class="dropdown-item" href="#" onclick="updateOrderStatus(${order.order_id}, 'Shipped')">Shipped</a>
                                    </c:if>
                                    <c:if test="${order.status != 'Cancelled'}">
                                        <a class="dropdown-item" href="#" onclick="updateOrderStatus(${order.order_id}, 'Cancelled')">Cancelled</a>
                                    </c:if>
                                </div>                                                     
                            </c:if>
                        </td>
                    <script>
                        function updateOrderStatus(orderId, newStatus) {
                            // Update the order status in the <td>
                            document.getElementById('orderStatus-' + orderId).value = newStatus;
                        }
                    </script>
                    </tr>
                    <tr>
                        <td><b>Sales Name:</b></td>
                        <td>${sales.fullName}</td>
                    </tr>
                    <tr>
                        <td><b>Notes:</b></td>
                        <td><textarea style ="height:200%" name ="notes" class="form-control" placeholder="Notes for the order">${order.notes}</textarea></td>
                    </tr>
                    <tr>
                        <td style = "visibility:hidden"><input type = "text" name ="order" hidden value = "${order.order_id}"</td>
                        <td><input type = "submit" value = "save" class = "btn btn-primary"></td>
                    </tr>
                </table>
            </form>
            <div>
                <table>
                    <tr>
                        <td style = "visibility:hidden"> A </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style = "visibility:hidden"> A </td>
                        <td></td>
                    </tr>
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
        <table class="table table-bordered mt-5">
            <thead class="table-dark">
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
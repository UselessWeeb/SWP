<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Order"%>
<%@page import="model.OrderItem"%>
<%@page import="model.Order_User"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Order Information</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
    </head>
    <body>
        <%@include file="view/header.jsp" %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-9">
                    <div class="d-flex justify-content-between">
                        <div class="card p-4 mb-4 flex-fill me-2">
                            <h5>Order Information</h5>
                            <p><strong>Order ID:</strong> ${order.order_id}</p>
                            <p><strong>Order Date:</strong> <fmt:formatDate value="${order.order_date}" pattern="dd-MM-yyyy"/></p>
                            <p><strong>Total Cost:</strong> $${order.price}</p>
                            <p><strong>Status:</strong> ${order.status}</p>
                        </div>

                        <div class="card p-4 mb-4 flex-fill ms-2">
                            <h5>Receiver Information</h5>
                            <p><strong>Full Name:</strong> ${orderuser.fullname}</p>
                            <p><strong>Gender:</strong> ${orderuser.gender}</p>
                            <p><strong>Email:</strong> ${orderuser.email}</p>
                            <p><strong>Mobile:</strong> ${orderuser.phoneNumber}</p>
                        </div>
                    </div>
                    <div class="card p-4">
                        <h5>Ordered Products</h5>
                        <table class="table table-bordered mt-3">
                            <thead class="table-light">
                                <tr>
                                    <th>Thumbnail</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total Cost</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${items}">
                                    <tr>
                                        <td><img src="${item.laptopId.mainImage}" alt="Thumbnail" width="50"></td>
                                        <td>${item.laptopId.title}</td>
                                        <td>
                                            <c:forEach var="category" items="${item.laptopId.category}">
                                                ${category.category} 
                                            </c:forEach>
                                        </td>
                                        <td>$${item.price}</td>
                                        <td>${item.quantity}</td>
                                        <td>$${item.price * item.quantity}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-4">
                        <a href="rebuyorder?order=${order.order_id}" class="btn btn-warning">Re-buy Product</a>
                        <c:if test="${order.status == 'Pending'}">
                            <a href="payment?order=${order.order_id}&total=${order.price}" class="btn btn-warning">Purchase Order</a>
                            <a href="cart?orderId=${order.order_id}" class="btn btn-warning">Update Order</a>
                            <a href="deleteorder?orderId=${order.order_id}" class="btn btn-warning">Delete Order</a>
                        </c:if>

                        <c:if test="${order.status == 'Submitted'}">
                            <a href="cart?orderId=${order.order_id}" class="btn btn-warning">Update Order</a>
                            <a href="cancel?order=${order.order_id}" class="btn btn-danger">Cancel Order</a>
                        </c:if>

                        <c:if test="${order.status == 'Delivered'}">
                            <a href="feedback?email=${orderuser.email}&orderId=${order.order_id}" class="btn btn-warning">Feedback Order</a>
                            <a href="refundorder?order=${order.order_id}" class="btn btn-danger">Refund Order</a>
                        </c:if>
                    </div>
                </div>
                <jsp:include page="/Sidebar" flush="true"/> 
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGFJJxntp2zW9RX9MRPPF0HcFv0cQ/hxV9Eo3Mo2llyh" crossorigin="anonymous"></script>
    </body>
</html>
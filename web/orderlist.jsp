<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Order List</title>
    <style>
        .pagination {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }
        .pagination a {
            margin: 0 5px;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            color: #333;
        }
        .pagination a.active {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
        }
        .pagination a:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h1>Order List</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Order Date</th>
                <th>Order Name</th>
                <th>Status</th>
                <th>Quantity</th>
                <th>User ID</th>
                <th>Laptop ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${orderlist}">
                <tr>
                    <td><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd"/></td>
                    <td>${order.order_name}</td>
                    <td>${order.status}</td>
                    <td>${order.quantity}</td>
                    <td>${order.user_id}</td>
                    <td>${order.laptop_id}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="orderlist?page=${currentPage - 1}">&laquo; Previous</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="orderlist?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="orderlist?page=${currentPage + 1}">Next &raquo;</a>
        </c:if>
    </div>
</body>
</html>

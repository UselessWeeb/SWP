<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <style>
            body {
                font-family: 'Outfit', sans-serif;
            }
            .navbar {
                background-color: white;
                padding: 1rem;
            }
            .navbar-brand {
                color: orange;
                font-weight: bold;
            }
            .nav-link {
                color: black;
                margin: 0 1rem;
            }
            .nav-link.active {
                color: orange;
            }
            .table-container {
                margin: 2rem;
            }
            .table th, .table td {
                text-align: center;
                vertical-align: middle;
            }
            footer {
                text-align: center;
                padding: 1rem;
                background-color: #f8f9fa;
            }
            
            th{
                background: #ff6543 !important;
            }
            
            th, td{
                padding-top: 20px !important;
                padding-bottom: 20px !important;
            }
        </style>
    </head>
    <body>
        <%@include file = "view/header.jsp" %>
        <div class="table-container">
            <h2 class="text-center">Order</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Order Date</th>
                        <th>Product</th>
                        <th>Total Cost</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderlist}">
                        <tr>
                            <td>${order.order_id}</td>
                            <td>${order.user.fullName}</td>
                            <td><fmt:formatDate value="${order.order_date}" pattern="dd/MM/yyyy"/></td>
                            <td>${order.laptop.title}</td>
                            <td>${order.laptop.salePrice * order.quantity}</td>
                            <td>${order.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <nav>
                <ul class="pagination justify-content-center gap-4">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="orderlist?page=${currentPage - 1}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="py-1 px-3 ${i == currentPage ? 'bg-primary text-white' : ''}" href="orderlist?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="orderlist?page=${currentPage + 1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>

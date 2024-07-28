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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
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

            .table th,
            .table td {
                text-align: center;
                vertical-align: middle;
            }

            footer {
                text-align: center;
                padding: 1rem;
                background-color: #f8f9fa;
            }

            th {
                background: #ff6543 !important;
            }

            th,
            td {
                padding-top: 20px !important;
                padding-bottom: 20px !important;
            }

            .text-info:hover {
                color: var(--primary-color) !important;
            }

            .font-bold {
                font-weight: 400;
            }

            .btn {
                max-height: 50px;
                padding: 10px !important;
            }

            tr a:hover {
                color: white !important;
            }

            tr a {
                color: var(--accent-color) !important;
            }
        </style>
    </head>

    <body>
        <%@include file="view/header.jsp" %>
        <div class="table-container">
            <p class="pt-5">Showing ${totalPerPage} of ${totalOrders} orders.</p>
            <form id="filterForm" method="GET">
                <div class="d-flex justify-content-center gap-1 pb-2 ms-1 me-1">
                    <label class="pt-3 font-bold">From:</label><input type="date" id="startDate"
                                                                      name="startDate" class="form-control" value="${startDate}">
                    <label class="pt-3 font-bold">To:</label><input type="date" id="endDate" name="endDate"
                                                                    class="form-control" value="${endDate}">
                    <input class="form-control" type="text" name="Search" placeholder="search"
                           value="${Search}">
                    <input type="submit" class="btn btn-primary pt-1" value="Filter" />
                </div>

                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Customer Name<a
                                    href="salesorderlist?page=${currentPage}&sortField=fullname&sortDirection=${sortField == 'fullname' && sortDirection == 'desc' ? 'asc' : 'desc'}&startDate=${startDate}&endDate=${endDate}&status=${status}&search=${search}">${sortField
                                                       == 'fullname' && sortDirection == 'desc' ? '&#x25B2;' : '&#x25BC;'}</a></th>
                            <th>Order Date<a
                                    href="salesorderlist?page=${currentPage}&sortField=order_date&sortDirection=${sortField == 'order_date' && sortDirection == 'desc' ? 'asc' : 'desc'}&startDate=${startDate}&endDate=${endDate}&status=${status}&search=${search}">${sortField
                                                       == 'order_date' && sortDirection == 'desc' ? '&#x25B2;' : '&#x25BC;'}</a>
                            </th>
                            <th>Product
                                <a href="#" data-bs-toggle="dropdown" role="button" aria-expanded="false">
                                    <i class="fas fa-filter"></i>
                                </a>
                                <div class="dropdown-menu p-3 animate slider" data-bs-popper="static">
                                    <input type="text" id="searchInput" class="form-control mb-3" placeholder="Search laptops..." onkeyup="filterLaptops()">
                                    <div id="laptopList">
                                        <c:forEach var="laptop" items="${laptops}">
                                            <div class="form-check laptop-item">
                                                <c:set var="isChecked" value="false" />
                                                <c:forEach var="selectedLaptopId" items="${selectedLaptopId}">
                                                    <c:if test="${selectedLaptopId == laptop.laptopId}">
                                                        <c:set var="isChecked" value="true" />
                                                    </c:if>
                                                </c:forEach>
                                                <input class="form-check-input" type="checkbox" value="${laptop.laptopId}"
                                                       id="productCheck${laptop.laptopId}" name="productCheck" <c:if test="${isChecked}">checked</c:if> >
                                                <label class="form-check-label" for="productCheck${laptop.laptopId}">
                                                    ${laptop.title}
                                                </label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <script>
                                    function filterLaptops() {
                                        const searchInput = document.getElementById('searchInput').value.toLowerCase();
                                        const laptopItems = document.getElementsByClassName('laptop-item');

                                        for (let i = 0; i < laptopItems.length; i++) {
                                            const label = laptopItems[i].getElementsByTagName('label')[0];
                                            const textValue = label.textContent || label.innerText;
                                            
                                            if (textValue.toLowerCase().indexOf(searchInput) > -1) {
                                                laptopItems[i].style.display = "";
                                            } else {
                                                laptopItems[i].style.display = "none";
                                            }
                                        }
                                    }
                                </script>
                            </th>
                            <th>Total Cost<a
                                    href="salesorderlist?page=${currentPage}&sortField=Order.price&sortDirection=${sortField == '[Order].price' && sortDirection == 'desc' ? 'asc' : 'desc'}&startDate=${startDate}&endDate=${endDate}&status=${status}&search=${search}">${sortField
                                                       == '[Order].price' && sortDirection == 'desc' ? '&#x25B2;' : '&#x25BC;'}</a></th>
                            <th>Status<a
                                    href="salesorderlist?page=${currentPage}&sortField=status&sortDirection=${sortField == 'status' && sortDirection == 'desc' ? 'asc' : 'desc'}&startDate=${startDate}&endDate=${endDate}&status=${status}&search=${search}">${sortField
                                                       == 'status' && sortDirection == 'desc' ? '&#x25B2;' : '&#x25BC;'}</a>
                                <a href="#" data-bs-toggle="dropdown" role="button"
                                   aria-expanded="false">
                                    <i class="fas fa-filter"></i>
                                </a>
                                <div class="dropdown-menu p-3 animate slider"
                                     data-bs-popper="static">
                                    <select name="status" class="form-select">
                                        <option value="">All</option>
                                        <option value="0" ${status==0 ? 'selected' : '' }>Pending</option>
                                        <option value="0" ${status==1 ? 'selected' : '' }>Submitted</option>
                                        <option value="1" ${status==2 ? 'selected' : '' }>Shipping</option>
                                        <option value="2" ${status==3 ? 'selected' : '' }>Delivered</option>
                                        <option value="3" ${status==4 ? 'selected' : '' }>Cancelled</option>
                                        <option value="3" ${status==5 ? 'selected' : '' }>Refunded</option>
                                    </select>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <c:choose>
                        <c:when test = "${not empty orderlist}">
                            <tbody>
                                <c:forEach var="order" items="${orderlist}">
                                    <tr>
                                        <td>${order.order_id}<br><a href="orderdetails?id=${order.order_id}"
                                                                    class="text-info"><u>View</u></a></td>
                                        <td>${order.user.fullname}</td>
                                        <td>
                                            <fmt:formatDate value="${order.order_date}" pattern="dd/MM/yyyy" />
                                        </td>
                                        <td>
                                            <c:set var="displayed" value="false" />
                                            <c:forEach var="item" items="${items}" varStatus="status">
                                                <c:if test="${item[0].orderId.order_id == order.order_id and not displayed}">
                                                    ${item[0].laptopId.title} 
                                                    <c:if test="${fn:length(item) > 1}">
                                                        (${fn:length(item) - 1} more items)
                                                    </c:if>
                                                    <c:set var="displayed" value="true" />
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>${order.price}</td>
                                        <td>${order.status}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </c:when>
                        <c:otherwise>
                            <p class ="text-center">No Order match your filter.</p>
                        </c:otherwise>
                    </c:choose>
                </table>
            </form>
            <nav>
                <ul class="pagination justify-content-center gap-4">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="salesorderlist?page=${currentPage - 1}&sortField=${sortField == "[Order].price" ? "Order.price" : sortField}&sortDirection=${sortDirection}&startDate=${startDate}&endDate=${endDate}&status=${status}&search=${search}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="py-1 px-3 ${i == currentPage ? 'bg-primary text-white' : ''}"
                               href="salesorderlist?page=${i}&sortField=${sortField == "[Order].price" ? "Order.price" : sortField}&sortDirection=${sortDirection}&startDate=${startDate}&endDate=${endDate}&status=${status}&search=${search}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="salesorderlist?page=${currentPage + 1}&sortField=${sortField == "[Order].price" ? "Order.price" : sortField}&sortDirection=${sortDirection}&startDate=${startDate}&endDate=${endDate}&status=${status}&search=${search}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <%@include file="view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>
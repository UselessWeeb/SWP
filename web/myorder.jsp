<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Order</title>
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
            .nav-tabs .nav-link.active {
                background-color: #fff;
                border-color: #dee2e6 #dee2e6 #fff;
                color: #ff6543;
            }
            .nav-tabs {
                flex-wrap: nowrap;
                overflow-x: auto;
                overflow-y: hidden;
                white-space: nowrap;
            }
            .item {
                padding-top: 20px !important;
            }
        </style>
    </head>
    <body>
        <%@include file="view/header.jsp" %>
        <section class="checkout-wrap">
            <div class="container">
                <div class="row d-flex flex-wrap">
                    <div class="col-lg-9">
                        <ul class="nav nav-tabs" id="orderTabs" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${orderType == 0 ? 'active' : ''}" href="?page=${currentPage}&orderType=0">Pending (<c:out value="${pendingCount}"/>)</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${orderType == 1 ? 'active' : ''}" href="?page=${currentPage}&orderType=1">Submitted (<c:out value="${submittedCount}"/>)</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${orderType == 2 ? 'active' : ''}" href="?page=${currentPage}&orderType=2">Delivering (<c:out value="${deliveringCount}"/>)</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${orderType == 3 ? 'active' : ''}" href="?page=${currentPage}&orderType=3">Completed (<c:out value="${completedCount}"/>)</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${orderType == 4 ? 'active' : ''}" href="?page=${currentPage}&orderType=4">Cancelled (<c:out value="${cancelledCount}"/>)</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${orderType == 5 ? 'active' : ''}" href="?page=${currentPage}&orderType=5">Refunded (<c:out value="${refundedCount}"/>)</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="orderTabsContent">
                            <c:choose>
                                <c:when test="${empty items}">
                                    <p>No orders found.</p>
                                </c:when>
                                <c:otherwise>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Date</th>
                                                <th>Product</th>
                                                <th>Total</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${items}">
                                                <tr>
                                                    <td class="item" style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; height: 100%;">
                                                        <a href="orderinfo?orderId=${item.key.order_id}" style="text-align: center;">
                                                            ${item.key.order_id}
                                                        </a>
                                                        <a href="orderinfo?orderId=${item.key.order_id}" style="margin-top: auto;">
                                                            View
                                                        </a>
                                                    </td>
                                                    <td class="item">
                                                        <fmt:formatDate value="${item.key.order_date}" pattern="dd-MM-yyyy"/>
                                                    </td>
                                                    <td class="item">
                                                        ${item.value.get(0).laptopId.title}
                                                        <c:if test="${item.value.size() > 1}">
                                                            & ${item.value.size() - 1} more
                                                        </c:if>
                                                    </td>
                                                    <td class="item">$${item.key.price}</td>
                                                    <td class="item">${item.key.status}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${orderType == 0}">
                                                                <button class="btn btn-primary purchase-btn" data-order-id="${item.key.order_id}" data-order-price = "${item.key.price}">Purchase</button>
                                                            </c:when>
                                                            <c:when test="${orderType == 1}">
                                                                <button class="btn btn-warning cancel-btn" data-order-id="${item.key.order_id}">Cancel</button>
                                                            </c:when>
                                                            <c:when test="${orderType == 3}">
                                                                <button class="btn btn-info refund-btn" data-order-id="${item.key.order_id}">Request Refund</button>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <c:if test="${orderType == 0}">
                                        <p class="text-warning">If you don't purchase after 24 hours, the order will be cleared and will not be delivered.</p>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <nav>
                            <ul class="pagination">
                                <c:forEach begin="1" end="${totalPages}" var="page">
                                    <li class="page-item ${page == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="?page=${page}&orderType=${orderType}">${page}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                    <jsp:include page="/Sidebar" flush="true"/>                   
                </div>
            </div>
        </section>
        <%@include file="view/footer.jsp" %>

        <!-- Confirmation Modal for Purchase -->
        <div class="modal fade" id="purchaseModal" tabindex="-1" aria-labelledby="purchaseModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="purchaseModalLabel">Confirm Purchase</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to proceed with the purchase?
                    </div>
                    <div class="modal-footer">
                        <a id="confirmPurchase" href="#" class="btn btn-primary">Confirm</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="purchaseModalLabel">Confirm Cancel</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to cancel this order ?
                    </div>
                    <div class="modal-footer">
                        <a id="cancelPurchase" href="#" class="btn btn-primary">Confirm</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="refundModal" tabindex="-1" aria-labelledby="refundModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="refundModalLabel">Confirm Refund Request</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to request a refund for this order?
                    </div>
                    <div class="modal-footer">
                        <a id="confirmRefund" href="#" class="btn btn-info">Confirm Refund</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for Feedback -->
        <div class="modal fade" id="feedbackModal" tabindex="-1" aria-labelledby="feedbackModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="feedbackModalLabel">Leave Feedback</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="submitFeedback" method="post">
                            <input type="hidden" id="feedbackOrderId" name="orderId" />
                            <div class="mb-3">
                                <label for="feedbackMessage" class="form-label">Your Feedback</label>
                                <textarea class="form-control" id="feedbackMessage" name="feedback" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">Submit Feedback</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script>
            $('.purchase-btn').click(function () {
                const orderId = $(this).data('order-id');
                const price = $(this).data('order-price');
                $('#confirmPurchase').attr('href', 'payment?order=' + orderId + "&total=" + price);
                var purchaseModal = new bootstrap.Modal(document.getElementById('purchaseModal'));
                purchaseModal.show();
            });

            $('.cancel-btn').click(function () {
                const orderId = $(this).data('order-id');
                $('#cancelPurchase').attr('href', 'cancel?order=' + orderId);
                var purchaseModal = new bootstrap.Modal(document.getElementById('cancelModal'));
                purchaseModal.show();
            });

            $('.refund-btn').click(function () {
                const orderId = $(this).data('order-id');
                $('#confirmRefund').attr('href', 'refundorder?order=' + orderId);
                var refundModal = new bootstrap.Modal(document.getElementById('refundModal'));
                refundModal.show();
            });

            $('.feedback-btn').click(function () {
                const orderId = $(this).data('order-id');
                $('#feedbackOrderId').val(orderId);
                var feedbackModal = new bootstrap.Modal(document.getElementById('feedbackModal'));
                feedbackModal.show();
            });
        </script>
    </body>
</html>
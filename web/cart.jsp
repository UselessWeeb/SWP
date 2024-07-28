<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

    <head>
        <c:choose>
            <c:when test = "${not empty orderId}">
                <title>Order Edit</title>
            </c:when>
            <c:otherwise>
                <title>Cart</title>
            </c:otherwise>
        </c:choose>       
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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <%@include file ="view/header.jsp" %>
        <%-- Check if "noti" session attribute exists --%>
        <c:if test="${not empty sessionScope.noti}">
            <%-- If it exists, trigger a modal to show up --%>
            <script>
                $(document).ready(function () {
                    $('#notiModal').modal('show');
                });
            </script>

            <%-- Remove "noti" attribute from the session --%>

            <%-- Modal HTML --%>
            <div class="modal fade" id="notiModal" tabindex="-1" role="dialog" aria-labelledby="notiModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="notiModalLabel">Notification</h5>
                        </div>
                        <div class="modal-body">
                            ${sessionScope.noti}
                        </div>
                        <c:choose>
                            <c:when test = "${not empty choose}">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                    <button type="button" class="btn btn-primary" id="confirmDeleteCart">Yes</button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <!-- Your form -->
            <form id="deleteFormCart" action="deletefromcart">
                <input type="hidden" name="id" value="${sessionScope.id}">
                <c:if test = "${not empty orderId}">
                    <input type="hidden" name="orderId" value="${orderId}">
                </c:if>
            </form>
            <script>
                document.getElementById('confirmDeleteCart').addEventListener('click', function () {
                    document.getElementById('deleteFormCart').submit();
                });
            </script>
            <c:remove var="noti" scope="session"/>
            <c:remove var="id" scope="session"/>
            <c:remove var="choose" scope="session"/>
        </c:if>
        <section class="cart">
            <div class="container">
                <div class="row">
                    <div class="cart-table col-lg-9">
                        <c:choose>
                            <c:when test = "${not empty carts}">
                                <input type="text" id="search-input" class="form-control mb-1" placeholder="Search for products..." onchange="searchProducts()">
                                <div class="cart-header pt-3">
                                    <div class="row d-flex text-uppercase">
                                        <div class = "col-lg-1"></div>
                                        <h4 class="col-lg-2 pb-3">Id</h4>
                                        <h4 class="col-lg-3 pb-3">Product</h4>
                                        <h4 class="col-lg-2 pb-3">Quantity</h4>
                                        <h4 class="col-lg-3 pb-3">Subtotal</h4>
                                    </div>
                                </div>                             
                                <div class="cart-table">
                                    <c:set var="totalQuantity" value="0"/>
                                    <c:set var="totalPrice" value="0"/>
                                    <div class ="item-list">
                                        <c:forEach var="cart" items="${carts}" varStatus="status">
                                            <c:set var="totalQuantity" value="${totalQuantity + cart.value}"/>
                                            <c:set var="totalPrice" value="${totalPrice + (cart.key.salePrice * cart.value)}"/>
                                            <div class="cart-item border-bottom padding-small item" id = "item" data-name = "${cart.key.title}">
                                                <div class="row align-items-center">
                                                    <div class="col-lg-6 col-md-3">
                                                        <div class="cart-info d-flex gap-2 flex-wrap align-items-center">
                                                            <div class = "col-lg-1">
                                                                <input type="checkbox" data-id = "${cart.key.laptopId}" class="item-checkbox" data-price="${cart.key.salePrice * cart.value}" onchange="updateTotalPrice()" checked>
                                                            </div>
                                                            <div class="col-lg-2">
                                                                <div class="card-detail">
                                                                    <h5 class="mt-2"><a href="productdetails?laptopId=${cart.key.laptopId}${orderId == null ? '' : '&orderId='}${orderId}">${cart.key.laptopId}</a></h5>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <div class="card-image">
                                                                    <img src="${cart.key.mainImage}" alt="cart-img" class="img-fluid border rounded-3">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <div class="card-detail">
                                                                    <h5 class="mt-2"><a href="productdetails?laptopId=${cart.key.laptopId}">${cart.key.title}</a></h5>
                                                                    <div class="card-price">
                                                                        <span class="price text-primary fw-light" data-currency-usd="${cart.key.salePrice}">$${cart.key.salePrice}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-7">
                                                        <div class="row d-flex">
                                                            <div class="col-md-6">
                                                                <div class="product-quantity my-2 my-2">
                                                                    <form id="cartForm-${status.index}" class="input-group product-qty align-items-center" style="max-width: 150px;" action="setcart">
                                                                        <input type="hidden" name="id" value="${cart.key.laptopId}">
                                                                        <span class="input-group-btn">
                                                                            <input type="submit" class="bg-white shadow border rounded-3 fw-light quantity-left-plus" name = "action" value="-" />
                                                                        </span>
                                                                        <input type="text" id="quantity" name="quantity" class="form-control bg-white shadow border rounded-3 py-2 mx-2 input-number text-center" value="${cart.value}" min="1" max="100" required onchange="document.getElementById('cartForm-${status.index}').submit()">
                                                                        <span class="input-group-btn">
                                                                            <input type="submit" class="bg-white shadow border rounded-3 fw-light quantity-left-plus" name = "action" value="+" />
                                                                        </span>
                                                                        <c:if test = "${not empty orderId}">
                                                                            <input type="hidden" name="orderId" value="${orderId}">
                                                                        </c:if>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="total-price">
                                                                    <span class="money fs-2 fw-light text-primary">$${cart.key.salePrice * cart.value}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-1 col-md-2">
                                                        <div class="cart-cross-outline">
                                                            <!-- Delete Confirmation Modal -->
                                                            <div class="modal fade" id="deleteModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="deleteModalLabel">Confirm Delete For ${cart.key.title}</h5>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Are you sure you want to delete ${cart.key.title} from the cart?
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                                            <button type="button" class="btn btn-primary" id="confirmDelete${status.index}">Yes</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- Your form -->
                                                            <form id="deleteForm${status.index}" action="deletefromcart">
                                                                <input type="hidden" name="id" value="${cart.key.laptopId}">
                                                                <c:if test = "${not empty orderId}">
                                                                    <input type="hidden" name="orderId" value="${orderId}">
                                                                </c:if>
                                                                <button type="button" class="bg-white shadow border rounded-3 fw-light quantity-left-plus" data-toggle="modal" data-target="#deleteModal${status.index}">Delete</button>
                                                            </form>
                                                            <script>
                                                                document.getElementById('confirmDelete${status.index}').addEventListener('click', function () {
                                                                    document.getElementById('deleteForm${status.index}').submit();
                                                                });
                                                            </script>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <div class="pagination-controls mt-3">
                                        <button class="btn btn-secondary" id = "prevPage" onclick="prevPage()">Previous</button>
                                        <span id="page-info"></span>
                                        <button class="btn btn-secondary" id = "nextPage" onclick="nextPage()">Next</button>
                                    </div>
                                    <script>
                                        const itemsPerPage = 3; // Number of items per page
                                        let currentPage = 1;
                                        const items = document.querySelectorAll('.cart-item'); // Select all cart items

                                        function displayItems() {
                                            const start = (currentPage - 1) * itemsPerPage;
                                            const end = start + itemsPerPage;

                                            items.forEach((item, index) => {
                                                if (index >= start && index < end) {
                                                    item.style.display = 'block';
                                                } else {
                                                    item.style.display = 'none';
                                                }
                                            });

                                            if (currentPage === 1) {
                                                document.getElementById('prevPage').disabled = true;
                                            } else {
                                                document.getElementById('prevPage').disabled = false;
                                            }

                                            if (currentPage * itemsPerPage >= items.length) {
                                                document.getElementById('nextPage').disabled = true;
                                            } else {
                                                document.getElementById('nextPage').disabled = false;
                                            }

                                            document.getElementById('page-info').innerText = 'Page ' + currentPage + ' of ' + Math.ceil(items.length / itemsPerPage);
                                        }

                                        function nextPage() {
                                            if (currentPage * itemsPerPage < items.length) {
                                                currentPage++;
                                                displayItems();
                                            }
                                        }

                                        function prevPage() {
                                            if (currentPage > 1) {
                                                currentPage--;
                                                displayItems();
                                            }
                                        }

                                        // Initialize the display
                                        displayItems();
                                    </script>
                                </div>
                                <div class="padding-small">
                                    <!-- "Select All" checkbox -->
                                    <div class="d-flex align-items-center gap-3">
                                        <input type="checkbox" id="select-all" class="select-all-checkbox" onchange="toggleSelectAll()" checked>
                                        <label for="select-all">Select all</label>
                                    </div>
                                    <!-- Script to handle "Select All" functionality -->
                                    <script>
                                        function toggleSelectAll() {
                                            let selectAllCheckbox = document.querySelector('.select-all-checkbox');
                                            let itemCheckboxes = document.querySelectorAll('.item-checkbox');
                                            let allChecked = true;

                                            if (selectAllCheckbox.checked) {
                                                itemCheckboxes.forEach(function (checkbox) {
                                                    checkbox.checked = true;
                                                });
                                            } else {
                                                itemCheckboxes.forEach(function (checkbox) {
                                                    checkbox.checked = false;
                                                });
                                            }

                                            updateTotalPrice();
                                        }
                                    </script>
                                </div>
                                <script>
                                    function updateTotalPrice() {
                                        let checkboxes = document.querySelectorAll('.item-checkbox');
                                        let totalPrice = 0;
                                        checkboxes.forEach(function (checkbox) {
                                            if (checkbox.checked) {
                                                totalPrice += parseFloat(checkbox.getAttribute('data-price'));
                                            }
                                        });
                                        //check if all checkboxes are checked
                                        let selectAllCheckbox = document.querySelector('.select-all-checkbox');
                                        let allChecked = true;
                                        checkboxes.forEach(function (checkbox) {
                                            if (!checkbox.checked) {
                                                allChecked = false;
                                            }
                                        });
                                        if (allChecked) {
                                            selectAllCheckbox.checked = true;
                                        } else {
                                            selectAllCheckbox.checked = false;
                                        }
                                        // Update the total price in the cart totals section
                                        document.querySelector('.total-price .amount').textContent = '$' + totalPrice;
                                    }

                                    // Initial calculation in case some boxes are checked by default
                                    document.addEventListener('DOMContentLoaded', updateTotalPrice);
                                </script>
                                <c:choose>
                                    <c:when test = "${not empty orderId}">
                                        <a href = "orderinfo?orderId=${orderId}"class="btn">Return</a>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="cart-totals padding-small pb-0">
                                            <h3 class="mb-3">Cart Totals</h3>
                                            <div class="total-price pb-3">
                                                <table cellspacing="0" class="table text-uppercase">
                                                    <tbody>
                                                        <tr class="subtotal pt-2 pb-2 border-top border-bottom">
                                                            <th>Selected Total</th>
                                                            <td data-title="Subtotal">
                                                                <span class="price-amount amount text-primary ps-5 fw-light">
                                                                    <bdi>
                                                                        <span class="price-currency-symbol">$</span>${totalPrice}
                                                                    </bdi>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr class="order-total pt-2 pb-2 border-bottom">
                                                            <th>Cart Total</th>
                                                            <td data-title="Total">
                                                                <span class="price-amount amount text-primary ps-5 fw-light">
                                                                    <bdi>
                                                                        <span class="price-currency-symbol">$</span>${totalPrice}</bdi>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!--a modal to warn user that they haven't select any products to checkout-->
                                            <div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="checkoutModalLabel">Warning</h5>
                                                        </div>
                                                        <div class="modal-body">
                                                            Please select at least one item to checkout
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">OK</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="button-wrap d-flex flex-wrap gap-3">
                                                <a href = "productList" class = "btn">Continue Shopping</a>
                                                <button href = "checkout" class = "btn" onclick = "checkout()">Proceed to checkout</button>
                                                <script>
                                                    function checkout() {
                                                        let checkboxes = document.querySelectorAll('.item-checkbox');
                                                        let ids = [];
                                                        checkboxes.forEach(function (checkbox) {
                                                            if (checkbox.checked) {
                                                                ids.push(checkbox.getAttribute('data-id'));
                                                            }
                                                        });
                                                        if (ids.length === 0) {
                                                            //invoke the modal to warn user that they haven't select any products to checkout
                                                            $('#checkoutModal').modal('show');
                                                        } else {
                                                            window.location.href = 'checkout?ids=' + ids.join(',');
                                                        }
                                                    }
                                                </script>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>     
                            </c:when>
                            <c:otherwise>
                                <p>The cart is empty, Visit <a href = "product">Product</a> to find the product that you might like</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <jsp:include page="/Sidebar" flush="true"/>
                </div>
        </section>
        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>

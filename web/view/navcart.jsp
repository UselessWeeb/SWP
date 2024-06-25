<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="totalQuantity" value="0"/>
<c:forEach var="entry" items="${sessionScope.cart.cart}">
    <c:set var="totalQuantity" value="${totalQuantity + entry.value}"/>
</c:forEach>
<c:if test="${sessionScope.user.role.role_id != 2 && sessionScope.user.role.role_id != 4}">
    <li class="cart-dropdown dropdown">
        <a href="cart" class="dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">
            <svg class="cart">
            <use xlink:href="#cart"></use>
            </svg><span class="fs-6 fw-light">(${totalQuantity})</span>
        </a>
        <div class="dropdown-menu animate slide dropdown-menu-start dropdown-menu-lg-end p-3">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-primary">Your cart</span>
                <span class="badge bg-primary rounded-pill">${totalQuantity}</span>
            </h4>
            <ul class="list-group mb-3">
                <c:choose>
                    <c:when test="${not empty cart}">
                        <c:set var="end" value="${fn:length(cart)}"/>
                        <c:set var="start" value="${(end - 3) > 0 ? (end - 3) : 0}"/>
                        <c:forEach var="entry" begin="${start}" end="${end}" items="${cart}">
                            <c:set var="product" value="${entry.key}"/>
                            <c:set var="quantity" value="${entry.value}"/>
                            <li class="list-group-item bg-transparent d-flex justify-content-between lh-sm">
                                <div>
                                    <h5>
                                        <a href="single-product.jsp">${product.title}</a>
                                    </h5>
                                    <small>${product.briefInfo}</small>
                                </div>
                                <span class="text-primary">${product.salePrice}</span>
                                <span class="text-secondary">Quantity: ${quantity}</span>
                            </li>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>Your cart is empty.</p>
                    </c:otherwise>
                </c:choose>
            </ul>
            <div class="d-flex flex-wrap justify-content-center">
                <a href="cart" class="w-100 btn btn-dark mb-1" type="submit">View Cart</a>
                <a href="checkout" class="w-100 btn btn-primary" type="submit">Go to checkout</a>
            </div>
        </div>
    </li>
</c:if>
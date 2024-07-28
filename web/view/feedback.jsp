<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="product-feedback">
    <h3>Product Feedback</h3>
    <c:choose>
        <c:when test="${not empty listfeedback}">
            <c:forEach var="feedbackEntry" items="${listfeedback}">
                <div class="feedback-item">
                    <p><strong>User:</strong> ${feedbackEntry.key.email}</p>
                    <p><strong>Rating:</strong> 
                        <c:forEach begin="1" end="5" var="star">
                            <span class="star ${star <= feedbackEntry.value.keySet().iterator().next().rated_star ? 'filled' : ''}">&#9733;</span>
                        </c:forEach>
                    </p>
                    <p><strong>Feedback:</strong> ${feedbackEntry.value.keySet().iterator().next().feedback}</p>
                    <div class="feedback-images">
                        <c:forEach var="image" items="${feedbackEntry.value.values().iterator().next()}">
                            <img src="${pageContext.request.contextPath}/${image.image}" alt="Feedback Image" class="img-thumbnail" style="max-width: 100px;">
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>No feedback yet for this product.</p>
        </c:otherwise>
    </c:choose>
</div>

<style>
    .product-feedback {
        margin-top: 20px;
    }
    .feedback-item {
        border: 1px solid #ddd;
        padding: 10px;
        margin-bottom: 10px;
    }
    .star {
        color: #ddd;
        font-size: 20px;
    }
    .star.filled {
        color: #ffc107;
    }
    .feedback-images {
        margin-top: 10px;
    }
</style>
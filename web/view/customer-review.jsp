<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Review</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <style>
        .star {
            fill: none;
            stroke: #FFD700;
            stroke-width: 2;
        }
        .star-fill {
            fill: #FFD700;
        }
    </style>
</head>
<body>
    <section id="general-feedback" class="position-relative">
        <div class="container">
            <div class="section-title overflow-hidden mb-4">
                <h3 class="d-flex align-items-center">General Feedback</h3>
            </div>
            <div class="swiper feedback-swiper">
                <div class="swiper-wrapper">
                    <c:forEach var="feedbackEntry" items="${listfeedback}">
                        <div class="swiper-slide">
                            <div class="card position-relative text-left p-5 border rounded-3">
                                <blockquote>${feedbackEntry.value.keySet().iterator().next().feedback}</blockquote>
                                <div class="rating text-primary">
                                    <c:forEach begin="1" end="5" var="star">
                                        <svg class="star ${star <= feedbackEntry.value.keySet().iterator().next().rated_star ? 'star-fill' : ''}" width="20" height="20" viewBox="0 0 24 24">
                                            <use xlink:href="#star-fill"></use>
                                        </svg>
                                    </c:forEach>
                                </div>
                                <h5 class="mt-1 fw-normal">${feedbackEntry.key.fullname}</h5>
                                <div class="feedback-images mt-3">
                                    <c:forEach var="image" items="${feedbackEntry.value.values().iterator().next()}">
                                        <img src="${pageContext.request.contextPath}/${image.image}" alt="Feedback Image" class="img-thumbnail me-2" style="max-width: 50px;">
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- Add Pagination if needed -->
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var swiper = new Swiper('.feedback-swiper', {
                slidesPerView: 1,
                spaceBetween: 10,
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                // Add other Swiper options as needed
            });
        });
    </script>
</body>
</html>
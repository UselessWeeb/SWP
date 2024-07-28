<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product Feedback</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Outfit', sans-serif;
            }
            .star-rating input[type="radio"] {
                display: none;
            }
            .star-rating label {
                font-size: 1.5em;
                color: #FFD700;
                cursor: pointer;
                transition: color 0.2s;
            }
            .star-rating input:checked ~ label {
                color: #FFD700;
            }
            .star-rating label:hover,
            .star-rating label:hover ~ label {
                color: #FFED85;
            }
            .feedback-form {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
            }
            .preview img {
                max-width: 100px;
                margin: 5px;
            }
        </style>
    </head>
    <body>
        <%@include file="view/header.jsp" %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-8">
                    <h2 class="mb-4">Product Feedback</h2>
                    <form action="feedback" method="get" class="mb-4">
                        <div class="mb-3 mt-3">
                            <input type="email" class="form-control" name="email" placeholder="Enter your email" required value="${email}">
                        </div>
                        <button type="submit" class="btn btn-primary">Find My Orders</button>
                    </form>

                    <c:if test="${not empty orders}">
                        <h3 class="mb-3 mt-3">Your Orders</h3>
                        <form id = "orderSubmit" action="feedback" method="get">
                            <input type="hidden" name="email" value="${email}">
                            <div class="mb-3">
                                <select class="form-select" name="orderId" onchange = "document.getElementById('orderSubmit').submit();">
                                    <option value="">Select an order</option>
                                    <c:forEach var="order" items="${orders}">
                                        <option value="${order.key.order_id}" ${order.key.order_id == orderId ? 'selected' : ''}>Order #${order.key.order_id} - ${order.key.order_date}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </form>
                    </c:if>

                    <c:if test="${not empty selectedOrder}">
                        <h3 class="mb-3 mt-3">Feedback for Order #${selectedOrder.order_id}</h3>
                        <div class="mb-3 mt-3">
                            <form id = "typeSubmit" action="feedback" method="get">
                                <input type="hidden" name="email" value="${email}">
                                <input type="hidden" name="orderId" value="${orderId}">
                                <select class="form-select" name="productId" onchange = "document.getElementById('typeSubmit').submit();">
                                    <option value="">General Feedback</option>
                                    <c:forEach var="item" items="${orderItems}">
                                        <option value="${item.laptopId.laptopId}" ${item.laptopId.laptopId == productId ? 'selected' : ''}>${item.laptopId.title}</option>
                                    </c:forEach>
                                </select>
                            </form>
                        </div>
                        <form action="feedback" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="email" value="${email}">
                            <input type="hidden" name="orderId" value="${selectedOrder.order_id}">
                            <input type="hidden" name="productId" value="${productId}">
                            <input type="hidden" name="feedbackId" value="${existingFeedback.feedback_id}">
                            <div class="mb-3 mt-3">
                                <label class="form-label">Rating</label>
                                <div class="star-rating">
                                    <c:forEach var="i" begin="1" end="5">
                                        <input type="radio" class="btn-check" name="rating" value="${i}" id="${i}-stars" ${existingFeedback.rated_star == i ? 'checked' : ''} required>
                                        <label class="btn btn-outline-warning" for="${i}-stars">☆</label>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="mb-3">
                                <textarea class="form-control" name="feedback" rows="4" placeholder="Your feedback" required>${existingFeedback.feedback}</textarea>
                            </div>
                            <div class="mb-3">
                                <input type="file" class="form-control" id="imageUpload" name="images" multiple>
                                <div id="imagePreview" class="mt-3 d-flex flex-wrap"></div>
                            </div>
                            <c:if test="${not empty existingImages}">
                                <div class="mb-3 mt-3">
                                    <h4>Existing Images</h4>
                                    <c:forEach var="image" items="${existingImages}">
                                        <div class="d-inline-block position-relative m-2">
                                            <img src="${pageContext.request.contextPath}/${image.image}" alt="Feedback Image" class="img-thumbnail" style="max-width: 100px;">
                                            <button type="button" class="btn btn-danger btn-sm position-absolute top-0 end-0" style ="padding: 0px 6px !important;" onclick="deleteImage(${image.fimages})">X</button>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                            <button type="submit" class="btn btn-primary">Submit Feedback</button>
                        </form>
                    </c:if>
                    <c:if test = "${not empty existingFeedback}">
                        <!--allowing user to delete the feedback if it's exist-->
                        <a class ="btn mt-4" href = "deleteFeedback?feedbackId=${existingFeedback.feedback_id}">Delete Feedback</a>
                    </c:if>
                </div>
                <jsp:include page="/Sidebar" flush="true"/>
            </div>
        </div>

        <!-- Modal for Confirm Deletion -->
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this image?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmDelete">Delete</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                                document.getElementById('imageUpload').addEventListener('change', function () {
                                                    const preview = document.getElementById('imagePreview');
                                                    preview.innerHTML = ''; // Clear any existing previews

                                                    // Handle files
                                                    Array.from(this.files).forEach(file => {
                                                        const reader = new FileReader();
                                                        reader.onload = function (e) {
                                                            // Create an image element
                                                            const img = document.createElement('img');
                                                            img.src = e.target.result;
                                                            img.classList.add('img-thumbnail');
                                                            img.style.maxWidth = '150px'; // Set the max width for preview images
                                                            img.style.margin = '5px';
                                                            preview.appendChild(img);
                                                        };
                                                        reader.readAsDataURL(file);
                                                    });
                                                });
                                                let imageIdToDelete;

                                                function deleteImage(imageId) {
                                                    imageIdToDelete = imageId;
                                                    const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
                                                    deleteModal.show();
                                                }

                                                document.getElementById('confirmDelete').addEventListener('click', function () {
                                                    fetch('feedback?action=deleteImage&imageId=' + imageIdToDelete, {method: 'POST'})
                                                            .then(response => {
                                                                if (response.ok) {
                                                                    console.log("yay");
                                                                    // Reload the page directly on success
                                                                    location.reload();
                                                                } else {
                                                                    console.log("nay");
                                                                    // Handle HTTP error
                                                                    response.text().then(text => {
                                                                        alert('Failed to delete image: ' + text);
                                                                    });
                                                                }
                                                            })
                                                });

                                                document.getElementById('orderSelect').addEventListener('change', function () {
                                                    const orderId = this.value;
                                                    const productOptions = document.querySelectorAll('#productSelect option');
                                                    productOptions.forEach(option => {
                                                        if (option.classList.contains('order-' + orderId) || option.value === '') {
                                                            option.style.display = 'block';
                                                        } else {
                                                            option.style.display = 'none';
                                                        }
                                                    });
                                                    document.getElementById('productSelect').value = '';
                                                });

                                                document.getElementById('imageUpload').addEventListener('change', function () {
                                                    const preview = document.getElementById('imagePreview');
                                                    preview.innerHTML = '';
                                                    Array.from(this.files).forEach(file => {
                                                        const reader = new FileReader();
                                                        reader.onload = function (e) {
                                                            const img = document.createElement('img');
                                                            img.src = e.target.result;
                                                            preview.appendChild(img);
                                                        };
                                                        reader.readAsDataURL(file);
                                                    });
                                                });
        </script>
    </body>
</html>
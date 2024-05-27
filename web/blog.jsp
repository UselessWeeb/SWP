<!DOCTYPE html>
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
    </head>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <body>
        <%@include file = "view/header.jsp" %>
        <section class="hero-section position-relative bg-light-gray padding-medium">
            <div class="hero-content">
                <div class="container">
                    <div class="row">
                        <div class="text-center">
                            <h1>Blog</h1>
                            <div class="breadcrumbs">
                                <span class="item">
                                    <a href="index.jsp">Home > </a>
                                </span>
                                <span class="item text-decoration-underline">Blog</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="padding-large">
            <div class="container">
                <div class="row">
                    <jsp:include page="/blogSidebar"/>
                    <main class="col-md-9">
                        <div class="filter-blog d-flex flex-wrap justify-content-between">
                            <div class="showing-product">
                                <c:choose>
                                    <c:when test="${not empty blogList and not empty totalPage and not empty currentPage}">
                                        <p>Showing ${currentPage * totalPerPage + 1} - ${(currentPage * totalPerPage) + blogList.size()} of ${totalProducts} results</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>No results found.</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="sort-by">
                                <select id="sorting" class="form-select" data-filter-sort="" data-filter-order="">
                                    <option value="">Latest to oldest</option>
                                    <option value="">Oldest to latest</option>
                                    <option value="">Popular</option>
                                    <option value="">Name (A - Z)</option>
                                    <option value="">Name (Z - A)</option>
                                    <option value="">Model (A - Z)</option>
                                    <option value="">Model (Z - A)</option>   
                                </select>
                            </div>
                        </div>
                        <div class = "row post-content">
                            <c:set var = "blogList" value = "${requestScope.blogList}" />
                            <c:forEach var="blog" items="${blogList}">
                                <div class="col-lg-4 col-md-6 posts mb-4">
                                    <a href="blogdetails" class="btn rounded-0 py-0 px-2">
                                        <c:forEach var="category" items="${blog.category}">
                                            ${category.category}
                                        </c:forEach>
                                    </a>
                                    <img src="${blog.thumbnail}" alt="post image" class="img-fluid">
                                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark">
                                        <a href="single-post.html?id=${blog.blogId}">${blog.title}</a>
                                    </h4>
                                    <p class="mb-2">${blog.blogContent}</p>
                                    <a class="text-decoration-underline" href="blogdetails?id=${blog.blogId}">Read More</a>
                                </div>
                            </c:forEach>
                        </div>
                        <nav class="py-5" aria-label="Page navigation">
                            <ul class="pagination justify-content-center gap-4">
                                <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                                    <a class="page-link" href="?page=${currentPage - 1}">Previous</a>
                                </li>
                                <c:forEach var="i" begin="0" end="${totalPage-1}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="?page=${i}">${i+1}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${currentPage == totalPage - 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="?page=${currentPage + 1}">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </main>
                </div>
            </div>
        </div>

        <section id="customers-reviews" class="position-relative margin-large mt-0">
            <div class="container">
                <div class="section-title overflow-hidden mb-4">
                    <h3 class="d-flex align-items-center">Customers reviews</h3>
                </div>
                <div class="position-absolute top-50 end-0 pe-0 pe-xxl-5 me-0 me-xxl-5 swiper-next testimonial-button-next">
                    <svg class="chevron-forward-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                    <use xlink:href="#alt-arrow-right-outline"></use>
                    </svg>
                </div>
                <div class="position-absolute top-50 start-0 ps-0 ps-xxl-5 ms-0 ms-xxl-5 swiper-prev testimonial-button-prev">
                    <svg class="chevron-back-circle d-flex justify-content-center align-items-center border rounded-3 p-2" width="55" height="55">
                    <use xlink:href="#alt-arrow-left-outline"></use>
                    </svg>
                </div>
                <div class="swiper testimonial-swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="card position-relative text-left p-5 border rounded-3">
                                <blockquote>?I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                    needs. Highly recommended!?</blockquote>
                                <div class="rating text-primary">
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                </div>
                                <h5 class="mt-1 fw-normal">Emma Chamberlin</h5>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="card position-relative text-left p-5 border rounded-3">
                                <blockquote>?This tech store is my go-to for all things tech! Whether it's a new smartphone, accessories, or even troubleshooting advice, they've always got me covered. The staff is friendly, and their expertise is unmatched. Trust me;
                                    you won't regret shopping here!?</blockquote>
                                <div class="rating text-primary">
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                </div>
                                <h5 class="mt-1 fw-normal">Thomas John</h5>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="card position-relative text-left p-5 border rounded-3">
                                <blockquote>?I recently purchased a smartwatch from this tech store, and I'm absolutely thrilled find the perfect fit with my purchase! Not only did they have an extensive find the perfect fit selection to choose from, but their team helped
                                    me find the perfect fit for my lifestyle.?</blockquote>
                                <div class="rating text-primary">
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                </div>
                                <h5 class="mt-1 fw-normal">Kevin Bryan</h5>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="card position-relative text-left p-5 border rounded-3">
                                <blockquote>?I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                    needs. Highly recommended!?</blockquote>
                                <div class="rating text-primary">
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                </div>
                                <h5 class="mt-1 fw-normal">Stevin</h5>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="card position-relative text-left p-5 border rounded-3">
                                <blockquote>?I stumbled upon this tech store while searching for a new laptop, and I couldn't be happier with my experience! The staff was incredibly knowledgeable and guided me through the process of choosing the perfect device for my
                                    needs. Highly recommended!?</blockquote>
                                <div class="rating text-primary">
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                    <svg class="star star-fill">
                                    <use xlink:href="#star-fill"></use>
                                    </svg>
                                </div>
                                <h5 class="mt-1 fw-normal">Roman</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="brands" class="py-5 border-top border-bottom">
            <div class="container">
                <div class="brand-images my-5 d-flex align-items-center justify-content-between flex-wrap">
                    <a href="#" class="brand">
                        <img src="images/brand1.png" alt="brand" class="img-fluid">
                    </a>
                    <a href="#" class="brand">
                        <img src="images/brand2.png" alt="brand" class="img-fluid">
                    </a>
                    <a href="#" class="brand">
                        <img src="images/brand3.png" alt="brand" class="img-fluid">
                    </a>
                    <a href="#" class="brand">
                        <img src="images/brand4.png" alt="brand" class="img-fluid">
                    </a>
                    <a href="#" class="brand">
                        <img src="images/brand5.png" alt="brand" class="img-fluid">
                    </a>
                </div>
            </div>
        </section>

        <section id="instagram" class="padding-large">
            <div class="container">
                <div class="text-center mb-4">
                    <h3>Instagram #shoplite</h3>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item1.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item2.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item3.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item4.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item5.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                    <div class="col-md-2">
                        <figure class="instagram-item position-relative rounded-3">
                            <a href="https://templatesjungle.com/" class="image-link position-relative">
                                <div class="icon-overlay position-absolute d-flex justify-content-center">
                                    <svg class="instagram">
                                    <use xlink:href="#instagram"></use>
                                    </svg>
                                </div>
                                <img src="images/insta-item6.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
                            </a>
                        </figure>
                    </div>
                </div>
            </div>
        </section>
        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>
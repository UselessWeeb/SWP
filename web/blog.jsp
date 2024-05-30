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
                    <jsp:include page="/Sidebar"/>
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
                        </div>
                        <div class = "row post-content">
                            <c:set var = "blogList" value = "${requestScope.blogList}" />
                            <c:forEach var="blog" items="${blogList}">
                                <div class="col-lg-4 col-md-6 posts mb-4">
                                    <a href="/app-name/blog?
                                        <c:forEach var="category" items="${blog.category}">
                                        category=${category.category}"
                                        </c:forEach>
                                        class="btn rounded-0 py-0 px-2">
                                        <c:forEach var="category" items="${blog.category}">
                                            ${category.category}
                                        </c:forEach>
                                    </a>
                                    <img src="${blog.thumbnail}" alt="post image" class="img-fluid">
                                    <h4 class="card-title mt-3 mb-2 text-uppercase text-dark">
                                        <a href="blogdetails?id=${blog.blogId}">${blog.title}</a>
                                    </h4>
                                    <p class="mb-2" '${fn:substring(fn:replace(blog.blogContent, "</.*?> a-z", ""), 0, 15)}...'>
                                    </p>
                                    <a class="text-decoration-underline" href="blogdetails?id=${blog.blogId}">Read More</a>
                                </div>
                            </c:forEach>
                        </div>
                        <nav class="py-5" aria-label="Page navigation">
                            <ul class="pagination justify-content-center gap-4">
                                <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                                    <a class="page-link" href="blog?page=${currentPage - 1}&search=${!empty searchQuery ? searchQuery.trim() : ''}
                                       <c:forEach var="category" items="${selectedCategories}">
                                           <c:if test="${!empty category}">
                                               &category=${category.trim()}
                                           </c:if>
                                       </c:forEach>
                                       ">Previous
                                    </a>
                                </li>
                                <c:forEach var="i" begin="0" end="${totalPage-1}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link px-3 ${i == currentPage ? 'bg-primary text-white' : ''}" href="blog?page=${i}&search=${!empty searchQuery ? searchQuery.trim() : ''}
                                           <c:forEach var="category" items="${selectedCategories}">
                                               <c:if test="${!empty category}">
                                                   &category=${category.trim()}
                                               </c:if>
                                           </c:forEach>
                                           ">${i+1}
                                        </a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${currentPage == totalPage - 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="blog?page=${currentPage + 1}&search=${!empty searchQuery ? searchQuery.trim() : ''}
                                       <c:forEach var="category" items="${selectedCategories}">
                                           <c:if test="${!empty category}">
                                               &category=${category.trim()}
                                           </c:if>
                                       </c:forEach>
                                       ">Next
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </main>
                </div>
            </div>
        </div>
        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>
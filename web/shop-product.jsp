<%-- 
    Document   : shop
    Created on : May 16, 2024, 3:29:06 PM
    Author     : M7510
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Shop</title>
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

    <body>
        <%@include file = "view/header.jsp" %>
        <%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <div class="shopify-grid">
            <div class="container">
                <div class="row">
                    <main class="col-md-9">
                        <div class="filter-shop d-flex flex-wrap justify-content-between">
                            <div class="showing-product">
                                <c:set var= "laptopList" value= "${requestScope.laptopList}" />
                                <c:set var= "totalPage" value= "${requestScope.totalPage}" />
                                <c:set var= "currentPage" value= "${requestScope.currentPage}" />
                                <c:set var= "totalProducts" value = "${requestScope.totalProducts}" />
                                <c:set var= "totalPerPage" value= "${requestScope.totalPerPage}" />
                                <c:set var = "searchQuery" value= "${requestScope.searchQuery}"/>
                                <c:set var = "categoryMap" value= "${requestScope.categoryMap}"/>
                                <c:set var = "selectedCategories" value= "${requestScope.selectedCategories}"/>
                                <c:choose>
                                    <c:when test="${not empty laptopList and not empty totalPage and not empty currentPage}">
                                        <p>Showing ${currentPage * totalPerPage + 1}–${(currentPage * totalPerPage) + laptopList.size()} of ${totalProducts} results</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>No results found.</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="row product-content product-store">
                            <c:forEach items="${laptopList}" var="laptop">
                                <div class="col-lg-3 col-md-4">
                                    <div class="card position-relative text-center py-4 border rounded-3">
                                        <img src="${laptop.mainImage}" class="p-3 img-fluid product-image" alt="${laptop.title}">
                                        <h5 class="mt-2"><a href="productdetails?laptopId=${laptop.laptopId}">${laptop.title}</a></h5>
                                        <div class = "d-flex justify-content-between px-3">
                                            <c:if test = "${laptop.salePrice != laptop.originalPrice}">
                                                <s class="fs-5 fw-lighter text-muted">$${laptop.originalPrice}</s>
                                                </c:if>            
                                            <span class="price text-primary fw-light mb-2">$${laptop.salePrice}</span>
                                        </div>
                                        <div class="card-concern position-absolute start-0 end-0 d-flex gap-2">
                                            <button type="button" class="btn btn-dark" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart">
                                                <svg class="cart">
                                                <use xlink:href="#cart"></use>
                                                </svg>
                                            </button>
                                            <button type="button" class="btn btn-dark" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist">
                                                <svg class="wishlist">
                                                <use xlink:href="#heart"></use>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <nav class="py-5" aria-label="Page navigation">
                                <ul class="pagination justify-content-center gap-4">
                                    <c:if test="${currentPage > 0}">
                                        <li class="page-item">
                                            <a class="page-link" href="productList?page=${currentPage - 1}&search=${searchQuery}
                                               <c:forEach var="category" items="${selectedCategories}">
                                                   &category=${category}
                                               </c:forEach>
                                               ">Prev</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${currentPage == 0}">
                                        <li class="page-item disabled">
                                            <span class="page-link">Prev</span>
                                        </li>
                                    </c:if>
                            
                                    <c:if test="${totalPage > 0}">
                                        <c:forEach var="i" begin="0" end="${(totalPage == 0) ? 0 : totalPage - 1}">
                                            <c:choose>
                                                <c:when test="${i < 2 || (i > currentPage - 1 && i < currentPage + 1) || i > totalPage - 3}">
                                                    <li class="page-item ">
                                                        <a class="px-3 page-link page-item ${i == currentPage ? 'bg-primary text-white' : ''}" href="productList?page=${i}&search=${searchQuery.trim() != '' ? searchQuery : ''}
                                                            <c:forEach var="category" items="${selectedCategories}">
                                                                <c:if test="${!empty category}">
                                                                    &category=${category}
                                                                </c:if>
                                                            </c:forEach>
                                                            ">${i + 1}
                                                        </a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${(i == 2 && currentPage > 2) || (i == totalPage - 3 && currentPage < totalPage - 3)}">
                                                        <li class="page-item disabled">
                                                            <span class="page-link">...</span>
                                                        </li>
                                                    </c:if>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </c:if>
                            
                                    <c:if test="${currentPage < totalPage - 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="productList?page=${currentPage + 1}&search=${searchQuery}
                                           <c:forEach var="category" items="${selectedCategories}">
                                               &category=${category}
                                           </c:forEach>
                                           ">Next
                                        </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${currentPage >= totalPage - 1}">
                                        <li class="page-item disabled">
                                            <span class="page-link">Next</span>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </main>
                    <jsp:include page="/Sidebar" flush="true"/>
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

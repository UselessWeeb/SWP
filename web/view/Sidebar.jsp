<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String uri = request.getRequestURI();
    request.setAttribute("uri", uri);
    System.out.println(uri);
%>
<!DOCTYPE html>
<html>
    <aside class="col-md-3">
        <c:choose>
            <c:when test = '${uri.contains("index.jsp")}'>
                <div class = "bg-light px-4 h-100">
                    <div class="text-center py-5 mb-3 side-content"><h4>Latest Blog</h4></div>
                    <c:set var="latestBlogs" value="${requestScope.latestBlogs != null ? requestScope.latestBlogs : requestScope.blogLatestList}" />
                    <c:forEach items="${latestBlogs}" var="blog">
                        <div class="posts mb-4 position-relative">
                            <div class="d-flex justify-content-between">
                                <span class="btn rounded-2 py-0 px-2">
                                    <c:forEach items = "${blog.category}" var = "category">
                                        ${category.category} 
                                    </c:forEach>                           
                                </span>
                                <span class="btn rounded-2 py-0 px-2 btn bg-info text-black py-0 px-2 position-absolute top-5 end-10 translate-middle">New</span>
                            </div>
                            <img src="${blog.thumbnail}" class="mw-100 p-3 img-fluid" alt="${blog.title}">
                            <h5 class="mt-2"><a href="single-post.jsp?blogId=${blog.blogId}">${blog.title}</a></h5>
                            <p class="text-muted"><c:set var="content" value="${blog.blogContent}" />
                                <c:choose>
                                    <c:when test="${fn:length(content) > 12}">
                                        <c:set var="shortContent" value="${fn:substring(content, 0, 12)}..." />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="shortContent" value="${content}" />
                                    </c:otherwise>
                                </c:choose>

                                ${shortContent}</p>
                            <a class="text-decoration-underline" href="blogdetails?id=${blog.blogId}">Read More</a>
                        </div>                  
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <form class="sidebar pe-lg-5 mb-3" role="search" id = "form"
                      <c:choose>
                          <c:when test = '${uri.contains("blog.jsp") || uri.contains("single-post.jsp")}'>
                              action="blog"
                          </c:when>
                          <c:when test = '${uri.contains("shop.jsp") || uri.contains("single-product.jsp")}'>
                              action="productList"
                          </c:when>
                      </c:choose>
                      >
                    <div class="widget-menu">
                        <div class="widget-search-bar">
                            <div class="d-flex border rounded-3 p-2 " role="search" action="blog">
                                <input class="form-control border-0 me-2" type="search" placeholder="Search" aria-label="Search" name="search" value="${searchQuery}">
                                <button class="btn rounded-3 px-4 d-flex align-items-center" type="submit">
                                    <svg class="search text-light" width="18" height="18">
                                    <use xlink:href="#search"></use>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="widget-product-categories pt-5">
                        <div class="section-title overflow-hidden mb-2">
                            <h4 class="d-flex flex-column mb-0 side-content py-1">Categories</h4>
                        </div>
                        <ul class="product-categories mb-0 sidebar-list list-unstyled">
                            <c:forEach var="entry" items="${categoryMap}">
                                <li class="cat-item">
                                    <c:set var="selectedCategoriesString" value="${fn:join(selectedCategories, ',')}" />
                                    <a href =
                                       <c:choose>
                                           <c:when test = '${uri.contains("single-post.jsp")}'>
                                               "/app-name/blog?search=&category=${entry.key}"
                                           </c:when>
                                           <c:when test = '${uri.contains("single-product.jsp")}'>
                                               "/app-name/productList?search=&category=${entry.key}&minPrice=0&maxPrice=${maxPriceFromDB}"
                                           </c:when>
                                           <c:otherwise>
                                               "?search=&category=${entry.key}&minPrice=0&maxPrice=${maxPriceFromDB}"
                                           </c:otherwise>
                                       </c:choose> class 
                                       = "${fn:contains(selectedCategoriesString, entry.key) ? 'bg-info text-white' : ''}">
                                        ${entry.key} (${entry.value})
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <c:if test = '${uri.contains("shop.jsp")}'>
                            <div class="widget-product-categories pt-5">
                                <div class="section-title overflow-hidden mb-2">
                                    <h4 class="d-flex flex-column mb-0 side-content py-1">Find by Prices</h4>
                                </div>
                                <div class="wrapper">
                                    <div class="values">
                                        <span id="range1">
                                            ${minPrice}
                                        </span>
                                        <span> &dash; </span>
                                        <span id="range2">
                                            ${maxPriceFromDB}
                                        </span>
                                    </div>
                                    <div class="range-container">
                                        <div class="slider-track"></div>
                                        <input type="range" min="0" max="${maxPriceFromDB}" value="${minPrice}" name="minPrice" id="slider-1" oninput="slideOne()" onchange = "sendForm()">
                                        <input type="range" min="0" max="${maxPriceFromDB}" value="${maxPrice}" name="maxPrice" id="slider-2" oninput="slideTwo()" onchange = "sendForm()">
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class="widget-product-categories pt-5">
                        <section id="customers-reviews" class="position-relative">
                            <div class="section-title overflow-hidden mb-2">
                                <h4 class="d-flex flex-column mb-0 side-content py-1">Latest</h4>
                            </div>
                            <c:choose>
                                <c:when test = '${uri.contains("blog.jsp") || uri.contains("single-post.jsp")}'>
                                    <c:set var="latestBlogs" value="${requestScope.latestBlogs}" />
                                    <c:forEach items="${latestBlogs}" var="blog">
                                        <div class="posts mb-4 position-relative">
                                            <div class="d-flex justify-content-between">
                                                <span class="btn rounded-2 py-0 px-2">
                                                    <c:forEach items = "${blog.category}" var = "category">
                                                        ${category.category} 
                                                    </c:forEach>                           
                                                </span>
                                                <span class="btn rounded-2 py-0 px-2 btn bg-info text-black py-0 px-2 position-absolute top-5 end-10 translate-middle">New</span>
                                            </div>
                                            <img src="${blog.thumbnail}" class="mw-100 p-3 img-fluid" alt="${blog.title}">
                                            <h5 class="mt-2"><a href="blogdetails?id=${blog.blogId}">${blog.title}</a></h5>
                                                <c:set var="content" value="${blog.blogContent}" />
                                                <c:choose>
                                                    <c:when test="${fn:length(content) > 12}">
                                                        <c:set var="shortContent" value="${fn:substring(content, 0, 12)}..." />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var="shortContent" value="${content}" />
                                                    </c:otherwise>
                                                </c:choose>

                                            <p>${shortContent}</p>
                                        </div>                  
                                    </c:forEach>
                                </c:when>
                                <c:when test = '${uri.contains("shop.jsp") || uri.contains("single-product.jsp")}'>
                                    <c:set var="latestProducts" value="${requestScope.latestProducts}" />
                                    <c:forEach items="${latestProducts}" var="laptop">
                                        <div class="position-relative text-left rounded-3">
                                            <img src="${laptop.mainImage}" class="mw-100 p-3 img-fluid" alt="${laptop.title}">
                                            <h5 class="mt-2"><a href="single-product.jsp?laptopId=${laptop.laptopId}">${laptop.title}</a></h5>
                                                <c:if test="${laptop.salePrice != laptop.originalPrice}">
                                                <s class="fs-5 fw-lighter text-muted">$${laptop.originalPrice}</s>
                                                </c:if>
                                            <span class="price text-primary fw-light mb-2">$${laptop.salePrice}</span>
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
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </section>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>
    </aside>
    <script language="javascript" type="text/javascript">
        function sendForm() {
            $("#form").submit();
        }
    </script>
</html>

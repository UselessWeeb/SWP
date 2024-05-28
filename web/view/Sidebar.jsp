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
        <form class="sidebar pe-lg-5 mb-3" role="search"
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
                <section id="customers-reviews" class="position-relative">
                    <div class="section-title overflow-hidden mb-2">
                        <h3 class="d-flex flex-column mb-0">Latest</h3>
                    </div>
                    <div class="swiper product-swiper">
                        <div class="swiper-wrapper">
                            <c:choose>
                                <c:when test = '${uri.contains("blog.jsp") || uri.contains("single-post.jsp")}'>
                                    <c:set var="latestBlogs" value="${requestScope.latestBlogs}" />
                                    <c:forEach items="${latestBlogs}" var="blog">
                                        <div class="swiper-slide">
                                            <div class="card position-relative text-left p-5 border rounded-3">
                                                <img src="${blog.thumbnail}" class="mw-100 p-3 img-fluid" alt="${blog.title}">
                                                <h5 class="mt-2"><a href="single-post.jsp?blogId=${blog.blogId}">${blog.title}</a></h5>
                                                <p class="text-muted">${blog.blogContent}</p>
                                                <a class="text-decoration-underline" href="blogdetails?id=${blog.blogId}">Read More</a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:when test = '${uri.contains("shop.jsp") || uri.contains("single-product.jsp")}'>
                                    <c:set var="latestProducts" value="${requestScope.latestProducts}" />
                                    <c:forEach items="${latestProducts}" var="laptop">
                                        <div class="swiper-slide">
                                            <div class="card position-relative text-left p-5 border rounded-3">
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
                                        </div>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </section>
            </div>
            <div class="widget-product-categories pt-5">
                <div class="section-title overflow-hidden mb-2">
                    <h3 class="d-flex flex-column mb-0">Categories</h3>
                </div>
                <ul class="product-categories mb-0 sidebar-list list-unstyled">
                    <c:forEach var="entry" items="${categoryMap}">
                        <li class="cat-item">
                            <c:set var="selectedCategoriesString" value="${fn:join(selectedCategories, ',')}" />
                            <input type="checkbox" name="category" value="${entry.key}" 
                                   ${fn:contains(selectedCategoriesString, entry.key) ? 'checked' : ''}>
                            <label>${entry.key} (${entry.value})</label>
                        </li>
                    </c:forEach>
                </ul>
                <c:if test = '${uri.contains("shop.jsp") || uri.contains("single-product.jsp")}'>
                    <div class="widget-product-categories pt-5">
                        <div class="section-title overflow-hidden mb-2">
                            <h3 class="d-flex flex-column mb-0">Find by Prices</h3>
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
                                <input type="range" min="0" max="${maxPriceFromDB}" value="${minPrice}" name="minPrice" id="slider-1" oninput="slideOne()">
                                <input type="range" min="0" max="${maxPriceFromDB}" value="${maxPrice}" name="maxPrice" id="slider-2" oninput="slideTwo()">
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </form>
    </aside>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <aside class="col-md-3">
        <form class="sidebar ps-lg-5" role="search" action="productList">
            <div class="widget-menu">
                <div class="widget-search-bar">
                    <div class="d-flex border rounded-3 p-2">
                        <input class="form-control border-0 me-2" type="search" placeholder="Search" name="search" aria-label="Search" value="${fn:escapeXml(searchQuery)}">
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
                    <div class="container">
                        <div class="section-title overflow-hidden mb-2">
                            <h3 class="d-flex flex-column mb-0 side-content">Latest</h3>
                        </div>
                        <div class="swiper product-swiper">
                            <div class="swiper-wrapper">
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
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="widget-product-categories pt-5">
                <div class="section-title overflow-hidden mb-2">
                    <h3 class="d-flex flex-column mb-0 side-content">Categories</h3>
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
            </div>
            <div class="widget-price-filter pt-5">
                <div class="section-title overflow-hidden mb-2">
                    <h3 class="d-flex flex-column mb-0 side-content">Filter by price</h3>
                </div>
                <ul class="product-tags mb-0 sidebar-list list-unstyled">
                    <li class="tags-item">
                        <a href="#">Less than $10</a>
                    </li>
                    <li class="tags-item">
                        <a href="#">$10- $20</a>
                    </li>
                    <li class="tags-item">
                        <a href="#">$20- $30</a>
                    </li>
                    <li class="tags-item">
                        <a href="#">$30- $40</a>
                    </li>
                    <li class="tags-item">
                        <a href="#">$40- $50</a>
                    </li>
                </ul>
            </div>
        </form>
    </aside>
</html>

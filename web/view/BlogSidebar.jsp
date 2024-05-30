<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <aside class="col-md-3">
        <div class="sidebar pe-lg-5 mb-3">
            <div class="widget-menu">
                <div class="widget-search-bar">
                    <form class="d-flex border rounded-3 p-2 " role="search" action="blog">
                        <input class="form-control border-0 me-2" type="search" placeholder="Search" aria-label="Search" name="search" value="${searchQuery}">
                        <button class="btn rounded-3 px-4 d-flex align-items-center" type="submit">
                            <svg class="search text-light" width="18" height="18">
                            <use xlink:href="#search"></use>
                            </svg>
                        </button>
                    </form>
                </div>
            </div>
            <div class="widget-product-categories pt-5">
                <div class="section-title overflow-hidden mb-2">
                    <h4 class="d-flex flex-column mb-0 side-content" style = "
                            background-color: #ff6543;
                            color: white;
                            border-radius: 5px;
                            text-align: center;
                            ">Categories</h4>
                </div>
                <ul class="product-categories mb-0 sidebar-list list-unstyled">
                    <c:forEach var="entry" items="${categoryMap}">
                        <li class="cat-item">
                            <h6>
                                <a href="/app-name/blog?category=${entry.key}">${entry.key} (${entry.value})</a>
                            </h6>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="widget-product-categories pt-5">
                <section id="customers-reviews" class="position-relative">
                    <div class="section-title overflow-hidden mb-2">
                        <h4 class="d-flex flex-column mb-0 side-content" style = "
                            background-color: #ff6543;
                            color: white;
                            border-radius: 5px;
                            text-align: center;
                            ">Latest Blogs</h4>
                    </div>
                    <div class="swiper product-swiper">
                        <div class="swiper-wrapper">
                            <c:set var="latestBlogs" value="${requestScope.latestBlogs}" />
                            <c:forEach items="${latestBlogs}" var="blog">
                                <div class="swiper-slide">
                                    <div class="card position-relative text-left p-6 border rounded-3">
                                        <img src="${blog.thumbnail}" class="mw-100 p-3 img-fluid" alt="${blog.title}">
                                        <p class="mt-2"><a href="blogdetails?id=${blog.blogId}">${blog.title}</a></p>
                                        <p class="text-muted">${blog.blogContent}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </aside>
</html>

<%-- 
    Document   : single-post
    Created on : May 16, 2024, 3:35:31 PM
    Author     : M7510
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

    <head>
        <title>${blog.title}</title>
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
        <c:set var = "blog" value = "${requestScope.blog}" />
        <div class="post-wrap overflow-hidden">
            <div class="container">
                <div class="row">
                    <main class="post-grid">
                        <div class="row">
                            <jsp:include page="/Sidebar"/>
                            <article class="post-item col-md-9">
                                <div class="post-content">
                                    <div class="hero-image">
                                        <img src="${blog.thumbnail}" alt="single-post" class="img-fluid">
                                    </div>
                                    <c:set var = "user1" value ="${requestScope.user1}"/>
                                    <div class="post-meta mt-4">
                                        <span class="post-category"><fmt:formatDate value="${blog.updatedDate}" pattern="dd-MM-yyyy" /></span> 
                                        - <h1>${user2}</h1>
                                        <span class="meta-date">
                                            <a href="blog.html">
                                                <c:forEach items = "${category}" var = "blog.category">
                                                    ${category} 
                                                </c:forEach>
                                            </a>
                                        </span>
                                    </div>
                                    
                                    <div class="post-description review-item mt-4">
                                        ${blog.blogContent}
                                    </div>
                                    <div id="single-post-navigation" class="mt-3">
                                        <div class="post-navigation d-flex flex-wrap align-items-center justify-content-between">
                                            <a itemprop="url" class="post-prev d-flex align-items-center" href="#">
                                                <svg class="alt-arrow-left-bold" width="44" height="44">
                                                <use xlink:href="#alt-arrow-left-bold"></use>
                                                </svg>
                                                <h4 class="card-title text-uppercase text-dark"></h4>
                                            </a>
                                            <a itemprop="url" class="post-next d-flex align-items-center" href="#">
                                                <h4 class="card-title text-uppercase text-dark"></h4>
                                                <svg class="alt-arrow-right-bold" width="44" height="44">
                                                <use xlink:href="#alt-arrow-right-bold"></use>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <%@include file = "view/footer.jsp"%>
                        </div>
                    </main>
                </div>
            </div>
        </div>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>

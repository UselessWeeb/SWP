<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <head>
        <title>${page == null ? "User Authorization" : page}</title>
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
        <!-- Select2 CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />

        <!-- jQuery (Select2 depends on it) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Select2 JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
        <style>
            .content iframe {
                width: 100%;
                height: calc(100% - 40px);
                border: none;
                background-color: #ccc;
            }
            .iframe-cover {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 10;
            }
            
            .select2{
                width:100%!important;
            }
        </style>
    </head>
    <body>
        <%@include file = "view/header.jsp" %>
        <div class="d-flex">
            <div class="sidebar d-flex flex-column px-3">       
                <form action="updateauth" class ="card px-3 py-3 mb-3">
                    <h5 class="btn btn-modify mb-2">Modify Role</h5>
                    <div class="mb-3">
                        <c:forEach var="role" items="${roles}">
                            <label class="d-block">
                                <input type="checkbox" value="${role.role_id}" name="role"
                                       <c:if test="${roleSelected.contains(role.role_id)}">checked</c:if>>
                                <c:set var="rolePurposeWithSpaces" value="${fn:replace(role.role_purpose, '_', ' ')}" />
                                <c:set var="formattedText" value="" />
                                <c:forEach var="word" items="${fn:split(fn:toLowerCase(rolePurposeWithSpaces), ' ')}">
                                    <c:set var="formattedText" value="${formattedText} ${fn:toUpperCase(fn:substring(word,0,1))}${fn:substring(word,1,fn:length(word))}" />
                                </c:forEach>
                                <span class="ps-1">${formattedText}</span>
                            </label>
                        </c:forEach>
                        <input type="text" name="url" value="${(url==null) ? '/' : url}" hidden>
                    </div>
                    <button type="submit" class="btn btn-save mb-2">Save</button>
                    <c:choose>
                        <c:when test="${not empty url}">
                            <a class="btn btn-save mb-2" href="${(fn:startsWith(url, '/') ? fn:substring(url, 1, url.length()) : url)}">Visit Page</a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-save mb-2" href="http://localhost:9999/app-name/">Visit Page</a>
                        </c:otherwise>
                    </c:choose>
                </form>
                <div class = "card px-3 py-3">
                    <h5 class="btn btn-modify mb-2 align-center">Modify Hidden Urls</h5>
                    <!--a div page to select url via checkbox, with search and a div for user to see which page has been choosed. user can also remove by pressing the letter "x" in each choosed elements-->
                    <!--assume 2 has been choosed-->
                    <div class="mb-3">
                        <div class="d-flex flex-grow-1">
                            <div class="me-2 w-100">
                                <select class="form-select searchable-select" id="hiddenUrlSelect">
                                    <option value="">Select an option</option>
                                    <c:forEach var="urlItem" items="${urls}">
                                        <option value="${urlItem}" ${urlItem.equals(url) ? "selected" : ""}>${urlItem == '/' ? 'Home' : urlItem}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex flex-wrap mt-2" id="hiddenUrlContainer">
                            <p>Here contains all urls that will not be displayed on the header, which caused by the fact that they do not display anything, only serve as a bridge for other's action</p>
                            <c:forEach var="url" items="${hiddenUrlsSelected}">
                                <div class="me-2 mb-2">
                                    <span>${url == '/' ? 'Home' : url}</span>
                                    <button class="btn btn-remove" data-url="${url}">x</button>
                                </div>
                            </c:forEach>
                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="content flex-grow-1">
                <form action="userauthorization" method="GET"> <!-- Replace YourServletURL with the actual URL of your servlet -->
                    <select class="form-select mb-3 searchable-select" name="url" onchange="this.form.submit()">
                        <option value="http://localhost:9999/app-name/" ${url.equals("http://localhost:9999/app-name/") ? "selected" : ""}>Home</option>
                        <option value="/" ${url.equals("/") ? "selected" : ""}>Home</option>
                        <c:forEach var="urlItem" items="${urls}">
                            <option value="${urlItem}" ${urlItem.equals(url) ? "selected" : ""}>${urlItem == '/' ? 'Home' : urlItem}</option>
                        </c:forEach>
                    </select>
                </form>
                <div style="position: relative;">
                    <iframe id="contentIframe" src="${url == '/' ? 'http://localhost:9999/app-name/' : (fn:startsWith(url, '/') ? fn:substring(url, 1, url.length()) : url)}" title="${url == '/' ? 'Home' : url}" style="width: 100%; height: 500px; border: none;"></iframe>
                    <div class="iframe-cover" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 10; background: transparent;"></div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            var iframeCover = document.querySelector('.iframe-cover');
                            var iframe = document.getElementById('contentIframe');

                            // Assuming the iframe content is from the same origin for this to work
                            iframeCover.addEventListener('wheel', function (e) {
                                // Prevent the default wheel behavior (page scrolling)
                                e.preventDefault();
                                // Scroll the iframe content, adjust the 30 to control scroll speed
                                var scrollAmount = e.deltaY > 0 ? 500 : -500;
                                iframe.contentWindow.scrollBy(0, scrollAmount);
                            });
                        });
        </script>

        <script>
            $(document).ready(function () {
                $('.searchable-select').select2({
                    placeholder: "Select an option",
                    allowClear: true
                });
            });
        </script>
        <%@include file = "view/footer.jsp" %>
    </body>
</html>


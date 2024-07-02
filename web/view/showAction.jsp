<%-- 
    Document   : showAction
    Created on : May 25, 2024, 9:43:26 PM
    Author     : M7510
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <c:forEach var="url" items="${accessibleurls}">
        <li class="nav-item">
            <a class="nav-link me-4 ${(url != '/' && fn:contains(pageContext.request.requestURI, fn:substringAfter(url, '/'))) ? 'active' : ''}" href="${url == '/' ? '/app-name/' : fn:substringAfter(url, '/')}">
                <c:choose>
                    <c:when test="${url == '/'}">Home</c:when>
                    <c:otherwise>${fn:substringAfter(url, '/')}</c:otherwise>
                </c:choose>
            </a>
        </li>
    </c:forEach>
</html>

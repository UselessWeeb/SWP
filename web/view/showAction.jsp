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
    <c:set var="urls" value="${requestScope.accessibleUrls}" />
    <li class="nav-item dropdown">
        <a class="nav-link me-4 dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Pages</a>
        <ul class="dropdown-menu animate slide border">
            <c:forEach var="url" items="${urls}">
                <li>
                    <a href="${url}" class="dropdown-item fw-light">${url}</a>
                </li>
            </c:forEach>
        </ul>
    </li>
</html>

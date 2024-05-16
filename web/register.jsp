<%-- 
    Document   : register
    Created on : May 16, 2024, 8:53:12 PM
    Author     : phamn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang = "en">
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <c:set var="err" value="${requestScope.err}" />
            <c:if test="${not empty err}">
                <div class="noti">
                    <p><c:out value= "${err}"/></p>
                </div>
            </c:if> 
            <p data-toggle="modal" data-target="#myModal">Register</p>
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3>Register</h3>
                        </div>
                        <div class="modal-body">     
                            <form action="login" method="POST">
                                <input type="email" name="email" value="" required placeholder = "Enter your email here"/>
                                <input type="password" name="password" value="" required placeholder = "And your password here"/>
                                <input type="submit" value="submit" />
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

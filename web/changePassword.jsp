<%@page import="java.util.Vector,model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html>

    <head>
        <title>ShopLite - Simple eCommerce Website Template</title>
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

        <div class="container p-2">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-primary">Change Password</h4>
                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg}</p>
                                <c:remove var="successMsg" scope="session"/>
                            </c:if>
                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>
                            <form action="changepassword" method="post">
                                <div class="text-center">
                                    <label for="account"><b><u>Account</u></b></label>
                                    <input readonly="readonly" 
                                           class="form-control" 
                                           type="text" id="account" 
                                           name="full_name" 
                                           value="${user.email}">
                                </div>
                                <div class="text-center">
                                    <label for="current-password"><b><u>Current Password</u></b></label>
                                    <input class="form-control" 
                                           type="password" 
                                           id="current-password" 
                                           name="oldPassword" required>
                                </div>
                                <div class="text-center">
                                    <label for="new-password"><b><u>New Password</u></b></label>
                                    <input class="form-control" 
                                           type="password" 
                                           id="new-password" 
                                           name="newPassword" 
                                           required>
                                </div>
                                <div class="text-center">
                                    <label for="confirm-password"><b><u>Confirm New Password</u></b></label>
                                    <input class="form-control" 
                                           type="password" 
                                           id="confirm-password" 
                                           name="confirmPassword" 
                                           required>
                                </div>
                                <input type="hidden" name="id" value="${user.userId}">
                                <br>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary btn-sm btn-block">Change</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br> 

        <%@include file = "view/footer.jsp" %>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>
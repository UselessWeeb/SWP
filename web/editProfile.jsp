<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.Vector,model.User" %>
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
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-primary">Edit Profile</h4>
                            <form action="UserProfile" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Email</label>
                                    <input readonly="readonly" type="email" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="email"
                                           value="${user.email}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Your Name</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="fname"
                                           value="${user.fullName}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Gender:</label>
                                    <input type="radio"
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="sex"
                                           value="${user.gender}" checked>
                                    <label for="male">Male</label>
                                    <input type="radio"
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="sex"
                                           value="${user.gender}" checked>
                                    <label for="female">Female</label>
                                    <input type="radio"
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="sex"
                                           value="${user.gender}" checked>
                                    <label for="others">Others</label>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Phone Number</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="phone"
                                           value="${user.phoneNumber}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        Address</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputPassword1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="address"
                                           value="${user.address}">
                                </div>
                                <br>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary btn-sm btn-block">
                                        Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4>Welcome, <b>${user.fullName}</b></h4>
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
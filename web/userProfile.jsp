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
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-primary">Edit Profile</h4>
                            <c:if test="${not empty success}">
                                <p class="text-center text-success">${success}</p>
                                <c:remove var="successMsg" scope="session"/>
                            </c:if>
                            <c:if test="${not empty error }">
                                <p class="text-center text-danger">${error}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>
                            <form action="userProfile" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><b><u>Email</u></b></label>
                                    <input readonly="readonly" type="email" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="email"
                                           value="${user.email}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><b><u>Your Name</u></b></label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="fname"
                                           value="${user.fullName}">
                                </div>
                                <div class="form-group">
                                    <label for="gender"><b><u>Gender:</u></b></label><br>
                                    <input type="radio" id="male" name="sex" value="Male" ${user.gender == 'Male' ? 'checked' : ''}> Male
                                    <input type="radio" id="female" name="sex" value="Female" ${user.gender == 'Female' ? 'checked' : ''}> Female
                                    <input type="radio" id="other" name="sex" value="Other" ${user.gender == 'Other' ? 'checked' : ''}> Other
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1"><b><u>Address</u></b></label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputPassword1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="loca"
                                           value="${user.address}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><b><u>Phone Number</u></b></label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="phone"
                                           value="${user.phoneNumber}">
                                </div>
                                <input type="hidden" name="id" value="${user.userId}">
                                <br>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary btn-sm btn-block">
                                        Update</button>
                                    <a href="changePassword.jsp">Change Password</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 d-flex align-items-center">
                    <form action="userProfile" method="POST" enctype="multipart/form-data">
                        <div class="card">
                            <div class="card-body">
                                <input type="hidden" name="id" value="${user.userId}">
                                <input type="hidden" name="fname" value="${user.fullName}">
                                <input type="hidden" name="sex" value="${user.gender}">
                                <input type="hidden" name="loca" value="${user.address}">                                
                                <input type="hidden" name="phone" value="${user.phoneNumber}">
                                <img src="${user.avatar}" alt="${user.fullName}" style="max-width: 40%; height: auto;"><br>
                                <input type="file" id="image" name="img" accept=".jpeg, .png, .jpg">
                                <div class="save-button">
                                    <button type="submit">Save</button>
                                </div>  
                            </div>
                        </div>
                    </form>
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

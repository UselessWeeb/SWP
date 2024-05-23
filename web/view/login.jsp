<%-- 
    Document   : login
    Created on : May 15, 2024, 7:25:12 PM
    Author     : M7510
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
        <form action = "login" method = "POST" class="tab-pane fade active show" id="nav-sign-in" role="tabpanel" aria-labelledby="nav-sign-in-tab">
            <div class="form-group py-3">
                <label class="mb-2" for="sign-in">Username or email address *</label>
                <input type="text" minlength="2" name="username" placeholder="Your Username" class="form-control w-100 rounded-3 p-3" required>
            </div>
            <div class="form-group pb-3">
                <label class="mb-2" for="sign-in">Password *</label>
                <input type="password" minlength="2" name="password" placeholder="Your Password" class="form-control w-100 rounded-3 p-3" required>
            </div>
            <label class="py-3">
                <input type="checkbox" required="" class="d-inline">
                <span class="label-body">Remember me</span>
                <span class="label-body"><a href="#" class="fw-bold">Forgot Password</a></span>
            </label>
            <button type="submit" name="submit" class="btn btn-dark w-100 my-3">Login</button>
        </form>
</html>

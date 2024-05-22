<%-- 
    Document   : register
    Created on : May 16, 2024, 3:08:08 PM
    Author     : M7510
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <form action = "register" method = "POST" class="tab-pane fade" id="nav-register" role="tabpanel" aria-labelledby="nav-register-tab">
        <div class="form-group py-3">
            <label class="mb-2" for="register">Your email address *</label>
            <input type="text" minlength="2" name="username" placeholder="Your Email Address" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <div class="form-group py-3">
            <label class="mb-2" for="fullname">Full Name *</label>
            <input type="text" minlength="2" name="fullname" placeholder="Your Full Name" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <div class="form-group py-3">
            <label class="mb-2" for="gender">Gender *</label>
            <select name="gender" class="form-control w-100 rounded-3 p-3" required>
                <option value="" disabled selected>Select your gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
        </div>
        <div class="form-group py-3">
            <label class="mb-2" for="phonenumber">Phone Number *</label>
            <input type="text" minlength="2" name="phonenumber" placeholder="Your Phone Number" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <div class="form-group py-3">
            <label class="mb-2" for="address">Address *</label>
            <input type="text" minlength="2" name="address" placeholder="Your Address" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <div class="form-group pb-3">
            <label class="mb-2" for="sign-in">Password *</label>
            <input type="password" minlength="2" name="password" placeholder="Your Password" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <label class="py-3">
            <input type="checkbox" required="" class="d-inline">
            <span class="label-body">I agree to the <a href="#" class="fw-bold">Privacy Policy</a></span>
        </label>
        <button type="submit" name="submit" class="btn btn-dark w-100 my-3">Register</button>
    </form>
</html>

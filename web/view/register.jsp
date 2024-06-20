<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <form action = "register" method = "POST" class="tab-pane fade" id="nav-register" role="tabpanel" aria-labelledby="nav-register-tab">
        <div class="text-danger">
            <c:if test="${not empty sessionScope.registerErr}">
                <c:out value="${sessionScope.registerErr}"/>
            </c:if>
        </div>
        <div class="form-group py-3">
            <input type="text" minlength="2" name="username" placeholder="Email Address" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <div class="form-group py-3">
            <input type="text" minlength="2" name="fullname" placeholder="Full Name" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <div class="form-group py-3">
            <select name="gender" class="form-control w-100 rounded-3 p-3" required>
                <option value="" disabled selected>Select your gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
        </div>
        <div class="form-group py-3">
            <input type="text" minlength="2" name="phonenumber" placeholder="Your Phone Number" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <div class="form-group py-3">
            <input type="text" minlength="2" name="address" placeholder="Your Address" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <div class="form-group pb-3">
            <input type="password" minlength="2" name="password" placeholder="Your Password" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <button type="submit" name="submit" class="btn btn-dark w-100 my-3">Register</button>
    </form>
    <c:if test="${not empty sessionScope.registerErr}">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#exampleModal').modal('show'); // Show the modal
                $('#nav-register-tab').tab('show'); // Switch to the register tab
            });
        </script>
        <!--remove it right after-->
        <c:remove var="registerErr" scope="session" />
    </c:if>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<form action="register" method="POST" class="tab-pane fade" id="nav-register" role="tabpanel" aria-labelledby="nav-register-tab">
    <p class="text-danger" id="result">
        <c:if test="${not empty sessionScope.registerErr}">
            <c:out value="${sessionScope.registerErr}"/>
        </c:if>
    </p>
    <p class="text-success">
        <c:if test="${not empty sessionScope.registerSucc}">
            <c:out value="${sessionScope.registerSucc}"/>
        </c:if>
    </p>
    <div class="form-group py-3">
        <input type="text" minlength="2" name="username" placeholder="Email Address" class="form-control w-100 rounded-3 p-3" required
               value="${inputEmail}">
    </div>
    <div class="form-group py-3">
        <input type="text" minlength="2" name="fullname" placeholder="Full Name" class="form-control w-100 rounded-3 p-3" required
               value="${inputFullName}">
    </div>
    <div class="form-group py-3">
        <select name="gender" class="form-control w-100 rounded-3 p-3" required>
            <option value="" disabled ${empty inputGender ? 'selected' : ''}>Select your gender</option>
            <option value="male" ${inputGender == 'male' ? 'selected' : ''}>Male</option>
            <option value="female" ${inputGender == 'female' ? 'selected' : ''}>Female</option>
            <option value="other" ${inputGender == 'other' ? 'selected' : ''}>Other</option>
        </select>
    </div>
    <div class="form-group py-3">
        <input type="text" minlength="2" name="phonenumber" placeholder="Your Phone Number" class="form-control w-100 rounded-3 p-3" required
               value="${inputPhoneNumber}">
    </div>
    <div class="form-group py-3">
        <input type="text" minlength="2" name="address" placeholder="Your Address" class="form-control w-100 rounded-3 p-3" required
               value="${inputAddress}">
    </div>
    <div class="form-group pb-3">
        <input type="password" minlength="2" name="password" id="password" placeholder="Your Password" class="form-control w-100 rounded-3 p-3" required>
    </div>
    <div class="form-group pb-3">
        <input type="password" minlength="2" name="repassword" id="repassword" placeholder="Re-enter your password" class="form-control w-100 rounded-3 p-3" required oninput="checkCorrect()">
        <p id="err" style="color: red"></p>
    </div>
    <button type="submit" name="submit" class="btn btn-dark w-100 my-3" id="submitBtn" disabled>Register</button>
</form>

<script>
    function checkCorrect() {
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;
        var submitBtn = document.getElementById("submitBtn");
        if (password !== repassword) {
            document.getElementById("err").innerHTML = "The password does not match!";
            submitBtn.disabled = true;
        } else {
            document.getElementById("err").innerHTML = "";
            submitBtn.disabled = false;
        }
    }
</script>
<c:if test="${not empty sessionScope.registerErr || not empty sessionScope.registerSucc}">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#exampleModal').modal('show');
            $('#nav-register-tab').tab('show');
        });
    </script>
    <c:remove var="registerErr" scope="session"/>
    <c:remove var="registerSucc" scope="session"/>
    <c:remove var="inputEmail" scope="session"/>
    <c:remove var="inputFullName" scope="session"/>
    <c:remove var="inputGender" scope="session"/>
    <c:remove var="inputAddress" scope="session"/>
    <c:remove var="inputPhoneNumber" scope="session"/>
</c:if>
</html>

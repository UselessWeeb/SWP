<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <form action = "register" method = "POST" class="tab-pane fade" id="nav-register" role="tabpanel" aria-labelledby="nav-register-tab">
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
            <input type="password" minlength="2" name="password" id ="password" placeholder="Your Password" class="form-control w-100 rounded-3 p-3" required>
        </div>
        <div class="form-group pb-3">
            <input type="password" minlength="2" name="repassword" id = "repassword" placeholder="Re-enter your password" class="form-control w-100 rounded-3 p-3" required oninput="checkCorrect()">
            <p id="err"></p>
        </div>
<<<<<<< HEAD
        <div class="form-group pb-3">
            <input type="password" minlength="2" name="repassword" placeholder="Re-enter your password" class="form-control w-100 rounded-3 p-3" required>
        </div>
=======
>>>>>>> 0c6922c9d2c375acf193b965e0a808ac686b3865
        <button type="submit" name="submit" class="btn btn-dark w-100 my-3">Register</button>
    </form>
    <script>
        function checkCorrect(){
            var password = document.getElementById("password").value;
            var repassword = document.getElementById("repassword").value;
            console.log(password + "" + repassword);
            if (password != repassword){
                document.getElementById("err").innerHTML = "The password does not match";
            }else{
                document.getElementById("err").innerHTML = "";
            }
        }
    </script>
</html>

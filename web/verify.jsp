<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Email Verification</title>
        <link rel="stylesheet" href="style.css">
        <script type="text/javascript">
            function redirectAfterDelay() {
                setTimeout(function() {
                    window.location.href = 'index.jsp';
                }, 5000); // 5000 milliseconds = 5 seconds
            }
        </script>
    </head>
    <body onload="redirectAfterDelay()">
        <div class="container">
            <h1>Email Verification</h1>
            <p><%= request.getAttribute("message") %></p>
            <p>You will be redirected to the home page in a few seconds...</p>
            <a href="index.jsp" class="btn btn-primary">Go to Home</a>
        </div>
    </body>
</html>

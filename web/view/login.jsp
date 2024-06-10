<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<form action = "login" method = "POST" class="tab-pane fade active show" id="nav-sign-in" role="tabpanel" aria-labelledby="nav-sign-in-tab">
    <div class="color-red">
        <c:if test="${not empty sessionScope.err}">
            <c:out value="${sessionScope.err}"/>
        </c:if>
    </div>
    <div class="form-group py-3">
        <input type="text" minlength="2" name="email" placeholder="Email address" class="form-control w-100 rounded-3 p-3" required>
    </div>
    <div class="form-group pb-3">
        <input type="password" minlength="2" name="password" placeholder="Password " class="form-control w-100 rounded-3 p-3" required>
    </div>
    <label class="py-3 d-flex justify-content-between">
        <div>
            <input type="checkbox" name = "session" value = "yes" class="d-inline">
            <span class="label-body">Remember me</span>
        </div>
        <span class="label-body"><a href="#" class="fw-bold">Forgot Password</a></span>
    </label>
    <button type="submit" name="submit" class="btn btn-dark w-100 my-3">Login</button>
    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/app-name/google_login&response_type=code&client_id=796807478712-7lh7a8irpfpafm160di39g8k31l61fke.apps.googleusercontent.com&approval_prompt=force" class="btn w-100 btn-lg btn-primary">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
        <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
        </svg>
        <span class="ms-2 fs-6">Sign in with Google</span>
    </a>
</form>
<!--if session err found-->
<c:if test="${not empty sessionScope.err}">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#exampleModal').modal('show'); // Show the modal
        });
    </script>
</c:if>
</html>

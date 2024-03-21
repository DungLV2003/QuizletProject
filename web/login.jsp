<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dũng Lại Lập Trình</title>
        <jsp:include page="header.jsp"/>
    </head>

    <!--    <body style="background: url('https://i.imgur.com/TkZIzzd.png') no-repeat center center fixed; background-size: cover; overflow-y: hidden;">-->
    <body style="background: url('images/gophim.jpg') no-repeat center center fixed; background-size: cover; overflow-y: hidden;">
        <div class="logo" style="position: absolute; top: 50px; left: 300px;">
            <img src="images/logohong.png" width="200" style="border-radius: 50%;">
        </div>


        <div class="d-flex flex-column justify-content-center align-items-center vh-100 mt-5">
            <div id="logDiv" class="alert alert-danger" style="display: none; width: 23rem;">
                <div class="row">
                    <div class="col-10">
                    </div>
                    <div class="col-2 text-end">
                        <button type="button" class="btn-close" aria-label="Close" onclick="closeErrorMessage()"></button>
                    </div>
                </div>
            </div>
            <div class="p-3 border rounded border-3" style="background-color:#e9e6e6;width: 26rem; border-color: #FFAEB9 !important;">
                <form action="login" method="get">
                    <h2 class="text-center mb-3" style="color: #FFAEB9">Login</h2>
                    <p style="color: red">${mess}</p>
                    <hr>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="username" id="emailInput" placeholder="yourUsername">
                        <label for="emailInput" class="form-label">Username</label>
                    </div>
                    <div class="form-floating mb-2">
                        <input type="password" class="form-control" name="password" id="passwordInput" placeholder="password">
                        <label for="passwordInput" class="form-label">Password</label>
                    </div>
<!--                     <div class="mb-2 form-check">
                        <input type="checkbox" class="form-check-input" name="" id="rememberMeCheckbox">
                        <label for="rememberMeCheckbox" class="form-check-label">Remember me</label>
                    </div> -->
                    <div>
                        <button class="btn btn-outline-primary w-100" style="font-size: 20px; background-color: #FFAEB9; color: #ffff;">Login</button>
                    </div>

<!--                    <div class="text-end mt-2">
                        <a href="#" style="text-decoration: none;">Create an Account?</a>
                    </div>-->
                </form>
            </div>
        </div>
        <script>
            if ("${sessionScope.log}") {
                document.getElementById("logDiv").style.display = "block";
            }

            function closeErrorMessage() {
                logDiv.style.display = "none";
            }
        </script>
        <c:remove var="log" scope="session" />
        <jsp:include page="footer.jsp"/>
    </body>

</html>

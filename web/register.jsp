<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dũng Lại Lập Trình</title>
    <jsp:include page="header.jsp" />
</head>

<body
    style="background: url('https://i.imgur.com/TkZIzzd.png') no-repeat center center fixed; background-size: cover; overflow-y: hidden;">
    <div class="logo" style="position: absolute; top: 50px; left: 300px;">
        <img <img src="images/logohong.png" width="200" style="border-radius: 50%;"> 
    </div>

    <div class="d-flex flex-column justify-content-center align-items-center vh-100 mt-5">
        <div id="logDiv" class="alert alert-danger" style="display: none; width: 23rem;">
            <div class="row">
                <div class="col-10">
                    ${log}
                </div>
                <div class="col-2 text-end">
                    <button type="button" class="btn-close" aria-label="Close" onclick="closeErrorMessage()"></button>
                </div>
            </div>
        </div>
        <div class="p-3 border rounded border-3"
            style="background-color:#e9e6e6;width: 23rem; border-color: rgb(177, 109, 255) !important;">
            <c:if test="${sessionScope.userGoogleDTO == null}">
                <form action="register" method="post">
                    <h2 class="text-center mb-3">Join EMS</h2>
                    <hr>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="username" id="emailInput"
                            placeholder="yourUsername">
                        <label for="emailInput" class="form-label">Username</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" name="email" id="emailInput"
                            placeholder="yourUsername">
                        <label for="emailInput" class="form-label">Email address</label>
                    </div>
                    <div class="form-floating mb-1">
                        <input type="password" class="form-control" name="password" id="passwordInput"
                            placeholder="password">
                        <label for="passwordInput" class="form-label">Password</label>
                    </div>
                    <div class="mb-1">
                        <span>You're currently a</span>
                        <select class="selectpicker mb-3" name="role">
                            <option value="student" selected>Student</option>
                            <option value="teacher">Teacher</option>
                          </select>                      
                    </div>
                    <div>
                        <button class="btn btn-outline-primary w-100">Register</button>
                    </div>
                </form>
            </c:if>

            <c:if test="${sessionScope.userGoogleDTO != null}">
                <form action="googleRegister" method="post">
                    <h2 class="text-center mb-3">Join EMS</h2>
                    <hr>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="username" id="emailInput"
                            placeholder="yourUsername">
                        <label for="emailInput" class="form-label">Username</label>
                    </div>
                    <div class="form-floating mb-1">
                        <input type="email" class="form-control" name="email" id="emailInput"
                            placeholder="yourUsername" value="${userGoogleDTO.getEmail()}" readonly>
                        <label for="emailInput" class="form-label">Email address</label>
                    </div>
                    <div class="mb-1">
                        <span>You're currently a</span>
                        <select class="selectpicker mb-3" name="role">
                            <option value="student" selected>Student</option>
                            <option value="teacher">Teacher</option>
                          </select>                      
                    </div>
                    <div>
                        <button class="btn btn-outline-primary w-100">Register</button>
                    </div>
                </form>
            </c:if>
        </div>
    </div>
    <script>
        if ("${log}") {
            document.getElementById("logDiv").style.display = "block";
        }

        function closeErrorMessage() {
            logDiv.style.display = "none";
        }
    </script>
    <jsp:include page="footer.jsp" />
</body>

</html>
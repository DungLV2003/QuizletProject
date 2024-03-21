<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .underline-green {
        text-decoration: underline;
        color: green;
    }
</style>




<div class="row border-bottom sticky-top" style="background-color: #fff; height: 6rem;">
    <!-- Home page -->
    <div class="col-2 align-self-center ps-5">
        <a href="#"
           class="align-left">
<!--            <img src="https://1000logos.net/wp-content/uploads/2021/11/Quizlet-Logo-2007.png" width="100">-->
            <img src="images/logohong.png" width="88" style="border-radius: 50%;">
        </a>

    </div>




    <!-- Empty -->
    <div class="col-6">
        <h id="mess" style="color: red">${mess}</h3>
    </div>
    <script>
        // Ẩn thông báo sau 2.5 giây
        setTimeout(function () {
            var messElement = document.getElementById('mess');
            messElement.style.display = 'none';
        }, 2500);
    </script>


    <c:choose>
        <c:when test="${sessionScope.user == null}">
            <div class="col-2">

            </div>
            <div class="col-2 justify-content-end align-self-center d-flex" style="margin-left: -1rem;">
                <a href="login.jsp" class="btn btn-success" style="width: 6rem; background-color: #FFAEB9">Login</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="col-2">

            </div>
            <div class="col-2 justify-content-end align-self-center d-flex" style="margin-left: -1rem;">
                <span style="font-size: 18px">Welcome <u class="underline-green">${sessionScope.user.username}</u></span>  
                <a href="logout" class="btn btn-success login-text" style="width: 6rem; background-color:#FFB6C1"> Logout</a>
            </div>
        </c:otherwise>
    </c:choose>

</div>
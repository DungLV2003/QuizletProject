<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.*" %>

<!DOCTYPE html>
<html>

    <head>
        <title>Dũng Lại Lập Trình</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="header.jsp" />
        <style>
            body {
                background-color: #FFB6C1;
            }

            header {
                color: #87CEEB;
                padding: 20px;
            }

            main {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                display: flex;
                flex-wrap: nowrap;
            }

            img {
                max-width: 100%;
                height: auto;
            }

            .flex-container {
                display: flex;
                justify-content: center;
                margin-top: 3%;
            }

            .flex-container>div {
                color: black;
                margin: 10px;
                text-align: center;
                z-index: 3;
            }

            .custom-enroll-key {
                font-size: 18px; 
                color: #FF5733; /* Màu đỏ nhạt */
            }
        </style>
    </head>

    <body style="overflow-x: hidden;">
        <%@include file="navbar.jsp" %>

        <jsp:include page="sidebar.jsp" />
        <div class="p-3" style="margin-left: 250px;">
            <div class="d-flex flex-row align-content center">
                <div>
                    <c:if test="${sessionScope.user.roleId == 2}">
                        <h2><strong>Quiz Created By me</strong></h2>
                    </c:if>


                    <form action="home" method="post" id="searchForm">
                        <div class="input-group mb-3" style="width: 35rem; position: relative;">
                            <input required="" type="text" class="form-control" name="txt"
                                   placeholder="Search quiz by name" id="searchClassString"
                                   value="${key}">
                            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">
                                <i class="fa-regular fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </form>
                    <c:if test="${sessionScope.user.roleId == 3}">
                        <h2><strong>Public Quiz</strong></h2>
                    </c:if>
                    <c:if test="${sessionScope.user.roleId == 2}">
                        <div class="input-group mb-3" style="width: 35rem; position: relative;">
                            <a href="createquiz" class="btn btn-success" style="width: 8rem; background-color:#B9D3EE">Create_Quiz</a>
                        </div>
                    </c:if>


                </div>
                <c:if test="${sessionScope.user.roleId == 3}">
                    <div>
                        <button type="button" class=" ms-3 btn btn-primary dropdown-toggle"
                                data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside"
                                style="size: 10px; background-color: #fff; color:#FFB6C1; font-weight: bold; ">
                            Enroll Quiz
                        </button>
                        <div class="dropdown-menu p-3">
                            <form action="enrollquiz" method="post">
                                <p style="color: red">${enrrollfail}</p>
                                <div class="form-floating mb-1">
                                    <input required="" type="text" name="txt" class="form-control" id="classKeyInput">
                                    <label for="floatingInput" >enroll key</label>
                                </div>
                                <button type="submit" class="btn btn-primary"
                                        id="enrollClassBtn" style="width: 5rem; background-color: #FFB6C1; color:#ffff;">
                                    Enroll
                                </button>
                            </form>
                        </div>
                    </div>
                </c:if>
            </div>

            <div class="row">
                <c:forEach items="${listQ}" var="q">
                    <div class="col-4 mt-3 class-item">
                        <div class="card">
                            <h5 class="card-header">${q.quizName}</h5>
                            <c:if test="${sessionScope.user.roleId == 2}">
                                <div class="card-body">
                                    <c:choose>
                                        <c:when test="${q.enrolKey != null}">
                                            <h5 class="card-title"">Enroll key: <span class="custom-enroll-key">${q.enrolKey}</span></h5>
                                            </c:when>
                                            <c:otherwise>
                                            <p class="custom-enroll-key">Public quiz</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <div>
                                        <button type="button" class=" ms-3 btn btn-primary dropdown-toggle"
                                                data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside"
                                                style="size: 10px; background-color: #FFB6C1;">
                                            Actions
                                        </button>
                                        <div class="dropdown-menu p-3">
                                            <a  href="quizdetail?quizId=${q.quizId}"class="btn btn-primary"
                                                id="enrollClassBtn" style="width: 5rem; background-color: #FFB6C1;">
                                                Details
                                            </a>
                                            <c:choose>
                                                <c:when test="${q.enrolKey != null}">
                                                    <a href="enrollkey?quizId=${q.quizId}" class="btn btn-primary"
                                                       id="enrollClassBtn" style="width: 7rem; background-color: #FFB6C1;">
                                                        Set public
                                                    </a>
                                                </c:when>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${q.enrolKey != null}">
                                                    <form action="enrollkey" method="post">
                                                        <div class="form-floating mb-1" style="position: relative;">
                                                            <input type="hidden" name="quizId" value="${q.quizId}">
                                                            <input required type="text" name="key" class="form-control" id="classKeyInput">
                                                            <button type="submit" class="btn" style="position: absolute; right: 5px; top: 5px;">OK</button>
                                                            <label for="floatingInput">Update enroll key</label>
                                                        </div>
                                                    </form>
                                                </c:when>
                                            </c:choose>

                                            <c:choose>
                                                <c:when test="${q.enrolKey == null}">
                                                    <form action="enrollkey" method="post">
                                                        <div class="form-floating mb-1">
                                                            <input type="hidden" name="quizId" value="${q.quizId}">
                                                            <input required="" type="text" name="key" class="form-control" id="classKeyInput">
                                                            <button type="submit" class="btn" style="position: absolute; right: 5px; top: 5px;">OK</button>
                                                            <label for="floatingInput"> set enroll key</label>
                                                        </div>
                                                    </form>

                                                </c:when>
                                            </c:choose>

                                            <a href="deletequiz?quizId=${q.quizId}" class="btn btn-primary" id="enrollClassBtn" style="width: 5rem;background-color: #FFB6C1;"
                                               onclick="return confirm('Bạn có chắc chắn muốn xóa quiz này?');">
                                                Delete
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${sessionScope.user.roleId == 3}">
                                <div class="card-body">
                                    <!--                                    <p>Enroll time: 2</p>
                                                                        <p>Avg marks: 50</p>-->
                                    <a href="enrollquiz?quizId=${q.quizId}" class="btn btn-secondary mt-2" style="background-color: #FFB6C1;">
                                        <span>Enroll </span>
                                    </a>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </c:forEach>

                <div class="col-12">

                </div>                  
            </div>
        </div>
    </div>


    <jsp:include page="footer.jsp" />
</body>

</html>
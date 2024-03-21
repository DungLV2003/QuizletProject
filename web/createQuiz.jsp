<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dũng Lại Lập Trình</title>
        <jsp:include page="header.jsp" />
        <title>Create Quiz</title>
        <style>
            /* Định dạng toàn bộ trang */
            body {
                overflow-x: hidden;
                background-color: #FFB6C1;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            /* Container */
            .container {
                max-width: 1000px;
                margin: 0 auto;
                padding: 20px;
                background-color: #FFFFFF;
                border: 2px solid #af94fc;
            }

            /* Question group */
            .question-group {
                margin-bottom: 20px;
            }

            .question-group label {
                font-weight: bold;
                font-size: 18px;
                margin-bottom: 10px;
                display: block;
            }

            .question-group input[type="text"],
            .question-group input[type="radio"],
            .question-group select {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #af94fc;
                border-radius: 5px;
            }


            .back-button {
                width: 122.38px;
                height: 44px;
                background-color: #af94fc;
                text-align: center;
                line-height: 44px;
                text-decoration: none;
                color: white;
                display: inline-block;
                margin-top: 20px;
                border-radius: 5px;
            }
            .question-group label input[type="radio"] {
                margin-right: 5px;
            }

            .question-group label {
                display: inline-flex;
                align-items: center;
                margin-right: 20px; 
                font-size: 16px;
            }

            .header {
                background-color:#FFFF;
                border-bottom: 2px solid #af94fc;
                height: 7rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 20px;
                
            }

            .header-logo {
                padding-left: 1rem;
            }

            .header-logo img {
                width: 100px;
            }

            .hint-text {
                font-size: 14px; 
                color: #888; 
            }


        </style>
    </head>

    <body>
        <div class="header">
            <div class="header-logo">
                <a href="#">
                    <img src="images/logohong.png" width="200" style="border-radius: 50%;"> 
                </a>
            </div>
        </div>
        <div class="col-6">
            <h id="mess" style="color: red; font-size: 25px; margin: auto;">${mess}</h3>
        </div>
        <script>
            // Ẩn thông báo sau 2.5 giây
            setTimeout(function () {
                var messElement = document.getElementById('mess');
                messElement.style.display = 'none';
            }, 6000);
        </script>

        <div class="container">
            <form action="createquiz" method="post">
                <div class="question-group">
                    <label for="topic">Quiz Topic</label>
                    <select name="topic">
                        <c:forEach items="${listTopic}" var="t">
                            <option value="${t.topicId}" ${param.topic == t.topicId ? 'selected' : ''}>${t.topicName}</option>
                        </c:forEach>
                    </select>
                </div>
                <!-- Trong phần "Quiz Name" -->
                <div class="question-group">
                    <label for="quizname">Quiz Name</label>
                    <input required="" type="text" name="quizname" id="quizname" value="${!empty param.quizname ? param.quizname : ''}">
                </div>
                <!-- Trong phần "Enroll Key" -->
                <div class="question-group">
                    <label style="margin-right: 0" for="enrollkey">Enroll Key</label>
                    <span class="hint-text">(leave empty for public quiz)</span>
                    <input type="text" name="enrollkey" id="enrollkey" value="${!empty param.enrollkey ? param.enrollkey : ''}">
                </div>

                <div class="question-group">
                    <label for="qs1">Question 1</label>
                    <input required="" type="text" name="qs1" id="qs1" value="${!empty param.qs1 ? param.qs1 : ''}">
                    <label>
                        <input required="" type="radio" name="qs1key" value="true" id="qs1key-true" ${param.qs1key == 'true' ? 'checked' : ''}>
                        True
                    </label>
                    <label>
                        <input required="" type="radio" name="qs1key" value="false" id="qs1key-false" ${param.qs1key == 'false' ? 'checked' : ''}>
                        False
                    </label>
                </div>

                <div class="question-group">
                    <label for="qs2">Question 2</label>
                    <input required="" type="text" name="qs2" id="qs2" value="${!empty param.qs2 ? param.qs2 : ''}">
                    <label>
                        <input required="" type="radio" name="qs2key" value="true" id="qs2key-true" ${param.qs2key == 'true' ? 'checked' : ''}>
                        True
                    </label>
                    <label>
                        <input required="" type="radio" name="qs2key" value="false" id="qs2key-false" ${param.qs2key == 'false' ? 'checked' : ''}>
                        False
                    </label>
                </div>

                <div class="question-group">
                    <label for="qs3">Question 3</label>
                    <input required="" type="text" name="qs3" id="qs3" value="${!empty param.qs3 ? param.qs3 : ''}">
                    <label>
                        <input required="" type="radio" name="qs3key" value="true" id="qs3key-true" ${param.qs3key == 'true' ? 'checked' : ''}>
                        True
                    </label>
                    <label>
                        <input required="" type="radio" name="qs3key" value="false" id="qs3key-false" ${param.qs3key == 'false' ? 'checked' : ''}>
                        False
                    </label>
                </div>

                <div class="question-group">
                    <label for="qs4">Question 4</label>
                    <input required="" type="text" name="qs4" id="qs4" value="${!empty param.qs4 ? param.qs4 : ''}">
                    <label>
                        <input required="" type="radio" name="qs4key" value="true" id="qs4key-true" ${param.qs4key == 'true' ? 'checked' : ''}>
                        True
                    </label>
                    <label>
                        <input required="" type="radio" name="qs4key" value="false" id="qs4key-false" ${param.qs4key == 'false' ? 'checked' : ''}>
                        False
                    </label>
                </div>

                        <a class="btn btn-primary" href="home" style="background-color:#FFB6C1">Back</a>
                <input class="btn btn-danger" type="submit" value="Create Quiz" style="background-color:#00CC00">
            </form>
        </div>
    </body>

</html>

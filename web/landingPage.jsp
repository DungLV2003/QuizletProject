<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dũng Lại Lập Trình</title>
        <jsp:include page="header.jsp"/>
    </head>

    <style>
        header{
            background-color: #E0EEE0;
        }

        .center-content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            /*            align-items: flex-start;*/
            height: 100vh;
            margin-left: 10%;
            /*            align-items: center;  Căn giữa theo chiều ngang */
            text-align: center; /* Căn giữa nội dung bên trong */
        }

        body {
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        /* Định dạng cho titleText */
        #title {
            font-size: 60px;
            font-weight: bold;
            color: #E0EEE0;
            margin-top: 20px;
        }

        #subtitle {
            font-size: 30px;
            color: #E0EEE0;
            margin-top: 10px;
        }

    </style>

    <body style="background: url('images/codejpg.jpg') no-repeat center center fixed;
          background-size: cover;
          overflow-x: hidden;
          overflow-y: hidden;">
        <%@include file="navbar.jsp" %>

        <div class="center-content">
            <h2 class="text-center" id="title"></h2><br>
            <h4 class="text-center" id="subtitle"></h4><br>
            <h1 class="text-center"></h1>
        </div>

        <jsp:include page="footer.jsp"/>

        <script>
            // Hiển thị chữ từ từ
            const title = document.getElementById("title");
            const subtitle = document.getElementById("subtitle");
            const content = document.getElementById("content");

            const titleText = "Học tập cùng Dũng";
            const subtitleText = "Hãy theo đuổi đam mê, thành công sẽ theo đuổi bạn";

            function displayText(element, text, index) {
                if (index < text.length) {
                    element.innerHTML += text.charAt(index);
                    index++;
                    setTimeout(function () {
                        displayText(element, text, index);
                    }, 50); // Thời gian trễ giữa mỗi ký tự (milliseconds)
                }
            }

            displayText(title, titleText, 0);
            setTimeout(function () {
                displayText(subtitle, subtitleText, 0);
            }, titleText.length * 50); // Chờ cho tiêu đề hiển thị xong trước
            setTimeout(function () {
                displayText(content, contentText, 0);
            }, (titleText.length + subtitleText.length) * 50); // Chờ cho tiêu đề và phụ đề hiển thị xong trước
        </script>
    </body>
</html>

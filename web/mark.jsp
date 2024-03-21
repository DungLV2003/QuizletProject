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
        /* Reset default margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            overflow-x: hidden;
        }

        /* Container styling */
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: #FFFFFF;
            border: 2px solid #af94fc;
            text-align: center;
        }

        /* Mark text styling */
        .mark-text {
            font-size: 40px;
            color: green;
            margin: 20px 0 10px;
        }

        /* OK button styling */
        .ok-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: green;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 18px;
        }

        .ok-button:hover {
            background-color: red;
        }

        /* Header styling */
        .header {
            background-color: #87CEEB;
            border-bottom: 2px solid #af94fc;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 7rem;
            padding: 0 1rem;
        }

        .header-logo img {
            width: 100px;
        }
    </style>
</head>

<body>
    <div class="header">
        <div class="header-logo">
            <a href="#">
                <img src="images/logohong.png" width="200" style="border-radius: 50%;" alt="Your Logo">
            </a>
        </div>
    </div>

    <div class="container">
        <p class="mark-text">Your mark: ${mark} %</p>
        <a href="home" class="ok-button">Ok</a>
    </div>
</body>

</html>

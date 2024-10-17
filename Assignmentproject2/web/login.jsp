<%-- 
    Document   : login
    Created on : Oct 14, 2024, 5:57:55 PM
    Author     : Admin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Production Management Login</title>
    
    <!-- CSS gộp trực tiếp vào file JSP -->
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #2c3e50, #4ca1af);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            margin-bottom: 20px;
            font-size: 1.8em;
            color: #2c3e50;
        }

        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1em;
            transition: border 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #4ca1af;
            outline: none;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            background-color: #4ca1af;
            border: none;
            color: white;
            font-size: 1em;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .login-btn:hover {
            background-color: #3a7786;
        }

        p {
            color: red;
            margin-top: 10px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .login-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Production Management Login</h2>
        
        <form action="login" method="POST">
            <div class="input-group">
                <label for="username">Username:</label>
                <input type="text" name="username" id="username" required/> 
            </div>
            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" required/> 
            </div>
            <input type="submit" name="login" value="Login" class="login-btn"/>
        </form>
        
        <!-- Hiển thị thông báo lỗi nếu có -->
        <c:if test="${not empty sessionScope.err}">
            <p>${sessionScope.err}</p>
            <!-- Xóa thông báo lỗi ngay sau khi hiển thị -->
            <c:remove var="err" scope="session" />
        </c:if>
    </div>
</body>
</html>

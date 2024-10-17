<%-- 
    Document   : dashbroad
    Created on : Oct 15, 2024, 12:23:35 AM
    Author     : Admin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .dashboard-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 1.5em;
            color: #333;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 1em;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Welcome to the Dashboard</h2>

        <!-- Nút View Employees -->
        <form action="viewEmployees.jsp" method="GET">
            <input type="submit" value="View Employees" class="btn"/>
        </form>

        <!-- Nút View Product Plan -->
        <form action="viewProductPlan.jsp" method="GET">
            <input type="submit" value="View Product Plan" class="btn"/>
        </form>
    </div>
</body>
</html>


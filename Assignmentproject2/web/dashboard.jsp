<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <style>
            /* CSS cho giao diện */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background: linear-gradient(135deg, #2C5364, #0F2027); /* Màu gradient giống bảng đăng nhập */
            }
            .header {
                background-color: #0F2027;
                color: white;
                text-align: center;
                padding: 1em;
                font-size: 24px;
                border-radius: 10px;
            }
            .container {
                width: 50%;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
                border-radius: 10px;
            }
            .folder {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }
            .folder-item {
                width: 200px;
                height: 50px;
                background-color: #2C5364;
                color: white;
                border-radius: 10px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                cursor: pointer;
                transition: 0.3s;
            }
            .folder-item:hover {
                background-color: #0F2027;
            }
        </style>
    </head>
    <body>

        <div class="header">
            DASH BOARD
        </div>

        <div class="container">
            <h2>Folders</h2>
            <div class="folder">
                <a href="employee/list" class="folder-item">Employees</a>
                <a href="department.jsp" class="folder-item">Department</a>
                <a href="productplan.jsp" class="folder-item">Product Plan</a>
                <a href="employeeschedule.jsp" class="folder-item">Employee Schedule</a>
            </div>
        </div>

    </body>
</html>

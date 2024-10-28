<%-- 
    Document   : search
    Created on : Oct 28, 2024, 11:08:23 AM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách Nhân viên</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #e0f7fa;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            font-size: 2.5em;
            color: #00796b;
            margin-top: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .table-container {
            width: 90%;
            margin: 40px auto;
            overflow: hidden;
            border-radius: 15px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #00796b;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:hover {
            background-color: #b2dfdb;
            transition: background-color 0.3s;
        }

        tr:nth-child(even) {
            background-color: #f1f8e9;
        }

        .container {
            padding: 20px;
        }

        @media only screen and (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                font-size: 0.85em;
                padding: 10px;
            }

            h2 {
                font-size: 1.8em;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>Danh sách Nhân viên</h2>
        <div class="table-container">
            <table>
                <tr>
                    <th>EmployeeID</th>
                    <th>EmployeeName</th>
                    <th>RoleName</th>
                    <th>DepartmentName</th>
                    <th>Dob</th>
                    <th>Gender</th>
                </tr>
                <c:forEach var="e" items="${emps}">
                    <tr>
                        <td>${e.employeeID}</td>
                        <td>${e.employeeName}</td>
                        <td>${e.roles.name}</td>                   
                        <td>${e.dept.name}</td>
                        <td>${e.dob}</td>
                        <td>
                            <c:if test="${e.gender}">
                                Male
                            </c:if>
                            <c:if test="${!e.gender}">
                                Female
                            </c:if>
                        </td>

                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>

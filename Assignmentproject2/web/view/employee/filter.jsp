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

            .form-container {
                width: 50%; /* Điều chỉnh độ rộng form */
                margin: 0 auto; /* Căn giữa form */
                background-color: #e0f7fa;
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
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

            .form-group {
                margin-bottom: 15px;
            }

            label {
                font-weight: bold;
            }

            input[type="text"], input[type="date"], select {
                padding: 10px;
                width: 100%;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            input[type="radio"] {
                margin: 0 10px;
            }

            input[type="submit"] {
                display: block; /* Đảm bảo nút là khối */
                margin: 20px auto; /* Căn giữa nút "Search" */
                padding: 10px 20px;
                background-color: #00796b;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #004d40;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Tìm kiếm Nhân viên</h2>
            <div class="filter">
                <form action="filter" method="get">
                    <div class="form-group">
                        <label for="id">Id:</label>
                        <input type="text" id="id" name="id" value="${param.id}">
                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name"value="${param.name}">
                    </div>
                    <div class="form-group">
                        Gender: <input type="radio" name="gender"
                           ${param.gender ne null && param.gender eq "male"?"checked=\"checked\"":""}
                           value="male"/> Male
            <input type="radio" name="gender"
                   ${param.gender ne null && param.gender eq "female"?"checked=\"checked\"":""}
                   value="female"/> Female
            <input type="radio" name="gender" 
                   ${param.gender eq null or param.gender eq "both"?"checked=\"checked\"":""}
                   value="both"/> Both
            <br/>
                    </div>
                    <div class="form-group">
                        <label for="dobFrom">Dob - From:</label>
                        <input type="date" id="dobFrom" name="dobFrom" value="${param.dobFrom}">
                        <label for="dobTo"> - To:</label>
                        <input type="date" id="dobTo" name="dobTo" value="${param.dobTo}">
                    </div>
                    
                    <div class="form-group">
                        <label for="department">Department:</label>
                        <select id="department" name="department">
                            <option value="-1" ${param.department == '-1' ? 'selected="selected"' : ''}>--------ALL----------</option>
    <option value="3" ${param.department == '3' ? 'selected="selected"' : ''}>Planning</option>
    <option value="2" ${param.department == '2' ? 'selected="selected"' : ''}>Accounting</option>
    <option value="1" ${param.department == '1' ? 'selected="selected"' : ''}>Human Resources</option>
                            <!-- Add other department options here -->
                            <c:forEach items="${requestScope.depts}" var="d">
                    <option
                        ${param.did ne null && param.did eq d.id?"selected=\"selected\"":""}
                        value="${d.id}">${d.name}</option>
                </c:forEach>
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Search">
                    </div>
                </form>
            </div>

            <h2>Kết quả tìm kiếm</h2>
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
                              ${e.gender?"Male":"Female"}
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : viewProductPlan
    Created on : Oct 15, 2024, 12:40:08 AM
    Author     : Admin
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Product Plan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Production Plan List</h2>
    
    <table>
        <thead>
            <tr>
                <th>Plan ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Start Date</th>
                <th>End Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Assume you've already set up your database connection
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDB", "root", "password");
                    
                    String query = "SELECT PlanID, ProductName, Quantity, StartDate, EndDate FROM ProductPlan";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        int planID = rs.getInt("PlanID");
                        String productName = rs.getString("ProductName");
                        int quantity = rs.getInt("Quantity");
                        Date startDate = rs.getDate("StartDate");
                        Date endDate = rs.getDate("EndDate");

                        // Output rows of product plan data
                        out.println("<tr>");
                        out.println("<td>" + planID + "</td>");
                        out.println("<td>" + productName + "</td>");
                        out.println("<td>" + quantity + "</td>");
                        out.println("<td>" + startDate + "</td>");
                        out.println("<td>" + endDate + "</td>");
                        out.println("</tr>");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>


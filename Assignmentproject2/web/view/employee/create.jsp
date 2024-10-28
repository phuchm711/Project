<%-- 
    Document   : login
    Created on : Oct 18, 2024, 4:25:55 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>c
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../master/greeting.jsp"></jsp:include>
        <form action="create" method="POST">
            Name: <input type="text" name="name"/> <br/>
            Department: <select name="DepartmentID">
            <c:forEach items="${requestScope.depts}" var="d">
                <option value="${d.id}">${d.name}</option>
            </c:forEach>
            </select> <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>

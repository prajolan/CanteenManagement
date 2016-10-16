<%-- 
    Document   : list
    Created on : Aug 5, 2016, 10:18:49 AM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <table>
        <thead>
            <tr>
                <th>Food Name</th>
                <th>Price</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>


        </tbody>

        <c:forEach items="${foodItem}" var="foodItem">
            <tr>
                <td>${foodItem.foodName}</td>
                <td>${foodItem.price}</td>
                <td><a href="edit-${foodItem.id}">Edit</a></td>
                <td><a href="delete?id=${foodItem.id}">delete</a></td>


            </tr>

        </c:forEach>

    </table>
</body>
</html>

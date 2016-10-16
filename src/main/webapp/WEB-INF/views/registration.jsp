<%-- 
    Document   : registration
    Created on : Aug 3, 2016, 7:32:46 AM
    Author     : Hp
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World! Registration</h1>
        ${message}
        <br>
        <%
//             This code will auto refresh the page

//               response.setIntHeader("Refresh", 1);
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
            sd.format(cal.getTime());

            out.println(sd.format(cal.getTime()));
        %>
        <br>

      

        <form:form method="POST" modelAttribute="foodInventory">
            <table>
                <form:input type="hidden" path="id"/>
                <form:input type="hidden" path="date" value="<%=sd.format(cal.getTime())%>"/>
                <tr>
                    <td><form:label path="foodName">Food Name</form:label></td>
                    <td><form:input path="foodName" /></td>
                </tr>
                <tr>
                    <td><form:label path="price">price</form:label></td>
                    <td><form:input path="price" /></td>
                </tr>
                
                <!--Option to show update or submit button according to test result-->
                <c:choose>
                    <c:when test= "${edit}">
                        <td colspan="2">
                            <input type="submit" value="Update"/>
                        </td>


                    </c:when>
                    <c:otherwise>
                        <td colspan="2">
                            <input type="submit" value="Submit"/>
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </table> 
       
    </form:form>

</body>
</html>

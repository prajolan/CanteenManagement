<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


    <div class="container-fluid">

        
        <br>
        <%
//               response.setIntHeader("Refresh", 1); This code will auto refresh the page

            Calendar cal = Calendar.getInstance();
            SimpleDateFormat sd = new SimpleDateFormat("MMMM");
            sd.format(cal.getTime());
        %>
        <br>

        Today's date: <%= (new java.util.Date())%>

        <form:form method="POST" modelAttribute="foodInventory">
            <table>
                <form:input type="hidden" path="id"/>
                <form:input type="text" path="date" value="<%= (new java.util.Date())%>"/>
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

</div>

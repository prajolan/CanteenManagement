<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid">
     
     
         <center> <h1>Add Food</h1>
         </center>
         
            <div class="row content">

                <div class="col-sm-9" id="div1">
                    <hr>
 <br>
        <%
//             This code will auto refresh the page

//               response.setIntHeader("Refresh", 1);
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
            sd.format(cal.getTime());

//            out.println(sd.format(cal.getTime()));
        %>
        <br>

      

        <form:form method="POST" modelAttribute="foodInventory">
            <table>
                <form:input type="hidden" path="id"/>
                <form:input type="hidden" path="date" value="<%=sd.format(cal.getTime())%>" class="form-group" />
                <tr style="padding-top: 20px">
                    <td style="padding-right: 20px"><form:label path="foodName" class="form-group" >Food Name</form:label></td>
                    <td><form:input path="foodName" /></td>
                </tr>
                <tr style="padding-top: 20px">
                    <td><form:label path="price" class="form-group" >Price</form:label></td>
                    <td><form:input path="price" /></td>
                </tr>

                
                <!--Option to show update or submit button according to test result-->
                <c:choose>
                    <c:when test= "${edit}">
                        <td colspan="2">
                            <input type="submit" value="Update" class="btn btn-success btn-lg"/>
                        </td>


                    </c:when>
                    <c:otherwise>
                        <td colspan="2">
                            <input type="submit" value="Submit" class="btn btn-success btn-lg"/>
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </table> 
       
    </form:form>
                    
                </div>
            </div>
        </div>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid">


    <center> <h1>Create User</h1>
    </center>

    <div class="row content">

        <div class="col-sm-9" id="div1">
            <hr>
            <form:form method="POST" modelAttribute="user" >
                <table>

                    <form:input type="hidden" path="id"/>
                    <tr>
                        <td style="padding-right: 20px"><form:label path="firstName" class="form-group" >First Name </form:label></td>

                            <td><form:input path="firstName" /></td>
                    </tr>
                    <tr>
                        <td><form:label path="lastName" class="form-group">Last Name</form:label></td>
                        <td><form:input path="lastName" /> </td>
                    </tr>
                    <tr>
                        <td><form:label path="employeeId" class="form-group">EID</form:label></td>
                        <td><form:input path="employeeId" /></td>
                    </tr>
                    <tr>
                        <td><form:label path="userName" class="form-group">Username</form:label></td>
                        <td><form:input path="userName" required="required"/></td>
                    </tr>
                    <tr>
                        <td><form:label path="password" class="form-group">Password</form:label></td>
                        <td><form:input path="password" type="password" required="required"/></td>
                    </tr>
                    <tr> 
                        <td><label class="col-lg-2 control-lable" for="userProfiles">Roles</label></td>

                        <!--Here, itmes roles will be loaded from controller class, multiple=true means you can
                        have multiple options being selected at the same time, itemValue=id means while sending request you will
                        send the id value and itemLabel=type will show the name of the id such as Admin or DBA-->
                        <td><form:select path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control input-xs"/></td>

                    </tr>
                    <tr>



                        <!--Option to show update or submit button according to test result-->
                        <c:choose>
                            <c:when test= "${editUser}">
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
            <td><a href="viewUsers" class="btn btn-success" role="button">Display All Users</a></td>



        </div>
    </div>
</div>
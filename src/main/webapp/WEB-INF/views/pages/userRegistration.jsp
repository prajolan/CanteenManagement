<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
            <link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet">

</head>

   
        <h1>Hello World! Registration</h1>
        <br>
        <br>


        <form:form method="POST" modelAttribute="user">
                <form:input type="hidden" path="id"/>
                <form:label  path="userProfiles">Roles</form:label>
                                <form:select path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" />

                                    <form:label path="firstName">First Name</form:label>
                   <form:input path="firstName" />
                                       <form:label path="lastName">Last Name</form:label>

                    <form:input path="lastName" />

                  
                   <form:label path="userName">Username</form:label>
                    <form:input path="userName" />
                    <form:label path="password">password</form:label>
                    <form:input path="password" type="password" />
                <!--Here, itmes roles will be loaded from controller class, multiple=true means you can
                have multiple options being selected at the same time, itemValue=id means while sending request you will
                send the id value and itemLabel=type will show the name of the id such as Admin or DBA-->
                
                 
               



                <!--Option to show update or submit button according to test result-->
                <c:choose>
                    <c:when test= "${edit}">
                            <input type="submit" value="Update"/>


                    </c:when>
                    <c:otherwise>
                        <input type="submit" value="Submit" class="btn btn-success"/>
                    </c:otherwise>
                </c:choose>
        
    </form:form>

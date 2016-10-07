<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">


    <center> <h1>All Users</h1>
    </center>


    <div class="row content">

        <div class="col-sm-9" id="div1">
            <hr>
        </div>
        <div id="viewFood" class="col-lg-5">


            <table class="table table-bordered" id="tables">

                <thead>
                    <tr>
                        <th>S.N</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                        <th>Status</th>
                        <th>Roles</th>

                    </tr>
                </thead>
                <tbody>


                </tbody>

                <c:forEach items="${users}" var="users" varStatus="sn">

                    <tr>

                        <td>${sn.count}</td>
                        <td>${users.firstName}</td>
                        <td>${users.lastName}</td>
                        <td>${users.userName}</td>
                        <td>${users.state}</td>
                        <td></td>
                        
                    <td><a href="editUser-${users.id}" class="btn btn-warning" role="button">Edit</a></td>
                    <td><a href="deleteUser?id=${users.id}" class="btn btn-danger" role="button">Delete</a></td>


                    </tr>

                </c:forEach>
            </table>
            <div id="addFood" class="col-lg-4">
        <a href="newuser" class="btn btn-success btn-lg" role="button">Add User</a></td>

    </div>


        </div>
            
    </div>
            
</div>
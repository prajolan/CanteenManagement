<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<div id="top-menu">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Companies Name</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="home"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                    <sec:authorize access="hasRole('ADMIN')">
                    <li><a href="viewFood"><span class="glyphicon glyphicon-eye-open"></span> View Items</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-stats"></span> View Report</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-pencil"></span> Activity Log</a></li>
                    <li><a href="newuser"><span class="glyphicon glyphicon-plus"></span> Create Account</a></li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('USER')">
                    <li><a href="transaction"><span class="glyphicon glyphicon-pencil"></span> Transactions</a></li>

                </sec:authorize>

                <li><a href="<c:url value="/logout" />" ><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
            </ul>
        </div>
    </nav>

</div>
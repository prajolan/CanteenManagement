<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link href="<c:url value='/static/css/app.css' />" >

<div class="container-fluid">


    <center> <h1>View Food</h1>
    </center>


    <div class="row content">

        <div class="col-sm-9" id="div1">
            <hr>
        </div>
        <div ng-app="myApp" >
            <div  class="ng-cloak">
                <div  ng-controller="FoodController as ctrl" class="generic-container">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading"><span class="lead">List of Food </span></div>
                        <div class="tablecontainer">
                            <table class="table table-striped">    
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Food Name</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="u in ctrl.foods">
                                        <td><span ng-bind="u.id"></span></td>
                                        <td><span ng-bind="u.foodName"></span></td>
                                        <td><span ng-bind="u.price"></span></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
            <script src="<c:url value='/static/js/app.js' />"></script>
            <script src="<c:url value='/static/js/service/user_service.js' />"></script>
            <script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
        </div>


    </div>

</div>

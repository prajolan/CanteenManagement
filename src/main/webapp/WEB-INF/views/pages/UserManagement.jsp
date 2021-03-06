<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link href="<c:url value='/static/css/app.css' />" >

<div class="container-fluid">


    <center> <h1>View User</h1>
    </center>


    <div class="row content">

        <div class="col-sm-9" id="div1">
            <hr>
            <body ng-app="myApp" >
                <div  class="ng-cloak">
                    <div  ng-controller="UserController as ctrl" class="generic-container">
                        <div class="panel panel-default">
                            <div class="panel-heading"><span class="lead">Create User </span>
                            </div>
                            <div class="formcontainer">
                                <form ng-submit="ctrl.submit()" name="userForm" class="form-horizontal">
                                    <input type="hidden" ng-model="ctrl.user.id" />

                                    <div class="row" style="padding-top: 15px; padding-left: 15px">
                                        <div class="form-group col-md-12">
                                            <label class="col-md-2 control-lable" for="file">Username</label>
                                            <div class="col-md-7">
                                                <input type="text" ng-model="ctrl.user.userName" name="userName" class="username form-control input-sm" placeholder="Enter Username name" required ng-minlength="3"/>
                                                <div class="has-error" ng-show="userForm.$dirty">
                                                    <span ng-show="userForm.userName.$error.required">This is a required field</span>
                                                    <span ng-show="userForm.userName.$error.minlength">Minimum length required is 3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="padding-top: 15px; padding-left: 15px">
                                        <div class="form-group col-md-12">
                                            <label class="col-md-2 control-lable" for="file">Password</label>
                                            <div class="col-md-7">
                                                <input type="password" ng-model="ctrl.user.password" class="form-control input-sm" placeholder="Enter Password" required=""/>
                                                <!--                                                <div class="has-error" ng-show="myForm.$dirty">
                                                                                                    <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                                                                                    <span ng-show="myForm.uname.$error.minlength">Minimum length required is 4</span>
                                                                                                </div>-->
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row" style="padding-top: 15px; padding-left: 15px">
                                        <div class="form-group col-md-12">
                                            <label class="col-md-2 control-lable" for="file">First Name</label>
                                            <div class="col-md-7">
                                                <input type="text" ng-model="ctrl.user.firstName" class="form-control input-sm" placeholder="Enter first name" required=""/>
                                                <!--                                                <div class="has-error" ng-show="myForm.$dirty">
                                                                                                    <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                                                                                </div>-->
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="padding-top: 15px; padding-left: 15px">
                                        <div class="form-group col-md-12">
                                            <label class="col-md-2 control-lable" for="file">Last Name</label>
                                            <div class="col-md-7">
                                                <input type="text" ng-model="ctrl.user.lastName" class="form-control input-sm" placeholder="Enter last name"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="padding-top: 15px; padding-left: 15px">
                                        <div class="form-group col-md-12">
                                            <label class="col-md-2 control-lable" for="userProfiles">Roles</label>
                                            <div class="col-md-7">
                                                <select name="multipleSelect" id="multipleSelect" ng-model="data.multipleSelect" multiple>
                                                    <option value="option-1">Option 1</option>
                                                    <option value="option-2">Option 2</option>
                                                    <option value="option-3">Option 3</option>
                                                </select><br>
                                            <!--                                                <select ng-model="ctrl.user.roles" ng-options=${roles}/>
                                                                                            </select>-->
                                                                                            <!--<select path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control input-sm"/></select>-->
                                            </div>
                                        </div>
                                    </div>



                                    <div class="row" >
                                        <div class="form-actions floatRight" style="padding-top: 15px; padding-left: 25px">
                                            <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="userForm.$invalid" style="width:100px">
                                            <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="userForm.$pristine" style="width:100px">Reset Form</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="generic-container">
                            <div class="panel panel-default">
                                <!-- Default panel contents -->
                                <div class="panel-heading"><span class="lead"><center>List of Users</center> </span></div>
                                <div class="tablecontainer">
                                    <table class="table table-striped">    
                                        <thead>
                                            <tr>
                                                <th>S.N</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>User Name</th>
                                                <th>Status</th>
                                                <th>Roles</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="u in ctrl.users">
                                                <td>{{ $index + 1}}</td>
                                                <td><span ng-bind="u.firstName"></span></td>
                                                <td><span ng-bind="u.lastName"></span></td>
                                                <td><span ng-bind="u.userName"></span></td>
                                                <td><span ng-bind="u.state"></span></td>
                                                <td>
                                                    <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                                                </td>

                                            </tr>
                                        </tbody>
                                    </table>
                                    <table>
                                    <!--<ul class="pagination pagination-sm">-->
                                        <tr ng-repeat="n in range(ctrl.countUsers)"> 
                                            <td>   
                                                <button type="button" class="btn btn-success custom-width" ng-click="ctrl.fetchAllUsers(n)">test</button>
                                            </td>
                                        </tr>
                                    <!--</ul>-->
                                        </table>

                                </div>

                                <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
                                <script src="<c:url value='/static/js/app.js' />"></script>
                                <script src="<c:url value='/static/js/service/user_service.js' />"></script>
                                <script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
                            </div>
                        </div>


                    </div>

                </div>
        </div>
    </div>
</div>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link href="<c:url value='/static/css/app.css' />" >
</head>
<body ng-app="myApp" >
<div  class="ng-cloak">
    <div  ng-controller="FoodController as ctrl" class="generic-container">
        <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Inventory Registration Form </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.food.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Inventory Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.food.foodName" name="uname" class="username form-control input-sm" placeholder="Enter Product name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                        
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Price</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.food.price" class="form-control input-sm" placeholder="Enter Price"/>
                              </div>
                          </div>
                      </div>

                     

                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.food.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
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
</body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link href="<c:url value='/static/css/app.css' />" >

<style>
.selected {
    background-color:black;
    color:white;
    font-weight:bold;
}
</style>

<div class="container-fluid">

    <div class="row content">

        <div class="col-sm-9" id="div1">
            <div ng-app="myApp" >
                <div  class="ng-cloak">
                    <div  ng-controller="CanteenController as ctrl" class="generic-container">
                        <div class="panel panel-default">
                            <div class="panel-heading"><span class="lead">Inventory Registration Form </span></div>
                            <div class="formcontainer">
                                <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                                    <input type="hidden" ng-model="ctrl.food.id" />
                                    <div class="row" style="padding-top: 15px; padding-left: 15px">
                                        <div class="form-group col-md-12">
                                            <label class="col-md-2 control-lable" for="file">Inventory Name</label>
                                            <div class="col-md-7">
                                                <input type="text" ng-model="ctrl.food.foodName" name="foodName" class="username form-control input-sm" placeholder="Enter Product name" required ng-minlength="3"/>
                                                <div class="has-error" ng-show="myForm.$dirty">
                                                    <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                                    <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row" style="padding-top: 15px; padding-left: 15px">
                                        <div class="form-group col-md-12">
                                            <label class="col-md-2 control-lable" for="file">Price</label>
                                            <div class="col-md-7">
                                                <input type="text" ng-model="ctrl.food.price" class="form-control input-sm" placeholder="Enter Price"/>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="row" >
                                        <div class="form-actions floatRight" style="padding-top: 15px; padding-left: 25px">
                                            <input type="submit"  value="{{!ctrl.food.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid" style="width:100px">
                                            <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine" style="width:100px">Reset Form</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="panel panel-default col-md-4">
                            <!-- Default panel contents -->
                            <div class="panel-heading"><span class="lead">List of Food </span></div>
                            <div class="tablecontainer">
                                <table class="table">    
                                    <thead>
                                        <tr>
                                            <th>S.N</th>
                                            <th>Food Name</th>
                                            <th>Price</th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="f in ctrl.foods" varStatus="sn" ng-class="{'selected':$index == selectedRow}" ng-click="setClickedRow($index)" ng-dblclick="addEntry(f)">
                                            <td><span ng-bind="f.id"></span></td>
                                            <!--<td><span>{{rowRenderIndex+1}}</span></td>-->
                                            
                                            <td><span ng-bind="f.foodName"></span></td>
                                            <td><span ng-bind="f.price"></span></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                             </div>
                        
                         <div class="panel panel-default col-md-offset-2 col-md-4">
                            <!-- Default panel contents -->
                            <div class="panel-heading"><span class="lead">Food Bill </span></div>
                            <div class="tablecontainer">
                                <table class="table">    
                                    <thead>
                                        <tr>
                                            <th>S.N</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-class="{'selected':$index == selectedRow}" ng-click="setClickedRow($index)">
                                            <td>1</td>
                                            <td>Hello</td>
                                            <td>47</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                             </div>
                        
                        

                            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
                            <script src="<c:url value='/static/js/app.js' />"></script>
                            <script src="<c:url value='/static/js/service/canteen_service.js' />"></script>
                            <script src="<c:url value='/static/js/controller/canteen_controller.js' />"></script>
                       


                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

'use strict';

angular.module('myApp').controller('FoodController', ['$scope', 'FoodService', function($scope, FoodService) {
    var self = this;
    self.food={"id":null, "foodName":'', "price":'', "del":false};
    self.foods=[];

    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;


    fetchAllFoods();

    function fetchAllFoods(){
        FoodService.fetchAllFoods()
            .then(
            function(d) {
                console.error('fetched');
                self.foods = d;
            },
            function(errResponse){
                console.error('Error while fetching Foods');
            }
        );
    }

    function createFood(food){
        console.log('contoller ko cl vayo');
        FoodService.createFood(food)
            .then(
            fetchAllFoods,
            function(errResponse){
                console.error('Error while creating Foods');
            }
        );
    }

    function updateFood(food, id){
        FoodService.updateFood(food, id)
            .then(
            fetchAllFoods,
            function(errResponse){
                console.error('Error while updating Foods');
            }
        );
    }

    function deleteFood(id){
        FoodService.deleteFood(id)
            .then(
            fetchAllFoods,
            function(errResponse){
                console.error($log.error(message));
            }
        );
    }

    function submit() {
        if(self.food.id==null){
            console.log('Saving New Food', self.food);
            createFood(self.food);
        }else{
            updateFood(self.food, self.food.id);
            console.log('Food updated with id ', self.food.id);
        }
        reset();
    }

    function edit(id){
        console.log('id to be edited', id);
        for(var i = 0; i < self.foods.length; i++){
            if(self.foods[i].id === id) {
                self.food = angular.copy(self.foods[i]);
                break;
            }
        }
    }

    function remove(id){
        console.log('id to be deleted', id);
        if(self.food.id === id) {//clean form if the food to be deleted is shown there.
            reset();
        }
        deleteFood(id);
    }


    function reset(){
        console.log('Reset');
        self.food={id:null,foodName:'',price:''};
        $scope.myForm.$setPristine(); //reset Form
    }

}]);

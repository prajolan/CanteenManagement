'use strict';

angular.module('myApp').controller('FoodController', ['$scope', 'FoodService', function($scope, FoodService) {
    var self = this;
    self.food={"id":null, "foodName":'', "price":'', "del":false};
    self.foods=[];

    self.submit = submit;
   self.edit = edit;
//    self.remove = remove;
    self.reset = reset;


    fetchAllUsers();

    function fetchAllUsers(){
        FoodService.fetchAllUsers()
            .then(
            function(d) {
                console.error('fetched');
                self.foods = d;
            },
            function(errResponse){
                console.error('Error while fetching Users');
            }
        );
    }

    function createFood(food){
        console.error('contoller ko cl vayo');
        FoodService.createFood(food)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while creating User');
            }
        );
    }

    function updateFood(food, id){
        FoodService.updateFood(food, id)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while updating User');
            }
        );
    }

//    function deleteUser(id){
//        UserService.deleteUser(id)
//            .then(
//            fetchAllUsers,
//            function(errResponse){
//                console.error('Error while deleting User');
//            }
//        );
//    }

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

//    function edit(id){
//        console.log('id to be edited', id);
//        for(var i = 0; i < self.users.length; i++){
//            if(self.users[i].id === id) {
//                self.user = angular.copy(self.users[i]);
//                break;
//            }
//        }
//    }
//
//    function remove(id){
//        console.log('id to be deleted', id);
//        if(self.user.id === id) {//clean form if the user to be deleted is shown there.
//            reset();
//        }
//        deleteUser(id);
//    }
//
//
    function reset(){
        self.user={id:null,foodName:'',price:''};
        $scope.myForm.$setPristine(); //reset Form
    }

}]);

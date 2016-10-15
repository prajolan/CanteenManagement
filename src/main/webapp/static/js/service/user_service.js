'use strict';

angular.module('myApp').factory('FoodService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8084/CanteenManagement/';

    var factory = {
        fetchAllUsers: fetchAllUsers,
        createFood: createFood,
        updateFood:updateFood
//        deleteUser:deleteUser
    };

    return factory;

    function fetchAllUsers() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+'foods')
            .then(
            function (response) {
                deferred.resolve(response.data);
                                console.error('fetched in service');

            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function createFood(food) {
        console.error('service ma aayo');
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI+'food', food)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


    function updateFood(food, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+id, food)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
//
//    function deleteUser(id) {
//        var deferred = $q.defer();
//        $http.delete(REST_SERVICE_URI+id)
//            .then(
//            function (response) {
//                deferred.resolve(response.data);
//            },
//            function(errResponse){
//                console.error('Error while deleting User');
//                deferred.reject(errResponse);
//            }
//        );
//        return deferred.promise;
//    }

}]);

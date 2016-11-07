'use strict';

angular.module('myApp').factory('UserService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8007/CanteenManagement/';

    var factory = {
        fetchAllUsers: fetchAllUsers,
        createUser: createUser,
        updateUser:updateUser,
        deleteUser:deleteUser,
        countUsers:countUsers
    };

    return factory;

    function fetchAllUsers(pageid) {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+'users/'+pageid)
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
  
//      ------------------------Pagination------------------------
     this.paged = function (valLists, pageSize) {
        retVal = [];
        for (var i = 0; i < valLists.length; i++) {
            if (i % pageSize === 0) {
                retVal[Math.floor(i / pageSize)] = [valLists[i]];
            } else {
                retVal[Math.floor(i / pageSize)].push(valLists[i]);
            }
        }
        return retVal;
    };
    
    //      ------------------------Pagination------------------------

 


    function createUser(user) {
        console.log('service ma aayo');
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI+'user', user)
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


    function updateUser(user, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+'user/'+id, user)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating User in service');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function deleteUser(id) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+'user/'+id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error($log.error(message));
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    function countUsers(){
       var deferred = $q.defer();
       $http.delete(REST_SERVICE_URI+'users/usersCount')
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error($log.error(message));
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

}]);

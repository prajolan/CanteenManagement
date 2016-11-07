'use strict';

angular.module('myApp').controller('UserController', ['$scope', 'UserService', function ($scope, UserService) {
        var self = this;
        self.user = {"id": null, "userName": '', "firstName": '', "lastName": '', "password": '', "state": '', "del": false};
        self.users = [];
        self.countUsers=0;
        self.pageid=1;
       

        self.submit = submit;
        self.edit = edit;
        self.remove = remove;
        self.reset = reset;
       


        fetchAllUsers(self.pageid);
         countUser();
//    ------------------------Pagination--------------------------------
//     // Calculate Total Number of Pages based on Search Result

        $scope.range = function (total) {
            var ret = [];
            var show=total/2;
            for(var i=1;i<show+1; i++){
                ret.push(i);
            }
//           
            return ret;
        };




        function fetchAllUsers(pageid) {
            UserService.fetchAllUsers(pageid)
                    .then(
                            function (d) {
                                console.log('fetched');
                                self.users = d;
                                self.pageid=pageid;
                            },
                            function (errResponse) {
                                console.error('Error while fetching Users');
                            }
                    );
        }

        function createUser(user) {
            console.error('contoller ko cl vayo');
            UserService.createUser(user)
                    .then(
                            fetchAllUsers,
                            function (errResponse) {
                                console.error('Error while creating Users');
                            }
                    );
        }

        function updateUser(user, id) {
            UserService.updateUser(user, id)
                    .then(
                            fetchAllUsers,
                            function (errResponse) {
                                console.error('Error while updating Users');
                            }
                    );
        }

        function deleteUser(id) {
            UserService.deleteUser(id)
                    .then(
                            fetchAllUsers,
                            function (errResponse) {
                                console.error($log.error(message));
                            }
                    );
        }

        function submit() {
            if (self.user.id == null) {
                console.log('Saving New User', self.user);
                createUser(self.user);
            } else {
                updateUser(self.user, self.user.id);
                console.log('User updated with id ', self.user.id);
            }
            reset();
        }

        function edit(id) {
            console.log('id to be edited', id);
            for (var i = 0; i < self.users.length; i++) {
                if (self.users[i].id === id) {
                    self.user = angular.copy(self.users[i]);
                    break;
                }
            }
        }

        function remove(id) {
            console.log('id to be deleted', id);
            if (self.user.id === id) {//clean form if the user to be deleted is shown there.
                reset();
            }
            deleteUser(id);
        }


        function reset() {
            console.log('Error');
            self.user = {id: null, userName: '', password: '', firstName: '', lastName: ''};
            $scope.myForm.$setPristine(); //reset Form
        }
        function countUser() {
            UserService.countUsers()

                    .then(
                            function (d) {
                                console.log('fetched');
                                self.countUsers = d;
                            },
                            function (errResponse) {
                                console.error('Error while fetching Users');
                            }
                    );
        }

    }]);

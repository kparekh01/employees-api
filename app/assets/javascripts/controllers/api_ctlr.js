(function(){
  'use strict';

  angular.module('app').controller('api_ctlr', function($scope, $http){
    function setup() {
      $http.get('/api/v1/employees.json').then(function(response){
        $scope.employees = response.data;
      });
    }
    setup();

    function resizeText(multiplier) {
      if (document.body.style.fontSize === "") {
        document.body.style.fontSize = "1.0em";
      }
      document.body.style.fontSize = parseFloat(document.body.style.fontSize) + (multiplier * 0.2) + "em";
    }

    $scope.addEmployee = function(employee){
      $http.post('/api/v1/employees.json', employee).success(function(response){
        $scope.message = response.data.message;
        $scope.employees.push(employee);
        $scope.employee = {};
      }).error(function(response){
        $scope.errors = response.errors;
      });
    };

    $scope.fireEmployee = function(employee){
      $http.delete('/api/v1/employees.json', employee).then(function(response){
        $scope.message = response.data.message;
        $scope.employees.push(employee);
        $scope.employee = {};
      });
    };

    $scope.toggleOrder = function(orderAttribute){
      if(orderAttribute != $scope.orderAttribute){
        $scope.isReverse = false;
      } else {
        $scope.isReverse = !$scope.isReverse;
      }
    };

  });
})();

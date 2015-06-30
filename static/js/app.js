
var cephweb = angular.module('cephweb', [
  'ngRoute',
]);

cephweb.config(function ($routeProvider, $httpProvider) {
        $httpProvider.defaults.headers.common['Access-Control-Allow-Origin'] = '*';

    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];

    });

cephweb.controller('IndexController', function ($scope, $rootScope, $route, $http) {

  url = "http://192.168.99.100:5000/api/v0.1/health"

  $scope.foo = "default"

  $http.get(url).success(function(data) {
  //$http.jsonp(url).success(function(data) {
      alert(data)
        $scope.foo = "Request success";
  }).error(function (data) {
    $scope.foo = "Request failed";
  });;

});

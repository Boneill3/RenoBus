RenoBusModule.factory('routesService', function($http) {
  return new function () {
    
   this.get = function (route) {
    return $http.get('/routes/' + route);
   
   }

  }

});

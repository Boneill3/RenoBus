RenoBusModule.controller('routesIndexCtrl', ['$scope', function ($scope) {
  $scope.inputData = [{
    route: 1,
    color: "992ac5",
    directions: [{ stops: [{id: 1, lat:123, lon:123}, 
			   {id:2, lat:124, lon: 123}],
		   name: "inbound"}],
		   paths:[[{lat: 39.42193, lon:-119.75829}, {lat: 39.47201, lon:-119.78316}], [{lat: 39.47201, lon:-119.78316}, {lat: 39.46481, lon:-119.77804}]]
		}];

  $scope.routes = [];
  $scope.message = "Angular is working!";
  $scope.polyLines = [];
  $scope.map = {center: {latitude: 39.42193, longitude: -119.75829 }, zoom: 14 };
        $scope.options = {scrollwheel: false};

  $scope.init = function() {
    $scope.inputData.map(function(route) {
      route.paths.map(function (paths) {
	var line = [];
	paths.map(function(path) {
	  line.push({latitude: path.lat, longitude: path.lon});
	})

	var bus ={
	  id: 1,
	path: line,
	stroke: { color: route.color, weight: 4, opacity: 1 },
	geodesic: true,
	visible: true,
	editable: false
	}
	$scope.polyLines.push(bus);

      });
    })
  }
}]);

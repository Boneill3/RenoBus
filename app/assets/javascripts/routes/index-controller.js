RenoBusModule.controller('routesIndexCtrl', ['$scope', '$firebase', function ($scope, $firebase) {
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

  var transitLine = 'X';
  var transitRef = new Firebase("https://publicdata-transit.firebaseio.com/reno");
  // create an AngularFire reference to the data
  var sync = $firebase(transitRef);
  // download the data into a local object
  $scope.data = sync.$asObject();
  
  $scope.init = function(data) {
    $scope.message = data[0].tag;
    
    data.map(function(route) {
      route.directions.map(function (direction) {
	var line = [];
	direction.stops.map(function(stop) {
	  line.push({latitude: stop.lat, longitude: stop.lon});
	})

	var bus ={
	id: direction.id,
	path: line,
	stroke: { color: '#' + route.color, weight: 4, opacity: 1 },
	geodesic: true,
	visible: true,
	editable: false
	}
	$scope.polyLines.push(bus);

      });
    })
  }
}]);

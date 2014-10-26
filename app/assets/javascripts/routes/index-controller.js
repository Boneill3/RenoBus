RenoBusModule.controller('routesIndexCtrl', ['$scope', '$firebase', 'routesService', function ($scope, $firebase, routesService) {

  $scope.routes = [];
  $scope.message = "Angular is working!";
  $scope.polyLines = [];
  $scope.map = {center: {latitude: 39.42193, longitude: -119.75829 }, zoom: 14 };
  $scope.options = {scrollwheel: false};
  $scope.stops = [];
  $scope.markerControl = {};
  var stopData = [];

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
	  $scope.stops.push({latitude: stop.lat, longitude: stop.lon, title: stop.title, id: stop.id});
	})

      });
    })
    stopData = $scope.stops;
  }

  $scope.selectMarker = function() {


  }

  var drawLines = function(route, weight) {
    route = 9; 
    routesService.get(route).then(function (routeInfo) {
      routeInfo.data.paths.map(function (path) {
	var drawPath = [];
	path.points.map(function(line) {
	  drawPath.push({latitude: line.lat, longitude: line.lon});
	})
	var bus = {
	  id: path.id,
	path: drawPath,
	stroke: { color: '#' + routeInfo.color, weight: 4, opacity: 1 },
	geodesic: true,
	visible: true,
	editable: false
	}
	$scope.polyLines.push(bus);

      })
    })
  }

  drawLines();

  $scope.events =  {
    zoom_changed: function (event) {
      if(event.zoom > 15) {
	//get relevant points

      }


    }
  }


}]);

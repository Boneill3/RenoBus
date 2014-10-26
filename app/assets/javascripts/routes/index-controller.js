RenoBusModule.controller('routesIndexCtrl', ['$scope', '$firebase', 'routesService',  function ($scope, $firebase, routesService ) {
  
  var colors = ['#963AC9', '#E81014', '#B7DB3F', '#CCCCCC', '#FF99D6', '#257D22', '#A30029', '#5FC1D9', '#8B8B8B', '#40CA3A', '#575757', '#290EE3', '#FF0099', '#18E50E', '#FFCC10', '#444900', '#2C5863', '#B15400', '#F5F46B', '#F5696C', '#D13C98', '#4C2400', '#F3B253', '#7E6F00', '#650065', '#EAE810', '#A2A00A', '#FF6910', '#7E3C00']

  $scope.routes = [];
  $scope.message = "Angular is working!";
  $scope.polyLines = [];
  $scope.map = {center: {latitude: 39.42193, longitude: -119.75829 }, zoom: 14 };
  $scope.options = {scrollwheel: false};
  $scope.stops = [];
  $scope.markerControl = {};
  $scope.showWindow = false;
  var stopData = [];

  var transitRef = new Firebase("https://publicdata-transit.firebaseio.com/reno");
  // create an AngularFire reference to the data
  var sync = $firebase(transitRef);
  // download the data into a local object
  $scope.data = sync.$asArray();

  $scope.markerOptions = {title: 'title',
			  label: 'title'}; 


  $scope.init = function(data) {
    $scope.message = data[0].tag;
    var i = 0;
    data.map(function(route) {
      route.color = colors[i];
      i++;
      route.directions.map(function (direction) {
	var line = [];
	direction.stops.map(function(stop) {
	  stopData[stop.id] = {title: stop.title, id: stop.id, route: route.id, color: route.color};
	  var stop = { latitude: stop.lat, longitude: stop.lon, title: stop.title, id: stop.id, show: false };
	  stop.onClick = function () {
	    stop.show = true;
	  }
	  $scope.stops.push(stop);
	  });
	})
      });
    }

  $scope.selectMarker = function(marker) {
   var result = stopData[marker.key];
   $scope.polyLines.pop();
   drawLine(result.route, result.color);
  }

  var drawLine = function(route, color) {
    routesService.get(route).then(function (routeInfo) {
      routeInfo.data.paths.map(function (path) {
	var drawPath = [];
	path.points.map(function(line) {
	  drawPath.push({latitude: line.lat, longitude: line.lon});
	})
	var bus = {
	  id: path.id,
	path: drawPath,
	stroke: { color: color, weight: 5, opacity: 1 },
	geodesic: true,
	visible: true,
	editable: false
	}
	$scope.polyLines.push(bus);

      })
    })
  }

  $scope.events =  {
    zoom_changed: function (event) {
      if(event.zoom > 15) {
	//get relevant points

      }
    }
  }

  drawLine(5);

}]);

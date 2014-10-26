RenoBusModule.controller('routesIndexCtrl', ['$scope', '$firebase', 'routesService',  function ($scope, $firebase, routesService ) {

  var colors = ['#963AC9', '#E81014', '#B7DB3F', '#CCCCCC', '#FF99D6', '#257D22', '#A30029', '#5FC1D9', '#8B8B8B', '#40CA3A', '#575757', '#290EE3', '#FF0099', '#18E50E', '#FFCC10', '#444900', '#2C5863', '#B15400', '#F5F46B', '#F5696C', '#D13C98', '#4C2400', '#F3B253', '#7E6F00', '#650065', '#EAE810', '#A2A00A', '#FF6910', '#7E3C00'];

  $scope.polyLines = [];
  $scope.map = {center: {latitude: 39.527222, longitude:  -119.821944 }, zoom: 12 };  
  $scope.mapOptions = {scrollwheel: false};
  $scope.stops = [];
  $scope.routes = [];
  $scope.routes2 = [];
  $scope.showAllRoutes = true;
  var stopData = [];

  $scope.init = function(data) {
    var i = 0;
    _.each(data, function(route) {
      route.color = colors[i];
      drawLines(route);
      if(i%2) {
	$scope.routes.push(route);
      } else {
	$scope.routes2.push(route);
      }
      i++;
      _.each(route.directions, function (direction) {
        var line = [];
       _.each(direction.stops, function(stop) {
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

  $scope.toggle = function() {
    $scope.showAllRoutes = !$scope.showAllRoutes;
    _.each($scope.polyLines, function(line) {
      line.visible = $scope.showAllRoutes;
    })
  }

  $scope.selectMarker = function(marker) {
    _.each($scope.polyLines, function (line) {
      if (line.routeId == stopData[marker.key].route) {
        line.visible = true;
      } else {
        line.visible = false;
      }
    })
  }

  $scope.selectButton = function (route) {
    _.each($scope.polyLines, function(line) {
      if (line.routeId == route.id) {
	line.visible = true;
      } else {
	line.visible = false;
      }
    })
  };

  var drawLines = function(routeInfo) {
    routeInfo.paths.map(function (path) {
      var drawPath = [];
      _.each(path.points, function(line) {
        drawPath.push({latitude: line.lat, longitude: line.lon});
      })
      var bus = {
        id: path.id,
        path: drawPath,
      stroke: { color: routeInfo.color, weight: 2, opacity: 1 },
      visible: true,
      routeId: routeInfo.id
    }
    $scope.polyLines.push(bus);
  });
};
}]);

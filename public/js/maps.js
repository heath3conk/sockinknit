$(document).ready(function() {
  google.maps.event.addDomListener(window, 'load', initialize);

});

var map;
var service;
var infowindow;

function initialize() {
  var location = new google.maps.LatLng(41.97032, -87.704162);

  map = new google.maps.Map(document.getElementById('googleMap'), {
      center: location,
      zoom: 10
    });

  var marker=new google.maps.Marker({
    position: map.center,
  });

  marker.setMap(map);

  google.maps.event.addListener(marker,'click',function() {
    map.setZoom(12);
    map.setCenter(marker.getPosition());
  });
};
// everything above this line works: loads the map & marker and zooms in on click


//   var newLocation = new google.maps.LatLng(40.3487181, -74.6590472); 
//   var request = {
//     location: newLocation,
//     radius: '5000',  // this is in meters
//     query: 'store',
//     keyword: 'yarn'
//   };

//   service = new google.maps.places.PlacesService(map);
//   service.textSearch(request, callback);
// }

// function callback(results, status) {
//   if (status == google.maps.places.PlacesServiceStatus.OK) {
//     for (var i = 0; i < results.length; i++) {
//       var place = results[i];
//       createMarker(results[i]);
//     }
//   }
// }
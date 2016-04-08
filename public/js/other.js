$(document).ready(function() {
  google.maps.event.addDomListener(window, 'load', initialize);


  $(".lys").on("submit", "#address-button", function(event) {
    event.preventDefault();
    var addressForm = $(this);
    var address = addressForm.serialize();
   
    var geocoder = new google.maps.Geocoder();

    geocodeAddress(geocoder, map);

    function geocodeAddress(geocoder, resultsMap) {
      // var address = document.getElementById('address').value;
      geocoder.geocode({'address': address}, function(results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
          resultsMap.setCenter(results[0].geometry.location);
          var userMarker = new google.maps.Marker({
            map: resultsMap,
            position: results[0].geometry.location
          });
        } else {
          alert ('Geocode was not successful for the following reason: ' + status);
        }
      });
    }
   });
});

var map;

function initialize() {
  var mapProp = {
    center:new google.maps.LatLng(41.97032, -87.704162),
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map=new google.maps.Map(document.getElementById("googleMap"), mapProp);

  var marker=new google.maps.Marker({
    position: mapProp.center,
  });

  marker.setMap(map);


  //user events
  google.maps.event.addListener(marker,'click',function() {
    map.setZoom(12);
    map.setCenter(marker.getPosition());
  });

};


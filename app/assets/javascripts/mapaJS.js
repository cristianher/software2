$(document).on('turbolinks:load', ready);
//http://gis.stackexchange.com/questions/33238/how-do-you-get-the-coordinates-from-a-click-or-drag-event-in-the-google-maps-api
function ready() {
  var geocoder = new google.maps.Geocoder();

  function geocodePosition(pos) {
    geocoder.geocode({
      latLng: pos
    }, function(responses) {
      if (responses && responses.length > 0) {
        updateMarkerAddress(responses[0].formatted_address);
      } else {
        updateMarkerAddress('No se puede saber la locación.');
      }
    });
  }

  function updateMarkerStatus(str) {
    document.getElementById('markerStatus').innerHTML = str;
  }

  function updateMarkerPosition(latLng) {
    //document.getElementById('info').innerHTML = [
    //  latLng.lat(),
    //  latLng.lng()
    //].join(', ');
    document.getElementById('alert_latitude').value = latLng.lat();
    document.getElementById('alert_longitude').value = latLng.lng();
  }

  function updateMarkerAddress(str) {
    //document.getElementById('address').innerHTML = str;
    document.getElementById('alert_description').value = str;
  }

  function initialize() {
    var latLng = new google.maps.LatLng(4.344907610517978, -74.36146224871828);
    var map = new google.maps.Map(document.getElementById('mapCanvas'), {
      zoom: 14,
      center: latLng,
      mapTypeId: google.maps.MapTypeId.HYBRID 
    });
    var marker = new google.maps.Marker({
      position: latLng,
      title: 'Point A',
      map: map,
      draggable: true
    });

    // Update current position info.
    updateMarkerPosition(latLng);
    geocodePosition(latLng);

    // Add dragging event listeners.
    google.maps.event.addListener(marker, 'dragstart', function() {
      updateMarkerAddress('Moviendo...');
    });

    google.maps.event.addListener(marker, 'drag', function() {
      updateMarkerStatus('Moviendo...');
      updateMarkerPosition(marker.getPosition());
    });

    google.maps.event.addListener(marker, 'dragend', function() {
      updateMarkerStatus('Seleccionado');
      geocodePosition(marker.getPosition());
    });
  }
  //initialize();
  // Onload handler to fire off the app.
  google.maps.event.addDomListener(window, 'load', initialize);

}
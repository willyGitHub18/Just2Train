$(document).on('turbolinks:load', function() {
function initializeAutocomplete(id) {
    var element = document.getElementById(id);
    if (element) {
        var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'], componentRestrictions: {country: 'fr'} });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    }
  }

  function onPlaceChanged() {
    var place = this.getPlace();

    // console.log(place);  // Uncomment this line to view the full object returned by Google API.

    for (var i in place.address_components) {
      var component = place.address_components[i];
      for (var j in component.types) {  // Some types are ["country", "political"]
        var type_element = document.getElementById(component.types[j]);
        if (type_element) {
          type_element.value = component.long_name;
        }
      }
    }
    document.getElementById('route').value = place.address_components[0]['long_name'] + ' ' + place.address_components[1]['long_name'];
    document.getElementById('latitude').value = place.geometry.location.lat();
    document.getElementById('longitude').value = place.geometry.location.lng();
  }

  google.maps.event.addDomListener(window, 'load', function() {
    initializeAutocomplete('autocomplete_address');
  });
});

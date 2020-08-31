import places from 'places.js';

const initAutocomplete = () => {
  const countryInput = document.getElementById('trip_country');
  const cityInput = document.getElementById('trip_city');
  if (countryInput) {
    places({
      container: countryInput,
      templates: {
        suggestion: function(suggestion) {
          return suggestion.highlight.name;
        }
      }
    }).configure({
      type: 'country'
    });
  }
  if (cityInput) {
    places({
      container: cityInput,
      templates: {
        suggestion: function(suggestion) {
          return suggestion.highlight.name;
        }
      }
    }).configure({
      type: 'city',
      aroundLatLngViaIP: false
    });
  }
};

export { initAutocomplete };

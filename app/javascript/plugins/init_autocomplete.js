import places from 'places.js';

const initAutocomplete = () => {
  const countryInputs = document.querySelectorAll('input.trip_country');
  const cityInputs = document.querySelectorAll('input.trip_city');

  countryInputs.forEach((countryInput) => {
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
  })

  cityInputs.forEach((cityInput) => {
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
  })

};

export { initAutocomplete };

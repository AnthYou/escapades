// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "../plugins/flatpickr";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../plugins/init_mapbox';
import { initStarRating } from '../plugins/init_star_rating';

import { initFlatpickr } from "../plugins/flatpickr";
import { initExpander } from "../plugins/expander";
import { initUpdateNavbarOnScroll } from "../components/navbar_home";
import {initTagCheckbox} from "../plugins/init_tag_checkbox";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initPolaroidsRotation } from "../components/postcards";
import { initTripCable } from "../channels/trip_channel";
import { sendMessage } from "../components/send_message";
import { initSelect2 } from '../plugins/init_select2';

document.addEventListener('turbolinks:load', () => {
  initTagCheckbox();
  initUpdateNavbarOnScroll();
  initMapbox();

  initStarRating();

  initFlatpickr();
  initAutocomplete();
  initPolaroidsRotation();
  initExpander();
  initTripCable();
  sendMessage();
  initSelect2();
  // Call your functions here, e.g:
  // initSelect2();
});


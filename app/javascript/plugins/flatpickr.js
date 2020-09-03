import flatpickr from "flatpickr";



const initFlatpickr = () => {
  const departureDate = document.querySelector('.departure_date_flatpickr'); //trip departure date
  const returnDate = document.querySelector('.return_date_flatpickr'); //trip return date

  // FLATPICKR FOR TRIPS FORM
  if (departureDate) {

    flatpickr(departureDate, {
      altInput: true,
      minDate: new Date().fp_incr(1), // 1 day from now
    });

    departureDate.addEventListener('change', (event) => {
      console.log(event.target.value)
      flatpickr(returnDate, {
        altInput: true,
        minDate: new Date(event.target.value).fp_incr(1),
      });
    });
  }

  // FLATPICKR FOR ACTIVITES FORM

  const startDateEl = document.querySelector('.start_date_flatpickr'); //activity start date
  const endDateEl = document.querySelector('.end_date_flatpickr'); //activity end date


  if (startDateEl) {

    const startDate = startDateEl.getAttribute('data-start-date');
    const endDate = endDateEl.getAttribute('data-end-date');
    console.log(endDate); //activity end date

    flatpickr(startDateEl, {
      altInput: true,
      dateFormat: "d-m-Y",
      minDate: startDate,
      maxDate: endDate,
      defaultDate: startDate,
    });

    startDateEl.addEventListener('change', (event) => {

      flatpickr(endDateEl, {
        altInput: true,
        dateFormat: "d-m-Y",
        minDate: startDate,
        maxDate: endDate,

      });
    });
  }
}
export { initFlatpickr }


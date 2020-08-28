import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const departureDate = document.querySelector('.departure_date_flatpickr');
  const returnDate = document.querySelector('.return_date_flatpickr');
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
}
export { initFlatpickr }

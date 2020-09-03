import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};

const initDeleteSweetalert = () => {
  const swalButton = document.querySelector(".delete-btn");
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Are you sure?",
        text: "This action cannot be reversed",
        icon: "warning"
      }).then((value) => {
        console.log(value);
        if (value) {
          // const link = document.querySelector('#delete-link');
          swalButton.nextElementSibling.click();
        }
      });
    });
  }
};

export { initSweetalert, initDeleteSweetalert };

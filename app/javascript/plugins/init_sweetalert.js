import swal from 'sweetalert';

const initAcceptSweetalert = (selector, options = {}) => {
   const swalButton = document.querySelector(".accept-application");
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      console.log("click");
      swal({
        title: "Confirm acceptation?",
        icon: "warning"
      }).then((value) => {
        console.log(value);
        if (value) {
            //const link = document.querySelector('#accept-link');
            //link.click();
           swalButton.nextElementSibling.click();
        }
      });
    });
  }
};

const initRejectSweetalert = (selector, options = {}) => {
   const swalButton = document.querySelector(".reject-application");
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      console.log("click");
      swal({
        title: "Do you really want to reject this application?",
        text: "This action cannot be reversed",
        icon: "warning"
      }).then((value) => {
        console.log(value);
        if (value) {
            //const link = document.querySelector('#accept-link');
            //link.click();
           swalButton.nextElementSibling.click();
        }
      });
    });
  }
};

const initDeleteSweetalert = () => {
  const swalButton = document.querySelector(".delete-btn");
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Do you really want to delete this activity?",
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

export { initAcceptSweetalert, initDeleteSweetalert, initRejectSweetalert };

import swal from 'sweetalert';

const initAcceptSweetalert = (selector, options = {}) => {
    const swalButton = document.querySelectorAll(".accept-application");
    if (swalButton) { // protect other pages
      swalButton.forEach((button) => {
        button.addEventListener('click', () => {
        swal({
          title: "Confirm acceptation?",
          icon: "warning"
        }).then((value) => {
          if (value) {

             swalButton.nextElementSibling.click();
          }
        });
      });
    });
  };
}

const initRejectSweetalert = (selector, options = {}) => {
    const swalButton = document.querySelectorAll(".reject-application");
    if (swalButton) { // protect other pages
      swalButton.forEach((button) => {
      button.addEventListener('click', () => {
        swal({
          title: "Do you really want to reject this application?",
          text: "This action cannot be reversed",
          icon: "warning",
          buttons: true,
          dangerMode: true,
        }).then((willDelete) => {
          if (willDelete) {
            swal("This application has been rejected!", {
                icon: "success",
              }).then((redirect) => {
                if (redirect) {
                  swalButton.nextElementSibling.click();
                  }
              });;
          } else {
            swal("This application hasn't been rejected");
          };
        });
      });
    });
  };
};

const initDeleteSweetalert = () => {
  const swalButton = document.querySelector(".delete-btn");
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Do you really want to delete this activity?",
        text: "This action cannot be reversed",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      }).then((willDelete) => {
        if (willDelete) {
          swal("This activity has been deleted!", {
              icon: "success",
            }).then((redirect) => {
              if (redirect) {
                swalButton.nextElementSibling.click();
                }
            });;
        } else {
          swal("This activity hasn't been deleted");
        };
      });
    });
  };
};

export { initAcceptSweetalert, initDeleteSweetalert, initRejectSweetalert };

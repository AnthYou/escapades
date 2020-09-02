const initTagCheckbox = () => {
  $(document).ready(function(){
    $(".filter-tag ").click(function(){
      $(this).toggleClass("active");
    });
  });
};

export { initTagCheckbox };

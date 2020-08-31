

const initExpander = () => {
  $(document).ready(function(){
    var zindex = 10;
    const array = document.querySelectorAll(".activity-card")

    $(".activity-card").each(function(){
      $(this).on("click",function(e){
        e.preventDefault();
        var isShowing = false;
        console.log(this)

        if ($(this).hasClass("show")) {
          isShowing = true
        }

        if ($("div.activity-cards").hasClass("showing")) {
          // a card is already in view
          $("div.activity-card.show")
            .removeClass("show");

          if (isShowing) {
            // this card was showing - reset the grid
            $("div.activity-cards")
              .removeClass("showing");
          } else {
            // this card isn't showing - get in with it
            $(this)
              .css({zIndex: zindex})
              .addClass("show");

          }

          zindex++;

        } else {
          // no cards in view
          $("div.activity-cards")
            .addClass("showing");
          $(this).css({zIndex:zindex})
            .addClass("show");

          zindex++;
        }
      });
    })
  });
}

export { initExpander }
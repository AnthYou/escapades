import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
  $('#review_stars').barrating({
    theme: 'css-stars',
    onSelect: (value, text, event) => {
      const form = $("form.review_form");
      form.submit();
    }
  });
};

export { initStarRating };

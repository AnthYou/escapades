const initUpdateNavbarOnScroll = () => {
  const homepage = document.getElementById('pages-home');
  const navbar = document.querySelector('.navbar');
  const navbarSearchbar = document.querySelector('.navbar-searchbar');

  // These lines below are used to get the Banner title and searchbar positions but it doesnt work all the time if you use it as breakpoints

  // const bannerSearchbarPosition = document.querySelector(".banner #query_banner").offsetTop;
  // const bannerTitlePosition = document.querySelector(".banner h1").offsetTop;

  if (homepage) {
    window.addEventListener('scroll', () => {

      if (window.scrollY >= 150) {
        navbar.classList.remove('linear-gradient');
        navbar.classList.remove('login-white');
      } else {
        navbar.classList.add('linear-gradient');
        navbar.classList.add('login-white');
      }

      if (window.scrollY >= 300) {
        navbarSearchbar.classList.remove('hide-searchbar');
      } else {
        navbarSearchbar.classList.add('hide-searchbar');
      }
    });
  }
}


export { initUpdateNavbarOnScroll };

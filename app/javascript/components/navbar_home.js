const initUpdateNavbarOnScroll = () => {
  const homepage = document.getElementById('pages-home');
  const navbar = document.querySelector('.navbar');
  if (homepage) {
    navbar.classList.remove('navbar-white');
    navbar.classList.add('hide-searchbar');
    navbar.classList.add('login-white');
    navbar.classList.add('linear-gradient');
    window.addEventListener('scroll', () => {
      if (window.scrollY >= (window.innerHeight)) {
        navbar.classList.add('navbar-white');
        navbar.classList.remove('hide-searchbar');
        navbar.classList.remove('login-white');
        navbar.classList.remove('linear-gradient');
      } else if  (window.scrollY >= (window.innerHeight)/4) {
        navbar.classList.add('navbar-white');
        navbar.classList.add('hide-searchbar');
        navbar.classList.add('login-white');
        navbar.classList.remove('linear-gradient');
      } else {
        navbar.classList.remove('navbar-white');
        navbar.classList.add('hide-searchbar');
        navbar.classList.add('login-white');
        navbar.classList.add('linear-gradient');
      }
    });
  }
}


export { initUpdateNavbarOnScroll };

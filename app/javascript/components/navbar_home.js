const initUpdateNavbarOnScroll = () => {
  const homepage = document.getElementById('pages-home');
  const logo = document.getElementById('logo');
  console.log(logo.src);

  const navbar = document.querySelector('.navbar');
  const navbarSearchbar = document.querySelector('.navbar-searchbar');

  // These lines below are used to get the Banner title and searchbar positions but it doesnt work all the time if you use it as breakpoints

  // const bannerSearchbarPosition = document.querySelector(".banner #query_banner").offsetTop;
  // const bannerTitlePosition = document.querySelector(".banner h1").offsetTop;



  if (homepage) {
    navbar.classList.add('background-none');
    navbar.classList.add('login-white');
    logo.src = "https://res.cloudinary.com/dg4hemebf/image/upload/v1599153497/1599153244-escapades-logo-white_fyf4lg.png"
    window.addEventListener('scroll', () => {


      if (window.scrollY >= 150) {
        navbar.classList.remove('linear-gradient');
        navbar.classList.remove('login-white');
        navbar.classList.remove('background-none');
        logo.src = "https://res.cloudinary.com/dg4hemebf/image/upload/v1599153386/1599153244-escapades-logo_u4e5ic.png"
      } else {
        navbar.classList.add('login-white');
        navbar.classList.add('background-none');
        logo.src = "https://res.cloudinary.com/dg4hemebf/image/upload/v1599153497/1599153244-escapades-logo-white_fyf4lg.png"
      }

      if (window.scrollY >= 300) {
        navbarSearchbar.classList.remove('hide-searchbar');
        navbar.classList.remove('background-none');
      } else {
        navbarSearchbar.classList.add('hide-searchbar');

      }
    });
  }
}


export { initUpdateNavbarOnScroll };

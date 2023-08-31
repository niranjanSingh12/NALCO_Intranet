window.addEventListener('load', function () {
    const logoImg = document.getElementById('logoImg');
    const overlay = document.querySelector('.faded-white-overlay');

    overlay.style.width = logoImg.width + 'px';
    overlay.style.height = logoImg.height + 'px';
});


  // JavaScript to handle the toggle button click
    document.addEventListener('DOMContentLoaded', function() {
    const navbarMenu = document.querySelector('.navbar-menu');
    const navbarToggleBtn = document.getElementById('navbarToggleBtn');

    navbarToggleBtn.addEventListener('click', function() {
        navbarMenu.classList.toggle('show');
    const isExpanded = navbarToggleBtn.getAttribute('aria-expanded') === 'true';
    navbarToggleBtn.setAttribute('aria-expanded', !isExpanded);
    });
  });


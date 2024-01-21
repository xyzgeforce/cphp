var base_url = $(".base_url").attr("id");

// Mask form 
$.getScript('https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js').done(() => {
  $('.mask-cpf').mask('000.000.000-00');
  $('.mask-date').mask('00/00/0000');
  $('.mask-phone').mask('(00) 00000-0000');
});

// View/hide password
$("#eye-show-login").click(function() {
    $("#senha").attr("type", "text");
});
$("#eye-hide-login").click(function() {
    $("#senha").attr("type", "password");
});
$("#eye-show-register").click(function() {
    $("#senha-cad").attr("type", "text");
});
$("#eye-hide-register").click(function() {
    $("#senha-cad").attr("type", "password");
});

// disabled input
$(document).ready(function() {
  $('.disabled').attr('disabled', 'disabled');
});

window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.custom-navbar');
    if (window.scrollY > 0) {
        navbar.classList.add('navbar-hidden');
    } else {
        navbar.classList.remove('navbar-hidden');
    }
});



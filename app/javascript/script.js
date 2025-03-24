$(document).on('click', '#back a', function(e) {
  e.preventDefault();
  $('html, body').animate({ scrollTop: 0 }, 800);
});

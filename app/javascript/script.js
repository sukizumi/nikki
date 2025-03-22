$(function() {
  $('#back a').on('click',function(e){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    e.preventDefault();
  });
});
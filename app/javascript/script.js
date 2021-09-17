$(function() {
  $('.close-modal').click(function() {
    $('#login-modal').fadeOut();
    $('#signup-modal').fadeOut();
  });
  $('.main-wrapper').click(function() {
    $('.flash').fadeOut(0)
  });
});
$(function() {
  $('#login-btn').click(function() {
    $('#login-modal').fadeIn();
  });
  // $('#signup-btn').click(function() {
  //   $('.signup-modal-wrapper').fadeIn();
  // });
  $('.close-modal').click(function() {
    $('#login-modal').fadeOut();
    $('#signup-modal').fadeOut();
  });
  $('.main-wrapper').click(function() {
    $('.flash').fadeOut(0)
  });
});
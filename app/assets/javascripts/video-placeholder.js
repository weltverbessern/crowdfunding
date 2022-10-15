$(function () {
  $('#video_image').on('click', function () {
    $('#player').removeClass('hidden');
    $('#player').css('display', 'block');
    $(this).hide();
  });
});

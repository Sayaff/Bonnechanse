//= require jquery
//= require fancybox
//= require jquery_ujs
//= require jquery-ui
//= require_bootstrap-sprockets
//= require_tree .
$(document).ready (function () {
  $('.alert').fadeOut(3000);
});
$(function() {
  $('#pictureInput').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
      img.src = file.target.result;
      $('#target').html(img);
    }
    reader.readAsDataURL(image);
    console.log(files);
  });
});

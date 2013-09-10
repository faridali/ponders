// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require turbolinks
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require jquery.purr
//= require jasny-bootstrap
//= require jquery.facebox
//= require best_in_place
//= require_tree .

$(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});

$(function(){
    $('textarea').keypress(function(e) {
        if (e.keyCode == 13 && !e.shiftKey) {
            e.preventDefault();
            var frm = this.form.submit();
            $.ajax({
                url: frm.attr(),
                data: frm.serialize(),
                success: {},
                dataType: json
            });
        }
    });

});

function updateCountdown() {
    // 200 is the max message length
    var remaining = 200 - jQuery('#slide_content').val().length;
    jQuery('.countdown').text(remaining + ' characters remaining');
}

jQuery(document).ready(function($) {
    updateCountdown();
    $('#slide_content').change(updateCountdown);
    $('#slide_content').keyup(updateCountdown);
});

$(function(){
    $('textarea').keypress(function(e) {
        if (e.keyCode == 13 && !e.shiftKey) {
            e.preventDefault();
            var frm = this.form.submit();
            $.ajax({
                url: frm.attr(),
                data: frm.serialize(),
                success: {},
                dataType: json
            });
        }
    });

});

function updateCountdown() {
    // 200 is the max message length
    var remaining = 200 - jQuery('#slide_content').val().length;
    jQuery('.countdown').text(remaining + ' characters remaining');
}

jQuery(document).ready(function($) {
    updateCountdown();
    $('#slide_content').change(updateCountdown);
    $('#slide_content').keyup(updateCountdown);
});

function validateFiles(inputFile) {
  var maxExceededMessage = "This file exceeds the maximum allowed file size (5 MB)";
  var extErrorMessage = "Only image file with extension: .jpg, .jpeg, .gif or .png is allowed";
  var allowedExtension = ["jpg", "jpeg", "gif", "png"];
 
  var extName;
  var maxFileSize = $(inputFile).data('max-file-size');
  var sizeExceeded = false;
  var extError = false;
 
  $.each(inputFile.files, function() {
    if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};
    extName = this.name.split('.').pop();
    if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
  });
  if (sizeExceeded) {
    window.alert(maxExceededMessage);
    $(inputFile).val('');
  };
 
  if (extError) {
    window.alert(extErrorMessage);
    $(inputFile).val('');
  };
}


// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require car_theme/js/bootstrap
//= require car_theme/js/interface
//= require car_theme/js/bootstrap-slider
//= require car_theme/js/slick.min
//= require car_theme/js/owl.carousel
//= require lightbox
//= require_tree .

hide_all_info = function() {
  $(".drivers-job-info").hide();
  $(".bus-assistant-job-info").hide();
  $(".dispatchers-job-info").hide();
  $(".mechanics-job-info").hide();
  $("#driver-job-info").removeClass('active_job');
  $("#bus-assist-job-info").removeClass('active_job');
  $("#dispatcher-job-info").removeClass('active_job');
  $("#mechanic-job-info").removeClass('active_job');
}
default_job = function(){
  $(".drivers-job-info").hide();
  $(".bus-assistant-job-info").hide();
  $(".dispatchers-job-info").hide();
  $(".mechanics-job-info").hide();
  $("#driver-job-info").removeClass('active_job');
  $("#bus-assist-job-info").removeClass('active_job');
  $("#dispatcher-job-info").removeClass('active_job');
  $("#mechanic-job-info").removeClass('active_job');

  $(".drivers-job-info").show();
  $("#driver-job-info").addClass('active_job');
} 

$(document).ready(function(){
    default_job();
    $("input.datepicker").datepicker({});
    //make tabs in quote-request page persist in url
    if (location.hash !== '') $('a[href="' + location.hash + '"]').tab('show');
      return $('a[data-toggle="tab"]').on('shown', function(e) {
      return location.hash = $(e.target).attr('href').substr(1);
    });
  }
);

$("#driver-job-info").on('click', function(e) {
  e.preventDefault()  ;
  hide_all_info();
  $(".drivers-job-info").show();
  $("#driver-job-info").addClass('active_job');
});
  
$("#bus-assist-job-info").on('click', function(e) {
  e.preventDefault()  ;
  hide_all_info();
  $(".bus-assistant-job-info").show();
  $("#bus-assist-job-info").addClass('active_job');
});
$("#dispatcher-job-info").on('click', function(e) {
  e.preventDefault()  ;
  hide_all_info();
  $(".dispatchers-job-info").show();
  $("#dispatcher-job-info").addClass('active_job');
});
$("#mechanic-job-info").on('click', function(e) {
  e.preventDefault()  ;
  hide_all_info();
  $(".mechanics-job-info").show();
  $("#mechanic-job-info").addClass('active_job');
});

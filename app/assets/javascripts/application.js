// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
$(".btn-pref .btn").click(function () {
    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    // $(".tab").addClass("active"); // instead of this do the below 
    $(this).removeClass("btn-default").addClass("btn-primary");   
});
// if($('#invisable_div').length){
//   $('body').css('padding-top', '0cm');
//   console.log('hello')
// }
// else 
// 	$('body').css('padding-top', '0.85cm');
// console.log('bye')
});

$(document).on("ready page:restore",function(){
	if($('#invisable_div').length){
  $('body').css('padding-top', '0cm');
	}
else {
	$('body').css('padding-top', '0.85cm');
	}
});


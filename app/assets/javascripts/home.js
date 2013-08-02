// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function(){
	$(".sign_up").click(function(){
		$(this).addClass("active");
		$(".log_in").removeClass("active");
	});

	$(".log_in").click(function(){
		$(this).addClass("active");
		$(".sign_up").removeClass("active");
	});

	
});
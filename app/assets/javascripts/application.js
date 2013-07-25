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
//= require jquery_ujs
//= require foundation
//= require_tree .


// fading nav bar
// function fadey() {
// 		//fade settings
// 		var fadeSpeed = 200, fadeTo = 0.5, topDistance = 30;
// 		var topbarME = function() { $('#uberbar').fadeTo(fadeSpeed,1); }, topbarML = function() { $('#uberbar').fadeTo(fadeSpeed,fadeTo); };
// 		var inside = false;
// 		//stuff that happens
// 		$(window).scroll(function() {
// 			position = $(window).scrollTop();
// 			if(position > topDistance && !inside) {
// 				//add events
// 				topbarML();
// 				$('#uberbar').bind('mouseenter',topbarME);
// 				$('#uberbar').bind('mouseleave',topbarML);
// 				inside = true;
// 			}
// 			else if (position < topDistance){
// 				topbarME();
// 				$('#uberbar').unbind('mouseenter',topbarME);
// 				$('#uberbar').unbind('mouseleave',topbarML);
// 				inside = false;
// 			}
// 		});
// }

// //repositioning main content relative to nav
// function reposition() {
// 	var cajun = $('#uberbar').height();
// 	$('#main').css("padding-top", cajun+30 + "px");
// 	$('#uberbar').css("position", "fixed");
// }

//doc ready & function calls
$(function(){ 
	$(document).foundation();
	// fadey();
	// reposition();
});

$(window).load(function(){
  $('#masonryContainer').masonry({  
    itemSelector: '.masonry-brick',
    columnWidth: 240
  });  
});    
              
         



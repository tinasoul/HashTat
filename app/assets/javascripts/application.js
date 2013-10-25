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
//= require masonry.pkgd.min
//= require best_in_place
//= require_tree .
//= require best_in_place.purr
//= require jquery.cookie.js

//doc ready & function calls
$(window).load(function(){
$('#masonryContainer').masonry({  
    itemSelector: '.masonry-brick',
    columnWidth: 400
  });
});

$(function(){ 
	$(document).foundation();

  //$(".best_in_place").best_in_place();


  $('#myModal').foundation('reveal', 'open');
  $('#myModal').foundation('reveal', 'close');



  $('.hover-bar').hide();
  $('.masonry-brick').hover(function(){
    $(this).find('.hover-bar').toggle();
  });

  // $(".hover-bar").on("ajax:success", (e, data, status, xhr) ->
  //   $(".hover-bar").append xhr.responseText
  // ).bind "ajax:error", (e, xhr, status, error) ->
  //   $("#new_post").append "<p>ERROR</p>"
  $('textarea[data-limit]').each(function() {
  var $this=$(this), limit = $this.data('limit');
  $this.attr('placeholder', 'limit '+limit+' words');
  $this.keypress(function(){
     var wordcount = $this.val().split(/\b[\s,\.-:;]*/).length;
     if (wordcount > limit) {
      return false;
     }
  });
});
});    
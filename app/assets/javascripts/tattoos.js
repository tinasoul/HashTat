$(function(){
	$('.closeModal').click(function(){
    $('#myModal').foundation('reveal', 'close');
  });


$(window).resize(function(){
   console.log('resize called');
   var width = $(window).width();
   if(width >= 960 && width <= 1200){
       $('#myModal').removeClass('large').addClass('medium');
   }
   else if (width < 960 && width > 500){
       $('#myModal').removeClass('small').addClass('large');
   }
   else {
   	$('#myModal').removeClass('medium').addClass('small');
   }
})
$(document).resize();
});
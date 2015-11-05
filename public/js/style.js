	$(function(){
		$(".thumb").on('click',function(){
			var source = this.src;
			$("#main-image").attr("src",source);
			$("#main-image").parent().children().last().attr("src",source);
		});

		$(".category_img").on("mouseover", function(){
			$(this).css({"border":"1px solid","border-color":"#027cd5"});
			$(this).parent().children(".panel-cat").css({"color":"#fff","background-color":"#027cd5"});
		});
		$(".category_img").on("mouseleave", function(){
			$(this).css({"border":"none"});
			$(this).parent().children(".panel-cat").css({"color":"#333333","background-color":"#f2f2f2", "border-color":"#d8d8d8"});
		});

		$(".panel-cat").on("mouseover",function(){
			$(this).parent().children(".category_img").css({"border":"1px solid","border-color":"#027cd5"});
			$(this).css({"color":"#fff","background-color":"#027cd5"});
		});
		
		$(".panel-cat").on("mouseleave",function(){
			$(this).parent().children(".category_img").css({"border":"none"});
			$(this).css({"color":"#333333","background-color":"#f2f2f2", "border-color":"#d8d8d8"});
		});
		//$(".wan-carousel").WanCarousel();
		 $(".off-canvas-submenu").hide();
		 $(".off-canvas-submenu-call").click(function() {
		 	var icon = $(this).parent().next(".off-canvas-submenu").is(':visible') ? '+' : '-';
			$(this).parent().next(".off-canvas-submenu").slideToggle('fast');
			$(this).find("span").text(icon);
		  });


		// $(".thumb").click(function(){
		// 	var source = this.src;
		// 	$("#main-image").attr("src",source);
		// 	$(".MYCLASS").attr("href",source);
		// });

	// $('main-image').zoomIn({
 //    'description': true, // default: false
 //    'message': 'My message', // default: null
 //    'zoom': 4.3, // default: 2, you can change zoom by mouse scroll, also note that zoom: 1 is img orginal size(visible on document, for more info check zoom section)
 //    'zoomMax': 6.66, // default: 10
 //    'zoomMin': -4, // default: 1.5, negative values will make element downside up ( ͡° ͜ʖ ͡°)
 //    'step': 0.01 // default: 0.5, simply change zoom value by step
 //  });

	
// 	$('.piclist li').on('click',function(event){
//   var $pic = $(this).find('img');
//   $('.picZoomer-pic').attr('src',$pic.attr('src'));
// });


  $(".answer").hide();
  $(".fa-chevron-down").hide();
  $(".fa-chevron-right").click(function(){
  	$(".answer").hide();
  	$(".fa-chevron-down").hide();
  	$(".fa-chevron-right").show();
    $(this).parent().parent().children().last().slideDown("slow");
    $(this).hide();
    $(this).parent().children(".fa-chevron-down").show();
});
  $(".fa-chevron-down").click(function(){
    $(".answer").slideUp("slow");
    $(".fa-chevron-down").hide();
    $(".fa-chevron-right").show();
});



	});

 	 var jq = jQuery.noConflict();
		jq('#ex1').zoom({duration: 120,
touch: true,onZoomIn: false,
magnify: 1
 });
// 	// jq('.picZoomer').picZoomer();
// 	jq('.zoom').zoomIn({
// // change zoom value by step
// 'step': 0.5,

// // default zoom depth
// 'zoom': 2,

// // maximum zoom depth
// 'zoomMax': 10,

// // minimum zoom depth
// 'zoomMin': 1.5,

// 'rate': 80,

// // callback function
// 'callback': null
//   });


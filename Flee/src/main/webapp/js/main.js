$(document).ready(function(){
	var window_w = $(window).width();
	$(window).resize(function(){
		window_w = $(window).width();
	});
	
	/* 동영상 제어 */	
	
	$(".movie a").on("click", function(){
		if(window_w>640){//pc모드 일 경우
			$(".movie .movie_pop").show();
			$("body").css({overflow : "hidden"}).bind('touchmove', function(e){e.preventDefault()});
			return false;//링크값 없애기(이후 행동 정지)
		}
	});
	
	$(".movie .movie_pop .inner button").on("click", function(){
		$(".movie .movie_pop").hide();
		$("body").css({overflow : "auto"}).unbind('touchmove');
	});
	
	
});
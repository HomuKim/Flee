$(document).ready(function(){
	var scrolling = $(window).scrollTop();
	var window_w = $(window).width();
	//로딩되자마자
	scroll_lnb();
	resize_mobile();
	
	$(window).scroll(function(){//스크롤될때마다
		scrolling = $(window).scrollTop();
		scroll_lnb();
		//console.log(scrolling);
	});
	
	$(window).resize(function(){//브라우저 사이즈가 변경될때마다
		window_w = $(window).width();
		scroll_lnb();
		resize_mobile();
	});
	
	/* 
		페이지가 일정값이상 스크롤되면 lnb에 scroll이라는 클래스 추가
		얼마나 스크롤되면?? 
		pc였을때
		lnb에 준 top값(447px) - scroll클래스가 들어간 lnb의 top값 (76px) = 371
		모바일이었을때
		207px - 50px = 157
	*/
	var lnb_top;
	function scroll_lnb(){
		if(window_w > 640){//pc모드
			lnb_top = 371;
		}else{
			lnb_top = 157;
		}
		if(scrolling >= lnb_top){
			$(".lnb").addClass("scroll");
		}else{
			$(".lnb").removeClass("scroll");
		}
	}
	
	
	/* lnb 열기/닫기 
		<div class="lnb">
			<div class="depth1">      --- $(this).parent()
				<button></button>     --- this
				<ul>                  --- $(this).next()
					<li></li>
				</ul>
			</div>
		</div>
		lnb button이라고 부른 이유 
		- 모바일에서만 작동하는 기능이라 모바일에서만 존재하는 요소를 선택
		- depth1과 depth2 작동이 동일함 
	*/
	var button_tit;
	var lnb_open;
	$(".lnb button").on("click", function(){
		lnb_open = $(this).parent().hasClass("on");
		//console.log(lnb_open);
		if(lnb_open == true){
			$(this).parent().removeClass("on");
			$(this).next().slideUp();
			button_tit = $(this).attr("title");
			//console.log(button_tit);
			if(button_tit == "1차메뉴 닫기"){
				$(this).attr("title", "1차메뉴 열기");
			}else{
				$(this).attr("title", "2차메뉴 열기");
			}
		}else{
			$(this).parent().addClass("on");
			$(this).next().slideDown();
			button_tit = $(this).attr("title");
			//console.log(button_tit);
			if(button_tit == "1차메뉴 열기"){
				$(this).attr("title", "1차메뉴 닫기");
			}else{
				$(this).attr("title", "2차메뉴 닫기");
			}
		}
		
	});
	
	/* 모바일에서 메뉴닫기로 사라진 .lnb .depth2 ul을 pc에서 보이게... 
		jquery로 show/hide로 처리한거는 jquery 제어해야함..
		-- pc의 기본상태 display:block
		-- mobile에서 기본상태 display:none
		
		mobile에서 pc로 전환됐을때
		-- depth1, depth2에 있는 on을 전부 삭제......
	*/
	var pc_mobile;
	if(window_w>640){
		pc_mobile = "pc";
	}else{
		pc_mobile = "mobile";
	}
	
	function resize_mobile(){
		if(window_w>640){
			if(pc_mobile == "mobile"){//pc로 전환된 순간				
				$(".lnb .depth2 ul").css("display","block");
				$(".lnb .depth1").removeClass("on");
				$(".lnb .depth2").removeClass("on");
				pc_mobile = "pc";
			}
		}else{
			if(pc_mobile == "pc"){//mobile로 전환된 순간
				$(".lnb .depth2 ul").css("display","none");
				pc_mobile = "mobile";
			}
		}
	}
	
});






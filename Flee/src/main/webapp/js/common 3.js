$(document).ready(function(){

	var mobile_menu;
	$("header .h_sub2 .gnb_mobile .menu_sub>ul>li>a").on("click", function(){
		mobile_menu = $(this).parent().hasClass("on");
		if(mobile_menu == true){//열린 상태라면
			$(this).parent().removeClass("on");
			$(this).next().slideUp();
		}else{//닫힌 상태라면
			$("header .h_sub2 .gnb_mobile .menu_sub>ul>li").removeClass("on");
			$("header .h_sub2 .gnb_mobile .menu_sub>ul>li>ul").slideUp();
			$(this).parent().addClass("on");
			//$(this).parent().find("ul").slideDown();
			$(this).next().slideDown();
		}//if
	});
	
	/* 메뉴가 fixed라 메뉴가 브라우저보다 길 경우에 메뉴가 짤려보임. 그래서 메뉴만 스크롤되게 하기 위한 jquery */
	
	var window_h = $(window).height();
	var window_w = $(window).width();
	var menu_top_h = 51;
	var menu_sub = $("header .h_sub2 .gnb_mobile .menu_sub");
	menu_sub.height(window_h - menu_top_h);
	
	$(window).resize(function(){
		window_h = $(window).height();
		window_w = $(window).width();
		menu_sub.height(window_h - menu_top_h);
		resize_mobile();
	});
	
	/* 모바일 메뉴 열기/닫기 
		header .h_sub2 .gnb_mobile .gnb_open을 클릭하면
		
		header .h_top .login
		header .h_sub2 .gnb_mobile .menu_top 
		header .h_sub2 .gnb_mobile .menu_sub
		header .h_sub2 .gnb_mobile .gnb_close
		header .h_sub2 .gnb_mobile .gnb_kbg
		header .h_sub2 .gnb_mobile .gnb_wbg		
	*/
	
	$("header .h_sub2 .gnb_mobile .gnb_open").on("click", function(){
		$("header .h_top .login").show();
		$("header .h_sub2 .gnb_mobile .menu_top").show();
		$("header .h_sub2 .gnb_mobile .menu_sub").show();
		$("header .h_sub2 .gnb_mobile .gnb_close").show();
		$("header .h_sub2 .gnb_mobile .gnb_kbg").show();
		$("header .h_sub2 .gnb_mobile .gnb_wbg").show();
		//스크롤 금지
		$("body").css({overflow : "hidden"}).bind('touchmove', function(e){e.preventDefault()});
	});
	$("header .h_sub2 .gnb_mobile .gnb_close").on("click", function(){
		$("header .h_top .login").hide();
		$("header .h_sub2 .gnb_mobile .menu_top").hide();
		$("header .h_sub2 .gnb_mobile .menu_sub").hide();
		$("header .h_sub2 .gnb_mobile .gnb_close").hide();
		$("header .h_sub2 .gnb_mobile .gnb_kbg").hide();
		$("header .h_sub2 .gnb_mobile .gnb_wbg").hide();
		//스크롤 해제
		$("body").css({overflow : "auto"}).unbind('touchmove');
	});
	
	/*
		header .h_top .login - pc와 mobile 동시에 나타남.
		모바일에서 메뉴로 show hide됨..
		---> 모바일에서 jquery로 hide 처리되어 있어서 
		     pc에 가면 나타나지 않음..
			 ==> jquery로 pc로 변경되면 나타나게 처리해야함..
			 
		pc면 - login은 show()
		모바일이면 - login은 hide(), 무조건 메뉴는 닫힘...
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
				$("header .h_top .login").show();
				$("header .h_sub2 .gnb_mobile .menu_top").hide();
				$("header .h_sub2 .gnb_mobile .menu_sub").hide();
				$("header .h_sub2 .gnb_mobile .gnb_close").hide();
				$("header .h_sub2 .gnb_mobile .gnb_kbg").hide();
				$("header .h_sub2 .gnb_mobile .gnb_wbg").hide();
				//스크롤 해제
				$("body").css({overflow : "auto"}).unbind('touchmove');
				pc_mobile = "pc";
				console.log(pc_mobile);
			}
		}else{
			if(pc_mobile == "pc"){//mobile로 전환된 순간
				$("header .h_top .login").hide();
				pc_mobile = "mobile";
				console.log(pc_mobile);
			}
		}
	}
	
	/* footer 전화번호 링크 pc에서 없애기 */
	$("footer .tel a").on("click", function(){
		if(window_w > 640){//pc모드에서는
			return false;
		}
	});

});





<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/product.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/modal.css'/>" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src=<c:url value='/js/jquery-1.12.4.min.js'/>></script>

<script src=<c:url value='/js/accuse.js'/>></script>
<script src=<c:url value='/js/jjim.js'/>></script>
<script src=<c:url value='/js/pslide.js'/>></script>

<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<script>
$(document).ready(function(){
	
	const vibration = (target) => {
		  target.addClass("vibration");

		  setTimeout(function() {
		    target.removeClass("vibration");
		  }, 400);
		};
		let jidx = '${info.jidx}';
		if(jidx!=''){
			$("#J_IDX").val(jidx);	
		}
	$(".pjjim").on("click", "span" , function(){
		if('${sessionScope.NICKNAME}'==''){
			location.href='<c:url value="/loginForm.fe"/>';
			return;
		}
		if($(this).attr("class")=="on"){
			let jjim = {
					J_IDX:$("#J_IDX").val(),
					P_ID:'${proMap.P_ID}'
			};
			jjimService.remove(jjim, function(result){
				if(result==='success'){
				let pjjimcount = $("#pjjimcount").html();
				$("#pjjimcount").html(parseInt(pjjimcount)-1);
			}
			});
			$(this).attr("class", "off");
			$(this).find("i").attr("class","fa-regular fa-heart");
		}else{
			let jjim = {
					J_NICKNAME:'${sessionScope.NICKNAME}',
					P_ID:'${proMap.P_ID}'
			};
			jjimService.add(jjim,function(result){
				$("#J_IDX").val(result);
				let pjjimcount = $("#pjjimcount").html();
				$("#pjjimcount").html(parseInt(pjjimcount)+1);
			});
			$(this).attr("class", "on");
			$(this).find("i").attr("class","fa-solid fa-heart");
			vibration($(this).find("i"));
			}
	});

});
</script>
<script type="text/javascript"></script>
<body>
	<section id="product">
		<div class="wrap2">
			<div class="p_nav">
				<div class="pptitle">
					<h2>${proMap.P_TITLE}</h2>
				</div>
				<div class="pjjim">
					<c:if test="${sessionScope.NICKNAME != proMap.P_NICKNAME}">
					마음에 들어요 !
						<c:choose>
							<c:when test="${info.jjim}">
								<span class="on"><i class="fa-solid fa-heart var"></i></span>
							</c:when>
							<c:otherwise>
								<span class="off"><i class="fa-regular fa-heart"></i></span>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="J_IDX" id="J_IDX" />
					</c:if>
				</div>
				<c:choose>
					<c:when test="${proMap.P_SELLBUY eq '1'}">
						<c:set var="sellbuy" value="해드리오" />
					</c:when>
					<c:otherwise>
						<c:set var="sellbuy" value="해주시오" />
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${proMap.P_ITEM eq '1'}">
						<c:set var="sitem" value="상품" />
					</c:when>
					<c:otherwise>
						<c:set var="sitem" value="서비스" />
					</c:otherwise>
				</c:choose>
				<c:if test="${proMap.P_CATEGORY eq '1' }">
					<c:set target="${proMap}" property="P_CATEGORY" value="패션" />
				</c:if>
				<c:if test="${proMap.P_CATEGORY eq '2' }">
					<c:set target="${proMap}" property="P_CATEGORY" value="뷰티" />
				</c:if>
				<c:if test="${proMap.P_CATEGORY eq '3' }">
					<c:set target="${proMap}" property="P_CATEGORY" value="전자기기" />
				</c:if>
				<c:if test="${proMap.P_CATEGORY eq '4' }">
					<c:set target="${proMap}" property="P_CATEGORY" value="그림" />
				</c:if>
				<c:if test="${proMap.P_CATEGORY eq '5' }">
					<c:set target="${proMap}" property="P_CATEGORY" value="운동" />
				</c:if>
				<c:if test="${proMap.P_CATEGORY eq '6' }">
					<c:set target="${proMap}" property="P_CATEGORY" value="공부" />
				</c:if>
				<c:if test="${proMap.P_CATEGORY eq '7' }">
					<c:set target="${proMap}" property="P_CATEGORY" value="영화" />
				</c:if>
				<c:if test="${proMap.P_CATEGORY eq '8' }">
					<c:set target="${proMap}" property="P_CATEGORY" value="동물" />
				</c:if>

				<p>${sellbuy}&nbsp;&nbsp;>&nbsp;${proMap.P_AREA}&nbsp;&nbsp;>&nbsp;${sitem}&nbsp;&nbsp;>&nbsp;${proMap.P_CATEGORY}</p>
				<div class="ppcount">
					<ul>
						<li>작성일 &nbsp ${proMap.P_DATE}</li>
						<li><span id="pjjimcount">${proMap.PJJIM_COUNT}</span>명이
							좋아해요!</li>
						<li>조회수&nbsp${proMap.P_COUNT}</li>
					</ul>
				</div>
			</div>
			<!-- 이미지 슬라이드 -->
			<div class="pd_top">
				<div class="ptop_side">
					<section class="pvisual">
						<div class="popup2">
							<ul>
								<li>
									<div class="pwrap">
										<div class="inner">
											<img src="img/${proMap.P_IMAGE}"
												onerror="this.src='images/common/noimage.jpg'">
										</div>
									</div>
								</li>
								<c:if test="${fn:length(info.iList) > 0}">
									<c:forEach var="row" items="${info.iList}" varStatus="status">
										<c:if test="${row.S_FILE_NAME != proMap.P_IMAGE}">
											<li>
												<div class="pwrap">
													<div class="inner">
														<img src="img/${row.S_FILE_NAME}"
															onerror="this.src='images/common/noimage.jpg'">
													</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</c:if>
							</ul>
							<div class="btn_group">
								<!--popup_paging-->
								<div class="paging">
									<c:if test="${fn:length(info.iList) > 1}">
										<c:forEach var="i" begin="1" end="${fn:length(info.iList)}">
											<button>${i}번팝업</button>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
					</section>
				</div>

				<!-- 오른쪽 프로필카드 -->
				<div class="ptop_rside">
					<div class="m_card">
						<a
							href="/Flee/myProfile.fe?EMAIL=${proMap.EMAIL}&M_NICKNAME=${proMap.P_NICKNAME}"><img
							class="p_img" src="img/image-${proMap.M_IMAGE}.jpg" alt="프로필이미지"
							onerror="this.src='images/contents/profile_image.webp'"></a>
						<div class="card1">
							<ul>
								<li><h3 class="p_name">
										<a class="a1"
											href="/Flee/myProfile.fe?EMAIL=${proMap.EMAIL}&M_NICKNAME=${proMap.P_NICKNAME}">${proMap.P_NICKNAME}님</a>
									</h3> <span><c:choose>
											<c:when test="${proMap.RANK eq 'S'}">
												<c:set var="rank" value="플리새내기<i class='fa-solid fa-seedling grade1'></i>" />
											</c:when>
											<c:when test="${proMap.RANK eq 'M'}">
												<c:set var="rank" value="플리매니저<i class='fa-solid fa-glasses grade2'></i>" />
											</c:when>
											<c:otherwise>
												<c:set var="rank" value="플리장인<i class='fa-solid fa-crown grade3'></i>"/>
											</c:otherwise>
										</c:choose>${rank}</span></li>
								<li><c:if test="${not empty sessionScope.NICKNAME}">
										<c:if test="${sessionScope.NICKNAME != proMap.P_NICKNAME}">
											<button id="btn-modal">신고하기 ></button>
										</c:if>
									</c:if></li>
							</ul>

						</div>
						<div id="modal" class="modal-overlay">
							<div class="modal-window" id="popupPrdCompare"
								data-popup-layer="popupPrdCompare">
								<div class="modalcon">
									<div class="title">
										<h3>신고하기</h3>
										<div class="close-area" data-focus-next="popupPrdCompare">X</div>
										<p>해당 사항을 선택해주세요</p>

									</div>

									<div class="content">
										<input type="hidden" name="ACU_NICKNAME" id="ACU_NICKNAME">
										<input type="hidden" name="A_CONTENT" id="A_CONTENT">
										<input type="hidden" name="A_NICKNAME" id="A_NICKNAME">
										<ul>
											<li class="off" value="1"><a href="javascript:void(0);">1.
													욕설 , 비방</a></li>
											<li class="off" value="2"><a href="javascript:void(0);">2.
													사기</a></li>
											<li class="off" value="3"><a href="javascript:void(0);">3.
													허위사실기재</a></li>
										</ul>
										<p>신고내용 확인 후 빠르게 처리해드리겠습니다.</p>
									</div>

									<button id="modalRegisterBtn" class="modalbtn" type="submit">신고하기</button>
								</div>
							</div>



						</div>
						<div class="card2">

							<div class="shortbox">
								<p class="short">${proMap.ABOUTME }</p>
							</div>
						</div>

					</div>
					<div class="card3">
						<div class="ppay">
							<ul>
								<li>가격</li>
								<li><strong>${proMap.P_PRICE}</strong></li>
							</ul>
						</div>
						<div class="pbtn">
							<c:choose>
								<c:when test="${proMap.P_NICKNAME eq sessionScope.NICKNAME}">
									<a class="ppbtn" href="#this" name="getChat">채팅내역</a>
									<a class="probtn" href="#this" name="mytrade">거래내역</a>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${info.chat}">
											<a class="ppbtn" href="#this" name="getChat">채팅하기</a>
										</c:when>
										<c:otherwise>
											<a class="ppbtn" href="#this" name="chat">채팅하기</a>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${info.trade}">
											<a class="probtn" href="#this" name="notrade">거래취소</a>
										</c:when>
										<c:otherwise>
											<a class="probtn" href="#this" name="trade">거래하기</a>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>

					</div>
				</div>
			</div>
			<div class="pd_btm">
				<div class="pdb_list">
					<h3>상품 상세 설명</h3>
					<c:if test="${sessionScope.NICKNAME eq proMap.P_NICKNAME}">
						<a class="pupbtn"
							href="/Flee/productUpdateForm.fe?P_ID=${proMap.P_ID}&M_NICKNAME=${proMap.P_NICKNAME}">수정/삭제하기</a>
					</c:if>
				</div>
				<div class="pb_content">
					<%-- 					<c:forEach var="row" items="${info.iList}" varStatus="status"> --%>
					<%-- 						<c:if test="${row.S_FILE_NAME != proMap.P_IMAGE}"> --%>
					<!-- 							<p style="text-align: center;"> -->
					<%-- 								<input type="hidden" id="I_IDX" value="${row.I_IDX}"> <img --%>
					<%-- 									src="img/${row.S_FILE_NAME}" width="80%" --%>
					<!-- 									onerror="this.src='images/common/noimage.jpg'"> -->
					<!-- 							</p> -->
					<%-- 						</c:if> --%>
					<%-- 					</c:forEach> --%>

					<div class="pcon_text">${proMap.P_CONTENT}</div>
				</div>
				<div class="bt_wrap">
					<button class="plistbtn" type="button"
						onClick="javascript:location.href='<c:url value='/productList.fe?P_SELLBUY=${proMap.P_SELLBUY}&P_ITEM=${proMap.P_ITEM}&P_AREA=${proMap.P_AREA}'/>'">목록</button>
				</div>

			</div>
		</div>
	</section>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			
		

			let nickname = '${sessionScope.NICKNAME}';

			$("a[name='trade']").on("click", function(e) { //거래하기 버튼
				e.preventDefault();
				if(nickname!=''){
					fn_tradeList();
					alert("거래요청 되었습니다!");
					return;
				}
				location.href='<c:url value="/loginForm.fe"/>';
			});
			
			$("a[name='mytrade']").on("click", function(e) { //내가 작성한 글 거래하기 버튼
				e.preventDefault();
				if(nickname!=''){
					fn_mytradeList();
					return;
				}
				location.href='<c:url value="/loginForm.fe"/>';
			});
			
			$("a[name='notrade']").on("click", function(e) { //거래취소 버튼
				e.preventDefault();
			let result = confirm("거래 취소 하시겠습니까? 확인을 누르시면 거래내역 창으로 이동합니다");
			if(result){
				fn_deleteTrade();
			}					
			});

			$("a[name='chat']").on("click", function(e) { //채팅방 생성 버튼
				e.preventDefault();
				if(nickname!=''){
					fn_createChat();
					return;
				}
				location.href='<c:url value="/loginForm.fe"/>';
			});

			$("a[name='getChat']").on("click", function(e) { //기존 채팅불러오기 버튼
				e.preventDefault();
				if(nickname!=''){
					fn_getChat();
					return;
				}
				location.href='<c:url value="/loginForm.fe"/>';
			});
		});

		/* 거래중 */
		function fn_tradeList() {
			var P_SELLBUY = '${proMap.P_SELLBUY}';
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/tradeWrite.fe'/>");
			comSubmit.addParam("TP_ID", "${proMap.P_ID}");
			comSubmit.addParam("TB_NICKNAME", "${sessionScope.NICKNAME}");
			comSubmit.addParam("TS_NICKNAME", "${proMap.P_NICKNAME}");
			comSubmit.addParam("TP_TITLE", "${proMap.P_TITLE}");
			comSubmit.addParam("TP_PRICE", "${proMap.P_PRICE}");
			comSubmit.addParam("TB_STATUS", "1");
			comSubmit.addParam("TS_STATUS", "0");
			comSubmit.addParam("M_NICKNAME", "${sessionScope.NICKNAME}");

			comSubmit.submit();
		}
		
		function fn_mytradeList() {

			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myTrade.fe'/>");
			comSubmit.addParam("M_NICKNAME", "${sessionScope.NICKNAME}");
			comSubmit.submit();

		}
		
		function fn_deleteTrade() {

			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/tradeDelete.fe'/>");
			comSubmit.addParam("T_IDX", "${info.tidx}");
			comSubmit.addParam("M_NICKNAME", "${sessionScope.NICKNAME}");
			comSubmit.addParam("TP_ID", "${proMap.P_ID}");
			comSubmit.submit();

		}

		function fn_createChat() {

			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/createChat.fe'/>");
			comSubmit.addParam("SEND_NICKNAME", "${sessionScope.NICKNAME}");
			comSubmit.addParam("RECV_NICKNAME", "${proMap.P_NICKNAME}");
			comSubmit.addParam("MES_CONTENT", "http://localhost:8000/Flee/productDetail.fe?P_ID=${proMap.P_ID}&M_NICKNAME=");
			comSubmit.addParam("CP_ID", "${proMap.P_ID}");
			comSubmit.submit();

		}

		function fn_getChat() {

			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/chatList.fe'/>");
			comSubmit.addParam("M_NICKNAME", "${sessionScope.NICKNAME}");
			comSubmit.submit();

		}
	</script>
	<script>
		
	$(document).ready(function() {
		var $modalContainer = $('#modal');
		let modalInputContent = $modalContainer.find("input[name='A_CONTENT']");
		let modalInputNickname = $modalContainer.find("input[name='ACU_NICKNAME']");
		let modalInputANickname = $modalContainer.find("input[name='A_NICKNAME']");
		let modalRegisterBtn = $("#modalRegisterBtn");



		$("#btn-modal").on('click', function() {
			modalInputNickname.val('${sessionScope.NICKNAME}');
			modalInputANickname.val('${proMap.M_NICKNAME}');
			$modalContainer.removeAttr('class').addClass('modalon');

		});

		$(".content").on("click", "ul li", function() {
			console.log($(this).attr("value"));
			modalInputContent.val($(this).attr("value"));
		});
		
		$("#modalRegisterBtn").on("click", function() {
			let accuse = {
				ACU_NICKNAME : modalInputNickname.val(),
				A_CONTENT : modalInputContent.val(),
				A_NICKNAME : modalInputANickname.val()

			};
			accuseService.add(accuse, function(result) {
				alert("신고가 접수 되었습니다!");
				$modalContainer.addClass('out');
			});
		});
		$(".close-area").on('click', function() {
			$modalContainer.addClass('out');
		});
	});

	</script>
	<script>
   $(document).ready(function(){
      var clickli =$('.content ul li');
      
          clickli.click(function(){
         $(this).removeClass('off');
         $(this).addClass('on');

         clickli.not($(this)).removeClass('on');
         clickli.not($(this)).addClass('off');
         
   });
   });
   </script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>
</html>
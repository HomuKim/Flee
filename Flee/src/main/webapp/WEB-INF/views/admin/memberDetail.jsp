<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('.mtbtn').menuBar();

						let rpage = '${param.rpage}';
						let cpage = '${param.cpage}';
						let qpage = '${param.qpage}';

						if (rpage != '') {
							$(".mtreview").trigger("click");
						}
						if (cpage != '') {
							$(".mtcommu").trigger("click");
						}
						if (qpage != '') {
							$(".mtqna").trigger("click");
						}
						$("a[name=delme]")
								.on(
										"click",
										function() {
											if (confirm("회원 정보를 삭제 하시겠습니까?")) {
												$(this)
														.attr("href",
																"/Flee/memberDelete.fe?EMAIL=${map.EMAIL}");
											}
										});

					});
</script>

<title>내가 쓴 글</title>
</head>
<body>
	<div class="sub_visual2">
		<div class="wrap">
			<strong>회원 정보</strong>
			<p>자세한 회원 정보</p>
		</div>
	</div>
	<div class="adminbody">
		<div class="wrap">
			<div class="lnb">
				<div class="wrap">
					<div class="depth2 menu_depth">
						<ul class="clearfix navbtn">
							<li class="onon" style="width: 14.2%"><a
								href=<c:url value='/memberList.fe' />>회원리스트</a></li>
							<li style="width: 14.2%"><a
								href=<c:url value='/adminAList.fe' />>회원신고리스트</a></li>
							<li style="width: 14.2%"><a
								href=<c:url value='/adminTradeList.fe' />>거래내역리스트</a></li>
							<li style="width: 14.2%"><a
								href=<c:url value='/adminProductList.fe' />>상품리스트</a></li>
							<li style="width: 14.2%"><a
								href=<c:url value='/adminCommunityList.fe' />>자유게시판관리</a></li>
							<li style="width: 14.2%"><a
								href=<c:url value='/adminNoticeList.fe' />>공지게시판관리</a></li>
							<li style="width: 14.2%"><a
								href=<c:url value='/adminReview.fe' />>후기리스트관리</a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="double">
				<div class="wrap">
					<div class="aboutm">
						<h3 style="margin-bottom: 40px">${map.M_NICKNAME }의회원정보</h3>

						<div class="memberbox">
							<div class="memberimg">
								<img class="p_img" src="img/image-${map.M_IMAGE}.jpg"
									alt="프로필이미지"
									onerror="this.src='images/contents/profile_image.webp'">
							</div>
							<div class="memberlist">
								<ul class="memberbox2">
									<li class="mbigtext">
										<ul>
											<li><span>회원등급</span>
												<p>
													<c:choose>
														<c:when test="${map.RANK eq 'S'}">
															<c:set var="rank" value="플리새내기 <i class='fa-solid fa-seedling grade1'></i>" />
														</c:when>
														<c:when test="${map.RANK eq 'M'}">
															<c:set var="rank" value="플리매니저<i class='fa-solid fa-glasses grade2'></i>" />
														</c:when>
														<c:otherwise>
															<c:set var="rank" value="플리장인<i class='fa-solid fa-crown grade3'></i>" />
														</c:otherwise>
													</c:choose>${rank}</p></li>
											<li><span>정지유무</span>
												<p>${map.BLOCK}</p></li>
											<li><span>회원가입일</span>
												<p>${map.M_DATE}</p></li>
										</ul>
									</li>
									<li class="msmalltext">
										<ul class="memberbox3">
											<li>
												<ul class="flaft">
													<li class="strong">이메일</li>
													<li>${map.EMAIL}</li>
												</ul>
											</li>
											<li>
												<ul class="flaft">
													<li class="strong">닉네임</li>
													<li>${map.M_NICKNAME}</li>
												</ul>
											</li>
											<li>
												<ul class="flaft">
													<li class="strong">주민번호</li>
													<li>${map.JUMIN1}-${map.JUMIN2}</li>
												</ul>
											</li>
											<li>
												<ul class="flaft">
													<li class="strong">우편번호</li>
													<li>${map.POSTCODE}</li>
												</ul>
											</li>
											<li>
												<ul class="flaft">
													<li class="strong">주소</li>
													<li>${map.ADDRESS1}</li>
												</ul>
											</li>
											<li>
												<ul class="flaft">
													<li class="strong">상세주소</li>
													<li>${map.ADDRESS2}</li>
												</ul>
											</li>
											<li class="memup"><button name="btn-modal"
													style="color: #656565; font-weight: 300;">수정</button>/ <a
												href="#this" name="delme">삭제</a> <input type="hidden"
												id="EMAIL" value="${map.EMAIL }"> <input
												type="hidden" id="M_NICKNAME" value="${map.M_NICKNAME}"></li>
											<li class="goprofile"><a
												href="/Flee/myProfile.fe?EMAIL=${map.EMAIL}&M_NICKNAME=${map.M_NICKNAME}">프로필
													보러가기 ></a></li>

										</ul>
									</li>
								</ul>
							</div>
						</div>
						<div class="mytext">
							<ul>
								<li><h5>간단 자기소개</h5>
									<div class="textbox">${map.ABOUTME}</div></li>
								<li><h5>긴 글 자기소개</h5>
									<div class="textbox2">${map.L_ABOUTME}</div></li>
							</ul>

						</div>

					</div>
					<div id="modal3" class="modal-overlay">
						<div class="modal-window" id="popupPrdCompare"
							data-popup-layer="popupPrdCompare" style="text-align: center;">
							<div class="title">

								<div class="close-area" data-focus-next="popupPrdCompare">X</div>

								<div>
									<h3>회원 정지유무 수정</h3>

								</div>
							</div>

							<div class="content" style="text-align: center;">
								<input type="hidden" name="M_NICKNAME" id="M_NICKNAME">
								<p style="float: none;">
									<strong>${map.M_NICKNAME}님의 계정을</strong>
								</p>
								<select name="selectBlock">
									<option value="Y">정지시킵니다.</option>
									<option value="N">활성화합니다.</option>
								</select>

							</div>
							<button id="blockRegisterBtn" class="modalbtn" type="submit">변경</button>
						</div>
					</div>


					<div class="membert">
						<!-- 					<div class="textline"> -->
						<%-- 						<h3>${map.M_NICKNAME }이쓴글</h3> --%>

						<!-- 					</div> -->
						<div class="mypagetext">
							<ul class="mtbtn mtnav">
								<li class="mtli mtreview onon">후기</li>
								<li class="mtli mtcommu">커뮤니티</li>
								<li class="mtli mtqna">QNA</li>
							</ul>

							<div class="mypage_textbox mttab mtbtn">
								<div class="mtview mtreview">
									<h3>후기 리스트</h3>
									<table class="board_list1">
										<colgroup>
											<col width="*%" />
											<col width="20%" />
											<col width="15%" />
											<col width="8%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">내용</th>
												<th scope="col">작성일</th>
												<th scope="col">별점</th>
												<th scope="col">삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${myReview}">
												<tr>
													<td>${item.R_CONTENT}</td>
													<td>${item.R_DATE}</td>
													<td>${item.R_GRADE}</td>
													<td>삭제</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div id="pagingr" class="pagingr">${rPaging.pageHtml}</div>
								</div>
								<div class="mtcommu mtview" style="display: none;">
									<h3>커뮤니티</h3>
									<table class="board_list2">
										<colgroup>
											<col width="*" />
											<col width="30%" />


										</colgroup>
										<thead>
											<tr>
												<th scope="col">제목</th>
												<th scope="col">작성일</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${myCommunity}">
												<tr>
													<td style="text-align: left; padding-left: 40px;"><a
														href='<c:url value="/communityDetail.fe?C_IDX=${item.C_IDX}"/>'>${item.C_TITLE}</a></td>
													<td>${item.C_DATE}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div id="pagingc">${cPaging.pageHtml}</div>
								</div>
								<div class="mtqna mtview" style="display: none;">
									<h3>QNA</h3>
									<table class="board_list3">
										<colgroup>
											<col width="*%" />
											<col width="20%" />
											<col width="8%" />

										</colgroup>
										<thead>
											<tr>
												<th scope="col">제목</th>
												<th scope="col">작성일</th>
												<th scope="col">답변</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${myQna}">
												<tr>
													<td><a
														href='<c:url value="/noticeDetail.fe?N_IDX=${item.N_IDX}"/>'>${item.N_TITLE}</a></td>
													<td>${item.N_DATE}</td>
													<c:choose>
														<c:when test="${item.COUNT eq '0' }">
															<td>x</td>
														</c:when>
														<c:otherwise>
															<td>o</td>
														</c:otherwise>
													</c:choose>

												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div id="pagingq">${qPaging.pageHtml}</div>
								</div>
								<div class="mtqna mprodut" style="display: none;">
									<h3>QNA</h3>
									<table class="board_list4">
										<colgroup>
											<col width="*%" />
											<col width="20%" />
											<col width="8%" />

										</colgroup>
										<thead>
											<tr>
												<th scope="col">제목</th>
												<th scope="col">작성일</th>
												<th scope="col">답변</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${myQna}">
												<tr>
													<td><a
														href='<c:url value="/noticeDetail.fe?N_IDX=${item.N_IDX}"/>'>${item.N_TITLE}</a></td>
													<td>${item.N_DATE}</td>
													<c:choose>
														<c:when test="${item.COUNT eq '0' }">
															<td>x</td>
														</c:when>
														<c:otherwise>
															<td>o</td>
														</c:otherwise>
													</c:choose>

												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div id="pagingq">${qPaging.pageHtml}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<c:url value='/js/adminnav.js'/>"></script>
<script src="<c:url value='/js/side.js'/>"></script>
<script src="<c:url value='/js/rank.js'/>"></script>
<script>
	$(document).ready(function() {
		
		/* 모달 관련 변수 선언 */
		let modal = $("#modal3");
		
		$(document).on("click", "button[name='btn-modal']", function () {
			modalOn();		
		});

 		let blockRegisterBtn = $("#blockRegisterBtn");

		/*모달확정*/
 		blockRegisterBtn.on("click", function(e) {
			var block = {
					M_NICKNAME : $("#M_NICKNAME").val(),
					BLOCK : $('select[name=selectBlock]').val()
			};
			
			rankService.blockUpdate(block, function(result) {
				alert("정지유무가 변경되었습니다.");
				
			});
			modalOff();
			location.reload();
		}); 

		 
	});
</script>
<script>
	
	const modal = document.getElementById("modal3")

	function modalOn() {
	    modal.style.display = "flex"
	}
	function isModalOn() {
	    return modal.style.display === "flex"
	}
	function modalOff() {
	    modal.style.display = "none"
	}
	
	const closeBtn = modal.querySelector(".close-area")
	closeBtn.addEventListener("click", e => {
	    modalOff()
	});
	modal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("modal-overlay")) {
	        modalOff()
	    }
	});
	window.addEventListener("keyup", e => {
	    if(isModalOn() && e.key === "Escape") {
	        modalOff()
	    }
	});
	const testScrPop = $('modal-window');
   testScrPop.scroll(function(){
   const $this = $(this);
});
</script>
</html>
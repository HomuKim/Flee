<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/side.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/modal.css'/>" />

<meta charset="UTF-8">
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('.mtbtn').menuBar();

	});
</script>

<title>내 거래내역</title>
</head>
<body>
	<div class="sub_visual ">
		<div class="wrap">
			<strong>마이페이지</strong>
			<p>My Page</p>
		</div>
	</div>
	<div class="double">
		<div class="wrap">

			<div class="sidenav">
				<ul>
					<li><a
						href='/Flee/myProfile.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}&EMAIL=${sessionScope.EMAIL}"/>'>프로필
					</a></li>
					<li><a
						href='/Flee/myInfoUpdateForm.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>&EMAIL=${sessionScope.EMAIL}'>회원정보
							수정 </a></li>
					<li class="on"><a
						href='/Flee/myTrade.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>거래내역</a></li>
					<li><a
						href='/Flee/chatList.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>채팅내역</a></li>
					<li><a
						href='/Flee/jjimList.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>찜목록</a></li>
					<li><a
						href='/Flee/myText.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>내가
							쓴 글</a></li>
					<li><a name="delete" href="#this">회원탈퇴</a></li>
				</ul>
			</div>
			<div class="sidecontent">
				<div class="textline">
					<h3>거래내역리스트</h3>
				</div>
				<div class="mypagetext">
					<ul class="mtbtn mtnav">
						<li class="mtli mtreview active">거래중</li>
						<li class="mtli mtcommu">거래완료</li>

					</ul>

					<div class="mypage_textbox mttab mtbtn">
						<div class="mtview mtreview">
							<h3>거래중</h3>
							<table class="board_list1">
								<colgroup>
									<col width="13%" />
									<col width="*%" />
									<col width="19%" />
									<col width="12%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">분류</th>
										<th scope="col">게시글명</th>
										<th scope="col">거래신청일</th>
										<th scope="col">거래상태</th>
									</tr>
								</thead>
								<tbody class="trading">

									<c:forEach var="item" items="${trading}">
										<c:if test="${M_NICKNAME eq item.TB_NICKNAME }">
											<tr>
												<td>수락을</br>기다려요
												</td>
												<td><a
													href="/Flee/productDetail.fe?P_ID=${item.TP_ID}&M_NICKNAME=${sessionScope.NICKNAME}">${item.TP_TITLE}</a></td>
												<td>${item.T_DATE}</td>
												<td><button class="ntbtn">거래취소</button> <input
													type="hidden" name="T_IDX" id="T_IDX" value="${item.T_IDX}" />
													<input type="hidden" name="TP_ID" id="TP_ID"
													value="${item.TP_ID}" /></td>
											</tr>
										</c:if>

										<c:if test="${M_NICKNAME eq item.TS_NICKNAME }">
											<tr>
												<td>거래</br>하시겠어요?
												</td>
												<td><a
													href="/Flee/productDetail.fe?P_ID=${item.TP_ID}&M_NICKNAME=${sessionScope.NICKNAME}">${item.TP_TITLE}</a></td>
												<td>${item.T_DATE}</td>
												<td><button class="ytbtn">거래수락</button> <input
													type="hidden" name="T_IDX" id="T_IDX" value="${item.T_IDX}" /></td>
											</tr>
										</c:if>

									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="mtcommu mtview" id="tctable" style="display: none;">
							<h3>거래 완료</h3>
							<table class="board_list1">
								<colgroup>
									<col width="*%" />
									<col width="20%" />
									<col width="15%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">제목</th>
										<th scope="col">거래날짜</th>
										<th scope="col">후기</th>
									</tr>
								</thead>
								<tbody class="completeList">
									<c:forEach var="item2" items="${completed}">
										<tr>
											<td><a
												href="/Flee/productDetail.fe?P_ID=${item2.TP_ID}&M_NICKNAME=${sessionScope.NICKNAME}">${item2.TP_TITLE}</a></td>
											<td>${item2.T_DATE}</td>
											<td><c:if test="${item2.review}">
													<button class="btn" class="btn-modal">후기작성</button>
													<c:if test="${item2.TS_NICKNAME eq sessionScope.NICKNAME}">
														<input type="hidden" name="rnickname"
															value="${item2.TB_NICKNAME}">
													</c:if>
													<c:if test="${item2.TB_NICKNAME eq sessionScope.NICKNAME}">
														<input type="hidden" name="rnickname"
															value="${item2.TS_NICKNAME}">
													</c:if>
												</c:if> <c:if test="${!item2.review}">
													<a
														href=<c:url value='/myText.fe?M_NICKNAME=${sessionScope.NICKNAME}' />>
														완료</a>
												</c:if> <input type="hidden" name="tpid" value="${item2.TP_ID}" /></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</div>


			</div>
			<div id="modal" class="modal-overlay">
				<div class="modal-window" id="popupPrdCompare"
					data-popup-layer="popupPrdCompare">
					<div class="modalcon">
						<div class="title">
							<div class="close-area" data-focus-next="popupPrdCompare">X</div>

							<div class="rvwho">
								<h3>후기작성</h3>
								<p>무분별한 비방 허위사실 기재시 삭제 될 수 있습니다</p>
								<span class="renick"></span>님에게 쓰는 후기에요!
							</div>
						</div>

						<div class="content">
							<input type="hidden" name="R_NICKNAME" id="R_NICKNAME"> <input
								type="hidden" name="RE_NICKNAME" id="RE_NICKNAME"
								value="${sessionScope.NICKNAME}"> <input type="hidden"
								name="RP_ID" id="RP_ID">
							<textarea class="reviewtext" name="R_CONTENT" id="R_CONTENT"
								maxlength="200"></textarea>
							<div class="stardr">
								<p>나의 별점은?</p>
								<span class="star"> ★★★★★ <span id="sstar"
									style="width:;">★★★★★</span> <input type="range"
									oninput="drawStar(this)" id="drawStar" name="R_GRADE" value="1"
									step="0" min="1" max="5">
								</span>
							</div>
						</div>
						<button id="reviewRegisterBtn" class="modalbtn" type="submit">리뷰작성
						</button>
					</div>

				</div>




			</div>

		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>
<script>
	$(document).ready(function() {
		
		
		let check = '${param.check}';
		if (check) {
			$(".mtcommu").trigger("click");
		}

		$(".trading").on("click", "tr td button", function() {
			if ($(this).attr("class") === 'ntbtn') {
				let tidx = $(this).closest("td").find("input[id=T_IDX]").val();
				let tpid = $(this).closest("td").find("input[id=TP_ID]").val();
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/tradeDelete.fe'/>");
				comSubmit.addParam("T_IDX", tidx);
				comSubmit.addParam("M_NICKNAME", "${sessionScope.NICKNAME}");
				comSubmit.addParam("TP_ID", tpid);
				comSubmit.submit();
			} else {
				let tidx = $(this).closest("td").find("input[id=T_IDX]").val();
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/tradeUpdate.fe'/>");
				comSubmit.addParam("T_IDX", tidx);
				comSubmit.addParam("M_NICKNAME", "${sessionScope.NICKNAME}");
				comSubmit.submit();
			}
		});
	});
</script>
<script>
const drawStar = (target) => {

	  $('#sstar').css( 'width',$("#drawStar").val() * 20 + '%');
 
}
	
	</script>
<script>
		
	$(document).ready(function() {
		let $modalContainer = $('#modal');
		let modalInputRContent = $modalContainer
				.find("textarea[name='R_CONTENT']");
		let modalInputRNickname = $modalContainer
				.find("input[name='R_NICKNAME']");
		let modalInputRENickname = $modalContainer
		.find("input[name='RE_NICKNAME']");
		let modalInputRPID = $modalContainer
		.find("input[name='RP_ID']");
		let modalInputR_GRADE = $modalContainer
		.find("input[name='R_GRADE']");
		
		
		$(".completeList").on("click","tr td button",function(){
			$(".renick").html($(this).closest("td").find("input[name=rnickname]").val());
			modalInputRNickname.val($(this).closest("td").find("input[name=rnickname]").val());
			modalInputRPID.val($(this).closest("td").find("input[name=tpid]").val());
			$modalContainer.removeAttr('class').addClass('modalon');
			
		});

		let reviewRegisterBtn = $("#reviewRegisterBtn");

		
		
		/*모달확정*/
		reviewRegisterBtn.on("click", function(e) {

			var review = {
					R_CONTENT : modalInputRContent.val(),
					R_NICKNAME : modalInputRNickname.val(),
					RE_NICKNAME : modalInputRENickname.val(),
					R_GRADE :modalInputR_GRADE.val(),
					RP_ID : modalInputRPID.val()

			};
			reviewService.add(review, function(result) {

				$modalContainer.find("input").val("");
				$modalContainer.addClass('out');
				window.location.href = "/Flee/myTrade.fe?M_NICKNAME=${sessionScope.NICKNAME}&check=true";
		
			});
			
		});
		$(".close-area").on('click', function() {
			$modalContainer.addClass('out');
		});
	});
	
	</script>
<script>
	$("a[name=delete]").click(
			function() {
				let check = confirm("탈퇴 하시겠습니까?");
				if (check) {
					$(this).attr("href",
							"/Flee/myInfoDelete.fe?EMAIL=${myInfo.EMAIL}");
				}
			});
</script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/review.js'/>"></script>

<script src="<c:url value='/js/side.js'/>"></script>
</html>

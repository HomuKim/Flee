<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<head>
<script src=<c:url value='/js/jquery-1.12.4.min.js'/>></script>
<script src=<c:url value='/js/common.js'/>></script>
<script src=<c:url value='/js/accuse.js'/>></script>
<script src="js/common.js"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/profile.css'/>" />
		
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/modal.css'/>" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="sub_visual bg_business">
		<div class="wrap">
			<strong>마이프로필</strong>
			<p>나를 소개해요.</p>
		</div>
	</div>
	<section id="profile">
		<div class="wrap clearfix">
			<div class="m_card">
				<img class="p_img" src="img/image-${myInfo.M_IMAGE}.jpg"
					alt="프로필이미지"
					onerror="this.src='images/contents/profile_image.webp'">
				<div class="card1">
					<h3 class="p_name">${myInfo.M_NICKNAME}님</h3>
					<!-- 닉네임 -->
					<span><c:choose>
							<c:when test="${myInfo.RANK eq 'S'}">
								<c:set var="rank" value="플리새내기<i class='fa-solid fa-seedling grade1'></i>" />
							</c:when>
							<c:when test="${myInfo.RANK eq 'M'}">
								<c:set var="rank" value="플리매니저<i class='fa-solid fa-glasses grade2'></i>" />
							</c:when>
							<c:otherwise>
								<c:set var="rank" value="플리장인<i class='fa-solid fa-crown grade3'></i>" />
							</c:otherwise>
						</c:choose>${rank}</span>
					<c:choose>
						<c:when test="${sessionScope.NICKNAME eq myInfo.M_NICKNAME}">

							<a
								href='/Flee/myProfileUpdateForm.fe?EMAIL=<c:out value="${myInfo.EMAIL}"/>&M_NICKNAME=<c:out value="${myCat.CAT_NICKNAME}"/>'
								name="updateForm">프로필 수정하기 ></a>

						</c:when>
						<c:when test="${not empty sessionScope.NICKNAME}">
							<button id="btn-modal">신고하기 ></button>
						</c:when>
					</c:choose>
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
								<input type="hidden" name="A_CONTENT" id="A_CONTENT"> <input
									type="hidden" name="A_NICKNAME" id="A_NICKNAME">
								<ul>
									<li value="1" class="off"><a href="javascript:void(0);">1.
											욕설 , 비방</a></li>
									<li value="2" class="off"><a href="javascript:void(0);">2.
											사기</a></li>
									<li value="3" class="off"><a href="javascript:void(0);">3.
											허위사실기재</a></li>
								</ul>
								<p>신고내용 확인 후 빠르게 처리해드리겠습니다.</p>
							</div>

							<button id="modalRegisterBtn" class="modalbtn" type="submit">신고하기
								></button>
						</div>
					</div>
				</div>
				<div class="card2">
					<h4>간단자기소개</h4>
					<div class="shortbox">
						<p class="short">${myInfo.ABOUTME }</p>
					</div>
					<a href="/Flee/myProductList.fe?M_NICKNAME=${myInfo.M_NICKNAME}">글
						보러가기 ></a>
				</div>
			</div>
			<div class="m_long">
				<div class="mytext">
					<h2>상세소개</h2>

					<p class="myh">${myInfo.L_ABOUTME }</p>
				</div>
				<div class="myt">
					<ul>
						<li><h3>${myInfo.M_NICKNAME }</h3></li>
						<li>님의 관심사는?</li>

					</ul>

					<div>
						<h4></h4>
						<c:if test="${myCat.FASHION eq '1' }">
							<span class="cspan"> 패션</span>
						</c:if>
						<c:if test="${myCat.BEAUTY eq '1' }">
							<span class="cspan"> 뷰티</span>
						</c:if>
						<c:if test="${myCat.ELECTRONIC eq '1' }">
							<span class="cspan"> 전자기기</span>
						</c:if>
						<c:if test="${myCat.DRAWING eq '1' }">
							<span class="cspan"> 미술</span>
						</c:if>
						<c:if test="${myCat.WORKOUT eq '1' }">
							<span class="cspan"> 운동</span>
						</c:if>
						<c:if test="${myCat.STUDY eq '1' }">
							<span class="cspan"> 공부</span>
						</c:if>
						<c:if test="${myCat.FILM eq '1' }">
							<span class="cspan"> 영화</span>
						</c:if>
						<c:if test="${myCat.ANIMAL eq '1' }">
							<span class="cspan"> 반려동물</span>
						</c:if>

					</div>
				</div>
			</div>

			<div class="m_review">
				<div class="m_aboutr">
					<ul>
						<li><h3>${myInfo.M_NICKNAME }</h3></li>
						<li>님의 리뷰온도는</li>
						<li><h3 style="color: #d49c04;">★${myReview.AVG}</h3></li>
						<li>입니다.</li>
					</ul>

				</div>
				<ul class="m_reviewpro">
					<c:choose>
						<c:when test="${fn:length(myReview.list) > 0}">
							<c:forEach items="${myReview.list}" var="item">
								<li class="rlist">
									<div class="rlistone">
										<a
											href='<c:url value="/myProfile.fe?EMAIL=${item.EMAIL}&M_NICKNAME=${item.RE_NICKNAME}"/>'>
											<img class="r_img" src="img/image-${item.M_IMAGE}.jpg"
											alt="프로필"
											onerror="this.src='images/contents/profile_image.webp'">
										</a>
									</div>
									<div class="rlisttwo">
										<h3>
											<a
												href='<c:url value="/myProfile.fe?EMAIL=${item.EMAIL}&M_NICKNAME=${item.RE_NICKNAME}"/>'>${item.RE_NICKNAME}
											</a>님
										</h3>
										<span class="rgrade"> <c:if test="${item.R_GRADE > 0}">
												<c:forEach var="i" begin="1" end="${item.R_GRADE}">
										★
										</c:forEach>
												<c:forEach var="i" begin="1" end="${5-item.R_GRADE}">
										☆
										</c:forEach>
											</c:if><label id="#R_GRADEW"></label></span>
										<p class="rcon">${item.R_CONTENT}</p>
										<strong class="rdate">${item.R_DATE}</strong>
									</div>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div style="text-align: center; padding-top: 100px;">등록된
								리뷰가 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</section>



	<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
	<script type="text/javascript">
		function fn_updateForm() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myProfileUpdateForm.fe' />");
			comSubmit.addParam("EMAIL", "${myInfo.EMAIL}");
			comSubmit.addParam("CAT_NICKNAME", "${myCat.CAT_NICKNAME}");
			comSubmit.submit();
		}
	</script>
	<script>
		$(document)
				.ready(
						function() {
							var $modalContainer = $('#modal');
							let modalInputContent = $modalContainer
									.find("input[name='A_CONTENT']");
							let modalInputNickname = $modalContainer
									.find("input[name='ACU_NICKNAME']");
							let modalInputANickname = $modalContainer
									.find("input[name='A_NICKNAME']");
							let modalRegisterBtn = $("#modalRegisterBtn");

							$("#btn-modal")
									.on(
											'click',
											function() {
												modalInputNickname
														.val('${sessionScope.NICKNAME}');
												modalInputANickname
														.val('${myInfo.M_NICKNAME}');
												$modalContainer.removeAttr(
														'class').addClass(
														'modalon');

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
		$(document).ready(function() {
			var clickli = $('.content ul li');
			clickli.click(function() {
				$(this).removeClass('off');
				$(this).addClass('on');
				clickli.not($(this)).removeClass('on');
				clickli.not($(this)).addClass('off');
			});
		})
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
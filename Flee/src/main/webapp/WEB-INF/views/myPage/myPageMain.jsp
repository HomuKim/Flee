<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>마이 페이지 메인</title>

<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/profile.css'/>" />
		
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="sub_visual bg_business">
		<div class="wrap">
			<strong>마이페이지</strong>
			<p>My Page</p>
		</div>
	</div>
	<section id="mypage">
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
							</c:otherwise></c:choose>${rank}</span> <a
						href='/Flee/myProfileUpdateForm.fe?EMAIL=<c:out value="${myInfo.EMAIL}"/>&M_NICKNAME=<c:out value="${myInfo.M_NICKNAME}"/>'>프로필
						수정하기 ></a>
				</div>
				<div class="card2">
					<h4>간단자기소개</h4>
					<div class="shortbox">
						<p class="short">${myInfo.ABOUTME }</p>
					</div>
					<a
						href='/Flee/myProfile.fe?EMAIL=<c:out value="${myInfo.EMAIL}"/>&M_NICKNAME=<c:out value="${myInfo.M_NICKNAME}"/>'>프로필
						자세히 보기 ></a>
				</div>
			</div>
			<div class="mypagenave">
				<div class="mytext">
					<ul class="ulcenter">
						<li><a
							href='/Flee/myInfoUpdateForm.fe?M_NICKNAME=<c:out value="${myInfo.M_NICKNAME}"/>&EMAIL=${myInfo.EMAIL}'>회원정보
								수정 </a></li>
						<li><a
							href='/Flee/myTrade.fe?M_NICKNAME=<c:out value="${myInfo.M_NICKNAME}"/>'>거래내역</a></li>
						<li><a
							href='/Flee/chatList.fe?M_NICKNAME=<c:out value="${myInfo.M_NICKNAME}"/>'>채팅내역</a></li>
						<li><a
							href='/Flee/jjimList.fe?M_NICKNAME=<c:out value="${myInfo.M_NICKNAME}"/>'>찜목록</a></li>
						<li><a
							href='/Flee/myText.fe?M_NICKNAME=<c:out value="${myInfo.M_NICKNAME}"/>'>내가
								쓴 글</a></li>
						<li><a name="delete" href="#this">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
<%@ include file="/WEB-INF/include/include-footer.jspf"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$("a[name=delete]").click(function() {
			let check = confirm("탈퇴 하시겠습니까?");
			if (check) {
				$(this).attr("href","/Flee/myInfoDelete.fe?EMAIL=${myInfo.EMAIL}");
			}
		});
	</script>
</body>
</html>
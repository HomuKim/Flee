<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<title>관리자 페이지 메인</title>


<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/profile.css'/>" />

<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="sub_visual bg_business">
		<div class="wrap">
			<strong>관리자 페이지</strong>
			<p>Admin Page</p>
		</div>
	</div>
	<section id="mypage" style="margin-top:60px;">
		<%-- 		<div class="wrap clearfix">
			<div class="m_card">
				<img class="p_img" src="img/image-${myInfo.M_IMAGE}.jpg"
					alt="프로필이미지"
					onerror="this.src='images/contents/profile_image.webp'">
				<div class="card1">
					<h3 class="p_name">${myInfo.M_NICKNAME}님</h3>
					<!-- 닉네임 -->
					<span>${myInfo.RANK}등급</span> <a
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
			</div> --%>
		<div class="mypagenave" style="height:600px;">
			<div class="mytext">
				<ul class="ulcenter">
					<li><a href='<c:url value="/memberList.fe"/>'>회원리스트 </a></li>
					<li><a href='<c:url value="/adminAList.fe"/>'>회원신고리스트</a></li>
					<li><a href='<c:url value="/adminTradeList.fe"/>'>거래내역 리스트</a></li>
					<li><a href='<c:url value="/adminProductList.fe"/>'>상품 리스트</a></li>
			
					<li><a href='<c:url value="/adminCommunityList.fe"/>'>자유게시판
							관리</a></li>
					<li><a href='<c:url value="/adminNoticeList.fe"/>'>공지/QNA관리</a></li>
							<li><a href=<c:url value='/adminReview.fe' />>후기리스트관리</a></li>
				</ul>
			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
			<script src="<c:url value='/js/common 2.js'/>"></script>
	</section>
	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>
</html>
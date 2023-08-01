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
		
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('.mtbtn').menuBar();

	});
</script>

<title>찜 한 목록</title>
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
					<li><a
						href='/Flee/myTrade.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>거래내역</a></li>
					<li><a
						href='/Flee/chatList.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>채팅내역</a></li>
					<li class="on"><a
						href='/Flee/jjimList.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>찜목록</a></li>
					<li><a
						href='/Flee/myText.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>내가
							쓴 글</a></li>
					<li><a name="delete" href="#this">회원탈퇴</a></li>
				</ul>
			</div>
			<div class="sidecontent">
				<div class="textline">
					<h3>나의 찜 리스트</h3>
					<p>내가 찜한 게시글을 확인해봐요.</p>
				</div>
				<div class="jjimlist">
					<ul class="clearfix utext">
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list}" var="item">
									<li class="jjimli"><a
										href="/Flee/productDetail.fe?P_ID=${item.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}"><img
											src="img/${item.P_IMAGE}" alt=""
											onerror="this.src='images/common/noimage.jpg'" /></a>
										<div class="setting" style="text-align: left;">
											<h3>
												<a
													href="/Flee/productDetail.fe?P_ID=${item.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}"
													name="P_TITLE">${item.P_TITLE}</a>
											</h3>
											<p>${item.P_NICKNAME}</p>
											<span>${item.P_CATEGORY}</span><strong>${item.P_PRICE}</strong>
											<p>${item.P_DATE}</p>
											<div class="jimheart">
												<span class="on"><i class="fa-solid fa-heart"></i></span> <input
													type="hidden" name="J_IDX" id="J_IDX" value="${item.J_IDX}" />
												<input type="hidden" name="P_ID" id="P_ID"
													value="${item.P_ID}" />
											</div>

										</div></li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">조회된 결과가 없습니다.</td>
								</tr>

							</c:otherwise>
						</c:choose>
					</ul>
					<div class="paging" id="paging">${paging.pageHtml}</div>
				</div>


			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>
<script>
	$(document).ready(
			function() {
				$(".clearfix").on(
						"click",
						"li .jimheart span",
						function() {
							let jim = $(this);
							if ($(this).attr("class") == "on") {
								let jjim = {
									J_IDX : $(this).closest("div").find(
											"input[name=J_IDX]").val(),
									P_ID : $(this).closest("div").find(
											"input[name=P_ID]").val()
								};
								jjimService.remove(jjim, function(result) {
									jim.closest("div")
											.find("input[name=J_IDX]").val("");
								});
								$(this).attr("class", "off");
								$(this).find("i").attr("class",
										"fa-regular fa-heart");
							} else {
								let jjim = {
									J_NICKNAME : '${sessionScope.NICKNAME}',
									P_ID : $(this).closest("div").find(
											"input[name=P_ID]").val()
								};
								jjimService.add(jjim, function(result) {
									jim.closest("div")
											.find("input[name=J_IDX]").val(
													result);
								});
								$(this).attr("class", "on");
								$(this).find("i").attr("class",
										"fa-solid fa-heart");
							}
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
<script src=<c:url value='/js/jjim.js'/>></script>
<script src="<c:url value='/js/side.js'/>"></script>
</html>



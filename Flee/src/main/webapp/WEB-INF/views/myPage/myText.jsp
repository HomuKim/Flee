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

<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
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
	});
</script>

<title>내가 쓴 글</title>
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
					<li><a
						href='/Flee/jjimList.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>찜목록</a></li>
					<li class="on"><a
						href='/Flee/myText.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>내가
							쓴 글</a></li>
					<li><a name="delete" href="#this">회원탈퇴</a></li>
				</ul>
			</div>
			<div class="sidecontent">
				<div class="textline">
					<h3>내가 쓴 글</h3>
					<p>내가 쓴 글을 확인해봐요.</p>
				</div>
				<div class="mypagetext">
					<ul class="mtbtn mtnav">
						<li class="mtli mtreview onon">후기</li>
						<li class="mtli mtcommu">커뮤니티</li>
						<li class="mtli mtqna">QNA</li>
					</ul>

					<div class="mypage_textbox mttab mtbtn">
						<div class="mtview mtreview">
							<h3>후기 리스트</h3>
							<table class="board_list1" style="">
								<colgroup>
									<col width="12%" />
									<col width="45%" />
									<col width="20%" />
									<col width="15%" />
									<col width="8%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">거래한 사람</th>
										<th scope="col">내용</th>
										<th scope="col">작성일</th>
										<th scope="col">별점</th>
										<th scope="col">삭제</th>
									</tr>
								</thead>
								<tbody id="rtable">
									<c:forEach var="item" items="${myReview}">
										<tr>
											<td>${item.R_NICKNAME}</td>
											<td>${item.R_CONTENT}</td>
											<td>${item.R_DATE}</td>
											<td>${item.R_GRADE}</td>
											<td><button id="rdelete">삭제</button> <input
												type="hidden" name="R_IDX" value="${item.R_IDX}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div id="pagingr">${rPaging.pageHtml}</div>
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
											<td style="text-align:left;"><a
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

<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="<c:url value='/js/side.js'/>"></script>
<script>
	$("a[name=delete]").click(
			function() {
				let check = confirm("탈퇴 하시겠습니까?");
				if (check) {
					$(this).attr("href",
							"/Flee/myInfoDelete.fe?EMAIL=${myInfo.EMAIL}");
				}
			});
	$("#rtable").on("click", "tr td button", function() {
		let ridx = $(this).closest("td").find("input[name=R_IDX]").val();
		console.log(ridx);
		reviewService.remove(ridx, function() {
			alert("삭제되었습니다.");
			location.reload();

		});
	});
</script>
<script type="text/javascript" src="<c:url value='/js/review.js'/>"></script>
</html>
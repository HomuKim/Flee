<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!̆̈DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/side.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin.css'/>" />

<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<title>관리자 신고게시판</title>
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
</head>
<body>
	<div class="sub_visual2">
		<div class="wrap">
			<strong>관리자페이지</strong>
		</div>
	</div>
	<div class="wrap">
		<div class="lnb">
			<div class="wrap">
				<div class="depth2 menu_depth">
					<ul class="clearfix navbtn">
						<li style="width: 14.2%"><a
							href=<c:url value='/memberList.fe' />>회원리스트</a></li>
						<li class="onon" style="width: 14.2%"><a
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
		<div class="comboard">
			<div class="wrap">
				<div class="textline">
					<h3>신고내역 리스트</h3>

				</div>
				<div class="search">
					<form id="searchForm" action="<c:url value='/adminAList.fe' />"
						method="get">
						<select class="searcht" name="type">
							<option value="">--</option>
							<option value="AC" name="type"
								<c:out value="${param.type eq 'AC' ? 'selected' : ''}"/>>전체</option>
							<option value="A" name="type"
								<c:out value="${param.type eq 'A' ? 'selected' : ''}"/>>신고자</option>
							<option value="C" name="type"
								<c:out value="${param.type eq 'C' ? 'selected' : ''}"/>>피신고자</option>
						</select>
						<c:choose>
							<c:when test="${param.keyword eq 'null'}">
								<input class="searchtext" type="text" name="keyword" value="" />
							</c:when>
							<c:otherwise>
								<input type="text" name="keyword" class="searchtext"
									value="<c:out value='${param.keyword}'/>" />
							</c:otherwise>
						</c:choose>
						<button class="sbtn">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>

				<table class="board_list">
					<colgroup>
						<col width="10%" />
						<col width="15%" />
						<col width="10%" />
						<col width="15%" />
						<col width="10%" />
						<col width="20%" />

					</colgroup>
					<thead>
						<tr>
							<th scope="col">식별번호</th>
							<th scope="col">신고자 닉네임</th>
							<th scope="col">신고내용</th>
							<th scope="col">신고날짜</th>
							<th scope="col">신고당한 닉네임</th>
							<th scope="col">신고 처리상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.A_IDX}</td>
								<td>${item.ACU_NICKNAME}</td>
								<td><c:choose>
										<c:when test="${item.A_CONTENT eq '1'}">욕설, 비방</c:when>
										<c:when test="${item.A_CONTENT eq '2'}">사기</c:when>
										<c:otherwise>허위 사실 기재</c:otherwise>
									</c:choose>
								<td>${item.A_DATE}</td>
								<td>${item.A_NICKNAME}</td>
								<td><c:choose>
										<c:when test="${item.A_STATUS eq '1'}">처리 완료</c:when>
										<c:otherwise>
											<a
												href="/Flee/adminAupdate.fe?A_IDX=${item.A_IDX}&page=${param.page}">처리하기</a>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="paging">${paging.pageHtml}</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-footer.jspf"%>

	<script src="<c:url value='/js/adminnav.js'/>"></script>
	<script src="<c:url value='/js/common 2.js'/>"></script>
</body>
</html>




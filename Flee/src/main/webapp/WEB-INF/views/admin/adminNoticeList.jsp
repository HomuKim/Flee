<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!̆̈DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/side.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin.css'/>" />
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>

<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
<title>공지게시판 관리</title>
</head>
<body>
	<div class="sub_visual2">
		<div class="wrap">
			<strong>관리자페이지</strong>
		</div>
	</div>

	<div class="lnb">
		<div class="wrap">
			<div class="depth2 menu_depth">
				<ul class="clearfix navbtn">
					<li style="width: 14.2%"><a
						href=<c:url value='/memberList.fe' />>회원리스트</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminAList.fe' />>회원신고리스트</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminTradeList.fe' />>거래내역리스트</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminProductList.fe' />>상품리스트</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminCommunityList.fe' />>자유게시판관리</a></li>
					<li class="onon" style="width: 14.2%"><a
						href=<c:url value='/adminNoticeList.fe' />>공지게시판관리</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminReview.fe' />>후기리스트관리</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="noticeboard" style="height: 1000px;">
		<div class="wrap">
			<div class="textline">
				<h3>공지 QnA 리스트</h3>
			</div>
			<div class="search">
				<form id="searchForm" action="<c:url value='/adminNoticeList.fe' />"
					method="get">
					<select class="searcht" name="type">
						<option value="">--</option>
						<option value="TWC" name="type"
							<c:out value="${param.type eq 'TWC' ? 'selected' : ''}"/>>전체</option>
						<option value="T" name="type"
							<c:out value="${param.type eq 'T' ? 'selected' : ''}"/>>제목</option>
						<option value="C" name="type"
							<c:out value="${param.type eq 'C' ? 'selected' : ''}"/>>내용</option>
						<option value="W" name="type"
							<c:out value="${param.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
					</select>
					<c:choose>
						<c:when test="${param.keyword eq 'null'}">
							<input class="searchtext" type="text" name="keyword" value="" />
						</c:when>
						<c:otherwise>
							<input class="searchtext" type="text" name="keyword"
								value="<c:out value='${param.keyword}'/>" />
						</c:otherwise>
					</c:choose>
					<button class="sbtn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
			</div>
			<div class="write" style="text-align: right">
				<a class="write" href="<c:url value='/openNoticeWrite.fe' />"
					class="btn" id="write">글쓰기</a>
			</div>
			<!-- 검색처리기능 -->


			<table class="board_list">
				<colgroup>
					<col class="none" width="8%" />
					<col width="10%" />
					<col width="*%" />
					<col width="15%" />
					<col width="8%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr>
						<th class="none" scope="col">글번호</th>
						<th scope="col">분류</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${nlist}">
						<tr>
							<td class="none">${item.N_IDX}</td>
							<td><c:if test="${item.N_TYPE eq 'N'}">
									<c:set var="type" value="공지" />
								</c:if> <c:if test="${item.N_TYPE eq 'Q'}">
									<c:set var="type" value="질문" />
								</c:if>${type}</td>
							<td style="text-align: left; padding: 0 10px;overflow:hidden;white-space: nowrap;"><a
								style="color: #478BE1; font-weight: 700"
								href='<c:url value="/adminNoticeDetail.fe?N_IDX=${item.N_IDX}"/>'>${item.N_TITLE}</a></td>
							<td>${item.N_NICKNAME}</td>
							<td>${item.N_COUNT}</td>
							<td>${item.N_DATE}</td>
						</tr>
					</c:forEach>
					<c:forEach var="item" items="${qlist}">
						<tr>
							<td class="none">${item.N_IDX}</td>
							<td><c:if test="${item.N_TYPE eq 'N'}">
									<c:set var="type" value="공지" />
								</c:if> <c:if test="${item.N_TYPE eq 'Q'}">
									<c:set var="type" value="질문" />
								</c:if>${type}</td>
							<td style="text-align: left; padding: 0 10px;overflow:hidden;white-space: nowrap;"><a
								href='<c:url value="/adminNoticeDetail.fe?N_IDX=${item.N_IDX}"/>'>${item.N_TITLE}</a></td>
							<td>${item.N_NICKNAME}</td>
							<td>${item.N_COUNT}</td>
							<td>${item.N_DATE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="paging">${paging.pageHtml}</div>
	</div>
<%@ include file="/WEB-INF/include/include-footer.jspf"%>

	<script src=<c:url value='/js/adminnav.js'/>></script>
	<script src="<c:url value='/js/common 2.js'/>"></script>
</body>
</html>
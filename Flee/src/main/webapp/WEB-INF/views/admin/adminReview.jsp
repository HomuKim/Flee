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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />
<title>관리자 리뷰게시판</title>

<meta name="viewport" content="width=device-width, initial-scale=0.8" />
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
						<li class="onon" style="width: 14.2%"><a
							href=<c:url value='/adminReview.fe' />>후기리스트관리</a></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="comboard">
		<div class="wrap">
			<div class="textline">
				<h3>후기 리스트</h3>
			</div>
			<div class="search">
				<!-- 검색처리기능 -->
				<form id="searchForm" action="<c:url value='/adminReview.fe' />"
					method="get">
					<select class="searcht" name="type">
						<option value="">--</option>
						<option value="RCN" name="type"
							<c:out value="${param.type eq 'RCN' ? 'selected' : ''}"/>>전체</option>
						<option value="R" name="type"
							<c:out value="${param.type eq 'R' ? 'selected' : ''}"/>>거래당사자</option>
						<option value="C" name="type"
							<c:out value="${param.type eq 'C' ? 'selected' : ''}"/>>후기내용</option>
							<option value="N" name="type"
							<c:out value="${param.type eq 'N' ? 'selected' : ''}"/>>작성자</option>
					</select>
					<c:choose>
						<c:when test="${param.keyword eq 'null'}">
							<input class="searchtext" type="text" name="keyword" value=" " />
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


			<table class="board_list" style="table-layout: fixed">
				<colgroup>
					<col class="none" width="7%" />
					<col width="54%" />
					<col width="8%" />
					<col width="8%" />
					<col width="4%" />
					<col width="14%" />
					<col width="5%" />
				</colgroup>

				<thead>
					<tr>
						<th class="none" scope="col">후기번호</th>
						<th scope="col">후기내용</th>
						<th scope="col">거래대상</th>
						<th scope="col">후기작성자</th>
						<th scope="col">별점</th>
						<th scope="col">작성일</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody id="review">
					<c:forEach var="item" items="${list}">
						<tr>

							<td class="none" >${item.R_IDX}</td>
							<td
								style="overflow: hidden; text-align: left; white-space: nowrap;"><a
								class="num" href="javascript:void(0);" target="_parent">${item.R_CONTENT}</a><input
								type="hidden" name="R_IDX" value="${item.R_IDX}"></td>
							<td><a
								href="/Flee/memberDetail.fe?M_NICKNAME=${item.RE_NICKNAME}">${item.RE_NICKNAME}</a></td>
							<td><a
								href="/Flee/memberDetail.fe?M_NICKNAME=${item.R_NICKNAME}">${item.R_NICKNAME}</a></td>
							<td>${item.R_GRADE}</td>
							<td>${item.R_DATE}</td>
							<td><a href="/Flee/adminDelete.fe?R_IDX=${item.R_IDX}">삭제</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div class="paging">${paging.pageHtml}</div>
		</div>
		<br>

	</div>

	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
	<script type="text/javascript">
		$("#review").on(
				"click",
				"tr td a.num",
				function() {
					var rdix = $(this).closest("td").find("input[name=R_IDX]")
							.val();
					window.open('/Flee/adminRDetail.fe?R_IDX=' + rdix, '리뷰 상세',
							'width=900px,height=400px,scrollbars=no');
				});
	</script>

	<script src="<c:url value='/js/adminnav.js'/>"></script>
</body>

</html>
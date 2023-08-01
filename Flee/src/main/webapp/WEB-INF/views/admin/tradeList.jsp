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
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<title>거래내역 리스트</title>
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
						<li class="onon" style="width: 14.2%"><a
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
		<div class="wrap">

			<!-- 			<div class="sermenu" style="height: 200px;"> -->
			<!-- 				<div class="drop" style="float: right;"> -->
			<!-- 					<ul class="menu"> -->
			<%-- 						<c:choose> --%>
			<%-- 							<c:when test="${param.FILTER eq 'T_IDX'}"> --%>
			<%-- 								<c:set var="filter" value="번호순" /> --%>
			<%-- 							</c:when> --%>
			<%-- 							<c:when test="${param.FILTER eq 'T_DATE'}"> --%>
			<%-- 								<c:set var="filter" value="최신순" /> --%>
			<%-- 							</c:when> --%>
			<%-- 							<c:otherwise> --%>
			<%-- 								<c:set var="filter" value="필터" /> --%>
			<%-- 							</c:otherwise> --%>
			<%-- 						</c:choose> --%>
			<%-- 						<li><a href="#">${filter}</a> --%>
			<!-- 							<ul class="depth_3"> -->
			<!-- 								<li><a href="/Flee/adminTradeList.fe?&FILTER=T_IDX">번호순</a></li> -->
			<!-- 								<li><a href="/Flee/adminTradeList.fe?&FILTER=T_DATE">최신순</a></li> -->
			<!-- 							</ul></li> -->
			<!-- 					</ul> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="comboard">
				<div class="wrap">
					<div class="textline">
						<h3>거래내역 리스트</h3>

					</div>
					<div class="search">
						<form id="searchForm" action="<c:url value='adminTradeList.fe' />"
							method="get">
							<select class="searcht" name="type">
								<option value="">--</option>
								<option value="TSB" name="type"
									<c:out value="${param.type eq 'TSB' ? 'selected' : ''}"/>>전체</option>
								<option value="T" name="type"
									<c:out value="${param.type eq 'T' ? 'selected' : ''}"/>>게시글명</option>
								<option value="S" name="type"
									<c:out value="${param.type eq 'S' ? 'selected' : ''}"/>>게시글작성자</option>
								<option value="B" name="type"
									<c:out value="${param.type eq 'B' ? 'selected' : ''}"/>>거래요청자</option>
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
					<div class="clearfix">
						<table class="board_list">
							<colgroup>
								<col width="10%" />
								<col width="*" />
								<col width="15%" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr>
									<th class="none" scope="col">관리번호</th>
									<th scope="col">구매자</th>
									<th scope="col">판매자</th>
									<th scope="col">날짜</th>
									<th class="none" scope="col">상품번호</th>
									<th scope="col">제목</th>
									<th scope="col">가격</th>
									<th scope="col">거래상태</th>
									<th scope="col">관리</th>
									<th scope="col">채팅로그</th>
								</tr>
							</thead>
							<tbody id="trade">
								<c:forEach var="item" items="${list}">
									<tr>
										<td class="none">${item.T_IDX}</td>
										<td>${item.TB_NICKNAME}</td>
										<td>${item.TS_NICKNAME}</td>
										<td>${item.T_DATE}</td>
										<td class="none">${item.TP_ID}</td>
										<td><a
											href="/Flee/productDetail.fe?P_ID=${item.TP_ID}&M_NICKNAME=${sessionScope.NICKNAME}">${item.TP_TITLE}</a></td>
										<td>${item.TP_PRICE}</td>
										<td><c:choose>
												<c:when test="${item.TS_STATUS eq '0'}">
													<strong>거래중</strong>
												</c:when>
												<c:otherwise>
													<strong>거래완료</strong>
												</c:otherwise>
											</c:choose></td>
										<td><a
											href="/Flee/adminTradeDelete.fe?T_IDX=${item.T_IDX}">삭제</a></td>
										<td><c:choose>
												<c:when test="${empty item.CROOM_IDX}">
                            						  없음
                            				    </c:when>
												<c:otherwise>
													<a class="num" href="javascript:void(0);" target="_parent">보기</a>
													<input type="hidden" name="CROOM_IDX"
														value="${item.CROOM_IDX}">
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="paging">${paging.pageHtml}</div>
			</div>
		</div>
	</div>



	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
	<script type="text/javascript">
		$("#trade").on(
				"click",
				"tr td a.num",
				function() {
					var croomdix = $(this).closest("td").find(
							"input[name=CROOM_IDX]").val();
					window.open('/Flee/adminChatLog.fe?CROOM_IDX=' + croomdix,
							'채팅 로그', 'width=640px,height=650px,scrollbars=no');
				});
	</script>
	<script src="<c:url value='/js/adminnav.js'/>"></script>
</body>
</html>

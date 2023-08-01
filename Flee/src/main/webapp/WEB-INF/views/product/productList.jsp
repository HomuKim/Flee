<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />

<meta charset="UTF-8">

<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

</head>
<body>
	<div class="sub_visual">
		<div class="wrap">
			<c:if test="${param.P_SELLBUY eq '0'}">
				<strong>해주시오!</strong>
				<p>다양한 서비스를 확인해보세요.</p>
			</c:if>
			<c:if test="${param.P_SELLBUY eq '1'}">
				<strong>해드리오!</strong>
				<p>다양한 서비스를 확인해보세요.</p>
			</c:if>
		</div>
	</div>
	<div class="lnb2">
		<div class="wrap">
			<div class="depth2 menu_depth">
				<h3>지역</h3>
				<ul class="clearfix">
					<li <c:if test="${param.P_AREA eq '종로구'}"> class="on"</c:if>
						style="width: 25%"><a
						href="/Flee/productList.fe?P_SELLBUY=${param.P_SELLBUY}&P_AREA=종로구&P_ITEM=1">종로구</a></li>
					<li <c:if test="${param.P_AREA eq '서대문구'}"> class="on"</c:if>
						style="width: 25%"><a
						href="/Flee/productList.fe?P_SELLBUY=${param.P_SELLBUY}&P_AREA=서대문구&P_ITEM=1">서대문구</a></li>
					<li <c:if test="${param.P_AREA eq '강남구'}"> class="on"</c:if>
						style="width: 25%"><a
						href="/Flee/productList.fe?P_SELLBUY=${param.P_SELLBUY}&P_AREA=강남구&P_ITEM=1">강남구</a></li>
					<li <c:if test="${param.P_AREA eq '강서구'}"> class="on"</c:if>
						style="width: 25%"><a
						href="/Flee/productList.fe?P_SELLBUY=${param.P_SELLBUY}&P_AREA=강서구&P_ITEM=1">강서구</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sub_tit" id="contents">
		<div class="wrap">
			<h2>${param.P_AREA}에서구해요!</h2>
			<div class="search">
				<form id="searchForm" action="<c:url value='/productList.fe' />"
					method="get">
					<select class="searcht"name="type">
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
					<button class="btn btn-default sbtn"><i class="fa-solid fa-magnifying-glass"></i></button>
					<input type="hidden" name="P_AREA" value="${param.P_AREA}">
					<input type="hidden" name="P_SELLBUY" value="${param.P_SELLBUY}">
					<input type="hidden" name="P_ITEM" value="${param.P_ITEM}">
				</form>
			</div>

			<div class="writebtn">
				<c:if test="${not empty sessionScope.EMAIL}">
					<a href="/Flee/productWriteForm.fe?P_SELLBUY=${param.P_SELLBUY}"
						id="write">글쓰기</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="sermenu">
		<div class="wrap">
			<div class="drop" style="float: right;">
				<ul class="menu">
					<c:choose>
						<c:when test="${param.FILTER eq 'PJJIM_COUNT'}">
							<c:set var="filter" value="인기순" />
						</c:when>
						<c:when test="${param.FILTER eq 'P_DATE'}">
							<c:set var="filter" value="최신순" />
						</c:when>
						<c:when test="${param.FILTER eq 'P_COUNT'}">
							<c:set var="filter" value="조회순" />
						</c:when>
						<c:otherwise>
							<c:set var="filter" value="필터" />
						</c:otherwise>
					</c:choose>
					<li><a href="#">${filter}</a>
						<ul class="depth_3">
							<li><a
								href="/Flee/productList.fe?P_SELLBUY=${param.P_SELLBUY}&P_AREA=${param.P_AREA}&P_ITEM=${param.P_ITEM}&FILTER=PJJIM_COUNT">인기순</a></li>
							<li><a
								href="/Flee/productList.fe?P_SELLBUY=${param.P_SELLBUY}&P_AREA=${param.P_AREA}&P_ITEM=${param.P_ITEM}&FILTER=P_DATE">최신순</a></li>
							<li><a
								href="/Flee/productList.fe?P_SELLBUY=${param.P_SELLBUY}&P_AREA=${param.P_AREA}&P_ITEM=${param.P_ITEM}&FILTER=P_COUNT">조회순</a></li>
						</ul></li>
				</ul>
			</div>
			<ul class="mtbtn mtnav">
				<li <c:if test="${param.P_ITEM eq 1}"> class="on"</c:if>><a
					href="/Flee/productList.fe?P_SELLBUY=${param.P_SELLBUY}&P_AREA=${param.P_AREA}&P_ITEM=1">상품</a></li>
				<li <c:if test="${param.P_ITEM eq 0}"> class="on"</c:if>><a
					href="/Flee/productList.fe?P_SELLBUY=${param.P_SELLBUY}&P_AREA=${param.P_AREA}&P_ITEM=0">서비스</a></li>
			</ul>
			<div class="serpro mttab">
				<div class="secone">

					<ul class="clearfix">
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list}" var="item">
									<c:if test="${item.P_CATEGORY eq '1' }">
										<c:set target="${item}" property="P_CATEGORY" value="패션" />
									</c:if>
									<c:if test="${item.P_CATEGORY eq '2' }">
										<c:set target="${item}" property="P_CATEGORY" value="뷰티" />
									</c:if>
									<c:if test="${item.P_CATEGORY eq '3' }">
										<c:set target="${item}" property="P_CATEGORY" value="전자기기" />
									</c:if>
									<c:if test="${item.P_CATEGORY eq '4' }">
										<c:set target="${item}" property="P_CATEGORY" value="그림" />
									</c:if>
									<c:if test="${item.P_CATEGORY eq '5' }">
										<c:set target="${item}" property="P_CATEGORY" value="운동" />
									</c:if>
									<c:if test="${item.P_CATEGORY eq '6' }">
										<c:set target="${item}" property="P_CATEGORY" value="공부" />
									</c:if>
									<c:if test="${item.P_CATEGORY eq '7' }">
										<c:set target="${item}" property="P_CATEGORY" value="영화" />
									</c:if>
									<c:if test="${item.P_CATEGORY eq '8' }">
										<c:set target="${item}" property="P_CATEGORY" value="동물" />
									</c:if>

									<li><div class="rap"><a
										href="/Flee/productDetail.fe?P_ID=${item.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}"><img
											src="img/${item.P_IMAGE}" alt=""
											onerror="this.src='images/common/noimage.jpg'" /></a></div>
										<div class="setting" style="text-align: left;">
											<div class="tlist1">
												<h3>
													<a
														href="/Flee/productDetail.fe?P_ID=${item.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}">${item.P_TITLE}</a>
												</h3>
												<strong>${item.P_PRICE}</strong>
											</div>
											<p style="display: block; height: 13px;">${item.P_NICKNAME}</p>
											<div class="tlist2">
												<ul>
													<li><span>${item.P_CATEGORY}</span></li>
													<li><p>
															<fmt:formatDate value="${item.P_DATE}"
																pattern="yyyy-MM-dd" />
														</p></li>
												</ul>
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
				</div>
				<div class="paging">${paging.pageHtml}</div>
			</div>
		</div>
	</div>


</body>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<c:url value='/js/side.js'/>"></script>
<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</html>
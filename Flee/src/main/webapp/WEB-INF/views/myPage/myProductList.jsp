
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!̆̈DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<title>나의 게시글</title>
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="sub_visual">
		<div class="wrap">
			<strong>${param.M_NICKNAME}님의 게시글</strong>
			<p>${param.M_NICKNAME}님의 게시글들을 소개해요.</p>
		</div>
	</div>
	<div class="comboard" style="height: 1190px;">
		<div class="wrap">
			<div class="sermenu">
				<div class="wrap">
					<div class="drop" style="float: right;">
						<ul class="menu">
							<c:choose>
								<c:when test="${param.FILTER eq 'P_ID'}">
									<c:set var="filter" value="번호순" />
								</c:when>
								<c:when test="${param.FILTER eq 'P_DATE'}">
									<c:set var="filter" value="최신순" />
								</c:when>
								<c:otherwise>
									<c:set var="filter" value="필터" />
								</c:otherwise>
							</c:choose>
							<li><a href="#">${filter}</a>
								<ul class="depth_3">
									<li><a
										href="/Flee/myProductList.fe?M_NICKNAME=${param.M_NICKNAME}&FILTER=P_ID">번호순</a></li>
									<li><a
										href="/Flee/myProductList.fe?M_NICKNAME=${param.M_NICKNAME}&FILTER=P_DATE">최신순</a></li>
								</ul></li>
						</ul>
					</div>
					<div class="serpro mttab">
						<div class="secone2">
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

											<li><a
												href="/Flee/productDetail.fe?P_ID=${item.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}"><img
													src="img/${item.P_IMAGE}" alt=""
													onerror="this.src='images/common/noimage.jpg'" /></a>
												<div class="setting" style="text-align: left;">
													<div class="tlist1" style="padding-top: 18px;">
														<h3>
															<a
																href="/Flee/productDetail.fe?P_ID=${item.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}">${item.P_TITLE}</a>
														</h3>
														<strong>${item.P_PRICE}</strong>
													</div>

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
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>
</html>

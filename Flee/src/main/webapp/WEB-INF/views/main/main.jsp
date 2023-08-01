<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/main.css'/>" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>Flee</title>

</head>

<body>
	<div class="layout">
		<div class="wrap">
			<section class="visual">
				<h2 class="skip">팝업</h2>
				<div class="popup">
					<ul>
						<li>
							<div class="wrap">
								<div class="inner">
									<h3>
										<strong>플리</strong>에서 만나보는 <br />다양한 서비스
									</h3>
									<p>지금 우리 지역에서는 ?</p>
								</div>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="inner">

									<h3>
										<strong>우리 동네</strong>의 <br />숨어있는 장인들을 찾아보세요!
									</h3>
									<p>간단한 부탁부터 모임까지!</p>
								</div>
							</div>
						</li>
					</ul>
					<div class="btn_group">
						<!--popup_paging-->
						<div class="paging">
							<button>1번 팝업</button>
							<button>2번 팝업</button>
						</div>
					</div>
				</div>
			</section>


			<section class="product">
				<div class="wrap">
					<div class="procontent">
						<c:choose>
							<c:when test="${not empty sessionScope.NICKNAME}">
								<h2>${sessionScope.NICKNAME }님이건어때요?</h2>
							</c:when>
							<c:otherwise>
								<h2>이건 어때요?</h2>
							</c:otherwise>
						</c:choose>
						<ul class="clearfix">
							<c:if test="${not empty cat}">
								<c:forEach var="product" items="${cat}">
									<c:if test="${product.P_CATEGORY eq '1' }">
										<c:set target="${product}" property="P_CATEGORY" value="패션" />
									</c:if>
									<c:if test="${product.P_CATEGORY eq '2' }">
										<c:set target="${product}" property="P_CATEGORY" value="뷰티" />
									</c:if>
									<c:if test="${product.P_CATEGORY eq '3' }">
										<c:set target="${product}" property="P_CATEGORY" value="전자기기" />
									</c:if>
									<c:if test="${product.P_CATEGORY eq '4' }">
										<c:set target="${product}" property="P_CATEGORY" value="그림" />
									</c:if>
									<c:if test="${product.P_CATEGORY eq '5' }">
										<c:set target="${product}" property="P_CATEGORY" value="운동" />
									</c:if>
									<c:if test="${product.P_CATEGORY eq '6' }">
										<c:set target="${product}" property="P_CATEGORY" value="공부" />
									</c:if>
									<c:if test="${product.P_CATEGORY eq '7' }">
										<c:set target="${product}" property="P_CATEGORY" value="영화" />
									</c:if>
									<c:if test="${product.P_CATEGORY eq '8' }">
										<c:set target="${product}" property="P_CATEGORY" value="동물" />
									</c:if>
									<li><div class="rap">
										<a
										href="/Flee/productDetail.fe?P_ID=${product.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}"><img
											src="img/${product.P_IMAGE}" alt=""
											onerror="this.src='images/common/noimage.jpg'" /></a></div>

										<div class="setting" style="text-align: left;">
											<div class="tlist1">
												<h3>
													<a
														href="/Flee/productDetail.fe?P_ID=${product.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}">${product.P_TITLE}</a>
												</h3>
												<strong>${product.P_NICKNAME}</strong>
											</div>
											<div class="tlist2">
												<ul>
													<li><span>${product.P_CATEGORY}</span></li>
													<li><p></p></li>
												</ul>
											</div>

										</div>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
				</div>
			</section>
			<section class="lok">
				<div class="wrap">
					<ul class="clearfix">
						<li class="tag">
							<h3>
								우리지역에서<br />인기있어요!
							</h3>
						</li>
						<li><a
							href=<c:url value='/productList.fe?P_SELLBUY=0&P_AREA=종로구&P_ITEM=1' />>
								<h2>종로구</h2>
						</a></li>
						<li><a
							href=<c:url value='/productList.fe?P_SELLBUY=0&P_AREA=서대문구&P_ITEM=1' />>
								<h2>서대문구</h2>
						</a></li>
						<li><a
							href=<c:url value='/productList.fe?P_SELLBUY=0&P_AREA=강남구&P_ITEM=1' />>
								<h2>강남구</h2>
						</a></li>
						<li><a
							href=<c:url value='/productList.fe?P_SELLBUY=0&P_AREA=강서구&P_ITEM=1' />>
								<h2>강서구</h2>
						</a></li>
					</ul>
				</div>
			</section>
			<section class="product2">
				<div class="wrap">
					<c:choose>
						<c:when test="${not empty area}">
							<h2>${area}에서확인해보세요!</h2>
						</c:when>
						<c:otherwise>
							<h2>종로구에서 확인해보세요!</h2>
						</c:otherwise>
					</c:choose>
					<ul class="clearfix">
						<c:if test="${not empty cat}">
							<c:forEach var="product" items="${list}">
								<c:if test="${product.P_CATEGORY eq '1' }">
									<c:set target="${product}" property="P_CATEGORY" value="패션" />
								</c:if>
								<c:if test="${product.P_CATEGORY eq '2' }">
									<c:set target="${product}" property="P_CATEGORY" value="뷰티" />
								</c:if>
								<c:if test="${product.P_CATEGORY eq '3' }">
									<c:set target="${product}" property="P_CATEGORY" value="전자기기" />
								</c:if>
								<c:if test="${product.P_CATEGORY eq '4' }">
									<c:set target="${product}" property="P_CATEGORY" value="그림" />
								</c:if>
								<c:if test="${product.P_CATEGORY eq '5' }">
									<c:set target="${product}" property="P_CATEGORY" value="운동" />
								</c:if>
								<c:if test="${product.P_CATEGORY eq '6' }">
									<c:set target="${product}" property="P_CATEGORY" value="공부" />
								</c:if>
								<c:if test="${product.P_CATEGORY eq '7' }">
									<c:set target="${product}" property="P_CATEGORY" value="영화" />
								</c:if>
								<c:if test="${product.P_CATEGORY eq '8' }">
									<c:set target="${product}" property="P_CATEGORY" value="동물" />
								</c:if>
								<li><div class="rap"><a
									href="/Flee/productDetail.fe?P_ID=${product.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}"><img
										src="img/${product.P_IMAGE}" alt=""
										onerror="this.src='images/common/noimage.jpg'" /></a></div>
									<div class="setting" style="text-align: left;">
										<div class="tlist1">
											<h3>
												<a
													href="/Flee/productDetail.fe?P_ID=${product.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}">${product.P_TITLE}</a>
											</h3>
											<strong>${product.P_NICKNAME}</strong>
										</div>
										<div class="tlist2">
											<ul>
												<li><span>${product.P_CATEGORY}</span></li>
												<li><p></p></li>
											</ul>
										</div>

									</div></li>
							</c:forEach>
						</c:if>

					</ul>
				</div>
			</section>
			<%@ include file="/WEB-INF/include/include-footer.jspf"%>
		</div>
	</div>

</body>

<script src="<c:url value='/js/jquery-1.12.4.min.js'/>"></script>
<script src="<c:url value='/js/common 2.js'/>"></script>
<script src="<c:url value='/js/popup.js'/>"></script>
</html>
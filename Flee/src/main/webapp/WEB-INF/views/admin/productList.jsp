<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />

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
<title>관리자 페이지</title>
<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
<script>
	function test() {

		//체크 해제할 라디오버튼 불러오기
		var deselect = document.getElementsByClassName("terms");

		for (var i = 0; deselect.length; i++) {
			//체크되어 있다면 park[i].checked == true
			//true -> false로 변환 ==> 체크해제
			if (deselect[i].checked) {
				deselect[i].checked = false;
			}
		}
	}
</script>
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
						<li class="onon" style="width: 14.2%"><a
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
		<div class="comboard" style="height: 1200px;">
			<div class="wrap">
				<div class="textline">
					<h3>상품 리스트</h3>
				</div>
				<div id="otherboard">
					<div class="pl">
						<div class="checkmenu2">
							<form action="adminProductList.fe">
								<table style="table-layout: fixed">
									<tr>
										<td class="tblok"><b>지역</b></td>
										<td><label> <input type="radio" id="P_AREA"
												name="P_AREA" class="terms" value="종로구"
												ondblclick="radioReset(this)"
												<c:out value="${param.P_AREA eq '종로구' ? 'checked' : ''}" />>종로구
										</label></td>
										<td><label><input type="radio" id="P_AREA"
												name="P_AREA" class="terms" value="서대문구"
												ondblclick="radioReset(this)"
												<c:out value="${param.P_AREA eq '서대문구' ? 'checked' : ''}" />>서대문구</label></td>
										<td><label><input type="radio" id="P_AREA"
												name="P_AREA" class="terms" value="강서구"
												ondblclick="radioReset(this)"
												<c:out value="${param.P_AREA eq '강서구' ? 'checked' : ''}" />>강서구</label></td>
										<td><label><input type="radio" id="P_AREA"
												name="P_AREA" class="terms" value="강남구"
												ondblclick="radioReset(this)"
												<c:out value="${param.P_AREA eq '강남구' ? 'checked' : ''}" />>강남구</label></td>
									</tr>
									<tr>
										<td class="tblok"><b>분류</b></td>
										<td><label><input type="radio" id="P_SELLBUY"
												name="P_SELLBUY" class="terms" value="0"
												ondblclick="radioReset(this)"
												<c:out value="${param.P_SELLBUY eq 0 ? 'checked' : ''}" />>해주시오</label></td>
										<td><label><input type="radio" id="P_SELLBUY"
												name="P_SELLBUY" class="terms" value="1"
												ondblclick="radioReset(this)"
												<c:out value="${param.P_SELLBUY eq 1 ? 'checked' : ''}" />>해드리오</label></td>
									</tr>
									<tr>
										<td class="tblok"><b>거래형태</b></td>
										<td><label><input type="radio" id="P_ITEM"
												name="P_ITEM" class="terms" value="1"
												ondblclick="radioReset(this)"
												<c:out value="${param.P_ITEM eq 1 ? 'checked' : ''}" />>상품</label></td>
										<td><label><input type="radio" id="P_ITEM"
												name="P_ITEM" class="terms" value="0"
												ondblclick="radioReset(this)"
												<c:out value="${param.P_ITEM eq 0 ? 'checked' : ''}" />>서비스</label></td>
									</tr>
								</table>
								<div class="search2">
									<select class="searcht" name="type">
										<option value="">---</option>
										<option value="TWC" name="type"
											<c:out value="${param.type eq 'TWC' ? 'selected' : ''}" />>
											전체</option>
										<option value="T" name="type"
											<c:out value="${param.type eq 'T' ? 'selected' : ''}" />>
											제목</option>
										<option value="C" name="type"
											<c:out value="${param.type eq 'C' ? 'selected' : ''}" />>
											내용</option>
										<option value="W" name="type"
											<c:out value="${param.type eq 'W' ? 'selected' : ''}" />>
											작성자</option>
									</select>
									<c:choose>
										<c:when test="${param.keyword eq 'null'}">
											<input class="searchtext2" type="text" name="keyword"
												value=" " />
										</c:when>
										<c:otherwise>
											<input type="text" name="keyword" class="searchtext2"
												value="<c:out value='${param.keyword}'/>" />
										</c:otherwise>
									</c:choose>
								</div>

								<br />
								<div style="text-align: center;">
									<input type="submit" value="검색" class="abtn"> <input
										type="button" value="리셋" class="abtn2" onclick="test()">
								</div>


							</form>
						</div>

					</div>
				</div>
				<div class="clearfix">
					<table class="board_list" style="table-layout: fixed">
						<colgroup>
							<col class="none" width="5%" />
							<col width="8%" />
							<col width="4%" />
							<col width="8%" />
							<col width="8%" />
							<col width="29%" />
							<col width="10%" />
							<col class="none"width="3%" />
							<col width="8%" />
							<col class="none" width="10%" />
							<col class="none" width="4%" />
							<col width="3%" />

						</colgroup>
						<thead>
							<tr>
								<th class="none"scope="col">상품번호</th>
								<th scope="col">거래방식</th>
								<th scope="col">종류</th>
								<th scope="col">카테고리</th>
								<th scope="col">지역</th>
								<th scope="col">제목</th>
								<th scope="col">가격</th>
								<th class="none"scope="col">찜</th>
								<th scope="col">닉네임</th>
								<th class="none" scope="col">작성일</th>
								<th class="none"scope="col">조회수</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}">
								<tr>
									<td class="none">${item.P_ID}</td>
									<td><c:choose>
											<c:when test="${item.P_SELLBUY eq '0'}">
															해주시오
														</c:when>
											<c:otherwise>
															해드리오
														</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${item.P_ITEM eq '0'}">
															서비스
														</c:when>
											<c:otherwise>
														     상품
														</c:otherwise>
										</c:choose></td>
									<td><c:if test="${item.P_CATEGORY eq '1' }">
														패션
													</c:if> <c:if test="${item.P_CATEGORY eq '2' }">
														뷰티
													</c:if> <c:if test="${item.P_CATEGORY eq '3' }">
														전자기기
													</c:if> <c:if test="${item.P_CATEGORY eq '4' }">
														그림
													</c:if> <c:if test="${item.P_CATEGORY eq '5' }">
														운동
													</c:if> <c:if test="${item.P_CATEGORY eq '6' }">
														공부
													</c:if> <c:if test="${item.P_CATEGORY eq '7' }">
														영화
													</c:if> <c:if test="${item.P_CATEGORY eq '8' }">
														동물
													</c:if></td>
									<td>${item.P_AREA}</td>
									<td style="overflow: hidden;text-align: left;white-space:nowrap;"><a
										href="/Flee/productDetail.fe?P_ID=${item.P_ID}&M_NICKNAME=${sessionScope.NICKNAME}&page=${page}">${item.P_TITLE}</a>
									</td>
									<td>${item.P_PRICE}</td>
									<td class="none" >${item.PJJIM_COUNT}</td>
									<td>${item.P_NICKNAME}</td>
									<td class="none">${item.P_DATE}</td>
									<td class="none">${item.P_COUNT}</td>
									<td><a
										href="./adminProductDelete.fe?P_ID=${item.P_ID}&P_SELLBUY=${item.P_SELLBUY}&P_AREA=${item.P_AREA}&P_ITEM=${item.P_ITEM}">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="paging">${paging.pageHtml}</div>
			</div>
		</div>

	</div>


	<%@ include file="/WEB-INF/include/include-footer.jspf"%>

	<script src="<c:url value='/js/adminnav.js'/>"></script>
</body>
</html>

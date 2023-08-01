<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!̆̈DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<title>고객센터</title>
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="sub_visual">
		<div class="wrap">
			<strong>공지게시판</strong>
			<p>QNA</p>
		</div>
	</div>
	<div class="noticeboard" style="height:800px;">
		<div class="wrap">
			<h2>게시판 규칙을 지켜주세요</h2>
			<p>무분별한 도배글은 삭제 될 수 있습니다.</p>

			<!-- 검색처리기능 -->
			<div class="search">
				<form id="searchForm" action="<c:url value='/noticeList.fe' />"
					method="get">
					<select class="searcht" name="type">
						<option value="">--</option>
						<option value="TWCNQ" name="type"
							<c:out value="${param.type eq 'TWC' ? 'selected' : ''}"/>>전체</option>
						<option value="T" name="type"
							<c:out value="${param.type eq 'T' ? 'selected' : ''}"/>>제목</option>
						<option value="W" name="type"
							<c:out value="${param.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
						<option value="C" name="type"
							<c:out value="${param.type eq 'C' ? 'selected' : ''}"/>>내용</option>
					</select> <input class="searchtext" type="text" name="keyword"
						value="<c:out value='${param.keyword}'/>" />
					<button class="btn btn-default sbtn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
			</div>
			<div class="write" style="text-align: right">
				<c:if test="${not empty sessionScope.EMAIL}">
					<a class="write" href="<c:url value='/openQnaWrite.fe' />"
						class="btn" id="write">글쓰기</a>
				</c:if>

			</div>
			<table class="board_list">
				<colgroup>
					<col width="8%" />
					<col width="*" />
					<col width="12%" />
					<col width="15%" />
					<col width="8%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">날짜</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${nlist}">
						<tr>
							<td>${item.N_IDX}</td>
							<c:if test="${item.N_TYPE eq 'N'}">
								<c:set var="type" value="공지" />
							</c:if>
							<c:if test="${item.N_TYPE eq 'Q'}">
								<c:set var="type" value="질문" />
							</c:if>
							<td style="text-align: left; padding: 0 10px;"><a
								style="color: #478BE1; font-weight: 700"
								href='<c:url value="/noticeDetail.fe?N_IDX=${item.N_IDX}"/>'>[${type}]${item.N_TITLE}</a></td>
							<td>${item.N_NICKNAME}</td>
							<td><fmt:formatDate value="${item.N_DATE}"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td>${item.N_COUNT}</td>
						</tr>
					</c:forEach>
					<c:forEach var="item" items="${qlist}">
						<tr>
							<td>${item.N_IDX}</td>
							<c:if test="${item.N_TYPE eq 'N'}">
								<c:set var="type" value="공지" />
							</c:if>
							<c:if test="${item.N_TYPE eq 'Q'}">
								<c:set var="type" value="질문" />
							</c:if>
							<td style="text-align: left; padding: 0 10px;"><a
								href='<c:url value="/noticeDetail.fe?N_IDX=${item.N_IDX}"/>'>[${type}]${item.N_TITLE}</a></td>
							<td>${item.N_NICKNAME}</td>
							<td><fmt:formatDate value="${item.N_DATE}"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td>${item.N_COUNT}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="paging">${paging.pageHtml}</div>
	</div>

	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>
<script>
	
</script>
</html>




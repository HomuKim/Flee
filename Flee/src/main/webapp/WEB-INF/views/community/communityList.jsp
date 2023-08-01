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
	href="<c:url value='/css/sub.css'/>" />
<title>자유게시판</title>
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="sub_visual">
		<div class="wrap">
			<strong>자유게시판</strong>
			<p>정보를 교류해요.</p>
		</div>
	</div>
	<div class="comboard">
		<div class="wrap">
			<h2>게시판 규칙을 지켜주세요</h2>
			<p>무분별한 도배글은 삭제 될 수 있습니다.</p>
			<div class="search">
				<form id="searchForm" action="<c:url value='/communityList.fe' />"
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
							<input class="searchtext" type="text" name="keyword" value=" " />
						</c:when>
						<c:otherwise>
							<input  class="searchtext"  type="text" name="keyword"
								value="<c:out value='${param.keyword}'/>" />
						</c:otherwise>
					</c:choose>
					<button class="btn btn-default sbtn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
			</div>
			<div class="write" style="text-align: right">
				<c:if test="${not empty sessionScope.EMAIL}">
					<a class="write" href="<c:url value='/openCommunityWrite.fe' />"
						class="btn" id="write">글쓰기</a>
				</c:if>
			</div>
			<table class="board_list">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="15%" />
					<col width="20%" />
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
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.C_IDX}</td>
							<c:if test="${item.C_TYPE eq 'L'}">
								<c:set var="type" value="일상" />
							</c:if>
							<c:if test="${item.C_TYPE eq 'Q'}">
								<c:set var="type" value="질문" />
							</c:if>
							<c:if test="${item.C_TYPE eq 'I'}">
								<c:set var="type" value="정보" />
							</c:if>
							<td style="text-align: left; padding: 0 10px;"><a
								href='<c:url value="/communityDetail.fe?C_IDX=${item.C_IDX}"/>'>[${type}]${item.C_TITLE}</a></td>
							<td>${item.C_NICKNAME}</td>
							<td><fmt:formatDate value="${item.C_DATE}"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td>${item.C_COUNT}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div class="paging">${paging.pageHtml}</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>
</html>

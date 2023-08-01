<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!̆̈DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin.css'/>" />
<title>관리자 후기 상세</title>
</head>
<body>

	<div class="minwrap">
		<div class="adrbox">
			<h3>관리자 후기 상세</h3>
			<div class="boxtext1">
				<ul>
					<li><ul>
							<li style="float:left;width: 90px;"><strong>작성자</strong></li>
							<li >${map.R_NICKNAME}</li>
						</ul></li>
					<li><ul>
							<li style="float:left;width: 90px;"><strong>거래대상</strong></li>
							<li>${map.RE_NICKNAME}</li>
						</ul></li>
					<li><ul>
							<li style="float:left;width: 90px;"><strong>별점</strong></li>
							<li>${map.R_GRADE}</li>
						</ul></li>
					<li><ul>
							<li style="float:left;width: 90px;"><strong>작성일</strong></li>
							<li>${map.R_DATE}</li>
						</ul></li>
				</ul>
			</div>
			<div class="boxtext2"><strong>후기내용</strong><br/>${map.R_CONTENT}</div>

		</div>
	</div>
	
</body>
</html>

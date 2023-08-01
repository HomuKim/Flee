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
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<title>채팅 로그</title>
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="comboard3">
		<div class="textline">
			<h3>채팅방 ${param.CROOM_IDX }번 채팅로그</h3>
		</div>

		<div class="chatlogbox">
			<div id='chatArea'>
				<div id='chatMessageArea'>
					<ul class='send2'>
						<c:forEach var="item" items="${list}">
							<li>
								<div class=''>
									<p class='readck'>
										<span class='sendinner'><strong>${item.SEND_NICKNAME } </strong>:
											${item.MES_CONTENT} </span>
								</div>
							</li>
						</c:forEach>
					</ul>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	<script src="<c:url value='/js/adminnav.js'/>"></script>
</body>
</html>

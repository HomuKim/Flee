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
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="sub_visual ">
		<div class="wrap">
			<strong>자유게시판</strong>
			<p>정보를 교류해요.</p>
		</div>
	</div>
	<div class="wrap">
		<div class="combowrite">
			<div class="board_title">
				<h2>게시판 규칙을 지켜주세요</h2>
				<p>무분별한 도배글은 삭제 될 수 있습니다.</p>
			</div>
			<div class="board_write_wrap">
				<form method="post" action="/Flee/communityWrite.fe"
					onSubmit="return submitCheck();">
					<div class="board_write">
						<div class="title">
							<dl>
								<dt>제목</dt>
								<dd>
									<input name="C_TITLE" id="C_TITLE" type="text" maxlength="30"
										placeholder="제목을 입력하세요. (30자 제한)">
								</dd>
							</dl>
						</div>
						<div class="info">

							<dl>
								<dt>타입</dt>
								<dd>
									<ul class="typedrop">
										<li><a href="javascript:void(0);" class="typen">카테고리</a>
											<ul class="depth_3">
												<li><a href="javascript:void(0);">일상</a><input type="hidden"
													name="C_TYPE" id="C_TYPE"></li>
												<li><a href="javascript:void(0);">질문</a></li>
												<li><a href="javascript:void(0);">정보</a></li>
											</ul></li>
									</ul>
								</dd>
							</dl>
							<dl>
								<dd>
									<input name="C_NICKNAME" type="hidden"
										value="${sessionScope.NICKNAME}">
								</dd>
							</dl>
						</div>
						<div class="cont">
							<textarea name="C_CONTENT" id="C_CONTENT"
								placeholder="내용 입력 1000자 제한" maxlength="1000"></textarea>
						</div>
					</div>
					<div class="bt_wrap">
						<button class="wrtiebtn" type="submit">작성</button>
						<button class="canclebtn" type="button"
							onClick="javascript:history.go(-1);">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>



	<%@ include file="/WEB-INF/include/include-footer.jspf"%>

</body>
<script>
	$('.depth_3').on("click", "li a", function(e) {
		let type = $(this).html();
		$('.typen').html(type);
		if (type === "일상") {
			$('#C_TYPE').val("L");
		}
		if (type === "정보") {
			$('#C_TYPE').val("I");
		}
		if (type === "질문") {
			$('#C_TYPE').val("Q");
		}
	});

	function submitCheck() {
		if ($('#C_TITLE').val().length == 0 || $('#C_TITLE').val() === "") {
			alert("제목을 입력하세요");
			$('#C_TITLE').focus();
			return false;
		}
		if ($('#C_TYPE').val() == null || $('#C_TYPE').val() === "") {
			alert("카테고리를 선택하세요");
			$('.typedrop li').css("background", "rgb(221 122 122)");
			$('.typedrop li').css("border", "1px solid rgb(221 122 122)");
			$('.typedrop li a').css("color", "#fff");
			$('.typedrop li a').css("background", "rgb(221 122 122)");
			return false;
		}
		if ($('#C_CONTENT').val().length == 0 || $('#C_CONTENT').val() === "") {
			alert("내용을 입력하세요");
			$('#C_CONTENT').focus();
			return false;
		}
		return true;
	}
</script>
</html>
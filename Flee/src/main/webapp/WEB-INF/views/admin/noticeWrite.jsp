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
<title>공지 작성 게시판</title>
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="sub_visual ">
		<div class="wrap">
			<strong>공지 게시판</strong>
			<p>문의해주세요.</p>
		</div>
	</div>
	<div class="wrap">
		<div class="noticeboardwrite">
			<div class="board_title">
				<h2>게시판 규칙을 지켜주세요.</h2>
				<p>무분별한 도배글은 삭제 될 수 있습니다.</p>
			</div>
			<div class="board_write_wrap">
				<form method="post" action="/Flee/noticeWrite.fe"
					onSubmit="return submitCheck();">
					<div class="board_write">
						<div class="title">
							<dl>
								<dt>제목</dt>
								<dd>
									<input name="N_TITLE" id="N_TITLE" type="text" maxlength="30"
										placeholder="제목을 입력하세요. (30자 제한)">
								</dd>
							</dl>
						</div>
						<div class="info">

							<dl>
								<dt>타입</dt>
								<dd>
									<ul class="type">
										<li><a href="javascript:void(0);">공지</a> <input
											type="hidden" name="N_TYPE" id="N_TYPE" readonly>
									</ul>
								</dd>
							</dl>
							<dl>
								<dd>
									<input name="N_NICKNAME" type="hidden"
										value="${sessionScope.NICKNAME}">
								</dd>
							</dl>
						</div>
						<div class="cont">
							<textarea name="N_CONTENT" id="N_CONTENT" placeholder="내용 입력 1000자 제한" maxlength="1000"></textarea>
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
		if (type === "공지") {
			$('#N_TYPE').val("N");
		}

	});

	function submitCheck() {
		if ($('#N_TITLE').val().length == 0 || $('#N_TITLE').val() === "") {
			alert("제목을 입력하세요");
			$('#N_TITLE').focus();
			return false;
		}
		if ($('#N_TYPE').val() == null || $('#N_TYPE').val() === "공지") {
			return false;
		}
		if ($('#N_CONTENT').val().length == 0 || $('#N_CONTENT').val() === "") {
			alert("내용을 입력하세요");
			$('#N_CONTENT').focus();
			return false;
		}
		return true;
	}
</script>
</html>




<%-- 
제목<input type="text" name="N_TITLE"></br>
닉네임<input type="text" name="N_NICKNAME"></br>
내용<input type="text" name="N_CONTENT"></br>
타입<input type="text" name="N_TYPE" value ="Q" readonly></br>




<a href="#this" class="btn" id="list" >목록으로</a>
<a href="#this" class="btn" id="write" >작성하기</a>
</form>
	

<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#list").on("click", function(e){
			e.preventDefault();
			fn_noticeList();
		});		
		
		$("#write").on("click", function(e){ //작성하기 버튼
			e.preventDefault();
			fn_noticeWrite();
		
		});
	});
	
	function fn_noticeList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/noticeList.fe' />");
		comSubmit.submit();
	}
	
	function fn_noticeWrite(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/noticeWrite.fe' />");
		comSubmit.submit();
	}
</script>
</body>
</html> --%>
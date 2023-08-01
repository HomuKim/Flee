<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!̆̈DOCTYPE html>
<html>
<head>
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/modal.css'/>" />
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin.css'/>" />
<title>고객센터</title>
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>

<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
</head>
<body>
	<div class="sub_visual2">
		<div class="wrap">
			<strong>관리자 공지게시판</strong>
			<p>공지 / QNA</p>
		</div>
	</div>
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
					<li style="width: 14.2%"><a
						href=<c:url value='/adminProductList.fe' />>상품리스트</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminCommunityList.fe' />>자유게시판관리</a></li>
					<li class="onon" style="width: 14.2%"><a
						href=<c:url value='/adminNoticeList.fe' />>공지게시판관리</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminReview.fe' />>후기리스트관리</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="noticeboardwrite">

			<div class="board_">
				<form id="qwform" method="post" action="/Flee/noticeUpdate.fe"
					onSubmit="return submitCheck();">
					<div class="board_write2">
						<div class="title2">
							<ul>
								<li>
									<div class="cdtype">
										<c:if test="${map.N_TYPE eq 'N'}">
											<c:set var="type" value="[공지]" />
										</c:if>
										<c:if test="${map.N_TYPE eq 'Q'}">
											<c:set var="type" value="[질문]" />
										</c:if>

										${type} <input type="hidden" name="N_TYPE" id="N_TYPE"
											value="${map.N_TYPE}">
									</div>
								</li>
								<li>
									<div class="ctitle">
										<div class="t_le">
											<h3 class="sss" style="display: inline-block;">제목</h3>
											<input class="sss" name="N_TITLE" id="N_TITLE" type="text"
												maxlength="30" placeholder="제목을 입력하세요. (30자 제한)"
												style="height: 29px; width: 500px" value="${map.N_TITLE}">

											<div class="nnn">${map.N_TITLE}</div>
										</div>
									</div>
								</li>

							</ul>
						</div>
						<div class="info2">
							<ul>
								<li><div class="nnn">
										<div class="c_nick">
											${map.N_NICKNAME} <input name="N_NICKNAME" type="hidden"
												value="${map.N_NICKNAME}">
										</div>
									</div></li>
								<li>
									<div class="c_date">${map.N_DATE}</div>
								</li>
								<li>
									<div class="ccount nnn">
										<div class="c_count ">조회수 ${map.N_COUNT}</div>
										<div class="t_le">
											<button class="sssbtn" type="button">수정</button>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="cont">
							<textarea class="sss" name="N_CONTENT" id="N_CONTENT"
								placeholder="내용 입력 1000자 제한" maxlength="1000"
								style="width: 90%; min-height: 280px;">${map.N_CONTENT}</textarea>
							<div class="nnn">${map.N_CONTENT}</div>
						</div>
						<input type="hidden" value="${map.N_IDX}" name="N_IDX">
						<div class="bt_wrap sss">
							<button class="wrtiebtn" type="submit">수정</button>
							<button class="canclebtn" type="button">취소</button>
							<button class="deletebtn" type="button">삭제</button>
						</div>

					</div>
				</form>
			</div>
		</div>


		<div class="comtable">
			<div class="panel-heading" id='comments'>
				<i class="fa fa-comments fa-fw"></i>
				<h3>Comment</h3>
				<button id="combtn-modal"
					class="btn btn-primary btn-xs pull-right combtn">댓글 쓰기</button>
			</div>
			<div class="rplist">
				<ul id="comment">
				</ul>
			</div>
			<div class="paging">
				<div class="paging1">
					<!--페이징 div-->
				</div>
			</div>
		</div>

		<div class="bt_wrap">
			<button class="listbtn" type="button"
				onClick="javascript:location.href='<c:url value='/adminNoticeList.fe'/>'">목록</button>
		</div>
	</div>

	<!-- 댓글 모달 -->
	<div id="modal2" class="modal-overlay wrap">
		<div class="modal-window wrap">
			<div class="modalcon">
				<div class="m_title"><div class="close-area">X</div>
					<h3>Comments</h3>
					<span>답변을 적어보아요.</span>
					<textarea class="form-control" name="NCOM_CONTENT"></textarea>
					<div class="bbtn">
						<button type="button" id='modalRegisterBtn'
							class="btn btn-primary conmbtn">작성</button>
						<button type="button" id='modalModBtn'
							class="btn btn-warning conmbtn2">수정</button>
						<button type="button" id='modalRemoveBtn'
							class="btn btn-danger conmbtn3">삭제</button>
					</div>
				</div>
				<div class="content">
					<div class="form-group">
						<input class="form-control" type="hidden" name="NCOM_NICKNAME" />
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>


<script>

	function submitCheck() {
		if ($('#N_TITLE').val().length == 0 || $('#N_TITLE').val() === "") {
			alert("제목을 입력하세요");
			$('#N_TITLE').focus();
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

<script>
$(document).ready(function() {
	/* 버튼 누르면 수정폼으로 전환 */
	$(".sss").hide();
	$(".sssbtn").click(function() {
		$(".sss").show();
		$(".nnn").hide();
	});
	$(".canclebtn").click(function() {
		$(".nnn").show();
		$(".sss").hide(); 
		
	});	
		/* 글 삭제 */
		$(".deletebtn").click(function(){
			if (confirm("삭제하시겠습니까?")) {
				$("#qwform").attr('action','/Flee/adminNoticeDelete.fe');
				$("#qwform").submit();
			}
		});
		
		/* 댓글이 들어갈 ul태그 */
		let commentUL = $("#comment");
		/* 댓글이 있는 글 번호 */
		let nidxValue ='${map.N_IDX}';

		/* 댓글 목록 호출 */
		showList(1);

		/* 댓글 목록 */
		function showList(page) {ncommentService.getList(
							{
								nidx : nidxValue,
								page : page || 1
							},
							function(list) {

								let str = "";
								if (list == null
										|| list.length == 0) { /* 댓글이 없는 경우 */
									str += "<li class='primary-font'>No Replies</li>";
									commentUL.html(str);
									return;
								}

								for (var i = 0, len = list.length || 0; i < len; i++) {

									str += "<li class='ccomment' data-ncidx='"+list[i].NCOM_IDX+"'>";
									str += "<div><div class='header' style='padding:5px 0;'><strong class='primary-font'>"
											+ list[i].NCOM_NICKNAME
											+ "<i class='fa-solid fa-pen' style='padding-left:15px;'></i></strong><small class='stext'>"
											+ ncommentService
													.displayTime(list[i].NCOM_DATE)
											+ "</small></div><div><span class='re_span'>"
											+ list[i].NCOM_CONTENT
											+ "</span>";
											+"</div></div></li>";
								
								}
								commentUL.html(str);

							});
		}
		

		
		/* 모달 관련 변수 선언 */
		let $modalContainer = $("#modal2");
		let modalInputContent = $modalContainer.find("textarea[name='NCOM_CONTENT']");
		let modalInputNickname = $modalContainer.find("input[name='NCOM_NICKNAME']");
		let modalModBtn = $("#modalModBtn");
		let modalRemoveBtn = $("#modalRemoveBtn");
		let modalRegisterBtn = $("#modalRegisterBtn");

		/* 새로운 댓글 작성 시 모달 창 */
		$("#combtn-modal").on("click",function(e){
					modalInputContent.val("");
					modalInputNickname.val('${sessionScope.NICKNAME}');
					$modalContainer.find("button[id!='modalRegisterBtn']").hide();
					modalRegisterBtn.show();
  					$modalContainer.removeAttr('class').addClass('modalon');
				});
		
		/* 댓글 작성 확정 */
		modalRegisterBtn.on("click", function(e){

			var comment = {
				NCOM_CONTENT : modalInputContent.val(),
				NCOM_NICKNAME : modalInputNickname.val(),
				N_IDX : nidxValue,

			};
			ncommentService.add(comment, function(result) {

				$modalContainer.find("input").val("");
				$modalContainer.addClass('out');

				showList(1);
			});
		});

		/* 댓글 리스트 클릭 시 */
		$("#comment").on("click","li",function(e){
			var ncidx = $(this).closest("li").data("ncidx");
				ncommentService.get(
				ncidx,
				function(ncomment) {
					modalInputContent
							.val(ncomment.NCOM_CONTENT);
					modalInputNickname
							.val(
									ncomment.NCOM_NICKNAME);
					$modalContainer
							.data(
									"ncidx",
									ncomment.NCOM_IDX);

					modalRegisterBtn.hide();
					modalModBtn.show();
					modalRemoveBtn.show();
					$modalContainer.removeAttr('class').addClass('modalon');
				});
			});
		
		
		/* 수정 */
		modalModBtn.on("click", function(e) {
			var ncomment = {
				NCOM_IDX:$modalContainer.data("ncidx"),
				NCOM_CONTENT:modalInputContent.val()
			};

			ncommentService.update(ncomment, function(result) {
				$modalContainer.addClass('out');
				showList(1);
			});
		});

		/* 삭제 */
		modalRemoveBtn.on("click", function(e) {
			var ncidx = $modalContainer.data("ncidx");

			ncommentService.remove(ncidx, function(result) {
				$modalContainer.addClass('out');
				showList(1);
			});
		});
		$(".close-area").on('click', function() {
			$modalContainer.addClass('out');
		});
	});
</script>

	<script src=<c:url value='/js/adminnav.js'/>></script>
<script type="text/javascript" src="<c:url value='/js/ncomment.js'/>"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
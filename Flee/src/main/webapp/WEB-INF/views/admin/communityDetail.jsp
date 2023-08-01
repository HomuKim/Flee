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
	href="<c:url value='/css/side.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/ui.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/modal.css'/>" />
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>

<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
<title>자유게시판 관리</title>
</head>
<body>
	<div class="sub_visual2">
		<div class="wrap">
			<strong>관리자페이지</strong>
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
					<li class="onon" style="width: 14.2%"><a
						href=<c:url value='/adminCommunityList.fe' />>자유게시판관리</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminNoticeList.fe' />>공지게시판관리</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminReview.fe' />>후기리스트관리</a></li>
				</ul>
			</div>
		</div>
	</div>

<div class="wrap">
		<div class="combowrite">
			<div class="board_">
				<form id="cwform" method="post" action="/Flee/communityUpdate.fe"
					onSubmit="return submitCheck();">
					<div class="board_write2">
						<div class="title2">
							<ul>
								<li>
									<div class="cdtype">
										<c:if test="${map.C_TYPE eq 'L'}">
											<c:set var="type" value="[일상]" />
										</c:if>
										<c:if test="${map.C_TYPE eq 'Q'}">
											<c:set var="type" value="[질문]" />
										</c:if>
										<c:if test="${map.C_TYPE eq 'I'}">
											<c:set var="type" value="[정보]" />
										</c:if>
										${type} <input type="hidden" name="C_TYPE" id="C_TYPE"
											value="${map.C_TYPE}">
									</div>
								</li>
								<li>
									<div class="ctitle">
										<div class="t_le">
											<div class="nnn">${map.C_TITLE}</div>
										</div>
									</div>
								</li>

							</ul>
						</div>
						<div class="info2">
							<ul>
								<li><div class="nnn">
										<div class="c_nick">
											${map.C_NICKNAME} <input name="C_NICKNAME" type="hidden"
												value="${map.C_NICKNAME}">
										</div>
									</div></li>
								<li>
									<div class="c_date">${map.C_DATE}</div>
								</li>
								<li>
									<div class="ccount nnn">
										<div class="c_count ">조회수 ${map.C_COUNT}</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="cont">
							<div class="nnn">${map.C_CONTENT}</div>
						</div>
					</div>
				</form>
			</div>
		</div>


		<div class="comtable">
			<div class="panel-heading" id='comments'>
				<i class="fa fa-comments fa-fw"></i>
				<h3>Comment</h3>
				<c:if test="${not empty sessionScope.NICKNAME}">
					<button id="combtn-modal"
						class="btn btn-primary btn-xs pull-right combtn">댓글 쓰기</button>
				</c:if>
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
			<button class="listbtn" type="button" onClick="javascript:location.href='<c:url value='/adminCommunityList.fe'/>'">목록</button>
		</div>
	</div>

	<!-- 댓글 모달 -->
	<div id="modal2" class="modal-overlay wrap">
		<div class="modal-window wrap">
			<div class="modalcon">
				<div class="m_title">
					<div class="close-area">X</div>
					<h3>Comments</h3>
					<span>댓글로 소통해요!</span>
					<textarea class="form-control" name="CCOM_CONTENT" maxlength="50"></textarea>
					<input name="REF" type='hidden' value='0' /> <input type="hidden"
						name="RE_LEVEL" value='0' /> <input type="hidden" name="RE_STEP"
						value='0' />
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
						<input class="form-control" type="hidden" name="CCOM_NICKNAME" />
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-footer.jspf"%>

	<script src=<c:url value='/js/adminnav.js'/>></script>
	<script src=<c:url value='/js/ccomment.js'/>></script>
	<script>

$(document)
		.ready(
				function() {
						
						/* 댓글이 들어갈 ul태그 */
						let commentUL = $("#comment");
						/* 댓글이 있는 글 번호 */
						let cidxValue = '${map.C_IDX}';

						/* 댓글 목록 호출 */
						showList(1);

						/* 댓글 목록 */
						function showList(page) {
							ccommentService
									.getList(
											{
												cidx : cidxValue,
												page : page || 1
											},
											function(total, list) {
												if (page == -1) {
													pageNum = Math
															.ceil(total / 10.0);
													showList(pageNum);
													return;
												}

												let str = "";
												if (list == null
														|| list.length == 0) { /* 댓글이 없는 경우 */
													str += "<li class='primary-font'>No Replies</li>";
													commentUL.html(str);
													return;
												}

												for (var i = 0, len = list.length || 0; i < len; i++) {
													var margin = "";
													if (list[i].RE_LEVEL > 0) {/* 답글이라면 */
														margin = 15 * list[i].RE_LEVEL;
													}

													str += "<li style='margin-left:"
											+ margin
											+ "px;' class='ccomment' data-ccidx='"+list[i].CCOM_IDX+"'>";
											let header = "";
											let pen = "";
											if('${sessionScope.NICKNAME}'===list[i].CCOM_NICKNAME){
												header = "header";
												pen = "<i class='fa-solid fa-pen' style='padding-left:15px;'></i>";
											}else{
												header = "header2";
											}
													str += "<div><div class="
															+ header 
															+ "><strong class='primary-font'>"
															+ list[i].CCOM_NICKNAME
															+ pen
															+ "</strong><small class='stext'>"
															+ ccommentService
																	.displayTime(list[i].CCOM_DATE)
															+ "</small></div><div><span class='re_span'>"
															+ list[i].CCOM_CONTENT
															+ "</span>";
													if('${sessionScope.NICKNAME}'!=''){
														str	+= "<span class='re_com'><i class='fa-regular fa-comment-dots'></i></span>";
													}				
														str	+= "</div></div></li>";
												
												}
												commentUL.html(str);

												showCommentPage(total);
											});
						}
						
						let pageNum = 1;
						let commentPageFooter = $(".paging1"); 

						/* Paging */
						function showCommentPage(total) {
							var endNum = Math.ceil(pageNum / 5.0) * 5;
							var startNum = endNum - 4;
							var prev = startNum != 1;
							var next = false;

							if (endNum * 10 >= total) {
								endNum = Math.ceil(total / 10.0);
							}

							if (endNum * 10 < total) {
								next = true;
							}

							var str = "<ul>";

							if (prev) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (startNum - 1)
										+ "'><</a></li>";
							}

							for (var i = startNum; i <= endNum; i++) {
								var active = pageNum == i ? "active" : "";

								str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"
										+ i + "</a></li>";
							}

							if (next) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (endNum + 1) + "'>></a></li>";
							}

							str += "</ul>";

							commentPageFooter.html(str);
						}
						
						/* 페이지 이동 할 경우 */
						commentPageFooter.on("click", "li a", function(e) {
							e.preventDefault();

							var targetPageNum = $(this).attr("href");

							pageNum = targetPageNum;

							showList(pageNum);
						}); 

						/* 모달 관련 변수 선언 */
						let $modalContainer = $('#modal2');
						let modalInputContent = $modalContainer
								.find("textarea[name='CCOM_CONTENT']");
						let modalInputNickname = $modalContainer
								.find("input[name='CCOM_NICKNAME']");
						let modalInputRef = $modalContainer.find("input[name='REF']");
						let modalInputRe_level = $modalContainer
								.find("input[name='RE_LEVEL']");
						let modalInputRe_step = $modalContainer
								.find("input[name='RE_STEP']");
						let modalModBtn = $("#modalModBtn");
						let modalRemoveBtn = $("#modalRemoveBtn");
						let modalRegisterBtn = $("#modalRegisterBtn");

						/* 새로운 댓글 작성 시 모달 창 */
						$("#combtn-modal").on(
								"click",
								function(e) {
									modalInputContent.val("");
									modalInputNickname.val(
											'${sessionScope.NICKNAME}');
									modalInputRef.val('0');
									modalInputRe_level.val('0');
									modalInputRe_step.val('0');
									$modalContainer.find("button[id!='modalRegisterBtn']").hide();
									modalRegisterBtn.show();

									$modalContainer.removeAttr('class').addClass('modalon');
								});
						
						/* 댓글 작성 확정 */
						modalRegisterBtn.on("click", function(e) {

							var comment = {
								CCOM_CONTENT : modalInputContent.val(),
								CCOM_NICKNAME : modalInputNickname.val(),
								C_IDX : cidxValue,
								REF : modalInputRef.val(),
								RE_STEP : modalInputRe_step.val(),
								RE_LEVEL : modalInputRe_level.val()
							};
							ccommentService.add(comment, function(result) {

								$modalContainer.find("input").val("");
								$modalContainer.addClass('out');

								showList(1);
							});
						});

						/* 댓글 리스트 클릭 시 */
						$("#comment")
						.on(
								"click",
								"li .header",
								function(e) {

									var ccidx = $(this).closest("li")
											.data("ccidx");

									ccommentService
											.get(
													ccidx,
													function(ccomment) {
														modalInputContent
																.val(ccomment.CCOM_CONTENT);
														modalInputNickname
																.val(
																		ccomment.CCOM_NICKNAME);
														$modalContainer
																.data(
																		"ccidx",
																		ccomment.CCOM_IDX);

														modalRegisterBtn.hide();
														modalModBtn.show();
														modalRemoveBtn.show();
														$modalContainer.removeAttr('class').addClass('modalon');
													});
								});
						
						/* 대댓글 버튼 클릭 시 */
						$("#comment")
						.on(
								"click",
								"li .re_com",
								function(e) {

									var ccidx = $(this).closest("li")
											.data("ccidx");

									ccommentService
											.get(
													ccidx,
													function(ccomment) {
														modalInputContent
																.val("");
														modalInputNickname
																.val(
																		'${sessionScope.NICKNAME}');
														$modalContainer.data(
																		"ccidx",
																		ccomment.CCOM_IDX);
														modalInputRef.val(ccomment.REF);
														modalInputRe_level.val(ccomment.RE_LEVEL+1);
														modalInputRe_step.val(ccomment.RE_STEP+1);

														$modalContainer.find("button[id!='modalRegisterBtn']").hide();
														modalRegisterBtn.show();
														$modalContainer.removeAttr('class').addClass('modalon');
													});
								});
						
						/* 수정 */
						modalModBtn.on("click", function(e) {
							var ccomment = {
								CCOM_IDX : $modalContainer.data("ccidx"),
								CCOM_CONTENT : modalInputContent.val()
							};

							ccommentService.update(ccomment, function(result) {
								$modalContainer.addClass('out');

								showList(1);
							});
						});

						/* 삭제 */
						modalRemoveBtn.on("click", function(e) {
							var ccidx = $modalContainer.data("ccidx");

							ccommentService.remove(ccidx, function(result) {
								$modalContainer.addClass('out');

								showList(1);
							});
						});
						
						/* 닫기 버튼 */
						$(".close-area").on('click', function() {
							$modalContainer.addClass('out');
						});
					});
					
</script>
</body>
</html>
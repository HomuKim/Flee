<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<title>회원리스트게시판</title>

<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
<script>
	function test() {

		//체크 해제할 라디오버튼 불러오기
		var deselect = document.getElementsByClassName("terms");

		for (var i = 0; deselect.length; i++) {
			//true -> false로 변환 ==> 체크해제
			if (deselect[i].checked == true) {
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
	<div class="lnb">
		<div class="wrap">
			<div class="depth2 menu_depth">
				<ul class="clearfix navbtn">
					<li class="onon" style="width: 14.2%"><a
						href=<c:url value='/memberList.fe' />>회원리스트</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminAList.fe' />>회원신고리스트</a></li>
					<li style="width: 14.2%"><a
						href=<c:url value='/adminTradeList.fe' />>거래내역리스트</a></li>
					<li style="width: 14.2%"><a
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
				<h3>회원 리스트</h3>
			</div>
			<div id="otherboard">
				<div class="pl">
					<div class="checkmenu2">
						<form action="memberList.fe">
							<table style="table-layout: fixed">
								<tr class="table1">
									<td class="tblok"><b>지역</b></td>
									<td><label> <input type="radio" id="AREA"
											name="AREA" class="terms" value="종로구"
											ondblclick="radioReset(this)"
											<c:out value="${param.AREA eq '종로구' ? 'checked' : ''}" />>종로구
									</label></td>
									<td><label><input type="radio" id="AREA"
											name="AREA" class="terms" value="서대문구"
											ondblclick="radioReset(this)"
											<c:out value="${param.AREA eq '서대문구' ? 'checked' : ''}" />>서대문구</label></td>
									<td><label><input type="radio" id="AREA"
											name="AREA" class="terms" value="강서구"
											ondblclick="radioReset(this)"
											<c:out value="${param.AREA eq '강서구' ? 'checked' : ''}" />>강서구</label></td>
									<td><label><input type="radio" id="AREA"
											name="AREA" class="terms" value="강남구"
											ondblclick="radioReset(this)"
											<c:out value="${param.AREA eq '강남구' ? 'checked' : ''}" />>강남구</label></td>
								</tr>
								<tr class="table2">
									<td class="tblok"><b>등급</b></td>
									<td><label><input type="radio" id="RANK"
											name="RANK" class="terms" value="S"
											ondblclick="radioReset(this)"
											<c:out value="${param.RANK eq 'S' ? 'checked' : ''}" />>플리새내기</label></td>
									<td><label><input type="radio" id="RANK"
											name="RANK" class="terms" value="M"
											ondblclick="radioReset(this)"
											<c:out value="${param.RANK eq 'M' ? 'checked' : ''}" />>플리매니저</label></td>
									<td><label><input type="radio" id="RANK"
											name="RANK" class="terms" value="J"
											ondblclick="radioReset(this)"
											<c:out value="${param.RANK eq 'J' ? 'checked' : ''}" />>플리장인</label></td>
								</tr>
							</table>
							<div class="search2">
								<select class="searcht" name="type">
									<option value="">---</option>
									<option value="NEM" name="type"
										<c:out value="${param.type eq 'NEM' ? 'selected' : ''}" />>
										전체</option>
									<option value="N" name="type"
										<c:out value="${param.type eq 'N' ? 'selected' : ''}" />>
										이름</option>
									<option value="E" name="type"
										<c:out value="${param.type eq 'E' ? 'selected' : ''}" />>
										이메일</option>
									<option value="M" name="type"
										<c:out value="${param.type eq 'M' ? 'selected' : ''}" />>
										닉네임</option>
								</select>
								<c:choose>
									<c:when test="${param.keyword eq 'null'}">
										<input class="searchtext" type="text" name="keyword" value=" " />
									</c:when>
									<c:otherwise>
										<input type="text" name="keyword" class="searchtext"
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
			<table class="board_list" style="table-layout: fixed">
				<colgroup>
					<col width="10%" />
					<col width="15%" />
					<col class="none" width="10%" />
					<col class="none" width="15%" />
					<col class="none" width="10%" />
					<col class="none" width="*%" />
					<col width="15%" />
					<col width="7%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">닉네임</th>
						<th scope="col">이메일</th>
						<th class="none" scope="col">이름</th>
						<th class="none" scope="col">핸드폰</th>
						<th class="none" scope="col">생년월일</th>
						<th class="none" scope="col">주소</th>
						<th scope="col">회원가입날짜</th>
						<th scope="col">등급</th>
					</tr>
				</thead>
				<tbody class="memberList">
					<c:forEach var="item" items="${list}">
						<tr>
							<td><a
								href="/Flee/memberDetail.fe?M_NICKNAME=${item.M_NICKNAME }">${item.M_NICKNAME }</a>
								<input type="hidden" id="M_NICKNAME" value="${item.M_NICKNAME }"></td>
							<td>${item.EMAIL}</td>
							<td class="none">${item.NAME}</td>
							<td class="none">${item.PHONE}</td>
							<td class="none">${item.JUMIN1}</td>
							<td class="none">${item.ADDRESS1}</td>
							<td>${item.M_DATE}</td>
							<td><strong><span id="recentRank"><c:choose>
											<c:when test="${item.RANK eq 'S'}">
												<c:set var="rank" value="플리새내기" />
											</c:when>
											<c:when test="${item.RANK eq 'M'}">
												<c:set var="rank" value="플리매니저" />
											</c:when>
											<c:otherwise>
												<c:set var="rank" value="플리장인" />
											</c:otherwise>
										</c:choose>${rank}</span></strong>
								<div>
									<button class="adbtn">등급 변경</button>
									<input type="hidden" name="nickname" value="${item.M_NICKNAME}">
								</div></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div class="paging">${paging.pageHtml}</div>
		</div>
	</div>
	<div id="modal3" class="modal-overlay">
		<div class="modal-window" id="popupPrdCompare"
			data-popup-layer="popupPrdCompare">
			<div class="title">

				<div class="close-area" data-focus-next="popupPrdCompare">X</div>

				<div>
					<h3 style="text-align: center;">등급 변경</h3>

				</div>
			</div>

			<div class="content">
				<div class="contentin">
					<input type="hidden" name="M_NICKNAME" id="M_NICKNAME">
					<p>
						<strong><span class="nick"></span>님의 등급을</strong>
					</p>
					<select style="float: left" " name="selectRank">
						<option value="S">플리새내기</option>
						<option value="M">플리매니저</option>
						<option value="J">플리장인</option>
					</select>
					<p>
						<strong>으로 변경합니다.</strong>
					</p>
					<button id="rankRegisterBtn" class="modalbtn" type="submit">변경</button>
				</div>
			</div>

		</div>
	</div>

	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="<c:url value='/js/adminnav.js'/>"></script>
<script src="<c:url value='/js/side.js'/>"></script>
<script src="<c:url value='/js/rank.js'/>"></script>
<script>
	$(document).ready(function() {
		
		/* 모달 관련 변수 선언 */
		let modal = $("#modal3");
		let modalInputNickname = modal.find("input[name='M_NICKNAME']");
		
		$(".memberList").on("click","tr td button",function(){
	 		$(".nick").html($(this).closest("td").find("input[name=nickname]").val());
			modalInputNickname.val($(this).closest("td").find("input[name=nickname]").val());
			modalOn();
			
		});

 		let rankRegisterBtn = $("#rankRegisterBtn");

		/*모달확정*/
 		rankRegisterBtn.on("click", function(e) {
			var rank = {
					M_NICKNAME : modalInputNickname.val(),
					RANK : $('select[name=selectRank]').val()
			};
			
			rankService.update(rank, function(result) {
				alert("등급이 변경되었습니다.");
				
			});
			modalOff();
			location.reload();
		}); 

		 
	});
</script>
<script>
	
	const modal = document.getElementById("modal3");

	function modalOn() {
	    modal.style.display = "flex"
	}
	function isModalOn() {
	    return modal.style.display === "flex"
	}
	function modalOff() {
	    modal.style.display = "none"
	}
	
	const closeBtn = modal.querySelector(".close-area")
	closeBtn.addEventListener("click", e => {
	    modalOff()
	});
	modal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("modal-overlay")) {
	        modalOff()
	    }
	});
	window.addEventListener("keyup", e => {
	    if(isModalOn() && e.key === "Escape") {
	        modalOff()
	    }
	});
	const testScrPop = $('modal-window');
   testScrPop.scroll(function(){
   const $this = $(this);
});
</script>
</html>
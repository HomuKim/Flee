<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/side.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common3.css'/>" />
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value="/js/post.js"/>"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('.mtbtn').menuBar();

	});
</script>
<script type="text/javascript">
	function check() {

		if (document.getElementById("FASHION").checked) {
			document.getElementById("FASHION_hidden").disabled = "true";
		}

		if (document.getElementById("BEAUTY").checked) {
			document.getElementById("BEAUTY_hidden").disabled = "true";
		}

		if (document.getElementById("ELECTRONIC").checked) {
			document.getElementById("ELECTRONIC_hidden").disabled = "true";
		}

		if (document.getElementById("DRAWING").checked) {
			document.getElementById("DRAWING_hidden").disabled = "true";
		}

		if (document.getElementById("WORKOUT").checked) {
			document.getElementById("WORKOUT_hidden").disabled = "true";
		}

		if (document.getElementById("STUDY").checked) {
			document.getElementById("STUDY_hidden").disabled = "true";
		}

		if (document.getElementById("FILM").checked) {
			document.getElementById("FILM_hidden").disabled = "true";
		}

		if (document.getElementById("ANIMAL").checked) {
			document.getElementById("ANIMAL_hidden").disabled = "true";
		}
	}
</script>
<title>회원정보 수정</title>
</head>
<body>
	<div class="sub_visual ">
		<div class="wrap">
			<strong>마이페이지</strong>
			<p>My Page</p>
		</div>
	</div>
	<div class="double" style="height: 1500px;">
		<div class="wrap">
			<div class="sidenav">
				<ul>
					<li><a
						href='/Flee/myProfile.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}&EMAIL=${sessionScope.EMAIL}"/>'>프로필
					</a></li>
					<li class="on"><a
						href='/Flee/myInfoUpdateForm.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>&EMAIL=${sessionScope.EMAIL}'>회원정보
							수정 </a></li>
					<li><a
						href='/Flee/myTrade.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>거래내역</a></li>
					<li><a
						href='/Flee/chatList.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>채팅내역</a></li>
					<li><a
						href='/Flee/jjimList.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>찜목록</a></li>
					<li><a
						href='/Flee/myText.fe?M_NICKNAME=<c:out value="${sessionScope.NICKNAME}"/>'>내가
							쓴 글</a></li>
					<li><a name="delete" href="#this">회원탈퇴</a></li>
				</ul>
			</div>
			<div class="sidecontent">
				<section id="joinupform">
					<div class="wrap">
						<div class="joincon">
							<h2>회원 정보 수정</h2>
							<form id="myInfoUpdateForm" class="form-horizontal" method="POST"
								action="<c:url value='/myInfoUpdate.fe'/>" onSubmit="check();">

								<!-- 이메일 -->
								<div class="joinfom">
									<label class="jointit">이메일</label><br /> <input class="putfom"
										type="text" class="form-control" check="0" id="EMAIL"
										name="EMAIL" value="${myInfo.EMAIL}" readonly="readonly"
										class="form-control" oninput="checkEmail()" required>
									<label id="EMAILLABEL"></label>
								</div>

								<!-- 비밀번호 -->
								<div class="joinfom">
									<label for="jointit">현재 비밀번호</label><br /> <input
										class="putfom" type="password" class="form-control"
										id="OPASSWORD" name="OPASSWORD" required /> <label
										id="OPASSWORDW"></label>
									<p>
										<label for="jointit">새 비밀번호</label><br /> <input
											class="putfom" type="password" class="form-control" check="1"
											id="PASSWORD" name="PASSWORD"> <label id="PASSWORDW"></label>
								</div>

								<div class="joinfom">
									<label>닉네임</label><br /> <input class="putfom" type="text"
										class="form-control" check="0" id="M_NICKNAME"
										name="M_NICKNAME" minlength="2" maxlength="8"
										value="${myInfo.M_NICKNAME}" readonly="readonly"
										class="form-control" oninput="checkNick()" required> <label
										id="NICKW"></label>
								</div>

								<!-- 이름 -->
								<div class="joinfom">
									<label>이름</label><br /> <input class="putfom" type="text"
										minlength="2" class="form-control" id="NAME" name="NAME"
										value="${myInfo.NAME}" required> <label id="NAMEW"></label>
								</div>

								<!-- 휴대전화 -->
								<div class="joinfom">
									<label for="PHONE">휴대전화 ('-' 없이 번호만 입력해주세요)</label><br /> <input
										class="putfom" type="text" class="form-control" check="0"
										maxlength="11" id="PHONE" name="PHONE" value="${myInfo.PHONE}"
										required> <label id="PHONEW"></label>
								</div>

								<div class="joinfom">
									<input class="putfomnum" type="text" class="form-control"
										id="sample6_postcode" name="POSTCODE"
										value="${myInfo.POSTCODE}" placeholder="우편번호"> <input
										type="button" class="postbtn"
										onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									<label id="ADDRW1"></label>
								</div>

								<div class="joinfom">
									<input class="putfom" type="text" class="form-control"
										id="sample6_address" name="ADDRESS1"
										value="${myInfo.ADDRESS1}" placeholder="주소">
									<p>
										<input class="putfom" type="text" class="form-control"
											id="ADDRESS2" name="ADDRESS2" value="${myInfo.ADDRESS2}"
											placeholder="상세주소를 입력해주세요"><br>
								</div>

								<div class="joincheck">
									<h4>관심 분야</h4>
									<ul>
										<li><input type="checkbox" name="FASHION" id="FASHION"
											value=1 onclick='getCheckedCnt()'> <input
											type="hidden" name="FASHION" id="FASHION_hidden" value=0>
											<label for="FASHION">패션</label></li>
										<li><input type="checkbox" name="BEAUTY" id="BEAUTY"
											value=1 onclick='getCheckedCnt()'> <input
											type="hidden" name="BEAUTY" id="BEAUTY_hidden" value=0>
											<label for="BEAUTY">뷰티</label></li>
										<li><input type="checkbox" name="ELECTRONIC"
											id="ELECTRONIC" value=1 onclick='getCheckedCnt()'> <input
											type="hidden" name="ELECTRONIC" id="ELECTRONIC_hidden"
											value=0> <label for="ELECTRONIC">전자기기</label> <br></li>
										<li><input type="checkbox" name="DRAWING" id="DRAWING"
											value=1 onclick='getCheckedCnt()'> <input
											type="hidden" name="DRAWING" id="DRAWING_hidden" value=0>
											<label for="DRAWING">미술</label></li>
										<li><input type="checkbox" name="WORKOUT" id="WORKOUT"
											value=1 onclick='getCheckedCnt()'> <input
											type="hidden" name="WORKOUT" id="WORKOUT_hidden" value=0>
											<label for="WORKOUT">운동</label></li>
										<li><input type="checkbox" name="STUDY" id="STUDY"
											value=1 onclick='getCheckedCnt()'> <input
											type="hidden" name="STUDY" id="STUDY_hidden" value=0>
											<label for="STUDY">공부</label></li>
										<li><input type="checkbox" name="FILM" id="FILM" value=1
											onclick='getCheckedCnt()'> <input type="hidden"
											name="FILM" id="FILM_hidden" value=0> <label
											for="FILM">영화</label></li>
										<li><input type="checkbox" name="ANIMAL" id="ANIMAL"
											value=1 onclick='getCheckedCnt()'> <input
											type="hidden" name="ANIMAL" id="ANIMAL_hidden" value=0>
											<label for="ANIMAL">반려동물</label></li>
									</ul>

								</div>
								<div class="checkcnt" style="display: block; margin-top: 100px;">
									<label id="CHECKCNTW"></label> <input type="hidden"
										id="checkcnt">
								</div>

								<div class="joinokbtn">
									<button class="jointruebtn" id="reg_submit"
										onclick="submit_ck(); return false;">
										<i aria-hidden="true"></i>수정하기
									</button>
								</div>
							</form>
						</div>
					</div>
				</section>


			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
</body>
<script type="text/javascript">
	function getCheckedCnt() {
		// 선택된 목록 가져오기
		const query = 'input[type="checkbox"]:checked';
		const selectedElements = document.querySelectorAll(query);

		// 선택된 목록의 갯수 세기
		const selectedElementsCnt = selectedElements.length;

		document.getElementById('checkcnt').value = selectedElementsCnt;
	}
</script>
<script>
	$(document)
			.ready(
					function() {
						let count = 0;
						if ('${myCat.FASHION}' == 1) {
							$('#FASHION').attr("checked", "checked");
							count++;
						}
						if ('${myCat.BEAUTY}' == 1) {
							$('#BEAUTY').attr("checked", "checked");
							count++;
						}
						if ('${myCat.ELECTRONIC}' == 1) {
							$('#ELECTRONIC').attr("checked", "checked");
							count++;
						}
						if ('${myCat.DRAWING}' == 1) {
							$('#DRAWING').attr("checked", "checked");
							count++;
						}
						if ('${myCat.WORKOUT}' == 1) {
							$('#WORKOUT').attr("checked", "checked");
							count++;
						}
						if ('${myCat.STUDY}' == 1) {
							$('#STUDY').attr("checked", "checked");
							count++;
						}
						if ('${myCat.FILM}' == 1) {
							$('#FILM').attr("checked", "checked");
							count++;
						}
						if ('${myCat.ANIMAL}' == 1) {
							$('#ANIMAL').attr("checked", "checked");
							count++;
						}
						$('#checkcnt').val(count);

						let password = '${myInfo.PASSWORD}';
						$('#OPASSWORD')
								.keyup(
										function() {
											if ($('#OPASSWORD').val().length > 0) {
												if ($('#OPASSWORD').val() != password) {
													$('#OPASSWORDW').text(
															" 비밀번호가 틀립니다");
													$('#OPASSWORDW').css(
															"color", "red");
													$('#OPASSWORDW').css(
															"font-size", "9pt");
													$('#OPASSWORDW').css(
															"font-weight",
															"bold");
													$(this).attr("check", "0");
												} else if ($('#OPASSWORD')
														.val() === '${myInfo.PASSWORD}') {
													$('#OPASSWORDW').text(
															" 비밀번호 일치 ");
													$('#OPASSWORDW').css(
															"color", "green");
													$('#OPASSWORDW').css(
															"font-size", "9pt");
													$('#OPASSWORDW').css(
															"font-weight",
															"bold");
													$(this).attr("check", "1");
												}
											} else {
												$('#OPASSWORDW').text("");
											}
										});

						$('#PASSWORD')
								.keyup(
										function() {
											if ($(this).val().length > 0) {
												if (!($(this).val()
														.match(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/))) {
													$('#PASSWORDW')
															.text(
																	" 최소 8자 이상 숫자, 문자, 특수문자 각각 1개 이상 포함");
													$('#PASSWORDW').css(
															"color", "red");
													$('#PASSWORDW').css(
															"font-size", "9pt");
													$('#PASSWORDW').css(
															"font-weight",
															"bold");
													$(this).attr("check", "0");
												} else {
													$('#PASSWORDW').text("");
													$(this).attr("check", "1");
												}
											} else {
												$('#PASSWORDW').text("");
												$(this).attr("check", "1");
											}
										});
					});
</script>
<script>
	function submit_ck() {
		if ($('#OPASSWORD').val().length == 0) {
			$('#OPASSWORDW').text(" 현재 비밀번호 입력");
			$('#OPASSWORDW').css("color", "red");
			$('#OPASSWORDW').css("font-size", "9pt");
			$('#OPASSWORDW').css("font-weight", "bold");
			$('#OPASSWORDW').focus();
		} else if ($('#OPASSWORD').attr("check") == "0") {
			$('#OPASSWORD').focus();
		} else if ($('#PASSWORD').attr("check") == "0") {
			$('#PASSWORD').focus();
		} else if ($('#checkcnt').val() < 2) {
			$('#CHECKCNTW').text(" 2개 이상 선택해주세요");
			$('#CHECKCNTW').css("color", "red");
			$('#CHECKCNTW').css("font-size", "9pt");
			$('#CHECKCNTW').css("font-weight", "bold");
			$('#FASHION').focus();
		} else {
			if ($('#PASSWORD').val().length == 0) {
				$('#PASSWORD').val('${myInfo.PASSWORD}');
			}
			$('#myInfoUpdateForm').submit();
		}
	}
</script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="<c:url value='/js/side.js'/>"></script>
<script>
	$("a[name=delete]").click(
			function() {
				let check = confirm("탈퇴 하시겠습니까?");
				if (check) {
					$(this).attr("href",
							"/Flee/myInfoDelete.fe?EMAIL=${myInfo.EMAIL}");
				}
			});
</script>
</html>
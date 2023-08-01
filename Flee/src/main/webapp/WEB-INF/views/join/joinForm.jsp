<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common3.css'/>" />
		
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
</head>
<body>
	<div class="layout">
		<!--헤더영역-->
		<header>
			<!--로고영역-->
			<div class="h_mm">
				<div class="wrap">
					<h1 class="logo">
						<a href=<c:url value='/main.fe' />><img
							src="<c:url value='/images/common/pclogo.png'/>" alt="플리" /></a>
					</h1>
				</div>
			</div>
		</header>
		<section id="joinform">
			<div class="wrap">
				<div class="joincon">
					<h2>이것만 작성하면 회원가입 완료!</h2>
					<form id="writeForm" class="form-horizontal" method="POST"
						action="<c:url value='/joinSuccess.fe'/>" onSubmit="check()">

						<!-- 이메일 -->
						<div class="joinfom">
							<label class="jointit">이메일*</label><br /> <input class="putfom"
								type="text" class="form-control" check="0" id="EMAIL"
								name="EMAIL" placeholder="이메일을 입력하세요" class="form-control"
								oninput="checkEmail()" required> <label id="EMAILLABEL"></label>
						</div>

						<!-- 비밀번호 -->
						<div class="joinfom">
							<label for="jointit">비밀번호</label><br /> <input class="putfom"
								type="password" class="form-control" id="PASSWORD"
								name="PASSWORD" required /> <label id="PASSWORDW"></label>
							<p>
								<label for="jointit">비밀번호 확인</label><br /> <input
									class="putfom" type="password" class="form-control"
									id="PASSWORD2" required> <label id="PASSWORDW2"></label>
						</div>

						<div class="joinfom">
							<label>닉네임*</label><br /> <input class="putfom" type="text"
								class="form-control" check="0" id="M_NICKNAME" name="M_NICKNAME"
								minlength="2" maxlength="8" placeholder="닉네임을 입력하세요"
								class="form-control" oninput="checkNick()" required> <label
								id="NICKW"></label>
						</div>

						<!-- 이름 -->
						<div class="joinfom">
							<label>이름</label><br /> <input class="putfom" type="text"
								minlength="2" class="form-control" id="NAME" name="NAME"
								required> <label id="NAMEW"></label>
						</div>

						<div class="joinfom">
							<label>주민번호</label><br /> <input class="putfomju" type="text"
								maxlength="6" class="form-control" id="JUMIN1" name="JUMIN1"
								required>
							<p style="float: left;">&nbsp;-&nbsp;</p>
							<input class="putfomju" type="text" class="form-control"
								maxlength="7" id="JUMIN2" name="JUMIN2" required> <label
								id="JUMINW"></label>
						</div>

						<!-- 휴대전화 -->
						<div class="joinfom">
							<label for="PHONE">휴대전화 ('-' 없이 번호만 입력해주세요)</label><br /> <input
								class="putfom" type="text" class="form-control" check="0"
								maxlength="11" id="PHONE" name="PHONE" required> <label
								id="PHONEW"></label>
						</div>

						<div class="joinfom">
							<input class="putfomnum" type="text" class="form-control"
								id="sample6_postcode" name="POSTCODE" placeholder="우편번호">
							<input type="button" class="postbtn"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기"> <label
								id="ADDRW1"></label>
						</div>

						<div class="joinfom">
							<input class="putfom" type="text" class="form-control"
								id="sample6_address" name="ADDRESS1" placeholder="주소">
							<p>
								<input class="putfom" type="text" class="form-control"
									id="ADDRESS2" name="ADDRESS2" placeholder="상세주소를 입력해주세요"><br>
						</div>

						<div class="joincheck">
							<h4>관심 분야</h4>
							<ul>
								<li><input type="checkbox" name="FASHION" id="FASHION"
									value=1 onclick='getCheckedCnt()'> <input type="hidden"
									name="FASHION" id="FASHION_hidden" value=0> <label
									for="FASHION">패션</label></li>
								<li><input type="checkbox" name="BEAUTY" id="BEAUTY"
									value=1 onclick='getCheckedCnt()'> <input type="hidden"
									name="BEAUTY" id="BEAUTY_hidden" value=0> <label
									for="BEAUTY">뷰티</label></li>
								<li><input type="checkbox" name="ELECTRONIC"
									id="ELECTRONIC" value=1 onclick='getCheckedCnt()'> <input
									type="hidden" name="ELECTRONIC" id="ELECTRONIC_hidden" value=0>
									<label for="ELECTRONIC">전자기기</label> <br></li>
								<li><input type="checkbox" name="DRAWING" id="DRAWING"
									value=1 onclick='getCheckedCnt()'> <input type="hidden"
									name="DRAWING" id="DRAWING_hidden" value=0> <label
									for="DRAWING">미술</label></li>
								<li><input type="checkbox" name="WORKOUT" id="WORKOUT"
									value=1 onclick='getCheckedCnt()'> <input type="hidden"
									name="WORKOUT" id="WORKOUT_hidden" value=0> <label
									for="WORKOUT">운동</label></li>
								<li><input type="checkbox" name="STUDY" id="STUDY" value=1
									onclick='getCheckedCnt()'> <input type="hidden"
									name="STUDY" id="STUDY_hidden" value=0> <label
									for="STUDY">공부</label></li>
								<li><input type="checkbox" name="FILM" id="FILM" value=1
									onclick='getCheckedCnt()'> <input type="hidden"
									name="FILM" id="FILM_hidden" value=0> <label for="FILM">영화</label></li>
								<li><input type="checkbox" name="ANIMAL" id="ANIMAL"
									value=1 onclick='getCheckedCnt()'> <input type="hidden"
									name="ANIMAL" id="ANIMAL_hidden" value=0> <label
									for="ANIMAL">반려동물</label></li>
							</ul>

						</div>
						<div class="checkcnt" style="display: block; margin-top: 100px;">
							<label id="CHECKCNTW"></label> <input type="hidden" id="checkcnt">
						</div>

						<div class="joinokbtn">
							<button class="jointruebtn" id="reg_submit"
								onclick="submit_ck(); return false;">
								<i aria-hidden="true"></i>환영합니다
							</button>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value='/js/post.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/joinForm.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value='/js/test.js'/>"></script> --%>
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
<script type="text/javascript">
	var email = "";
	/* 아이디체크 */
	function checkEmail() {
		var id = $('#EMAIL').val();
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/confirmEmail.fe'/>");
		comAjax.setCallback("fn_checkIdCallback");
		comAjax.addParam("email", id);
		comAjax.ajax();
	}

	function fn_checkIdCallback(data) {
		if (data) {
			$('#EMAILLABEL').text(" 사용중인 이메일");
			$('#EMAILLABEL').css("color", "red");
			$('#EMAILLABEL').css("font-size", "9pt");
			$('#EMAILLABEL').css("font-weight", "bold");
			$('#EMAIL').attr("check", "0");
		} else {
			$('#EMAILLABEL').text(" 사용가능");
			$('#EMAILLABEL').css("color", "green");
			$('#EMAILLABEL').css("font-size", "9pt");
			$('#EMAILLABEL').css("font-weight", "bold");
			$('#EMAIL').attr("check", "1");
		}
	}
	/* 닉네임체크 */
	function checkNick() {
		var nick = $('#M_NICKNAME').val();
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/confirmNickname.fe'/>");
		comAjax.setCallback("fn_checkNickCallback");
		comAjax.addParam("nick", nick);
		comAjax.ajax();
	}

	function fn_checkNickCallback(data) {
		if (data) {
			$('#NICKW').text(" 사용중인 닉네임");
			$('#NICKW').css("color", "red");
			$('#NICKW').css("font-size", "9pt");
			$('#NICKW').css("font-weight", "bold");
			$('#NICKW').attr("check", "0");
		} else {
			$('#NICKW').text(" 사용가능");
			$('#NICKW').css("color", "green");
			$('#NICKW').css("font-size", "9pt");
			$('#NICKW').css("font-weight", "bold");
			$('#NICKW').attr("check", "1");
		}
	}
</script>
</html>
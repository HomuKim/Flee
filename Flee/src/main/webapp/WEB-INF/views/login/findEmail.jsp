<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common3.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/main.css'/>" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="layout">
		<section id="findform">
			<div class="sub_visual">
				<div class="wrap">
					<strong>이메일 / 비밀번호 찾기</strong>
					<p>E-mail/ Password </p>
				</div>
			</div>
			<div class="wrap">
				<div class="findemail">

					<h2>이메일 찾기</h2>
					<div class="f_line">
						<form id="findEmailForm"
							action="<c:url value='/findEmailResult.fe'/>" method="POST">

							<!-- 이름 -->
							<div class="find">

								이름 <input class="putfom1" type="text" check="0" id="NAME"
									name="NAME" placeholder="이름을 입력하세요" />

							</div>

							<!-- 주민번호 -->
							<div class="find">
								주민번호 <input class="putfom2" type="text" id="JUMIN1"
									name="JUMIN1"> - <input class="putfom2" type="password"
									id="JUMIN2" name="JUMIN2">

							</div>
							<div style="text-align:center;">

								<button type="submit" class="findbtn">이메일찾기</button>
							</div>

						</form>
					</div>
				</div>

				<div class="findpw">
					<h2>비밀번호찾기</h2>
						<div class="f_line2">
					<form id="findPwForm" action="<c:url value='/findPwResult.fe'/>"
						method="POST">

						<!-- 이메일 -->
						<div class="find">
							이메일
							<input class="putfom3" type="text" check="0" id="PEMAIL"
								name="EMAIL" placeholder="이메일을 입력하세요" />

						</div>
						<!-- 이름 -->
						<div class="find">
							이름
							<input class="putfom1" type="text" check="0" id="PNAME"
								name="NAME" placeholder="이름을 입력하세요" />

						</div>

						<!-- 주민번호 -->
						<div class="find">
							주민번호
							<input class="putfom2" type="text" id="PJUMIN1" name="JUMIN1">
							- <input class="putfom2" type="password" id="PJUMIN2"
								name="JUMIN2">

						</div>
						<div style="text-align:center;" >

						<button type="submit" class="findbtn">비밀번호찾기</button>
						</div>
					</form>
					</div>
				</div>
			</div>
		</section>
		<%@ include file="/WEB-INF/include/include-footer.jspf"%>
	</div>
</html>
<script>
	$(document).ready(function() {
		let result = '${result}';
		if (result != '') {
			if (result == 'true') {
				let email = '${e_member.EMAIL}';
				let passwd = '${p_member.PASSWORD}';
				if (email != '') {
					alert("찾으시는 이메일은 " + email + " 입니다");
				}
				if (passwd != '') {
					alert("찾으시는 비밀번호는 " + passwd + " 입니다");
				}
			} else {
				alert("가입되지 않은 회원 입니다");
			}
		}
	});
</script>
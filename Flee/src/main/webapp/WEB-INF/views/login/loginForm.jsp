<%@ page language="java" contentType="text/html; charset=EUC-KR"
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



<script type="text/javascript">

function fsubmit(){
	var id = $("#EMAIL")[0].value;
	var pw = $("#PASSWORD")[0].value;
	if(id==null || id==''){
		alert("이메일을 입력하세요.");
		return false;
	}
	if(pw==null || pw==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	loginForm.submit();
}

function f_enterLogin(){
	 if (window.event.keyCode == 13){
		 fsubmit();
	    }
}
</script>
</head>
<body>
	<c:if test="${not empty param.message}">
		<script>
			alert('${param.message}');
		</script>
	</c:if>
	<div class="layout">
		<!--헤더영역-->
		<header>
			<!--로고영역-->
			<div class="h_mm">
				<div class="wrap">
					<h1 class="logo">
						<a href=<c:url value='/main.fe' />><img
							src="images/common/pclogo.png" alt="플리" /></a>
					</h1>
				</div>
			</div>
		</header>
		<section id="loginform">
			<div class="wrap">
				<div class="logincon">
					<h2 class="loh2">로그인</h2>
					<form id="loginForm" action="<c:url value='/login.fe'/>"
						method="POST">

						<!-- 이메일 -->
						<div class="loginfom">
							<label class="logintit">이메일</label><br /> <input class="putfom"
								type="text" check="0" id="EMAIL" name="EMAIL"
								placeholder="이메일을 입력하세요" onkeyup="f_enterLogin();" />

						</div>

						<!-- 비밀번호 -->
						<div class="loginfom">
							<label for="logintit">비밀번호</label><br /> <input class="putfom"
								type="password" id="PASSWORD" name="PASSWORD" onkeyup="f_enterLogin();" />

						</div>
						<br />

						<button type="button" onclick="fsubmit();" class="loginbtn">로그인</button>
						<br />
						<button type="button"
							onclick="location.href='<c:url value='/joinForm.fe'/>';"
							class="loginbtn2">회원가입</button>
						<div style="text-align: center;">
							<a href="<c:url value='/findEmail.fe'/>" alt="아이디찾기">아이디 /
								비밀번호 찾기</a>
						</div>


					</form>
				</div>
			</div>
		</section>
	</div>
</html>
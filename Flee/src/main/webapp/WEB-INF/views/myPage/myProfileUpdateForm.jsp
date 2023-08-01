<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/profile.css'/>" />
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script>
$(document).ready(function() {
	$('#remove').on("click", function() {
	let frm=document.getElementById('frm');
	
	var input = document.createElement('input');
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "M_IMAGE_hidden");
	input.setAttribute("value", "profile");

	frm.appendChild(input);
	
	document.getElementById('p_img').src="images/contents/profile_image.webp";
	});
});
</script>
</head>
<body>
	<div class="sub_visual">
		<div class="wrap">
			<strong>마이페이지</strong>
			<p>My page</p>
		</div>
	</div>
	<section id="profileupdate">
		<div class="wrap clearfix">
			<form id="frm" name="frm" method="post" enctype="multipart/form-data"
				action="<c:url value='/myProfileUpdate.fe'/>">
				<h3>프로필 수정하기</h3>
				<div class="m_upcard">
					<img class="p_img" id="p_img" src="img/image-${myInfo.M_IMAGE}.jpg"
						alt="프로필이미지"
						onerror="this.src='images/contents/profile_image.webp'">

					<div class="card1">
						<h4>프로필이미지 변경</h4>

						<input type="file" name="M_IMAGE" id="M_IMAGE" accept="image/*"
							onchange="readURL(this);" />
						<button class="removebtn" type=button id=remove>이미지 삭제하기</button>
</div>
<div class="card2">
						<div class="yub">
							<span>프로필 이미지 미리보기</span>
						</div>
						<div>
							<img id="preview" style="width: 40%" />
						</div>

						<script>
                            function readURL(input) {
                                if (input.files && input.files[0]) {
                                    var reader = new FileReader();
                                    reader.onload = function(e) {
                                    document.getElementById('preview').src = e.target.result;
                                    };
                                    reader.readAsDataURL(input.files[0]);
                                } else {
                                    document.getElementById('preview').src = "";
                                }
                                }
                            </script>
					</div>
				</div>
				<div class="m_updateshort">
					<div class="up_left">
						<h3>간단소개수정</h3>
						<p>30자 제한</p>
					</div>
					<div class="updateright">
						<textarea cols=100 rows=10 name="ABOUTME" maxlength="30">${myInfo.ABOUTME }</textarea>
					</div>
				</div>
				<div class="m_updatelong">
					<div class="up_left">
						<h3>상세소개수정</h3>
						<p>1000제한</p>
					</div>
					<div class="updateright">
						<textarea cols=100 rows=20 name="L_ABOUTME" maxlength="1000">${myInfo.L_ABOUTME }</textarea>
					</div>
				</div>
				<input type=hidden name=EMAIL value="${myInfo.EMAIL }">
				<div class="updatebtn">
					<button class="probtn" type=submit>수정</button>
					<button class="canclepro" type=button
						onClick="javascript:history.go(-1);">취소</button>
				</div>
			</form>
		</div>
	</section>
	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
	<script>
function readImage(input) {
	// 인풋 태그에 파일이 있는 경우
	if(input.files && input.files[0]) {
		// 이미지 파일인지 검사 (생략)
		
		// FileReader 인스턴스 생성
		const reader = new FileReader();
		
		// 이미지가 로드가 된 경우
		reader.onload = e => {
			const previewImage = document.getElementById("preview-image");
			previewImage.src = e.target.result;
		};
		
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0]);
	}	
</script>

</body>
</html>
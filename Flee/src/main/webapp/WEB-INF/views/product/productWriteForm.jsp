<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<form action="./productWrite.fe" enctype="multipart/form-data"
		method="post" onSubmit="return submitCheck();">
		<div class="sub_visual">
			<div class="wrap">
				<c:if test="${P_SELLBUY eq '0'}">
					<strong>해주시오!</strong>
					<p>판매글을 등록해주세요.</p>
					<input type="hidden" name="P_SELLBUY" value="0">
				</c:if>
				<c:if test="${P_SELLBUY eq '1'}">
					<strong>해드리오!</strong>
					<p>판매글을 등록해주세요.</p>
					<input type="hidden" name="P_SELLBUY" value="1">
				</c:if>

			</div>
		</div>
		<section id="profileupdate">
			<div class="wrap clearfix">
				<div class="p_title">
					<h2>글작성</h2>
					<p>허위 게시글 작성시 서비스 이용에 제한을 받을 수 있습니다.</p>
				</div>

				<div class="sell2">
					<div class="p_left">
						<h3>종류</h3>
					</div>
					<div>
						<ul class="sellcheck">
							<li><input type="radio" name="P_ITEM" class="P_ITEM" value=0 /><label
								for="">서비스</label></li>
							<li><input type="radio" name="P_ITEM" class="P_ITEM" value=1 /><label
								for="">상품</label> <input type="hidden" id="check" /></li>
						</ul>
					</div>
				</div>
				<div class="droplist">
					<div class="p_left">
						<h3>지역 / 관심분야</h3>
					</div>
					<ul>
						<li>
							<div class="loc_cate">
								<ul class="locdrop">
									<li><a href="javascript:void(0);" class="typen4">지역선택</a>
										<ul class="depth_4">
											<li><a href="javascript:void(0);">종로구</a><input
												type="hidden" name="P_AREA" id="P_AREA"></li>
											<li><a href="javascript:void(0);">서대문구</a></li>
											<li><a href="javascript:void(0);">강남구</a></li>
											<li><a href="javascript:void(0);">강서구</a></li>
										</ul></li>
								</ul>
							</div>
						</li>
						<li>

							<div class="p_cate">
								<ul class="pdrop">
									<li><a href="javascript:void(0);" class="typen5">관련분야</a>
										<ul class="depth_5">
											<li><a href="javascript:void(0);">패션</a><input
												type="hidden" name="P_CATEGORY" id="P_CATEGORY"></li>
											<li><a href="javascript:void(0);">뷰티</a></li>
											<li><a href="javascript:void(0);">전자기기</a></li>
											<li><a href="javascript:void(0);">반려동물</a></li>
											<li><a href="javascript:void(0);">운동</a></li>
											<li><a href="javascript:void(0);">공부</a></li>
											<li><a href="javascript:void(0);">영화</a></li>
											<li><a href="javascript:void(0);">그림</a></li>
										</ul></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<div class="pwrite_b">
					<div class="p_point">
						<div class="p_text">
							<h4>제목</h4>
							<input type="text"
								style="width: 68%; height: 20px; border-width: 1px;"
								name="P_TITLE" id="P_TITLE" maxlength="30">

						</div>
						<div class="p_pay">
							<h4>가격</h4>
							<input type="text"
								style="width: 30%; height: 20px; border-width: 1px;"
								name="P_PRICE" id="P_PRICE" maxlength="13">
						</div>
						<div class="p_paycheck">
							<input type="checkbox" id="pcheck" />가격은 협의로 정할래요
						</div>
						<div class="p_img" id="p_img">
							<h4>
								메인이미지 첨부하기<i class="fa-solid fa-star"></i>
							</h4>
							<input
								style="width: 30%; height: 30px; float: left; border-style: none;"
								type="file" name="P_IMAGE" id="P_IMAGE" accept="image/*"
								onchange="readURL(this);" />
							<div class="imgplus"></div>
							<div class="i_imgex">
								<span>이미지 미리보기</span> <a class="addfile" href="#this"
									id="addFile">파일 추가 </a>
							</div>
							<img id="preview" style="width: 50%; margin-left: 200px;" />
						</div>
					</div>
					<div class="p_content">
						<h4>상품상세설명</h4>

						<textarea id="P_CONTENT" style="width: 90%;" rows=20
							name="P_CONTENT" maxlength="1000" onkeypress="onTestChange()"></textarea>
					</div>

					<div class="updatebtn">
						<button class="probtn" type=submit>등록</button>
						<button class="canclepro" type=button
							onClick="javascript:history.go(-1);">취소</button>
					</div>
				</div>
				<input type="hidden" name="P_NICKNAME"
					value="${sessionScope.NICKNAME}">


			</div>

		</section>
	</form>
	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
	<script type="text/javascript">
		var gfv_count = 1;
		$(document).ready(function() {
			$("#addFile").on("click", function(e) { //파일추가하기 버튼
				e.preventDefault();
				fn_addFile();
			});

			$("#pcheck").on("click", function() {
				if ($(this).prop("checked")) {
					$("#P_PRICE").attr("readonly", "readonly");
					$("#P_PRICE").val("협의");
				} else {
					$("#P_PRICE").removeAttr("readonly");
					$("#P_PRICE").val("")
				}
			});

			$('.depth_4').on("click", "li a", function(e) {
				let type = $(this).html();
				$('.typen4').html(type);
				if (type === "종로구") {
					$('#P_AREA').val("종로구");
				}
				if (type === "서대문구") {
					$('#P_AREA').val("서대문구");
				}
				if (type === "강남구") {
					$('#P_AREA').val("강남구");
				}
				if (type === "강서구") {
					$('#P_AREA').val("강서구");
				}
			});
			$('.depth_5').on("click", "li a", function(e) {
				let type = $(this).html();
				$('.typen5').html(type);
				if (type === "패션") {
					$('#P_CATEGORY').val("1");
				}
				if (type === "뷰티") {
					$('#P_CATEGORY').val("2");
				}
				if (type === "전자기기") {
					$('#P_CATEGORY').val("3");
				}
				if (type === "그림") {
					$('#P_CATEGORY').val("4");
				}
				if (type === "운동") {
					$('#P_CATEGORY').val("5");
				}
				if (type === "공부") {
					$('#P_CATEGORY').val("6");
				}
				if (type === "영화") {
					$('#P_CATEGORY').val("7");
				}
				if (type === "반려동물") {
					$('#P_CATEGORY').val("8");
				}
			});

			$(".P_ITEM").on("click", function(e) {
				$("#check").val("1");
			});

		});

		function fn_addFile() {
			var str = "<p style='padding-right:20px;'>"
					+ "<input type='file' id='file_" + (gfv_count++)
					+ "' name='file_" + (gfv_count++)
					+ "' onchange='readURL(this);' >"
					+ "<a href='#this' class='btn' id='delete_" + (gfv_count++)
					+ "' name='delete_" + (gfv_count++) + "'>삭제</a>" + "</p>";
			$(".imgplus").append(str);
			$("a[name^='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}

		function fn_deleteFile(obj) {
			obj.parent().remove();
		}
	</script>

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
	<script>
		function submitCheck() {
			if ($('#check').val().length == 0 || $('#check').val() === "") {
				alert("상품인지 서비스인지 선택해주세요");
				$('.P_ITEM').focus();
				return false;
			}
			if ($('#P_AREA').val() == null || $('#P_AREA').val() === "") {
				alert("지역을 선택하세요");
				$('.locdrop li').css("background", "rgb(221 122 122)");
				$('.locdrop li').css("border", "1px solid rgb(221 122 122)");
				$('.locdrop li a').css("color", "#fff");
				$('.locdrop li a').css("background", "rgb(221 122 122)");
				return false;
			}
			if ($('#P_CATEGORY').val() == null || $('#P_CATEGORY').val() === "") {
				alert("상품 카테고리를 선택하세요");
				$('.pdrop li').css("background", "rgb(221 122 122)");
				$('.pdrop li').css("border", "1px solid rgb(221 122 122)");
				$('.pdrop li a').css("color", "#fff");
				$('.pdrop li a').css("background", "rgb(221 122 122)");
				return false;
			}
			if ($('#P_TITLE').val().length == 0 || $('#P_TITLE').val() === "") {
				alert("제목을 입력하세요");
				$('#P_TITLE').focus();
				return false;
				P_PRICE
			}
			if ($('#P_PRICE').val().length == 0 || $('#P_PRICE').val() === "") {
				alert("가격을 입력하세요");
				$('#P_PRICE').focus();
				return false;
			}
			if ($('#P_CONTENT').val().length == 0
					|| $('#P_CONTENT').val() === "") {
				alert("내용을 입력하세요");
				$('#P_CONTENT').focus();
				return false;
			}
			return true;
		}
	</script>
	<script type="text/javascript">
		const input = document.querySelector('#P_PRICE');
		input.addEventListener('keyup', function(e) {
			let value = e.target.value;
			value = Number(value.replaceAll(',', ''));
			if (isNaN(value)) {
				input.value = 0;
			} else {
				const formatValue = value.toLocaleString('ko-KR');
				input.value = formatValue;
			}
		})
	</script>

</body>
</html>
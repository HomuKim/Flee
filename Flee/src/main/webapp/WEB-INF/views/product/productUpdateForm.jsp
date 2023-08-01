<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>

</head>

<body>
	<form action="./productUpdate.fe" enctype="multipart/form-data"
		method="post" onSubmit="return submitCheck();">
		<div class="sub_visual">
			<div class="wrap">
				<strong>수정하시오!̆̈</strong>
				<p>작성글을 수정해요.</p>
			</div>
		</div>
		<section id="profileupdate">
			<div class="wrap clearfix">
				<div class="p_title">
					<c:if test="${empty P_ID }">
						<h2>글작성</h2>
					</c:if>
					<c:if test="${!empty P_ID}">
						<h2>글수정</h2>
					</c:if>
					<p>허위 게시글 작성시 서비스 이용에 제한을 받을 수 있습니다.</p>
				</div>

				<div class="sell2">
					<div class="p_left">
						<h3>종류</h3>
					</div>
					<div>
						<ul class="sellcheck">
							<li><c:if test="${proMap.P_ITEM eq '1' }">
									<c:set var="item" value="상품" />
								</c:if> <c:if test="${proMap.P_ITEM eq '0' }">
									<c:set var="item" value="서비스" />
								</c:if> ${item}</li>
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
								<ul class="locdrop2">
									<li>${proMap.P_AREA}</li>
								</ul>
							</div>
						</li>
						<li>
							<div class="p_cate">
								<ul class="pdrop2">
									<c:if test="${proMap.P_CATEGORY eq '1' }">
										<c:set target="${proMap}" property="P_CATEGORY" value="패션" />
									</c:if>
									<c:if test="${proMap.P_CATEGORY eq '2' }">
										<c:set target="${proMap}" property="P_CATEGORY" value="뷰티" />
									</c:if>
									<c:if test="${proMap.P_CATEGORY eq '3' }">
										<c:set target="${proMap}" property="P_CATEGORY" value="전자기기" />
									</c:if>
									<c:if test="${proMap.P_CATEGORY eq '4' }">
										<c:set target="${proMap}" property="P_CATEGORY" value="그림" />
									</c:if>
									<c:if test="${proMap.P_CATEGORY eq '5' }">
										<c:set target="${proMap}" property="P_CATEGORY" value="운동" />
									</c:if>
									<c:if test="${proMap.P_CATEGORY eq '6' }">
										<c:set target="${proMap}" property="P_CATEGORY" value="공부" />
									</c:if>
									<c:if test="${proMap.P_CATEGORY eq '7' }">
										<c:set target="${proMap}" property="P_CATEGORY" value="영화" />
									</c:if>
									<c:if test="${proMap.P_CATEGORY eq '8' }">
										<c:set target="${proMap}" property="P_CATEGORY" value="동물" />
									</c:if>
									<li>${proMap.P_CATEGORY}</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<div class="pwrite_b">
					<div class="p_point">
						<input type="hidden" name="P_ID" value="${proMap.P_ID}"> <input
							type="hidden" name="M_NICKNAME" value="${sessionScope.NICKNAME}">
						<div class="p_text">
							<h4>제목</h4>
							<input type="text"
								style="width: 68%; height: 20px; border-width: 1px;"
								name="P_TITLE" id="P_TITLE" maxlength="150"
								value="${proMap.P_TITLE}">
						</div>
						<div class="p_pay" style="display: inline-block;">
							<h4>가격</h4>
							<input type="text"
								style="width: 30%; height: 20px; border-width: 1px;"
								name="P_PRICE" id="P_PRICE" maxlength="150"
								value="${proMap.P_PRICE}">
						</div>
						<div class="p_img" id="p_img" style="margin-top: 30px;">
							<h4>
								메인이미지 수정하기<i class="fa-solid fa-star"></i>
							</h4>
							<input
								style="width: 52%; height: 30px; float: left; border-style: none;"
								type="file" name="P_IMAGE" id="P_IMAGE" accept="image/*"
								onchange="readURL(this);" />
							<div class="imgbox">
								<div class="imgplus"></div>
								<div class="imglist">
									<div class="i_imgex">
										<span>이미지 미리보기</span> <a class="addfile" href="#this"
											id="addFile">상세 이미지추가</a>
									</div>
									<div class="borderb">
										<ul class="imglist2" id="imglistid">
											<c:forEach var="row" items="${list}" varStatus="var">
												<c:if test="${row.S_FILE_NAME eq proMap.P_IMAGE}">
													<li><input type="hidden" id="I_IDX"
														name="I_IDX_${var.index}" value="${row.I_IDX}"><img
														src="img/${row.S_FILE_NAME}" id="p_img2"
														onerror="this.src='images/common/noimage.jpg'"> <input
														type="file" id="file_${var.index }" style="display: none;"
														name="file_${var.index}"><a><i
															style="color: #d49c04;" class="fa-solid fa-star"></i></a></li>
												</c:if>
												<c:if test="${row.S_FILE_NAME != proMap.P_IMAGE}">
													<li><input type="hidden" id="I_IDX"
														name="I_IDX_${var.index}" value="${row.I_IDX}"><img
														src="img/${row.S_FILE_NAME}"
														onerror="this.src='images/common/noimage.jpg'"> <input
														type="file" id="file_${var.index }" style="display: none;"
														name="file_${var.index}"> <a href="#this"
														class="btn" id="delete_${var.index}"
														name="delete_${var.index}"><i
															class="fa-solid fa-xmark"></i></a></li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="p_content">
						<h4>상품상세설명</h4>
						<textarea id="P_CONTENT" style="width: 90%;" rows=20
							name="P_CONTENT" maxlength="1000">${proMap.P_CONTENT}</textarea>
					</div>
					<div class="updatebtn">
						<button class="probtn" type=submit>수정</button>
						<button class="canclepro" type=button
							onClick="javascript:history.go(-1);">취소</button>
						<button class="deletepro" type=button
							onClick="fn_deleteProduct();">삭제</button>
					</div>
				</div>
			</div>
		</section>
	</form>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-footer.jspf"%>
	<script type="text/javascript">
		var gfv_count = 1;
		$(document).ready(function() {
			$("#addFile").on("click", function(e) { //파일추가하기 버튼
				e.preventDefault();
				fn_addFile();
			});
			$("a[name^='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});
		function fn_deleteProduct() { //게시글 삭제

			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/productDelete.fe'/>");
			comSubmit.addParam("P_ID", "${proMap.P_ID}");
			comSubmit.addParam("P_SELLBUY", "${proMap.P_SELLBUY}");
			comSubmit.addParam("P_AREA", "${proMap.P_AREA}");
			comSubmit.addParam("P_ITEM", "${proMap.P_ITEM}");
			comSubmit.submit();

		}
		function fn_addFile() {
			var str = "<p style='padding-right:20px;'>"
					+ "<input type='file' id='file_" + (gfv_count++)
					+ "' name='nfile_" + (gfv_count++)
					+ "' onChange='readImg(this);'>"
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
					document.getElementById('p_img2').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
				document.getElementById('p_img2').parentElement.querySelector(
						"input").remove();
			} else {
				document.getElementById('p_img2').src = "";
			}
		}
		var count = 0;
		function readImg(input) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					const list = document.createElement("li");
					const preview = document.createElement("img");
					const del = document.createElement("a");
					const icon = document.createElement("i");
					icon.className = "fa-solid fa-xmark";
					del.href = "#this";
					del.name = "delete" + count++;
					del.className = "btn";
					preview.src = e.target.result;
					del.appendChild(icon);
					del.addEventListener("click", function(e) {
						e.preventDefault();
						fn_deleteFile($(this));
					});
					list.appendChild(preview);
					list.appendChild(del);
					document.getElementById("imglistid").appendChild(list);

				};
				reader.readAsDataURL(input.files[0]);
			} else {
			}
		}
	</script>
	<script>
		function submitCheck() {
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

</body>
</html>
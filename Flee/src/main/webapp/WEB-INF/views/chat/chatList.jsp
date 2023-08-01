<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 리스트</title>
<script src=<c:url value='/js/common.js'/>></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/chat.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
<script src=<c:url value='/js/jquery-1.12.4.min.js'/>></script>
<script src=<c:url value='/js/common.js'/>></script>
<script src="https://kit.fontawesome.com/41c6b11e7f.js"
	crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="wrap">
		<section id="chat">
			<div class="chatlist1">
				<div class="chattitle">
					<h3>채팅 내역</h3>
				</div>

				<ul class="chatli">

				</ul>
			</div>
			<div class="abchat">
				<div class="mslist">
					<div id="messages"></div>
				</div>
			</div>


		</section>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script>
		function scroll() {
			const sc = document.querySelector("#chatMessageArea");

			const eh = sc.clientHeight + sc.scrollTop;

			// 요소가 추가 되기 전에 비교
			const isScroll = sc.scrollHeight <= eh;

			// 스크롤이 최하단 일때만 고정
			sc.scrollTop = sc.scrollHeight;
		}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {

			fn_selectChatList(1); /* 1페이지 */

			$(".chatli").on("click", "li .linner", function(e) {
				e.preventDefault();

				fn_openMessage($(this));

				$( ".abchat" ).addClass( "on" );
				
			});
			
		
			

			
		});
		
		$(".chatheader").on("click", function(e) {
			$( ".abchat" ).removeClass( "on" );
		});
		function fn_openMessage(obj) {

			let messageUL = $("#messages");
			let croomidx = obj.parent().find("input[name=CROOM_IDX]").val();

			let str = "";

			/* 채팅방 가지고 오는 메소드 message.js에서 list로 메시지 리스트를, lastMessage로 그 방번호에 해당하는 마지막 테이블을 가지고 옵니다*/
			chatService
					.getMessageList(
							{
								croomidx : croomidx
							},
							function(list, lastMessage) {

								str += "<div class='chatheader'>"
										+ "<ul>"
										+ "<li>"
										+ "<img class='p_img' src='img/image-"
										+ lastMessage.chatMember.M_IMAGE
										+ ".jpg' alt='이미지' onerror=\"this.src='images/contents/profile_image.webp'\" >"
										+ "</li>"
										+ "<li>"
										+ "<h4>"
										+ lastMessage.chatMember.M_NICKNAME
										+ "</h4>"
										+ "</li>"
										+ "<li>"
										+ "<a href=\"<c:url value='/chatList.fe?M_NICKNAME=${sessionScope.NICKNAME}'/>\">뒤로가기</a> "
										+ "</li>"
										+ "</ul>"
										+ "</div>"
										+ "<div id='chatArea'><div id='chatMessageArea'>";

								for (var i = 0, len = list.length || 0; i < len; i++) {
									let nickname = "";
									str += "<ul class='send2'>" + "<li>";
									if (list[i].SEND_NICKNAME === '${sessionScope.NICKNAME}') {
										nickname = "sendnick2";
									} else {
										nickname = "sendnick";
									}
									str += "<div class='" + nickname + "' >"
											+ "<p class='readck'>";
									if (parseInt(list[i].READCHECK) == 1) {
										str += list[i].READCHECK + "</p>";
									} else {
										str += "</p>";
									}
									if (i == 0) {
										str += "<span class='sendinner' >"
											 + "<a href='"+list[0].MES_CONTENT+'${sessionScope.NICKNAME}'+"'>"
												+ "<div class='box'>"
												+ "<i class='fa-solid fa-right-to-bracket'></i>"
												+ "<strong>게시글보러가기&nbsp;></strong>"
												+ "</div>" + "</a>"

												+ "</span>" + "</div>"
												+ "</li>";

									} else {
										str += "<span class='sendinner' >"
												+ list[i].MES_CONTENT
												+ "</span>" + "</div>"
												+ "</li>";

									}
								}
								str += "</div><br/>"
										+ "<div class='chattext'>"
										+ "<textarea class='ctextarea' maxlength='100' id='message'></textarea>"
										+ "<input class='cbtn' type='button' id='sendBtn' value='전송 '/>"
										+ "<input type='hidden' id='SEND_NICKNAME' value='"+lastMessage.SEND_NICKNAME+"' />"
										+ "<input type='hidden' id='RECV_NICKNAME' value='"+lastMessage.RECV_NICKNAME+"' />"
										+ "<input type='hidden' id='CROOM_IDX' name='CROOM_IDX' value='"+lastMessage.CROOM_IDX+"' />"
										+ "</div>"
										/* 마지막 메시지에 해당하는 SEND_NICKNAME, RECV_NICKNAME을 가지고 옵니다. */
										+ "</div>";
								fn_selectChatList();
								messageUL.html(str);
								scroll();
							});
		}

		/* 채팅방 관련 (WEBSOCKET) 메소드 */
		var wsocket;

		function disconnect() {
			wsocket.close();
		}
		function onOpen(evt) {

		}
		function onMessage(evt) {
			var data = evt.data;
			if (data.substring(0, 4) == "msg:") {
				appendMessage(data.substring(4));
			}
		}
		function onClose(evt) {
			appendMessage("연결을 끊었습니다.");
		}

		function send(obj) {
			var nickname = '${sessionScope.NICKNAME}';
			var msg = $("#message").val();

			$("#message").val("");

			if ('${sessionScope.NICKNAME}' === $("#RECV_NICKNAME").val()) {
				var recvnickname = $("#SEND_NICKNAME").val();
			} else {
				var recvnickname = $("#RECV_NICKNAME").val();
			}
			/* 마지막 메시지에서 RECV_NICKNAME이 현재 로그인한 닉네임과 같다면 데이터를 보낼때의 RECV_NICKNAME을 마지막 메시지의 SEND_NICKNAME으로 바꾼다. */

			/* 채팅창에서 실시간 채팅을 보이게 하는 부분. 일단 채팅하면 무조건 1을 보이게 한다. 어쩌면 수정 필요할수도*/
			var message = {
				SEND_NICKNAME : nickname, /* 보내는 닉네임은 무조건 로그인한 사람의 닉네임 */
				RECV_NICKNAME : recvnickname,
				MES_CONTENT : msg,
				CROOM_IDX : $("#CROOM_IDX").val()
			};
			/* 		메시지 입력하는 메소드입니다. (무조건 테이블 하나 만드는 쿼리이므로 create로 설정했습니다.) 
			 처음 대화방 만들때도 chatroom이랑 message테이블이 동시에 만들어지도록 설정했습니다. */
			chatService.create(message, function(result) {
				fn_selectChatList();
				fn_openMessage(obj);
			});
		}

		wsocket = new WebSocket("ws://localhost:8000/Flee/chat-ws");

		$('#message').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				send();
			}
			event.stopPropagation();
		});
		$('#messages').on("click", "#sendBtn", function() {
			send($(this));
		});
		$('#exitBtn').click(function() {
			disconnect();
		});

		/* 흔한개발자 보고 따라했습니다. Ajax로 페이징 하는 용도 */
		function fn_selectChatList() {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='selectChatList.fe' />");
			comAjax.setCallback("fn_selectChatListCallback");
			comAjax.addParam("M_NICKNAME", '${sessionScope.NICKNAME}');
			comAjax.ajax();
		}

		function fn_selectChatListCallback(data) {
			var total = data.TOTAL;
			var body = $(".chatli");

			body.empty();
			if (total == 0) {
				var str = "<li class='chatname'>" + "<h4 style='font-weight:300;text-align:center;'>생성된 채팅방이 없습니다.</h4>"
						+ "</li>";
				body.html(str);
			} else {

				var str = "";
				$
						.each(
								data.list,
								function(key, value) {
									str += "<li class='chatname'>"
											+ "<div class='linner'>"
											+ "<div class='chatimg'>"
											+ "<img class='p_img' src='img/image-"
											+ value.chatMember.M_IMAGE
											+ ".jpg' alt='이미지' onerror=\"this.src='images/contents/profile_image.webp'\">"
											+ "</div>"
											+ "<strong class='cname'> "
											+ value.chatMember.M_NICKNAME
											+ "</strong>";
									if (value.check) {
										str += "<span>"
												+ "<i class='fa-solid fa-n'></i>"
												+ "</span>";
									}
									str += "<ul class='chattext'>"
											+ "<li>"
											+ value.lastMessage
											+ "</li>"
											+ "<li>"
											+ chatService
													.displayTime(value.CROOM_DATE)
											+ "</li>"
											+ "</ul>"
											+ "<input type='hidden' name='CROOM_IDX' id='CROOMIDX' value='" + value.CROOM_IDX +"'/>"
											+ "</div>" + "</li>";
								});
				body.html(str);

			}
		}
	</script>
	<script type="text/javascript" src="<c:url value='/js/message.js'/>"></script>


</body>
<%@ include file="/WEB-INF/include/include-footer.jspf"%>
<script src="<c:url value='/js/common 2.js'/>"></script>
</html>
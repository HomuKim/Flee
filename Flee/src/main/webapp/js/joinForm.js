$(document).ready(function(){
	$('#NAME').keyup(function(){
		if($(this).val().length==0){
			$('#NAMEW').text(" 이름 입력");
			$('#NAMEW').css("color","red");
			$('#NAMEW').css("font-size","9pt");
			$('#NAMEW').css("font-weight","bold");		
		}else{		
			$('#NAMEW').text("");		
		}	
	});
	
	$('#EMAIL').keyup(function(){
		if($(this).val().length==0){
			$('#EMAILLABEL').text(" 이메일 아이디 입력");
			$('#EMAILLABEL').css("color","red");
			$('#EMAILLABEL').css("font-size","9pt");
			$('#EMAILLABEL').css("font-weight","bold");		
		}		
	});
	
	$('#PASSWORD').keyup(function(){
		if($(this).val().length==0){
			$('#PASSWORDW').text(" 비밀번호 입력");
			$('#PASSWORDW').css("color","red");
			$('#PASSWORDW').css("font-size","9pt");
			$('#PASSWORDW').css("font-weight","bold");		
		}else	{	
			$('#PASSWORDW').text("");
			$(this).attr("check", "1");
		}	
		if($('#PASSWORD2').val().length>0){
			 if($(this).val()!=$('#PASSWORD2').val()){
				 $('#PASSWORDW2').text(" 비밀번호가 틀립니다");
				 $('#PASSWORDW2').css("color","red");
				 $('#PASSWORDW2').css("font-size","9pt");
				 $('#PASSWORDW2').css("font-weight","bold");
			 }else{
				 $('#PASSWORDW2').text("");
			 }
		}
		if($(this).val().length>0){
			if(!($(this).val().match(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/))){
				$('#PASSWORDW').text(" 최소 8자 이상 숫자, 문자, 특수문자 각각 1개 이상 포함");
				$('#PASSWORDW').css("color","red");
				$('#PASSWORDW').css("font-size","9pt");
				$('#PASSWORDW').css("font-weight","bold");
				$(this).attr("check", "0");	
			}else{
				$('#PASSWORDW').text("");
			}
		}
	});
	
	$('#M_NICKNAME').keyup(function(){
		if($(this).val().length<2){
			$('#NICKW').text(" 닉네임 2자 이상 입력");
			$('#NICKW').css("color","red");
			$('#NICKW').css("font-size","9pt");
			$('#NICKW').css("font-weight","bold");		
		}	
	});
	
	$('#sample6_postcode,#sample6_address').keyup(function(){
		if($(this).val().length==0){
			$('#ADDRW1').text(" 주소 입력");
			$('#ADDRW1').css("color","red");
			$('#ADDRW1').css("font-size","9pt");
			$('#ADDRW1').css("font-weight","bold");		
		}else{		
			$('#ADDRW1').text("");		
		}	
	});
	
	
	$('#PASSWORD2').keyup(function(){
		if($('#PASSWORD').val()==""&&$(this).val().length>0){
			$('#PASSWORDW2').text(" 비밀번호를 입력해주세요");
			$('#PASSWORDW2').css("color","red");
			$('#PASSWORDW2').css("font-size","9pt");
			$('#PASSWORDW2').css("font-weight","bold");
		}else if($(this).val()!=$('#PASSWORD').val()){
			$('#PASSWORDW2').text(" 비밀번호가 틀립니다");
			$('#PASSWORDW2').css("color","red");
			$('#PASSWORDW2').css("font-size","9pt");
			$('#PASSWORDW2').css("font-weight","bold");		
		}else if($(this).val()===$('#PASSWORD').val()){		
			$('#PASSWORDW2').text(" 비밀번호 일치 ");
			$('#PASSWORDW2').css("color", "green");
			$('#PASSWORDW2').css("font-size", "9pt");
			$('#PASSWORDW2').css("font-weight", "bold");
	}
	});
	$('#JUMIN1').keyup(function(){
		if($(this).val().length==0){
			$('#JUMINW').text(" 주민번호 앞자리 입력");
			$('#JUMINW').css("color","red");
			$('#JUMINW').css("font-size","9pt");
			$('#JUMINW').css("font-weight","bold");		
		}else{		
			if(!($(this).val().match(/^\\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|[3][01])/))){
				$('#JUMINW').text(" 주민번호 앞자리 6자리 입력");
				$('#JUMINW').css("color","red");
				$('#JUMINW').css("font-size","9pt");
				$('#JUMINW').css("font-weight","bold");
			}else{
				$('#JUMINW').text("");
			}		
		}	
	});
	
	$('#JUMIN2').keyup(function(){
		if($(this).val().length==0){
			$('#JUMINW').text(" 주민번호 뒷자리 입력");
			$('#JUMINW').css("color","red");
			$('#JUMINW').css("font-size","9pt");
			$('#JUMINW').css("font-weight","bold");		
		}else{		
			if(!($(this).val().match(/[1-4][0-9]{6}/))){
				$('#JUMINW').text(" 주민번호 뒷자리 7자리 입력");
				$('#JUMINW').css("color","red");
				$('#JUMINW').css("font-size","9pt");
				$('#JUMINW').css("font-weight","bold");
			}else{
				$('#JUMINW').text("");
			}		
		}	
	});
	
	$('#PHONE').keyup(function(){
		if($(this).val().length==0){
			$('#PHONEW').text(" 번호 입력");
			$('#PHONEW').css("color","red");
			$('#PHONEW').css("font-size","9pt");
			$('#PHONEW').css("font-weight","bold");		
		}else{	
			$('#PHONEW').text("");		
			$('#PHONE').attr("check", "1");
		}	
		if($(this).val().length>0){
			if(!($(this).val().match(/^[0-9]*$/))){
				$('#PHONE').attr("check", "0");
				$('#PHONEW').text(" 숫자만 입력");
				$('#PHONEW').css("color","red");
				$('#PHONEW').css("font-size","9pt");
				$('#PHONEW').css("font-weight","bold");	
			}
		}
	});
});






function submit_ck(){
	if($('#EMAIL').val().length==0){
		$('#EMAILLABEL').text(" 이메일 아이디 입력");
		$('#EMAILLABEL').css("color","red");
		$('#EMAILLABEL').css("font-size","9pt");
		$('#EMAILLABEL').css("font-weight","bold");
		$('#EMAIL').focus();
	}else if($('#PASSWORD').val().length==0){
		$('#PASSWORDW').text(" 비밀번호 입력");
		$('#PASSWORDW').css("color","red");
		$('#PASSWORDW').css("font-size","9pt");
		$('#PASSWORDW').css("font-weight","bold");
		$('#PASSWORD').focus();
	}else if($('#PASSWORD2').val().length==0){
		$('#PASSWORDW2').text(" 비밀번호확인 입력");
		$('#PASSWORDW2').css("color","red");
		$('#PASSWORDW2').css("font-size","9pt");
		$('#PASSWORDW2').css("font-weight","bold");
		$('#PASSWORD2').focus();
	}else if($('#M_NICKNAME').val().length==0){
		$('#NICKW').text(" 닉네임 입력");
		$('#NICKW').css("color","red");
		$('#NICKW').css("font-size","9pt");
		$('#NICKW').css("font-weight","bold");
		$('#M_NICKNAME').focus();
	}else if($('#NAME').val().length==0){
		$('#NAMEW').text(" 이름 입력");
		$('#NAMEW').css("color","red");
		$('#NAMEW').css("font-size","9pt");
		$('#NAMEW').css("font-weight","bold");
		$('#NAME').focus();
	}else if($('#JUMIN1').val().length==0 || $('#JUMIN2').val().length==0){
		$('#JUMINW').text(" 주민번호 입력");
		$('#JUMINW').css("color","red");
		$('#JUMINW').css("font-size","9pt");
		$('#JUMINW').css("font-weight","bold");
		$('#JUMIN1').focus();
	}else if($('#PHONE').val().length==0){
		$('#PHONEW').text(" 번호 입력");
		$('#PHONEW').css("color","red");
		$('#PHONEW').css("font-size","9pt");
		$('#PHONEW').css("font-weight","bold");
		$('#PHONE').focus();
	}else if($('#sample6_postcode').val().length==0 ||$('#sample6_address').val().length==0 ){
		$('#ADDRW1').text(" 주소 입력");
		$('#ADDRW1').css("color","red");
		$('#ADDRW1').css("font-size","9pt");
		$('#ADDRW1').css("font-weight","bold");
		$('#sample6_postcode').focus();
	}else if($('#PASSWORD2').val()!=$('#PASSWORD').val()){
		$('#PASSWORD2').focus();
	}else if($('#EMAIL').attr("check")=="0"){
		$('#EMAIL').focus();
	}else if($('#PASSWORD').attr("check")=="0"){
		$('#PASSWORD').focus();
	}else if($('M_NICKNAME').attr("check")=="0"){
		$('#M_NICKNAME').focus();
	}else if($('#PHONE').attr("check")=="0"){
		$('#PHONE').focus();
	}else if($('#checkcnt').val() < 2){
			$('#CHECKCNTW').text(" 2개 이상 선택해주세요");
			$('#CHECKCNTW').css("color","red");
			$('#CHECKCNTW').css("font-size","9pt");
			$('#CHECKCNTW').css("font-weight","bold");	
			$('#FASHION').focus();
	}else{
		$('#writeForm').submit();
		alert("가입완료!");
		}
		
		
		
		
		
}
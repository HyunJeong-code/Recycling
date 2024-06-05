<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	// 이름
	$("#mgrName").blur(function() {
		if($("#mgrName").val() == '') {
			$("#name").css("display", "block");
		} else {
			$("#name").css("display", "none");			
		}
	})
	
	// 핸드폰 번호
	$("#sPhone").blur(function() {
		if($("#sPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	// 핸드폰 번호 직접 입력
	$("#inPhone").hide();
	
	$("#sPhone").change(function() {
		if($("#sPhone").val() === "in") {
			$("#inPhone").show();		
			$("#sPhone").hide();		
		} else {
			$("#inPhone").hide();				
			$("#sPhone").show();		
		}		
	})
	
	$("#sPhone").blur(function() {
		if($("#sPhone").val() === 'in' && $("#inPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	$("#mPhone").blur(function() {
		if($("#sPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	$("#lPhone").blur(function() {
		if($("#sPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	// 이메일
	$("#mgrEmail").blur(function() {
		if($("#mgrEmail").val() == '') {
			$("#email").css("display", "block");	
		} else {
			$("#email").css("display", "none");
		}
	})
	
	// 이메일 직접 입력
	$("#inEmail").hide();
	
	$("#mgrEmail2").change(function() {
		if($("#mgrEmail2").val() === "in") {
			$("#inEmail").show();
			$("#mgrEmail2").hide();
		} else {
			$("#inEmail").hide();
			$("#mgrEmail2").show();
		}
	})
	
	$("#mgrEmail2").blur(function() {
		if($("#mgrEmail2").val() == '') {
			$("#email").css("display", "block");				
		} else {
			$("#email").css("display", "none");			
		}
	})
	
	$("#mgrEmail2").blur(function() {
		if($("#mgrEmail2").val() === 'in' || $("#inEmail").val() == '') {
			$("#email").css("display", "block");				
		} else {
			$("#email").css("display", "none");			
		}
	})
	
	$("#btnEmail").click(function() {
		var email = $('#mgrEmail').val() + $('#mgrEmail2').val();
		console.log("이메일 : " + email);
		var emailNum = $("#emailNum")
		
		$.ajax({
			type: 'post',
			url : './EmailAuth',
			data: {email : email},
			dataType: 'json',
			success: function(res) {
				console.log("res : " + res);
				$("#emailChk").css("display", "block");
				num = res;
				alert("인증번호가 발송되었습니다. 입력하신 메일의 메일함을 확인해주세요.");
			}
		}) // End Ajax
	}) // End 이메일 인증
	
	$("#emailNum").focusout(function() {
		var inputNum = $("#emailNum").val();
		
		console.log("입력 인증 번호 : " + inputNum);
		console.log("전송 인증 번호 : " + num);
		
		if(Number(inputNum) === num) {
			$("#emailOk").css("display", "block");
			$("#bEmail").css("disabled", "true");
			$("#bEmail2").css("disabled", "true");
			$("#btnEmail").css("disabled", "true");
			$("#emailNo").css("display", "none");			
		} else {
			$("#emailNo").css("display", "block");			
			$("#emailOk").css("display", "none");			
		}
	})
	
}) // End Jquery
</script>
</head>
<body>

<div class="full">
	<div class=wrap>
		<div class="page">
			<h3>아이디 찾기</h3>
		</div>
		
		<div class="section">
			<form action="./findid" method="post">
				<div>
					<label for="mgrName">이름</label>
					<input type="text" id="mgrName" name="mgrName"><br>
					<div id="name" >이름을 입력해주세요.</div>
					
					<label for="mgrPhone">핸드폰 번호</label>
					<input type="text" id="mgrPhone" name="mgrPhone">-<input type="text" id="mPhone" name="mPhone">-<input type="text" id="lPhone" name="lPhone">
					<br>
				</div>
				
				<div>
				<label for="mgrEmail">이메일</label>
				<input type="text" id="mgrEmail" name="mgrEmail">
				
				<select class="mgrEmail2" name="mgrEmail2" id="mgrEmail2">
					<option>@naver.com</option>
					<option>@gmail.com</option>
					<option>@daum.net</option>
				</select>
				<input type="button" id="btnEmail" value="이메일 인증">
				</div>
				
				<div id="emailChk" style="display: none;">
					<label for="emailNum">이메일 인증 번호</label>
					<input type="text" id="emailNum" name="emailNum" placeholder="인증번호 6자리를 입력해주세요.">
					<div id="emailOk" style="color: green; display: none;">
						인증번호가 일치합니다.
					</div>
					<div id="emailNo" style="color: red; display: none;">
						인증번호가 불일치합니다. 다시 입력해주세요.
					</div>
				</div>
				
				<button>아이디 찾기</button>
			</form>
		</div>
	</div>
</div>

</body>
</html>
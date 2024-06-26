<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
	// VS Code 테스트
$(function() {
	$("#btnEmail").click(function() {
		var email = $('#bEmail').val() + $('#bEmail2').val();
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
			<h3>비밀번호 찾기</h3>
		</div>
		
		<div class="section">
			<form action="./findpw" method="post">
				<div>
					<label for="bId">아이디</label>
					<input type="text" id="bId" name="bId"><br>
					
					<label for="bName">이름</label>
					<input type="text" id="bName" name="bName"><br>
					
					<label for="bPhone">핸드폰 번호</label>
					<input type="text" id="bPhone" name="bPhone">-<input type="text" id="mPhone" name="mPhone">-<input type="text" id="lPhone" name="lPhone">
					<br>
				</div>
				
				<div>
				<label for="bEmail">이메일</label>
				<input type="text" id="bEmail" name="bEmail">
				
				<select class="bEmail2" name="bEmail2" id="bEmail2">
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
				
				<button>비밀번호 찾기</button>
				
			</form>
		</div>
	</div>
</div>
</body>
</html>
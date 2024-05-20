<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	
	$("#inEmail").hide();
	
	$("#mgrEmail2").change(function() {
		if($("#mgrEmail2").val() === "in") {
			$("#inEmail").show();
		} else {
			$("#inEmail").hide();
		}
	})
	
	$("#btnEmail").click(function() {
		var selMail = "";
		
		if($("#mgrEmail2").val() === "in") {
			selMail = $("#inEmail").val();
		} else {
			selMail = $("#mgrEmail2").val();
		}
		var email = $("#mgrEmail").val() + selMail;
		console.log("MGR 이메일 : " + email);
		var emailNum = $("#emailNum").val();
		
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
	<div class="wrap">
		<div class="page">
		<h3>회원가입</h3>
		</div>
		
		<div class="section">
		
		<form action="./join" method="post">
			<div>
				<label for="mgrCode">사원 번호</label>	
				<input type="text" id="mgrCode" name="mgrCode"><br>
			
				<label for="mgrId">아이디</label>
				<input type="text" id="mgrId" name="mgrId"><br>
				
				<label for="mgrPw">비밀번호</label>	
				<input type="text" id="mgrPw" name="mgrPw"><br>
				
				<label for="chkMgrPw">비밀번호 확인</label>	
				<input type="text" id="chkMgrPw" name="chkMgrPw"><br>
				
				<label for="mgrName">이름</label>	
				<input type="text" id="mgrName" name="mgrName"><br>
				
				<label for="mgrPhone">핸드폰 번호</label>	
				<input type="text" id="mgrPhone" name="mgrPhone"><br>
			</div>

			<div>
				<label for="mgrEmail">이메일</label>	
				<input type="text" id="mgrEmail" name="mgrEmail">
				
				<select class="mgrEmail2" name="mgrEmail2" id="mgrEmail2">
					<option>@naver.com</option>
					<option>@gmail.com</option>
					<option>@daum.net</option>
					<option value="in">직접 입력</option>
				</select>
				<input type="text" id="inEmail" name="inEmail" placeholder="@test.com 형식으로 입력하세요.">
				<input type="button" id="btnEmail" value="이메일 인증">
				
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
			</div>
			
			<button>가입하기</button>
			<button><a href="./main">취소하기</a></button>
		</form>
		</div>
	</div>
</div>

</body>
</html>
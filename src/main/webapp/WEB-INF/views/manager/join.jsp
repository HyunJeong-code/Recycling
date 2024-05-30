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
			$("#mgrEmail2").hide();
		} else {
			$("#inEmail").hide();
			$("#mgrEmail2").show();
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
		
		<div>
			<p>회원가입 시, 유의 사항</p>
			<div>
				1. 입사 확정을 안내받은 합격자만 회원가입이 가능합니다.<br>
				
				2. 회원가입 안내 사항은 인사팀에서 안내합니다. 인사팀 안내 가이드에 따라 회원가입 부탁드립니다.<br>		
				2 - 1. 인사팀에서 인사등록 후, '사원 번호'를 안내받은 합격자만 회원가입을 할 수 있습니다.<br>
				2 - 2. 인사팀의 제출한 내용과 회원 가입 시 작성 내용이 동일해야 회원가입이 성공적으로 진행됩니다.<br>
				
				3. 회원가입 시, 모든 입력 사항을 필수입니다.<br>
				<br>
				<br>
				<br> 
			</div>
		</div>
		
		<form action="./join" method="post" enctype="multipart/form-data">
			<div>
				<label for="mgrProf">사원증</label>
				<input type="file" id="mgrProf" name="mgrProf" required="required">
			</div>
		
			<div>
				<label for="mgrCode">사원 번호</label>	
				<input type="text" id="mgrCode" name="mgrCode" required="required"><br>
				
				<label for="deptno">부서</label>
				<select class="deptno" id="deptno" name="deptno" required="required">
					<option value="20">인사팀</option>
					<option value="30">판매제휴팀</option>
					<option value="40">구매CS팀</option>					
				</select><br>			
			
				<label for="mgrId">아이디</label>
				<input type="text" id="mgrId" name="mgrId" required="required"><br>
				
				<label for="mgrPw">비밀번호</label>	
				<input type="text" id="mgrPw" name="mgrPw" required="required"><br>
				
				<label for="chkMgrPw">비밀번호 확인</label>	
				<input type="text" id="chkMgrPw" name="chkMgrPw" required="required"><br>
				
				<label for="mgrName">이름</label>	
				<input type="text" id="mgrName" name="mgrName" required="required"><br>
				
				<label for="sPhone">핸드폰 번호</label>
				<select class="sPhone" id="sPhone" name="sPhone" required="required">
					<option>010</option>
					<option>011</option>
					<option>017</option>
					<option>016</option>
					<option value="in">직접 입력</option>
				</select>
				<input type="text" id="inPhone" name="inPhone">-<input type="text" id="mPhone" name="mPhone" required="required">-<input type="text" id="lPhone" name="lPhone" required="required"><br>
				
				<label for="mgrBirth">생년월일</label>
				<input type="date" id="mgrBirth" name="mgrBirth" required="required"><br>
				
				<label for="mgrGender">성별</label>
				<select class="mgrGender" id="mgrGender" name="mgrGender" required="required">
					<option value="W">여성</option>
					<option value="M">남성</option>
				</select>
			</div>

			<div>
				<label for="mgrEmail">이메일</label>	
				<input type="text" id="mgrEmail" name="mgrEmail" required="required">
				
				<select class="mgrEmail2" name="mgrEmail2" id="mgrEmail2" required="required">
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
			<button><a href="/manager/main">취소하기</a></button>
		</form>
		</div>
	</div>
</div>

</body>
</html>
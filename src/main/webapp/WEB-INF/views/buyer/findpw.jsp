<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	
	// 아이디
	$("#bId").blur(function() {
		if($("#bId").val() == '') {
			$("#id").css("display", "block");
		} else {
			$("#id").css("display", "none");
		}
	})
	
	// 이름
	$("#bName").blur(function() {
		if($("#bName").val() == '') {
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
	$("#bEmail").blur(function() {
		if($("#bEmail").val() == '') {
			$("#email").css("display", "block");	
		} else {
			$("#email").css("display", "none");
		}
	})
	
	// 이메일 직접 입력
	$("#inEmail").hide();
	
	$("#bEmail2").change(function() {
		if($("#bEmail2").val() === "in") {
			$("#inEmail").show();
			$("#bEmail2").hide();
		} else {
			$("#inEmail").hide();
			$("#bEmail2").show();
		}
	})
	
	$("#bEmail2").blur(function() {
		if($("#bEmail2").val() == '') {
			$("#email").css("display", "block");				
		} else {
			$("#email").css("display", "none");			
		}
	})
	
	$("#bEmail2").blur(function() {
		if($("#bEmail2").val() === 'in' || $("#inEmail").val() == '') {
			$("#email").css("display", "block");				
		} else {
			$("#email").css("display", "none");			
		}
	})
	
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
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
	<div class=wrap>
		<div class="page">
			<h3>비밀번호 찾기</h3>
		</div>
		
		<div class="section">
			<form action="./findpw" method="post">
			
				<label for="bId">아이디</label>
				<input type="text" id="bId" name="bId">
				<input type="button" id="chkBid" value="중복 확인"><br>
				<div id="id" style="display:none; color:red;">아이디는 필수입니다.</div>
				<div id="chkId" style="display:none; color:red;">아이디는 영어소문자와 숫자로 8자리 ~ 15자리로 입력 필요</div>
				
				<div id="email">
					<label for="bEmail">이메일</label>
					<input type="text" id="bEmail" name="bEmail">
					
					<select class="bEmail2" name="bEmail2" id="bEmail2">
						<option>@naver.com</option>
						<option>@gmail.com</option>
						<option>@daum.net</option>
						<option value="in">직접 입력</option>
					</select>
					<input type="text" id="inEmail" name="inEmail" placeholder="@test.com 형식으로 입력하세요.">
					<input type="button" id="btnEmail" value="이메일 인증">
					<div id="email" style="display:none; color:red;">이메일은 필수입니다.</div>
				</div>
				
				<div id="emailChk" style="display: none;">
					<label for="emailNum">이메일 인증 번호</label>
					<input type="text" id="emailNum" name="emailNum" placeholder="인증번호 6자리를 입력해주세요.">
					<button id="chkEmail">인증번호 확인</button><br>
					<div id="emailChk2" style="display:none; color:red;">이메일 인증은 필수입니다.</div>		
					<div id="emailOk" style="color: green; display: none;">
						인증번호가 일치합니다.
					</div>
					<div id="emailNo" style="color: red; display: none;">
						인증번호가 불일치합니다. 다시 입력해주세요.
					</div>
				</div>
				
				<label for="bName">이름</label>
				<input type="text" id="bName" name="bName"><br>
				<div id="name" style="display:none; color:red;">이름은 필수입니다.</div>
				
				<label for="sPhone">핸드폰 번호</label>
				<select class="sPhone" id="sPhone" name="sPhone" required="required">
					<option>010</option>
					<option>011</option>
					<option>017</option>
					<option>016</option>
					<option value="in">직접 입력</option>
				</select>
				<input type="text" id="inPhone" name="inPhone">-<input type="text" id="mPhone" name="mPhone" required="required">-<input type="text" id="lPhone" name="lPhone" required="required"><br>
				<br>
				<div id="phone" style="display:none; color:red;">핸드폰 번호는 필수입니다.</div>
				
				<button>비밀번호 찾기</button>
			</form>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
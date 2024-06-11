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
			$("#email2").css("display", "block");	
		} else {
			$("#email2").css("display", "none");
		}
	})
	
	// 이메일 직접 입력
	$("#inEmail").hide();
	
	$("#mgrEmail2").change(function() {
		if($("#mgrEmail2").val() === "in") {
			$("#inEmail").show();
			$("#mgrEmail2").hide();
			$(".selectE").hide();
		} else {
			$("#inEmail").hide();
			$(".selectE").show();
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
	
	$("form").submit(function(e) {
		 if($("#mgrName").val() == '' || $("#mgrEmail").val() == '' || $("#mPhone").val() == '' || $("#lPhone").val() == '' || $("#emailNum").val() == '') {
			 alert("필수 입력 정보를 모두 입력해야합니다.");
			 e.preventDefault();
		 }
	 })
	
}) // End Jquery
</script>
<style>
input[type='radio'] {
/* 	웹킷 브라우저에서 기본 스타일 제거 */
	-webkit-appearance: none; 
/*  	 모질라 브라우저에서 기본 스타일 제거  */
 	-moz-appearance: none; 
 	appearance: none;
 	width: 20px;
 	height: 20px;
 	border: 2px solid black;
 	border-radius: 50%;
 	outline: none;
 	cursor: pointer;
}

input[type='radio']:checked {
	background-color: #4CAF50;
	border: 3px solid white;
	box-shadow: 0 0 0 1.6px #4CAF50;
}

.wrap {
	text-align: center;
}

.join {
	width: 600px;
	margin: 0 auto;
	text-align: left;
}

.section label {
	display: inline-block;
	width: 200px;
	height: 50px;
	vertical-align: middle;
	line-height: 50px;
}

.section input[type="text"], input[type="password"] {
	height: 50px;
	border: none;
	border-bottom: 1px solid black;
}

.selectE {
	display: inline-block;
	position: relative;
	width: 100px;
	height: 35px;
	border-radius: 4px;
	border: 2px solid #4CAF50;
}

.selectP {
	display: inline-block;
	position: relative;
	width: 50px;
	height: 35px;
	border-radius: 4px;
	border: 2px solid #4CAF50;
}

select::-ms-expand { 
	display: none;
}

.selectE .select {
	-o-appearance: none;
  	-webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
  	width: inherit;
    height: inherit;
    background: transparent;
    border: 0 none;
    outline: 0 none;
    padding: 0 5px;
    position: relative;
    z-index: 3;
}

.selectP .select {
	-o-appearance: none;
  	-webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
  	width: inherit;
    height: inherit;
    background: transparent;
    border: 0 none;
    outline: 0 none;
    padding: 0 5px;
    position: relative;
    z-index: 3;
}

.select option {
	background-color: #4CAF50;
	color: white;
}

.j-info {
	font-size: 12px;
}

.btn {
	width: 150px;
}

.section fieldset {
	margin: 0 auto;
	width: 600px;
}

/* .section #infoAd { */
/* 	width: 50px; */
/* } */

.agree {
	display: flex;
	justify-content: flex-end;
}

.section .agree .ag-chk {
	width: 100px;
}

.s {
	width: 70px;
}

.m {
	width: 150px;
}

.l {
	width: 300px;
}

.mm {
	width: 100px;
}

.btn-list {
	display: flex;
	justify-content: space-around;
	margin-top: 50px;
}

.ag-box {
	margin-top: 50px;
	text-align: center;
}

.ag-content {
	width: 590px;
	height: 200px;
    overflow: auto;
}

.ag-content::-webkit-scrollbar {
    width: 10px;
}

.ag-content::-webkit-scrollbar-thumb {
    background-color: #4CAF50;
}

.ag-content::-webkit-scrollbar-track {
    background-color: #ccc;
}

.ad-title {
	float: left;
}

.ad-list {
	
}

#infoAd .in-label {
	width: 100px;
}

input[type=file]::file-selector-button {
	width: 100px;
   	height: 36px;
	background: #4CAF50;
	border: 1px solid white;
	color: white;
	border-radius: 5px;
	font-size: 15px;
	cursor: pointer;
}

.ne {
	color: red;
}

.j-info {
	font-size: 12px;
	height: 30px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
<div class="full">
	<div class=wrap>
		<div class="page">
			<h3>아이디 찾기</h3>
		</div>
		
		<div class="section">
		<div class="join">
			<form action="./findid" method="post">
				<div>
					<label for="mgrName">이름<span class="ne"> *</span></label>
					<input type="text" id="mgrName" name="mgrName"><br>
					<div class="j-info" >
						<div id="name" style="display:none; color:red;" class="j-info">
							<label></label>
							이름은 필수입니다.
						</div>				
					</div>
					
					<label for="sPhone">핸드폰 번호<span class="ne"> *</span></label>
					<div class="selectP">
					<select class="sPhone select" id="sPhone" name="sPhone">
						<option>010</option>
						<option>011</option>
						<option>017</option>
						<option>016</option>
						<option value="in">직접 입력</option>
					</select>
					</div>
					<input type="text" id="inPhone" name="inPhone" class="s">-<input type="text" id="mPhone" name="mPhone" class="s">-<input type="text" id="lPhone" name="lPhone" class="s">
					<div class="j-info" >
						<div id="phone" style="display:none; color:red;" class="j-info">
							<label></label>
							핸드폰 번호는 필수입니다.
						</div>
					</div>
				</div>
				
				<div id="email">
					<label for="mgrEmail">이메일<span class="ne"> *</span></label>
					<input type="text" id="mgrEmail" name="mgrEmail" class="m">
					
					<div class="selectE">
					<select class="mgrEmail2 select" name="mgrEmail2" id="mgrEmail2">
						<option>@naver.com</option>
						<option>@gmail.com</option>
						<option>@daum.net</option>
						<option value="in">직접 입력</option>
					</select>
					</div>
					<input type="text" id="inEmail" name="inEmail" placeholder="@test.com 형식으로 입력하세요." class="mm">
					<input type="button" id="btnEmail" value="이메일 인증" class="btn btnRight">
					<div class="j-info" >
						<div id="email2" style="display:none; color:red;" class="j-info">
							<label></label>
							이메일은 필수입니다.
						</div>
					</div>
				</div>
				
				<div id="emailChk" style="display: none;">
					<label for="emailNum">이메일 인증 번호<span class="ne"> *</span></label>
					<input type="text" id="emailNum" name="emailNum" placeholder="인증번호 6자리를 입력해주세요.">
					<div class="j-info" >
						<div id="emailChk2" style="display:none; color:red;" class="j-info">
							<label></label>
							이메일 인증은 필수입니다.
						</div>
						<div id="emailOk" style="color: green; display: none;" class="j-info">
							<label></label>
							인증번호가 일치합니다.
						</div>
						<div id="emailNo" style="color: red; display: none;" class="j-info">
							<label></label>
							인증번호가 불일치합니다. 다시 입력해주세요.
						</div>
					</div>
				</div>
				
				<button>아이디 찾기</button>
			</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>
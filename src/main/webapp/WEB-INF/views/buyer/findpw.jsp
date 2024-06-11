<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			$("#email2").css("display", "block");	
		} else {
			$("#email2").css("display", "none");
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
	
	$("#chkEmail").click(function() {
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
<style type="text/css">
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

.selectD {
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

.selectD .select {
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
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
	<div class=wrap>
		<div class="page">
			<h3>비밀번호 찾기</h3>
		</div>
		
		<div class="section">
		<div class="join">
			<form action="./findpw" method="post">
			
				<label for="bId">아이디</label>
				<input type="text" id="bId" name="bId">
				<div class="j-info" >
					<div id="id" style="display:none; color:red;" class="j-info">
						<label></label>
						아이디는 필수입니다.
					</div>
					<div id="chkId" style="display:none; color:red;" class="j-info">
						<label></label>
						아이디는 영어소문자와 숫자로 8자리 ~ 15자리로 입력 필요
					</div>
				</div>
				
				<label for="bName">이름<span class="ne"> *</span></label>
				<input type="text" id="bName" name="bName" class="m">
				<div class="j-info" >
					<div id="name" style="display:none; color:red;" class="j-info">
						<label></label>
						이름은 필수입니다.
					</div>				
				</div>
				
				<div id="email">
					<label for="bEmail">이메일<span class="ne"> *</span></label>
					<input type="text" id="bEmail" name="bEmail" class="m">
					
					<div class="selectE">
					<select class="bEmail2 select" name="bEmail2" id="bEmail2">
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
					<label for="emailNum">이메일 인증 번호</label>
					<input type="text" id="emailNum" name="emailNum" placeholder="인증번호 6자리를 입력해주세요.">
					<button id="chkEmail" type="button" class="btn btnRight">인증번호 확인</button><br>
					<div id="emailChk2" style="display:none; color:red;">이메일 인증은 필수입니다.</div>		
					<div id="emailOk" style="color: green; display: none;">
						인증번호가 일치합니다.
					</div>
					<div id="emailNo" style="color: red; display: none;">
						인증번호가 불일치합니다. 다시 입력해주세요.
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
				
				<div class="btn-list">
				<button class="btn btnRight">비밀번호 찾기</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
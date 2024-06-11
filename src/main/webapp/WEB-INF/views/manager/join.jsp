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
	
	var rexId = /[a-z][a-z0-9]{8,15}/;
	var rexPw = /[a-zA-Z0-9!@#$%]{8,15}/;
	
	// 아이디
	$("#mgrId").blur(function() {
		if($("#mgrId").val() == '') {
			$("#id").css("display", "block");
		} else {
			$("#id").css("display", "none");
			
			if(!rexId.test($("#mgrId").val())) {
				console.log(rexId.test($("#mgrId").val()));
				$("#chkId").css("display", "block");				
			} else {
				console.log(rexId.test($("#mgrId").val()));
				$("#chkId").css("display", "none");								
			}
		}
	})
	
	// 아이디 중복 확인
	$("#chkBid").click(function() {
		var bId = $("#mgrId").val();
		
		$.ajax({
			type: 'post',
			url : './chkbid',
			data: {bId : bId},
			dataType: 'json',
			success: function(res) {
				console.log("res : " + res);
				
				if(res > 0) {
					alert("중복된 아이디가 존재합니다.");
				} else {
					alert("사용 가능한 아이디 입니다.");					
				}
			}
		}) // End Ajax
	})
	
	// 비밀번호
	$("#mgrPw").blur(function() {
		if($("#mgrPw").val() == '') {
			$("#pw").css("display", "block");
		} else {
			$("#pw").css("display", "none");
			
			if(!rexPw.test($("#mgrPw").val())) {
				console.log(rexPw.test($("#mgrPw").val()));
				$("#chkPw").css("display", "block");				
			} else {
				console.log(rexPw.test($("#mgrPw").val()));
				$("#chkPw").css("display", "none");								
			}
		}
	})
	
	// 비밀번호 확인
	$("#newPw").blur(function() {
		if($("#newPw").val() == '') {
			$("#cfmPw").css("display", "block");			
		} else {
			$("#cfmPw").css("display", "none");
			
			// 비밀번호 일치
			if($("#newPw").val() === $("#mgrPw").val()) {
				$("#okPw").css("display", "block");				
				$("#noPw").css("display", "none");				
			} else {
				$("#okPw").css("display", "none");				
				$("#noPw").css("display", "block");				
			}
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
	
	// 이메일 인증
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
	
	$("#emailNum").blur(function() {
		var inputNum = $("#emailNum").val();
		
		console.log("입력 인증 번호 : " + inputNum);
		console.log("전송 인증 번호 : " + num);
		
		if(Number(inputNum) === num) {
			$("#emailOk").css("display", "block");
			$("#mgrEmail").css("disabled", "true");
			$("#mgrEmail2").css("disabled", "true");
			$("#btnEmail").css("disabled", "true");
			$("#emailNo").css("display", "none");			
		} else {
			$("#emailNo").css("display", "block");			
			$("#emailOk").css("display", "none");			
		}
	})
	
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
	
	$("#mPhone").blur(function() {
		if($("#mPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	$("#lPhone").blur(function() {
		if($("#lPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})

// 	$("FORM").SUBMIT(FUNCTION(E) {
// 		 IF($("#MGRID").VAL() == '' || $("#MGRPW").VAL() == '' || $("#MGRNAME").VAL() == '' || $("#NEWPW").VAL() == '' || $("#MGREMAIL").VAL() == ''
// 			 || $("#EMAILNUM").VAL() == ''  || $("#MPHONE").VAL() == '' || $("#LPHONE").VAL() == '') {
// 			 ALERT("필수 입력 정보를 모두 입력해야합니다.");
// 			 E.PREVENTDEFAULT();
// 		 }
// 	 })
		
}) // End Jquery
</script>
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
<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<div class="page">
		<h3>회원가입</h3>
		</div>
		
		<div class="section">
		<div class="join>
			<form action="/manager/join" method="post" enctype="multipart/form-data">
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
			
				<div>
					<label for="mgrCode">사원 번호</label>	
					<input type="text" id="mgrCode" name="mgrCode" required="required"><br><br>
					
					<label for="deptno">부서</label>
					<div class="selectD">
					<select class="deptno select" id="deptno" name="deptno" required="required">
						<option value="20">인사팀</option>
						<option value="30">판매제휴팀</option>
						<option value="40">구매CS팀</option>					
					</select>
					</div>
					<br>
					<label for="mgrId">아이디</label>
					<input type="text" id="mgrId" name="mgrId" required="required"><br>
					
					<label for="mgrPw">비밀번호</label>	
					<input type="password" id="mgrPw" name="mgrPw" required="required"><br>
					
					<label for="chkMgrPw">비밀번호 확인</label>	
					<input type="password" id="chkMgrPw" name="chkMgrPw" required="required"><br>
					
					<label for="mgrName">이름</label>	
					<input type="text" id="mgrName" name="mgrName" required="required"><br>
					
					<label for="sPhone">핸드폰 번호</label>
					<div class="selectP">
					<select class="sPhone select" id="sPhone" name="sPhone" required="required">
						<option>010</option>
						<option>011</option>
						<option>017</option>
						<option>016</option>
						<option value="in">직접 입력</option>
					</select>
					</div>
					<input type="text" id="inPhone" name="inPhone" class="s">-<input type="text" id="mPhone" name="mPhone" required="required" class="s">-<input type="text" id="lPhone" name="lPhone" required="required" class="s"><br>
					
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
					
					<div class="selectE">
					<select class="mgrEmail2 select" name="mgrEmail2" id="mgrEmail2" required="required">
						<option>@naver.com</option>
						<option>@gmail.com</option>
						<option>@daum.net</option>
						<option value="in">직접 입력</option>
					</select>
					</div>
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
				
				<br><br>
				
				<button class="btn btnRight">가입하기</button>
				<a href="/manager/main"><button class="btn btnLeft">취소하기</button></a>
			</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>
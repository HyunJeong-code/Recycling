<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function() {
	
	var rexPw = /[a-zA-Z0-9!@#$%]{8, 15}/;
	
	// 비밀번호
	$("#mgrPw").blur(function() {
		if($("#mgrPw").val() == '') {
			$("#pw").css("display", "block");
		} else {
			$("#pw").css("display", "none");
			
			if(rexPw.test($("#mgrPw"))) {
				$("#chkPw").css("display", "block");				
			} else {
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
	
	$("#newPw").blur(function() {
		var mgrPw = $("#mgrPw").val();
		var newPw = $("#newPw").val();
		
		console.log("mgrPw : " + mgrPw);
		console.log("newPw : " + newPw);
		
		if(newPw == '') {
			$("#cfmPw").css("display", "block");						
		} else {
			$("#cfmPw").css("display", "none");
			
			if(mgrPw === newPw) {
				$("#okPw").css("display", "block");
				$("#noPw").css("display", "none");					
			} else {
				$("#okPw").css("display", "none");		
				$("#noPw").css("display", "block");					
			}
		}
	})
	
})
</script>
</head>
<body>
<div class="full">
	<div class="wrap">
		<div class="page">
			<h3>비밀번호 변경</h3>
		</div>
		
		<div class="section">
			<form action="./changepw" method="post">
				<label for="mgrPw">새 비밀번호</label>
				<input type="text" id="mgrPw" name="mgrPw"><br>
				<div id="pw" style="display:none; color:red;">비밀번호는 필수입니다.</div>
				
				<label for="newPw">새 비밀번호 확인</label>
				<input type="text" id="newPw" name="newPw"><br>
				<div id="cfmPw" style="display: none; color: red;">비밀번호를 입력해주세요.</div>
				<div id="okPw" style="display: none; color: green;">비밀번호가 일치합니다.</div>
				<div id="noPw" style="display: none; color: red;">비밀번호가 일치하지 않습니다.</div>
				<br>
				
				<button>변경하기</button>
			</form>
		</div> <!-- section End -->
	</div> <!-- wrap End -->
</div> <!-- full End -->

</body>
</html>
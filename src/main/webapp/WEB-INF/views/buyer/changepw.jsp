<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function() {
	
	var rexPw = /[a-zA-Z0-9!@#$%]{8,15}/;
	
	// 비밀번호
	$("#bPw").blur(function() {
		if($("#bPw").val() == '') {
			$("#pw").css("display", "block");
		} else {
			$("#pw").css("display", "none");
			
			if(!rexPw.test($("#bPw").val())) {
				console.log(rexPw.test($("#bPw").val()));
				$("#chkPw").css("display", "block");				
			} else {
				console.log(rexPw.test($("#bPw").val()));
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
			if($("#newPw").val() === $("#bPw").val()) {
				$("#okPw").css("display", "block");				
				$("#noPw").css("display", "none");				
			} else {
				$("#okPw").css("display", "none");				
				$("#noPw").css("display", "block");				
			}
		}
	})
	
	$("form").submit(function(e) {
		 if( $("#bPw").val() == '' || $("#newPw").val() == '') {
			 alert("필수 입력 정보를 모두 입력해야합니다.");
			 e.preventDefault();
		 }
	 })
	
})
</script>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<div class="page-header">
			<h3>비밀번호 변경</h3>
		</div>
		
		<div class="section">
			<c:if test="${buyer ne null }">
				<form action="/buyer/changepw" method="post">
				<input type="hidden" id="mgrCode" name="mgrCode">
					<label for="bPw">비밀번호<span class="ne"> *</span></label>
					<input type="password" id="bPw" name="bPw" class="m">
					<div class="j-info" >
						<div id="pw" style="display:none; color:red;" class="j-info">
							<label></label>
							비밀번호는 필수입니다.
							</div>
						<div id="chkPw" style="display:none; color:red;" class="j-info">
							<label></label>
							대소문자, 숫자, 특수문자(!, @, #, $, %)로 8자리 ~ 15자리로 입력 필요
						</div>
					</div>
					<br>
					
					<label for="newPw">비밀번호 확인<span class="ne"> *</span></label>
					<input type="password" id="newPw" name="newPw" class="m">
					<div class="j-info" >
						<div id="cfmPw" style="display:none; color:red;" class="j-info">
							<label></label>
							비밀번호 확인은 필수입니다.
						</div>
						<div id="okPw" style="display:none; color:green;" class="j-info">
							<label></label>
							비밀번호가 일치합니다.
						</div>
						<div id="noPw" style="display:none; color:red;" class="j-info">
							<label></label>
							비밀번호가 일치하지 않습니다.
						</div>
					</div>
					
					<button class="btn btnRight">변경하기</button>
				</form>
			</c:if>
			<c:if test="${buyer eq null }">
				<p>일치하는 회원정보가 없습니다.</p>
				
				<a href="/buyer/findpw"><button class="btn btnLeft">돌아가기</button></a>
			</c:if>
		</div> <!-- section End -->
	</div> <!-- wrap End -->
</div> <!-- full End -->
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function() {
	
	var rexPw = /[a-zA-Z0-9!@#$%]{8, 15}/;
	
var rexPw = /[a-zA-Z0-9!@#$%]{8,15}/;
	
	// 비밀번호
	$("#mgrPw").blur(function() {
		if($("#mgrPw").val() == '') {
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
		 if( $("#mgrPw").val() == '' || $("#newPw").val() == '') {
			 alert("필수 입력 정보를 모두 입력해야합니다.");
			 e.preventDefault();
		 }
	 })
	
})
</script>
<style type="text/css">
.section input[type="text"], input[type="password"] {
	height: 50px;
	border: none;
	border-bottom: 1px solid black;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
<div class="admin-container">
<sec:authentication var="managerLogin" property="principal"/>
<c:if test="${managerLogin.deptno eq 10}">
	<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
</c:if>
<c:if test="${managerLogin.deptno eq 20}">
	<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
</c:if>
<c:if test="${managerLogin.deptno eq 30}">
	<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
</c:if>
<c:if test="${managerLogin.deptno eq 40}">
	<c:import url="/WEB-INF/views/layout/manager/managercsmenu.jsp"/>
</c:if>
	<div class="full content">
	<div class="wrap">
		<div class="page">
			<h3>비밀번호 변경</h3>
		</div>
		
		<div class="section">
			<form action="./changepw" method="post">
				<label for="mgrPw">새 비밀번호</label>
				<input type="text" id="mgrPw" name="mgrPw"><br>
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
				
				<label for="newPw">새 비밀번호 확인</label>
				<input type="text" id="newPw" name="newPw"><br>
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
				<br>
				
				<button>변경하기</button>
			</form>
		</div> <!-- section End -->
		</div>
	</div> <!-- wrap End -->
</div> <!-- full End -->

</body>
</html>
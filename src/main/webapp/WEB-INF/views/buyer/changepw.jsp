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
	
	$("#mgrPw").blur(function() {
		if($("#mgrPw").val() == '') {
			$("#infoPw").css("display", "block");			
		} else {
			$("#infoPw").css("display", "none");						
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
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<div class="page">
			<h3>비밀번호 변경</h3>
		</div>
		
		<div class="section">
			<c:if test="${buyer ne null }">
				<form action="./changepw" method="post">
					<label for="mgrPw">새 비밀번호</label>
					<input type="text" id="mgrPw" name="mgrPw"><br>
					<div id="infoPw" style="display: none; color: red;">비밀번호를 입력해주세요.</div>
					
					<label for="newPw">새 비밀번호 확인</label>
					<input type="text" id="newPw" name="newPw"><br>
					<div id="cfmPw" style="display: none; color: red;">비밀번호를 입력해주세요.</div>
					<div id="okPw" style="display: none; color: green;">비밀번호가 일치합니다.</div>
					<div id="noPw" style="display: none; color: red;">비밀번호가 일치하지 않습니다.</div>
					<br>
					
					<button>변경하기</button>
				</form>
			</c:if>
			<c:if test="${buyer eq null }">
				<p>일치하는 회원정보가 없습니다.</p>
				
				<button><a href="/buyer/findpw">돌아가기</a></button>
			</c:if>
		</div> <!-- section End -->
	</div> <!-- wrap End -->
</div> <!-- full End -->
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
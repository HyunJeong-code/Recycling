<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changePw</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('form').on('submit', function(event) {
		var newPw = $('#newPw').val();
		var confirmPw = $('#confirmPw').val();
		
		if(newPw !== confirmPw) {
			alert('새 비밀번호가 일치하지 않습니다.');
			event.preventDefault();
		}
	})
})
</script>

<style type="text/css">
.changepw {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: center;
	height: 100vh;
	padding-top: 50px;
	text-align: center;
}

.form-group {
	display: flex;
	flex-direction: row;
	align-items: center;
	margin-bottom: 15px;
}

label {
	margin-right: 10px;
	width: 150px;
	text-align: right;
}
</style>


</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
			<h2>비밀번호 변경</h2>
			<hr>
			<div class="page">
				<c:choose>
					<c:when test="${buyerLogin.bCtCode == 'P' }">
						<a href="${pageContext.request.contextPath }/buyer/mypage/mypagepri">마이페이지</a>
					</c:when>
					<c:when test="${buyerLogin.bCtCode == 'C' }">
						<a href="${pageContext.request.contextPath }/buyer/mypage/mypagecmp">마이페이지</a>
					</c:when>
				</c:choose>
				<form action="${pageContext.request.contextPath }/buyer/mypage/changepw" method="post">
					<div class="changepw">
						<h3>비밀번호 변경</h3>
						<div class="form-group">
							<label for="newPw">새 비밀번호 </label>
							<input type="text" id="newPw" name="newPw" required>
						</div>
						<div class="form-group">
							<label for="confirmPw">새 비밀번호 확인 </label>
							<input type="text" id="confirmPw" name="confirmPw" required><br>
						</div>
						<input type="submit" value="비밀번호 변경">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
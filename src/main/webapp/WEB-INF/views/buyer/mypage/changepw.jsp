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
	<div class="full">
		<div class="wrap">
		
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
				<form action="${pageContext.request.contextPath }/buyer/mypage/changepw" method="post">
					<div class="changepw">
						<div>
							<h3>비밀번호 변경</h3>
						</div>
						<div class="form-group">
							<label for="currentPw">현재 비밀번호</label>
							<input type="text" id="currentPw" name="currentPw" required>
						</div>
						<div class="form-group">
							<label for="newPw">새 비밀번호 </label>
							<input type="text" id="newPw" name="newPw" required>
						</div>
						<div class="form-group">
							<label for="confirmPw">새 비밀번호 확인 </label>
							<input type="text" id="conformPw" name="confirmPw" required><br>
						</div>
						<input type="submit" value="비밀번호 변경">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
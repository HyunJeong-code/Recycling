<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changePw</title>

<script type="text/javascript">

</script>

</head>
<body>
	<div class="full">
		<div class="wrap">
			<h2>비밀번호 변경</h2>
			<hr>
			
			<div class="page">
				<form action="${pageContext.request.contextPath }/seller/mypage/changepw" method="post">
					<h3>비밀번호 변경</h3>
					<label for="newPw">새 비밀번호 </label>
					<input type="password" id="newPw" name="newPw" required>
					<br>
					<label for="bPw">새 비밀번호 확인 </label>
					<input type="password" id="bPw" name="bPw" required><br>
					<input type="submit" value="비밀번호 변경">
				</form>
				<c:if test="${not empty error}">
        			<p style="color: red;">${error}</p>
    			</c:if>
    			<c:if test="${not empty success}">
       				<p style="color: green;">${success}</p>
    			</c:if>
			</div>
		</div>
	</div>
</body>
</html>
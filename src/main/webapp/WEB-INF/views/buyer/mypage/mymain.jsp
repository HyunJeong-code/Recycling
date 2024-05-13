<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myMain</title>
</head>
<body>
	<div class="full">
		<div class="wrap">
			<h2>비밀번호 확인</h2>
			<hr>
			<div class="page">
				<form action="${pageContext.request.contextPath }/buyer/mypage/mymain" method="post">
					<h3>개인 정보 변경을 위해 비밀번호를 입력해주세요.</h3>
					<label for="password">비밀번호 </label>
					<input type="password" id="password" name="password" required>
					<button type="submit">확인</button>
				</form>
				<c:if test="${not empty error }">
					<p style="color: red;">${error }</p>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
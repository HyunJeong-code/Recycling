<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>outBuyer</title>

<script type="text/javascript">

</script>

</head>
<body>
	<div class="full">
		<div class="wrap">
			<h2>회원 탈퇴</h2>
			<hr>
			<div class="page">
				<form action="${pageContext.request.contextPath }/buyer/mypage/outbuyer" method="post">
					<label for="password">비밀번호 </label>
					<input type="password" id="password" name="password" required><br><br>
					
					<h3>탈퇴 후 개인 정보 처리 약관 (필수)</h3>
					<label><input type="radio" name="privacyConsent" value="agree" required>동의</label>
					<label><input type="radio" name="privacyConsent" value="disagree">미동의</label>
					
					<h3>탈퇴 후 회원 정보 및 거래 내역 안내 (필수)</h3>
					<label><input type="radio" name="infoConsent" value="agree" required>동의</label>
					<label><input type="radio" name="infoConsent" value="disagree">미동의</label>
					
					<input type="submit" value="탈퇴하기">
					<input type="button" value="취소하기" onclick="history.back()">
				</form>
				
				<c:if test="${not empty error }">
					<p style="color: red;">${error }</p>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
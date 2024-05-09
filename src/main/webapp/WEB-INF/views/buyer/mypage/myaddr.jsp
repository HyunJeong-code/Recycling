<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myAddr</title>

<script type="text/javascript">
function toggleVisibility(elementId) {
	
	var element = document.getElementById(elementId);
	
	if(element.style.display === "none") {
		
		element.style.display = "block";
		
	} else {
		
		element.style.display = "none";
		
	}
	
}

function cancelForm() {
	
	window.history.back();
	
}
</script>

</head>
<body>
	<div class="full">
		<div class="wrap">
			<h2>비밀번호 변경</h2>
			<hr>
			<div class="page">
				<c:if test="${addr.adrChk eq 'Y'}">
				<form action="${pageContext.request.contextPath }/buyer/mypage/changepw" method="post">
					<h3>비밀번호 변경</h3>
					<label for="newPww">새 비밀번호 </label>
					<input type="password" id="newPw" name="newPw" required>
					<br>
					<label for="confirmPw">새 비밀번호 확인 </label>
					<input type="password" id="conformPw" name="confirmPw" required><br>
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
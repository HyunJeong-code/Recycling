<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myDetailPri</title>

<script type="text/javascript">
var previousChecked = {};

function toggleRadioButton(element) {
	
	var name = element.name;
	
	if(previousChecked[name] === element) {
		
		element.checked = false;
		previousChecked[name] = null;
		
	} else {
		
		previousChecked[name] = element;
		
	}
	
}
	
function cancelUpdate() {
		
	window.history.back();
		
}

window.onload = function() {
    var error = '${error}';
    if (error) {
        alert(error);
        window.location.href = '/buyer/login'; // 로그인 페이지로 리디렉션
    }
}
</script>

</head>
<body>
	<div class="full">
		<div class="wrap">
			<h2>개인 정보 수정</h2>
			<hr>
			<div class="page">
				<form action="${pageContext.request.contextPath }/buyer/mypage/mydetailpri" method="post">
					<input type="hidden" name="bCode" value="${buyer.bCode }">
					<input type="hidden" name="adrCode" value="${buyerAdr.adrCode }">
					
					<label for="bName">이름 </label>
					<input type="text" id="bName" name="bName" value="${buyer.bName}" required><br>
					
					<label for="bId">아이디 </label>
					<input type="text" id="bId" name="bId" value="${buyer.bId }" required readonly><br>
					
					<label for="bEmail">이메일 </label>
					<input type="email" id="bEmail" name="bEmail" value="${buyer.bEmail }"required>
					<input type="button" value="이메일 인증" onclick="sendVerificationEmail()"><br>
					
					<label for="verification">이메일 인증 확인 </label>
					<input type="text" id="verificationCode">
					<input type="button" value="인증번호 확인"><br>
					
					<h3>광고성 정보 수신 여부 </h3>
					<label for="adSms">SMS</label>
					<input type="radio" name="adSms" id="adSms" value="Y" 
						<c:if test="${buyer.adSms eq 'Y' }">checked</c:if> onclick="toggleRadioButton(this)">
					
					<label for="adEmail">Email</label>
					<input type="radio" name="adEmail" id="adEmail" value="Y" 
						<c:if test="${buyer.adEmail eq 'Y' }">checked</c:if> onclick="toggleRadioButton(this)"><br>
					
					<input type="submit" value="수정하기">
					<input type="button" value="취소하기" onclick="cancelUpdate()">
				</form>
				<c:if test="${not empty success }">
					<p style="color: green;">${success }</p>
				</c:if>
				<c:if test="${not empty error }">
					<p style="color: red;">${error }</p>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
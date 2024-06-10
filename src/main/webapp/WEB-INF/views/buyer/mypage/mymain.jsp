<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myMain</title>

<script type="text/javascript">
$(document).ready(function() {
	$('form').on('submit', function(event) {
		event.preventDefault(); // 폼 기본 제출 방지

		var password = $('#password').val();
		
		$.ajax({
			url: '${pageContext.request.contextPath }/buyer/mypage/mymain',
			type: 'POST',
			data: $(this).serialize(), // 폼 데이터 직렬화
			success: function(response) {
				var parsedHtml = $.parseHTML(response);
				var errorMessage = $(parsedHtml).find('#errorMessage').text();
				var redirectUrl = $(parsedHtml).find('#redirectUrl').text();
				
				if (errorMessage) {
					alert(errorMessage);
				} else if (redirectUrl) {
					window.location.href = redirectUrl;
				}
			},
			error: function() {
				alert('비밀번호 확인 중 오류가 발생했습니다.');
			}
		});
	});
});
</script>

<style>
body {
    margin: 0;
    padding: 0;
}

.full {
    width: 1200px;
    height: auto;
    margin: 0 auto;
    padding: 50px 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.wrap {
    display: flex;
    width: 100%;
    justify-content: center;
    align-items: center;
    border-radius: 8px;
    padding: 20px;
}

.page {
    margin-top: 20px;
    border-bottom: 3px solid #333;
    width: 100%;
    text-align: center;
    padding-bottom: 30px;
}

.mymain {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
}

.mymain h3 {
    margin-bottom: 30px;
    color: #333;
}

.form-group {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
}

.form-group label {
    margin-right: 20px;
    text-align: left;
    width: 100px;
}

input[type="text"] {
    border: none;
    border-bottom: 1px solid black;
    width: 200px;
}

.button-group {
    text-align: center;
    margin-top: 40px;
    margin-bottom: 40px;
}

.button-group button {
    margin-right: 10px;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 135px;
    height: 39px;
}

.button-group button:hover {
    background-color: #58c05c;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
		
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
				<form action="${pageContext.request.contextPath }/buyer/mypage/mymain" method="post">
					<div class="mymain">
						<div>
							<h3>개인 정보 변경을 위해 비밀번호를 입력해주세요.</h3>
						</div>
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" id="password" name="password" required>
						</div>
						<div class="button-group">
							<button type="submit" class="btn">확인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
	<c:if test="${not empty error}">
		<div id="errorMessage" style="display:none;">${error}</div>
	</c:if>
	
	<c:if test="${buyerLogin != null && buyerLogin.bCtCode == 'P'}">
		<div id="redirectUrl" style="display:none;">${pageContext.request.contextPath}/buyer/mypage/mypagepri</div>
	</c:if>
	
	<c:if test="${buyerLogin != null && buyerLogin.bCtCode == 'C'}">
		<div id="redirectUrl" style="display:none;">${pageContext.request.contextPath}/buyer/mypage/mypagecmp</div>
	</c:if>
	
</body>
</html>
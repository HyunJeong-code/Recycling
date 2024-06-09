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
}

h3 {
	margin-bottom: 20px;
	color: #333;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
}

table {
    margin: 0 auto;
    border-collapse: separate;
    border-spacing: 10px 15px;
}

td {
    padding: 5px;
}

td:first-child {
    text-align: right;
    vertical-align: middle;
    padding-right: 10px;
}

td:last-child {
    text-align: left;
    vertical-align: middle;
}

input[type="password"] {
	border: none;
	border-bottom: 1px solid black;
	width: 200px;
}

button {
    padding: 0 0;
    border: none;
    width: 100px;
    height: 30px;
    margin: 20px auto;
    display: block;
}

.btn {
	background-color: #ccc;
    color: black;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
		
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
				<h3>개인 정보 변경을 위해 비밀번호를 입력해주세요.</h3>
				<form action="${pageContext.request.contextPath }/buyer/mypage/mymain" method="post">
					<table>
						<tr>	
							<td>비밀번호</td>
							<td><input type="password" id="password" name="password" required></td>
						</tr>
						<tr>
							<td colspan="2"><button class="btn">확인</button></td>
						</tr>
					</table>
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
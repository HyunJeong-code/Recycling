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
.full {
	width: 1200px;
	margin: 0 auto;
}

button {
    border: none;
    width: 100px;
}

input[type="button"] {
    border: none;
    width: 100px;
}

input[type="text"] {
	border: none;
	border-bottom: 1px solid black;
}

.s {
	width: 100px;
}

.m {
	width: 200px;
}

.l {
	width: 300px;
}

.btn {
	background-color: #ccc;
    color: black;
}

.btnLeft {
    background-color: #4CAF50;
    color: white;
}

h3 {
	margin-bottom: 20px; /* h3와 table 사이의 간격 조정 */
	text-align: center;
}

.n-table {
	margin-top: 20px; /* table과 h3 사이의 간격 조정 */
	margin: 0 auto;
	text-align: center;
}
.n-table th, .n-table td {
	border: none; /* 테두리 제거 */
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
					<table class="n-table">
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
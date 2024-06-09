<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>outbuyer</title>

<script type="text/javascript">

</script>

<style>
table, th, td {
    border: 1px solid #dddddd;
}
th, td {
    padding: 15px;
    text-align: left;
}
th {
    background-color: #f2f2f2;
}
.form-group {
    margin-bottom: 20px;
}
.button-group {
	text-align: center;
	margin-top: 20px;
}
.button-group input {
    margin-right: 10px;
    padding: 10px 20px;
    background-color: #0066cc;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
.button-group input[type="button"] {
    background-color: #ccc;
}
.button-group input:hover {
    background-color: #005bb5;
}
.button-group input[type="button"]:hover {
    background-color: #bbb;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
		
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
				<form action="${pageContext.request.contextPath }/buyer/mypage/outbuyer" method="post">
					<table>
						<tr>
							<th colspan="2">회원 탈퇴</th>
						<tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="password" name="password" required></td>
						</tr>
						<tr>
							<td>탈퇴 후 개인 정보 처리 약관 (필수)</td>
							<td>
								<label><input type="radio" name="privacyConsent" value="agree" required> 동의 </label>
								<label><input type="radio" name="privacyConsent" value="disagree"> 미동의 </label>
							</td>
						</tr>
						<tr>
							<td>탈퇴 후 회원 정보 및 거래 내역 안내 (필수)</td>
							<td>
								<label><input type="radio" name="infoConsent" value="agree" required> 동의 </label>
								<label><input type="radio" name="infoConsent" value="disagree"> 미동의 </label>
							</td>
						</tr>
					</table>
					<div class="button-group">
						<input type="submit" value="탈퇴하기">
						<input type="button" value="취소하기" onclick="history.back()">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
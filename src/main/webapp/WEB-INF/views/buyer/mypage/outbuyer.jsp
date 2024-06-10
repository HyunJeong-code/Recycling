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

.table-container {
    display: flex;
    justify-content: center;
}

table, th, td {
    border: 1px solid #dddddd;
    border-collapse: collapse;
    margin: 0 auto;
}

th, td {
    padding: 15px;
    text-align: left;
}

td:first-child {
    background-color: #CEE741;
    text-align: center;
    font-weight: bold;
}

.form-group {
    margin-bottom: 20px;
}

.button-group {
    text-align: center;
    margin-top: 40px;
    margin-bottom: 40px;
}

.button-group button {
    margin-right: 10px;
    padding: 10px 20px;
    background-color: #878787;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.button-group button.btnRight {
    background-color: #878787;
}

.button-group button.btnLeft {
    background-color: #4CAF50;
}

.button-group button.btnRight:hover {
    background-color: #9e9e9e;
}

.button-group button.btnLeft:hover {
    background-color: #58c05c;
}

.button-group button.btnLeft:hover {
    background-color: #45A049;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
		
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
				<h3>회원 탈퇴</h3>
				<form action="${pageContext.request.contextPath }/buyer/mypage/outbuyer" method="post">
					<div class="table-contatiner">
						<table>
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
					</div>
					<div class="button-group">
						<button class="btnLeft" type="submit">탈퇴하기</button>
						<button class="btnRight" type="button" onclick="history.back()">취소하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
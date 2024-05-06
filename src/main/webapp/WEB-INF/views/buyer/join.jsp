<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buyer Join</title>
</head>
<body>

<div class="full">
	<div class="wrap">
		<div class="page">
		</div>
		
		<div class="section">
			
			<form action="./join" method="post">
				<label for="bId">아이디</label>
				<input type="text" id="bId" name=bId">
				<button id="chkBid">아이디 중복 확인</button><br>
				
				<label for="bPw">비밀번호</label>
				<input type="text" id="bPw" name="bPw"><br>
				
				<label for="chkBpw">비밀번호 확인</label>
				<input type="text" id="chkBpw" name="chkBpw"><br>
				
				<label for=""></label>
				<input type="text" id="" name=""><br>
				<label for=""></label>
				<input type="text" id="" name=""><br>
				<label for=""></label>
				<input type="text" id="" name=""><br>
				<label for=""></label>
				<input type="text" id="" name=""><br>
			</form>
		</div>
	</div>
</div>

</body>
</html>
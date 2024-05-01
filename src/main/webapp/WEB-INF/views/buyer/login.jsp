<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<div class="wrap">
	<form action="./login" method="post">
		
		<div class="buyerCt">
			<input type="radio" name="bCtCode" id="bCtCode" value="P" checked="checked"> 
			<label for="ctPri">개인</label>
			
			<input type="radio" name="bCtCode" id="bCtCode" value="C">
			<label for="ctCmp">기업</label>	
		</div>
		
		<div class="buyer">
			<label for="bId">ID</label>
			<input id="bId" name="bId" placeholder="아이디를 입력해주세요."><br>
			
			<label for="bPw">PW</label>
			<input id="bPw" name="bPw" placeholder="비밀번호를 입력해주세요."><br><br>
			
			<button id="btnLogin">로그인</button>
		</div>
	</form>
</div>
</body>
</html>
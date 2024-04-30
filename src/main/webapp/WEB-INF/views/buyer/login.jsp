<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<form action="./login" method="post">
	
	<div class="buyerCt">
		<input type="radio" name="ctBcode" id="ctPri" value="P" checked="checked"> 
		<label for="ctPri">개인</label>
		
		<input type="radio" name="ctBcode" id="ctCmp" value="C">
		<label for="ctCmp">기업</label>	
	</div>
	
	
	
	<br><br>
	<button>가입하기</button>
</form>

</body>
</html>
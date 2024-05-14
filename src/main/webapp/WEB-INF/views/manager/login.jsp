<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="full">
	<div class="wrap">
		<div class="page">
		<h3>관리자 로그인</h3>
		</div>
		
		<div class="section">
			<form action="./login" method="post">
				<div id="manager">
					<label for="mgrId">ID</label>
					<input id="mgrId" name="mgrId" placeholder="아이디를 입력해주세요."><br>
					
					<label for="mgrPw">PW</label>
					<input id="mgrPw" name="mgrPw" placeholder="비밀번호를 입력해주세요."><br><br>
					
					<button id="btnLogin">로그인</button>
				</div>
				
				<div id="join">
					<button><a href="./join">회원가입</a></button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
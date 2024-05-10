<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="../../../resources/css/common.css">
</head>
<body>

<div class="full">
	<div class="wrap">
		<div class="page">
		</div>
		
		<div class="section">
			<form action="./login" method="post">
				
				<div id="buyerCt">
					<input type="radio" name="bCtCode" id="bCtCode" value="P" checked="checked"> 
					<label for="ctPri">개인</label>
					
					<input type="radio" name="bCtCode" id="bCtCode" value="C">
					<label for="ctCmp">기업</label>	
				</div>
				
				<div id="buyer">
					<label for="bId">ID</label>
					<input id="bId" name="bId" placeholder="아이디를 입력해주세요."><br>
					
					<label for="bPw">PW</label>
					<input id="bPw" name="bPw" placeholder="비밀번호를 입력해주세요."><br><br>
					
					<button id="btnLogin">로그인</button>
				</div>
				
				<div id="social">
					<button>네이버 로그인</button>
					<button>카카오 로그인</button>
					<button>구글 로그인</button>
				</div>
				<div id="join">
					<button><a href="./join">일반 회원가입</a></button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
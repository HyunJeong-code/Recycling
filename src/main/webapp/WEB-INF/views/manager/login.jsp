<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 로그인</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<div class="page">
		<h3>관리자 로그인</h3>
		</div>
		
		<div class="section">
			<form action="/manager/login" method="post">
				<div id="manager">
					<label for="mgrId">ID</label>
					<input id="mgrId" name="mgrId" placeholder="아이디를 입력해주세요."><br>
					
					<label for="mgrPw">PW</label>
					<input id="mgrPw" name="mgrPw" placeholder="비밀번호를 입력해주세요."><br><br>
					
					<button class="btn btnRight">로그인</button>
				</div>
				
				<div id="join">
					<a href="/manager/join"><button class="btn btnLeft">회원가입</button></a>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h3>비밀번호 찾기</h3>
		</div>
		
		<div class="section">
			<c:set var="buyer" value="${buyer }"/>
			<c:if test="${buyer ne null}">
				<form action="./changepw" method="post">
					<input type="hidden" id="bCode" name="bCode" value="${buyer.bCode }">
					<label for="bPw">변경 비밀번호</label>
					<input type="text" id="bPw" name="bPw"><br>
					
					<label for="bPw2">변경 비밀번호 확인</label>
					<input type="text" id="bPw2" name="bPw2"><br><br>
					
					<button>비밀번호 변경하기</button>
				</form>
			</c:if>
			
			<c:if test="${buyer eq null }">
				<p>일치하는 회원정보가 없습니다.</p>
				
				<button><a href="./findpw">돌아가기</a></button>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>
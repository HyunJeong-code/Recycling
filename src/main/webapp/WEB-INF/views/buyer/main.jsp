<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새활용 메인페이지</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

<div class="full">
	<div class="wrap">
	
		<!-- 임시설정 -->
		<a href="/buyer/login">로그인</a><br>
		<a href="/buyer/mypage/mymain">마이페이지</a><br>
		<a href="/buyer/mypage/changepw">비밀번호 변경</a><br>
		<a href="/buyer/mypage/mydetailpri">개인 회원 정보 변경</a><br>
		<a href="/buyer/mypage/mydetailcmp">기업 회원 정보 변경</a><br>
		<a href="/buyer/mypage/myaddr">배송지</a><br>
		<a href="/buyer/mypage/outbuyer">회원탈퇴</a>
		
		<div class="ad">
		</div>
		
		<div>
			<div class="wash">
			</div>
			
			<div class="hit">
			</div>
		</div>
		
		<div>
			<div class="rcy">
			</div>
			
			<div class="upcy">
			<div>
			</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>

</body>
</html>
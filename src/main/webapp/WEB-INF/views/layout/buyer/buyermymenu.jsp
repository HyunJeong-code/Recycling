<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- mymenu css -->
<link rel="stylesheet" href="/resources/css/mymenu.css">

</head>
<body>
	<div class="sidebar">
	   	<div class="panel-heading">
	        <a href="#">마이페이지</a>
	    </div>
	    <ul>
	        <li><a href="/buyer/mypage/cart">장바구니</a></li>
	        <li><a href="/buyer/mypage/myorder">주문조회</a></li>
	        <li><a href="/buyer/mypage/myboard">내 게시글</a></li>
	        <sec:authentication var="buyerLogin" property="principal"/>
	        <li><a href="/buyer/mypage/mymain">회원정보</a></li>
	        <li><a href="/buyer/mypage/changepw">비밀번호 변경</a></li>
	        			<c:if test="${buyerLogin.bCtCode eq 'C'}">
				<li><a href="/buyer/mypage/mypagecmp">내 정보 변경</a></li>
			</c:if>
			<c:if test="${buyerLogin.bCtCode eq 'P'}">
				<li><a href="/buyer/mypage/mypagepri">내 정보 변경</a></li>
			</c:if>
	    </ul>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새활용</title>
</head>
<body>

<div class="full">
<sec:authorize access="isAnonymous()">
<button><a href="./login">로그인</a></button>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_BUYER')">
<button><a href="./logout">로그아웃</a></button>
</sec:authorize>

<body>
    <div class="full">
        <div class="wrap">
        
        <!-- 임시설정 -->
		<a href="/buyer/login">로그인</a><br>
		<a href="/buyer/mypage/mymain">마이페이지</a><br>
		<a href="/buyer/mypage/mydetailpri">개인 회원 정보 변경</a><br>
		<a href="/buyer/mypage/mydetailcmp">기업 회원 정보 변경</a><br>
		<a href="/buyer/mypage/myaddr">배송지</a><br>
		<a href="/buyer/mypage/outbuyer">회원탈퇴</a>
        
            <div class="page">
            
            </div>
        
            <div class="section">
                
            </div>
        </div>
    </div>
</body>


</body>
</html>
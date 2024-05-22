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
		<a href="/seller/login">로그인</a><br>
		<a href="/seller/mypage/sellermain">마이페이지</a><br>
		<a href="/seller/mypage/changepw">비밀번호 변경</a><br>
		<a href="/seller/mypage/changebank">계좌번호 변경</a><br>
		<a href="/seller/mypage/mydetail">판매자 정보수정</a><br>
		<a href="/seller/mypage/outSeller">회원탈퇴</a>
        
            <div class="page">
            
            </div>
        
            <div class="section">
                
            </div>
        </div>
    </div>
</body>


</body>
</html>
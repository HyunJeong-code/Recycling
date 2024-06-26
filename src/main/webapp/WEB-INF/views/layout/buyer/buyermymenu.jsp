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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'get',
		url : '/buyer/mypage/myprof',
		dataType: 'json',
		success: function(res) {
			
		}
	})
})
</script>
</head>
<body>
<sec:authentication var="buyerLogin" property="principal"/>
	<div class="sidebar">
	   	<div class="panel-heading">
	        <c:choose>
            	<c:when test="${buyerLogin.bCtCode == 'P'}">
    		        <a href="${pageContext.request.contextPath}/buyer/mypage/mypagepri">마이페이지</a>
                </c:when>
                <c:when test="${buyerLogin.bCtCode == 'C'}">
                    <a href="${pageContext.request.contextPath}/buyer/mypage/mypagecmp">마이페이지</a>
                </c:when>
        	</c:choose>
	    </div>
	    <ul>
	        <li><a href="/buyer/mypage/cart">장바구니</a></li>
	        <li>
	            <c:choose>
                    <c:when test="${buyerLogin.bCtCode == 'P'}">
                        <a href="${pageContext.request.contextPath}/buyer/mypage/mypagepri">회원정보</a>
                    </c:when>
                    <c:when test="${buyerLogin.bCtCode == 'C'}">
                        <a href="${pageContext.request.contextPath}/buyer/mypage/mypagecmp">회원정보</a>
                    </c:when>
                </c:choose>
	        </li>
	        <li><a href="/buyer/mypage/changepw">비밀번호 변경</a></li>
	        <li>
	        	<c:choose>
					<c:when test="${buyerLogin.bCtCode == 'P' }">
						<a href="${pageContext.request.contextPath }/buyer/mypage/mydetailpri">회원정보 변경</a>
					</c:when>
					<c:when test="${buyerLogin.bCtCode == 'C' }">
						<a href="${pageContext.request.contextPath }/buyer/mypage/mydetailcmp">회원정보 변경</a>
					</c:when>
				</c:choose>
	        </li>
	        <li><a href="/buyer/mypage/myorder">주문조회</a></li>
	        <li><a href="/buyer/mypage/myaddr">배송지 관리</a></li>
	        <li><a href="/buyer/mypage/myboard">내 게시글</a></li>
	        <li><a href="/buyer/mypage/outbuyer">회원탈퇴</a></li>
	    </ul>
	</div>
</body>
</html>
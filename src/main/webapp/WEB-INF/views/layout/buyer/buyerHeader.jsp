<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
header {
	width: 1200px;
	margin: 0 auto;
}

.ntc {
	background-color: black;
	color: white;
}
</style>
<body>
	<header>
	    <div class="head">
	        <div class="ntc">
	        	<c:forEach var="ntc" items="${ntcList }">
		        	<h6><a href="/buyer/help/noticedetail?ntcCode=${ntc.NTC_CODE }">${ntc.TITLE }</a></h6>
	        	</c:forEach>
	        </div>
	        <div class="main">
	            <h1>새활용</h1>
	            <div class="search">
	                <form action="" method="">
	                    <input type="text" placeholder="Search">
	                    <button>검색</button>
	                </form>
	            </div>
	            <div class="top-btn">
	                <!-- 세션 조건 걸기(로그인 여부) -->
	                <sec:authorize access="isAnonymous()">
		                <button><a href="./join">회원가입</a></button>
						<button><a href="./login">로그인</a></button>
					</sec:authorize>
					
					<sec:authorize access="hasRole('ROLE_BUYER')">
						<button><a href="./logout">로그아웃</a></button>
						<c:if test="">
		                <button><a href="">마이페이지</a></button>
		                </c:if>
						<c:if test="">
		                <button><a href="">마이페이지</a></button>
		                </c:if>	                
					</sec:authorize>
	
	            </div>
	        </div>
	    </div>
	</header>
</body>
</html>
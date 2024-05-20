<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새활용</title>
</head>
<body>

<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

<div class="full">
<sec:authorize access="isAnonymous()">
<button><a href="./login">로그인</a></button>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_BUYER')">
<button><a href="./logout">로그아웃</a></button>
</sec:authorize>
	<div class="wrap">
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
</body>
</html>
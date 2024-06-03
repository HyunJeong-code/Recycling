<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새활용 판매자 페이지</title>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
	
	<div class="full">
		<div class="wrap">
			<c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>
					
			<div class="main-section">
				<sec:authorize access="hasAnyRole('ROLE_SELLER')">
					<button><a href="./logout">로그아웃</a></button>
				</sec:authorize>
			</div>
		</div>
	</div>
		
	<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
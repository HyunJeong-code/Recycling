<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새활용 메인페이지</title>
<link rel="stylesheet" href="../../../resources/css/common.css">
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

<div class="full">
	<div class="wrap">
		
		<div class="page">
			<a href="/buyer/mypage/mymain">mymain</a>
			<a href="/buyer/mypage/changepw">changepw</a>
			<a href="/buyer/mypage/mydetailpri">mydetailpri</a>
			<a href="/buyer/mypage/mydetailcmp">mydetailcmp</a>
		</div>
		
		<div class="section">
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
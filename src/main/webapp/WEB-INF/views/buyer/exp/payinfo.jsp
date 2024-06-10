<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn {
	cursor: pointer;
}
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<h1>결제 완료</h1>
		<hr>
		
		<h3>${expRes.resName }님의 예약이 완료되었습니다.</h3>
		
		<span>예약 번호 : ${expRes.resCode }</span>
		<br>
		
		<a href="/buyer/exp/main"><button class="btn">메인으로</button></a>
	</div>
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
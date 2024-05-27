<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<h1>결제 완료</h1>
	<hr>
	
	<h3>${order.ordName }님의 주문이 완료되었습니다.</h3>
	
	<span>주문 번호 : ${order.ordCode }</span>
	
	<a href="/buyer/main"><button>메인페이지</button></a>

	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
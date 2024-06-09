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

	<div class="full">
		<div class="center-title">
			<h1>결제 완료</h1>
		</div>
		
		<h3>${order.ordName }님의 주문이 완료되었습니다.</h3>
		
		<table class="view-table">
			<tr>
				<td>주문번호</td>
				<td>${order.ordCode }</td>
			</tr>
			<tr>
				<td>주문자</td>
				<td>${order.sendName }</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>${order.ordPostcode }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${order.ordAddr }</td>
			</tr>
			<tr>
				<td>상세 주소</td>
				<td>${order.ordDetail }</td>
			</tr>
			<tr>
				<td>주문번호</td>
				<td>${order.ordCode }</td>
			</tr>
		</table>
		
		<div class="btnBox">
			<a href="/buyer/main"><button class="btn">메인페이지</button></a>
		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
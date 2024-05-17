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

<h1>주문목록</h1>
<hr>

<table>
	<thead>
		<tr>
			<th>주문번호</th>
			<th>상품 이름</th>
			<th>가격</th>
			<th>개수</th>
			<th>총금액</th>
			<th>배송 상태</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${list }">
		<tr>
	 		<td>${list.orddtCode }</td>
	 		<td>${list.ordName }</td>
	 		<td>${list.ordPrice }</td>
	 		<td>${list.ordCnt }</td>
	 		<td>${list.ordSum }</td>
	 		<td>${list.sttNo }</td>
	 	</tr>
	</c:forEach>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tbody>
</table>



</body>
</html>
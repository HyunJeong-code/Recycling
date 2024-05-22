<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">

let sttList = {900: "결제 완료", 910: "배송 준비 중", 920: "배송 중", 930: "배송 완료" 
		, 940: "구매 확정", 950: "거래 완료", 960: "환불", 970: "반품", 980: "취소"}
		
</script>
</head>
<body>

<h1>주문목록</h1>
<hr>

<table border="1">
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
		 		<td>
		 			<script>document.write(sttList[${list.sttNo}])</script>
		 		</td>
		 	</tr>
		</c:forEach>
	</tbody>
</table>



</body>
</html>
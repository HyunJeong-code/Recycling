<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		<div class="main-section">
			<div class="page">
				<h3>내 기본 정보</h3>
			</div>
			
			<div class="section">
				<table>
					<tr>
						<th></th>
					</tr>
					
					<tr>
					</tr>
				</table>
			</div> <!-- section End -->
			
			<div class="page">
				<h3>나의 주문 현황</h3>
			</div>
			
			<div class="section">
				<table>
					<thead>
						<tr>
							<th>재활용품</th>
						</tr>
					</thead>
					
					<tbody>
					<tr>
						<th>결제 완료</th>
						<th>거래 완료</th>
					</tr>
					</tbody>
				</table>
				
				<table>
					<thead>
						<tr>
							<th>새용품</th>
						</tr>
					</thead>
					
					<tbody>
					<tr>
						<th>결제 완료</th>
						<th>배송 대기</th>
						<th>배송 중</th>
						<th>배송 완료</th>
						<th>구매 확정</th>
						<th>반품</th>
						<th>환불</th>
						<th>교환</th>
						<th>취소</th>
					</tr>
					</tbody>
				</table>
			</div> <!-- section End -->
			
			<div class="page">
				<h3>게시글 현황</h3>
			</div>
			
			<div class="section">
			</div> <!-- section End -->
		</div>
	</div> <!-- wrap End -->
</div> <!-- full End -->
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
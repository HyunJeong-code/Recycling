<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn-list {
	display: flex;
	justify-content: space-around;
	margin-top: 50px;
}

#btn {
	width: 250px;
	height: 150px;
	font-size: 40px;
	font-weight: bold;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>	
		<div class="main-section">
		
			<div class="page-header">
			<h3>상품 등록</h3>
			</div>
			
			<div class="section">
			<div class="btn-list">
			<a href="./rcyform"><button id="btn" class="btn btnRight">재활용품</button></a>
			<a href="./upcyform"><button id="btn" class="btn btnRight" style="background-color: #4CAF50;">새활용</button></a>
			</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
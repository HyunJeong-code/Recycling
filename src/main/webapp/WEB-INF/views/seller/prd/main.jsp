<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>	
		<div class="main-section">
		
			<div class="page">
			<h3>상품 등록</h3>
			</div>
			
			<div class="section">
			<button><a href="./rcyform">재활용품</a></button>
			<button><a href="./upcyform">새활용</a></button>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
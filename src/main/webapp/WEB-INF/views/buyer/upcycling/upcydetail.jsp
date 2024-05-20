<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새상품 업사이클 상품페이지</title>
<style type="text/css">
	body {
		margin: 0;
		padding: 0;
	}
	
	.container {
		display: flex;
		align-items: flex-start;
		padding: 20px;
	}
	
	.group {
		width: 200px;
		margin-right: 20px;
	}
	
	.mainThumbnail {
		width: 500px;
		margin-bottom: 20px;
	}
	
	.prdInfo {
		margin-bottom: 20px;
	}
	
	.buyBtn, .reportBtn {
		display: inline-block;
		padding: 10px 20px;
		margin-right: 10px;
		background-color: #007bff;
		color: #fff;
		text-decoration: none;
		border-radius: 5px;
	}
	
	.buyBtn:hover, .reportBtn:hover {
		background-color: #0056b3;
	}
	
	
	
	
	
</style>
</head>
<body>
	<div class="container">
		<div class="group">
			<h2>업사이클링>중분류</h2>
		</div>
		
		<div class="detailUpper">
			<img src="${pageContext.request.contextPath}/resources/img/popular_400px.png"
				class="mainThumbnail">
			<div class="prdInfo">
				<p class="prdName">${prd.prdName}</h1>
				<hr>
				<p class="prdPrice">${prd.price}<p>
				<hr>
				<p class="prdSum">${prd.prdDetail}</p>
				<hr>
				<a href="#" class="buyBtn">바로구매</a>
				<a href="#" class="reportBtn">신고하기</a>
			</div>
		</div>
	</div>

</body>
</html>
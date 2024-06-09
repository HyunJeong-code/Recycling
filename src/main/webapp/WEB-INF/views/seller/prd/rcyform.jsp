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
		<div class="page">
		<h3>재활용품 등록</h3>
		</div>
		
		<div class="section">
		<form action="./rcyform" method="post" enctype="multipart/form-data">
			
			<input type="hidden" id="ctPno" name="ctPno" value="0">
			
			<label for="ctPdtNo">분류</label>
			<select id="ctPdtNo" name="ctPdtNo">
				<option value="0">plastic</option>
				<option value="1">glass</option>
				<option value="2">paper</option>
				<option value="3">can</option>
				<option value="4">cloth</option>
				<option value="5">etc</option>
			</select><br>
			
			<label for="main">상품 썸네일</label>
			<input type="file" id="main" name="main"><br>
			
			<label for="prdName">상품명</label>
			<input type="text" id="prdName" name="prdName"><br>
			
			<label for="price">가격</label>
			<input type="number" id="price" name="price"><span>원</span><br>
			
			<label for="prdDetail">설명</label><br><br>
			<textarea rows="30" cols="100" id="prdDetail" name="prdDetail" placeholder="재활용품에 대한 설명을 적어주세요.(세쳑 유무, 거래 방법, 수량/무게 등)"></textarea>
			<br>
			
			<label for="detail">상품 상세 이미지</label>
			<input multiple="multiple" type="file" id="detail" name="detail">
			<br><br>
			
			<button>등록하기</button>
			<button><a href="./main">취소하기</a></button>
		</form>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
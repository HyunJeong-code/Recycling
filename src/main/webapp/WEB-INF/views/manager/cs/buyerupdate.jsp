<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>구매자 수정</h1>
	<hr>
	
	<div class="container">
		<form action="./buyerupdate" method="post">
			<label for="bName">이름: </label>
			<input type="text" id="bName" name="bName" value="${buyer.bName }">
			
			<label for="bPhone">전화번호: </label>
			<input type="text" id="bPhone" name="bPhone" value="${buyer.bPhone }">
			
			<label for="bEmail">이메일: </label>
			<input type="text" id="bEmail" name="bEmail" value="${buyer.bEmail }">			
			
			<input type="hidden" id="bCode" name="bCode" value="${buyer.bCode }">
			
			<button>수정</button>
		</form>
	</div>

</body>
</html>

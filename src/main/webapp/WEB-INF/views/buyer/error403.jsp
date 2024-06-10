<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 없음</title>
<style type="text/css">
.full {
	width: 1200px;
	margin: 0 auto;
}

h3 {
	font-size: 30px;
	font-weight: bolder;
	color: red;
}

.item {
	outline: 0;
    border: none;
    transition: all 0.2s ;
   	width: 90px;
   	height: 36px;
    background-color: #878787;
    border-radius: 5px;
   	color: white;
   	font-size: 15px;
}

.item:hover {
	background-color: #4CAF50;
}
</style>
</head>
<body>
<div class="full">
	<div class="wrap">
		<div class="page">
			<h3>잘못된 접속</h3>
		</div>
		
		<div class="section">
			사용자는 해당 사이트에 대한 권한이 없습니다.
			<br><br>
			
			<hr>
			<a  href="/manager/main"><button class="item">돌아가기</button></a>
			<a href="/manager/logout"><button class="item">로그아웃</button></a>
		</div> <!-- section End -->
	</div> <!-- wrap End -->
</div> <!-- full End -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>구매자 상세정보</h1>
	<hr>
	
	<h3>번호: ${buyerdetail.bCode }</h3>
	
	<a href="./buyerupdate?bCode=${buyer.bCode }"><button>수정</button></a>
	<a href="./buyerdel?bCode=${buyer.bCode }"><button>삭제</button></a>

</body>
</html>

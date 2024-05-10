<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myRank</title>
</head>
<body>
	<div class="full">
		<div class="wrap">
			<h2>멤버쉽 관리</h2>
			<hr>
			<div class="page">
				<h3>현재 멤버쉽 등급</h3>
				<p>이름 : ${buyer.bName }</p>
				<p>아이디 : ${buyer.bId }</p>
				<p>등급 : ${buyerRank.rankName }</p>
			</div>
		</div>
	</div>
</body>
</html>
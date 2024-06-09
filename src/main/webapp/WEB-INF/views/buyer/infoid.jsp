<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<div class="page">
		<h3>아이디 찾기</h3>
		</div>
		
		<div class="section">
		<c:set var="bId" value="${bId }"/>
			<c:if test="${bId eq null }">
				<p>회원 정보와 일치하는 아이디가 없습니다.</p>
				<a href="/buyer/findid"><button class="btn btnLeft">돌아가기</button></a>
			</c:if>
			
			<c:if test="${bId ne null }">
				<p>회원님의 아이디는 [ ${bId } ] 입니다.</p>
				<a href="/buyer/findpw"><button class="btn btnRight">비밀번호 찾기</button></a>
			</c:if>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
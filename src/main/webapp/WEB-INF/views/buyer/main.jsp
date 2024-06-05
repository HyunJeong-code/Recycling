<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새활용 메인페이지</title>
<link rel="stylesheet" href="/resources/css/common.css">
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

<div class="full">
	<div class="wrap">
		
		<div class="page">
			<h3>체험단</h3>
		</div>
		
		<div class="section">
			
		</div>
		
		<div class="page">
			<h3>재활용품</h3>
		</div>
		
		<div class="section">
			<c:forEach var="rcy" items="${rcy }">
				<div class="prd">
					<img alt="상품 이미지" src="/upload/${rcy.ORIGINNAME }">
					<a href="/buyer/recycling/rcydetail?prdCode=${rcy.PRDCODE }">${rcy.PRDNAME }</a>
				</div>
			</c:forEach>
		</div>
		
		<div class="page">
			<div>새활용</div>
		</div>
		
		<div class="section">
			<c:forEach var="upcy" items="${upcy }">
				<div class="prd">
					<img alt="상품 이미지" src="/upload/${upcy.ORIGINNAME }">
					<a href="/buyer/recycling/upcydetail?prdCode=${upcy.PRDCODE }">${upcy.PRDNAME }</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>

</body>
</html>
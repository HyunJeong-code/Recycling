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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
$(function(){
	
// 	$("#exphit").click(function() {
		
// 		var ctg = $("#exphit").val();
// 		console.log("exphit : " + ctg);
		
// 		$.ajax({
// 			type: 'get',
// 			url : '/buyer/main',
// 			dataType: 'json',
// 			data: {ctg : ctg},
// 			success: function(res) {
				
// 			}
// 		})
// 	})

	$("#expHit").click(function() {
		$(".expNew").css("display", "none");
		$(".expHit").css("display", "inline-block");
	})
	
	$("#expNew").click(function() {
		$(".expHit").css("display", "none");
		$(".expNew").css("display", "inline-block");
	})
	
	$("#rcyHit").click(function() {
		$(".rcyNew").css("display", "none");
		$(".rcyHit").css("display", "inline-block");
	})
	
	$("#rcyNew").click(function() {
		$(".rcyHit").css("display", "none");
		$(".rcyNew").css("display", "inline-block");
	})
	
	$("#upcyHit").click(function() {
		$(".upcyNew").css("display", "none");
		$(".upcyHit").css("display", "inline-block");
	})
	
	$("#upcyNew").click(function() {
		$(".upcyHit").css("display", "none");
		$(".upcyNew").css("display", "inline-block");
	})
	
})
</script>
<style type="text/css">
.btnBox {
	text-align: center;
}

.mainTitle {
	text-align: center;
	border-bottom: 3px solid black;
}

.mainContent {
	text-align: center;
	justify-content: space-around;
}

.imgSum {
	width: 200px;
	height: 200px;
}

.mainPrd {
	display: inline-block;
	text-align: center;
}

.mainPrd P {
	width: 200px;
    overflow: hidden;
	text-overflow: ellipsis;
    white-space: nowrap;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

<div class="full">
	<div class="wrap">
		<div class="page mainTitle">
			<h3>재활용품</h3>
		</div>
		
		<div class="section mainContent">
			<div class="btnBox">
				<button id="rcyHit">인기순</button><button id="rcyNew">최신순</button>
			</div>
			<c:forEach var="rcyHit" items="${rcyHit }">
				<div class="mainPrd rcyHit">
					<a href="/buyer/recycling/rcydetail?prdCode=${rcyHit.PRDCODE }">
					<img alt="상품 이미지"	src="/resources/image/${rcyHit.ORIGINNAME }" class="imgSum">
					<p>${rcyHit.PRDNAME }</p>
					</a>
				</div>
			</c:forEach>
			
			<c:forEach var="rcyNew" items="${rcyNew }">
				<div class="mainPrd rcyNew" style="display:none;">
					<a href="/buyer/recycling/rcydetail?prdCode=${rcyNew.PRDCODE }">
					<img alt="상품 이미지"	src="/resources/image/${rcyNew.ORIGINNAME }" class="imgSum">
					<p>${rcyNew.PRDNAME }</p>
					</a>
				</div>
			</c:forEach>
		</div>
		
		<div class="page mainTitle">
			<h3>새활용</h3>
		</div>
		
		<div class="section mainContent">
			<div class="btnBox">
				<button id="upcyHit">인기순</button><button id="upcyNew">최신순</button>
			</div>
			<c:forEach var="upcyHit" items="${upcyHit }">
				<div class="mainPrd upcyHit">
					<a href="/buyer/upcycling/upcydetail?prdCode=${upcyHit.PRDCODE }">
					<img alt="상품 이미지"	src="/resources/image/${upcyHit.ORIGINNAME } class="imgSum">
					<p>${upcyHit.PRDNAME }</p>
					</a>
				</div>
			</c:forEach>
			
			<c:forEach var="upcyNew" items="${upcyNew }">
				<div class="mainPrd upcyNew" style="display:none;">
					<a href="/buyer/upcycling/upcydetail?prdCode=${upcyNew.PRDCODE }">
					<img alt="상품 이미지"	src="/resources/image/${upcyNew.ORIGINNAME }" class="imgSum">
					<p>${upcyNew.PRDNAME }</p>
					</a>
				</div>
			</c:forEach>
		</div>
		
		<div class="page mainTitle">
			<h3>체험단</h3>
		</div>
		
		<div class="section mainContent">
			<div class="btnBox">
				<button id="expHit">인기순</button><button id="expNew">최신순</button>
			</div>
			
			<c:forEach var="expHit" items="${expHit }">
				<div class="mainPrd expHit">
					<a href="/buyer/exp/expdetail?expCode=${expHit.EXPCODE }">
					<img alt="상품 이미지"	src="/resources/image/${expHit.ORIGINNAME }" class="imgSum">
					<p>${expHit.EXPNAME }</p>
					</a>
				</div>
			</c:forEach>
		
			<c:forEach var="expNew" items="${expNew }">
				<div class="mainPrd expNew" style="display:none;">
					<a href="/buyer/exp/expdetail?expCode=${expNew.EXPCODE }">
					<img alt="상품 이미지"	src="/resources/image/${expNew.ORIGINNAME }" class="imgSum">
					<p>${expNew.EXPNAME }</p>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>

</body>
</html>
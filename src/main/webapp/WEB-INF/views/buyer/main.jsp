<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새활용 메인페이지</title>
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
		$("#expNew").css("background-color", "#878787");
		$(".expHit").css("display", "inline-block");
		$("#expHit").css("background-color", "#4CAF50");
	})
	
	$("#expNew").click(function() {
		$(".expHit").css("display", "none");
		$("#expHit").css("background-color", "#878787");
		$(".expNew").css("display", "inline-block");
		$("#expNew").css("background-color", "#4CAF50");
	})
	
	$("#rcyHit").click(function() {
		$(".rcyNew").css("display", "none");
		$("#rcyNew").css("background-color", "#878787");
		$(".rcyHit").css("display", "inline-block");
		$("#rcyHit").css("background-color", "#4CAF50");
	})
	
	$("#rcyNew").click(function() {
		$(".rcyHit").css("display", "none");
		$("#rcyHit").css("background-color", "#878787");
		$(".rcyNew").css("display", "inline-block");
		$("#rcyNew").css("background-color", "#4CAF50");
	})
	
	$("#upcyHit").click(function() {
		$(".upcyNew").css("display", "none");
		$("#upcyNew").css("background-color", "#878787");
		$(".upcyHit").css("display", "inline-block");
		$("#upcyHit").css("background-color", "#4CAF50");
	})
	
	$("#upcyNew").click(function() {
		$(".upcyHit").css("display", "none");
		$("#upcyHit").css("background-color", "#878787");
		$(".upcyNew").css("display", "inline-block");
		$("#upcyNew").css("background-color", "#4CAF50");
	})
	
})
</script>
<style type="text/css">
.btnBox {
	text-align: center;
}

.mainTitle {
	text-align: center;
}

.mainContent {
	text-align: center;
	justify-content: center;
	margin-bottom: 50px;
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

.mainContent {
	max-width: 1200px;
	height: auto; /* 높이 자동으로 설정 */
	overflow: hidden;
	padding-bottom: 20px; /* 하단 패딩 추가 */
	background-color: #f8f9fa;
}

</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

<div class="full">
	<div class="wrap">
		<div class="page-header mainTitle">
			<h3>재활용품</h3>
		</div>
		
		<div class="section mainContent">
			<div class="btnBox">
				<button id="rcyHit" class="item">인기순</button><button id="rcyNew" class="item">최신순</button>
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
		
		<div class="page-header mainTitle">
			<h3>새활용</h3>
		</div>
		
		<div class="section mainContent">
			<div class="btnBox">
				<button id="upcyHit" class="item">인기순</button><button id="upcyNew" class="item">최신순</button>
			</div>
			<c:forEach var="upcyHit" items="${upcyHit }">
				<div class="mainPrd upcyHit">
					<a href="/buyer/upcycling/upcydetail?prdCode=${upcyHit.PRDCODE }">
					<img alt="상품 이미지"	src="/resources/image/${upcyHit.ORIGINNAME }" class="imgSum">
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
		
		<div class="page-header mainTitle">
			<h3>체험단</h3>
		</div>
		
		<div class="section mainContent">
			<div class="btnBox">
				<button id="expHit" class="item">인기순</button><button id="expNew" class="item">최신순</button>
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
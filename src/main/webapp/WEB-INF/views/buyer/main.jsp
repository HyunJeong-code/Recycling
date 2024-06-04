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
	
})
</script>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

<div class="full">
	<div class="wrap">
		
		<div class="page">
			<h3>체험단</h3>
		</div>
		
		<div class="section">
			<button id="exphit" name="ctg" value="exphit">인기순</button><button id="expnew" name="ctg" value="expnew">최신순</button>
			<c:forEach var="exp" items="${exp }">
				<div class="exp">
<%-- 					<img alt="상품 이미지" src="/upload/${rcy.ORIGINNAME }"> --%>
					<img class="epximg" alt="상품 이미지"	src="/resources/image/plastic_01.jpg">
					<a href="/buyer/exp/expdetail?expCode=${exp.EXPCODE }">${exp.EXPNAME }</a>
				</div>
			</c:forEach>
		</div>
		
		<div class="page">
			<h3>재활용품</h3>
		</div>
		
		<div class="section">
			<button id="rcyhit" name="ctg" value="rcyhit">인기순</button><button id="rcynew" name="ctg" value="rcynew">최신순</button>
			<c:forEach var="rcy" items="${rcy }">
				<div class="prd">
<%-- 					<img alt="상품 이미지" src="/upload/${rcy.ORIGINNAME }"> --%>
					<img class="prdimg" alt="상품 이미지"	src="/resources/image/plastic_01.jpg">
					<a href="/buyer/recycling/rcydetail?prdCode=${rcy.PRDCODE }">${rcy.PRDNAME }</a>
				</div>
			</c:forEach>
		</div>
		
		<div class="page">
			<h3>새활용</h3>
		</div>
		
		<div class="section">
			<button id="upcyhit" name="ctg" value="upcyhit">인기순</button><button id="upcynew" name="ctg" value="upcynew">최신순</button>
			<c:forEach var="upcy" items="${upcy }">
				<div class="prd">
<%-- 					<img alt="상품 이미지" src="/upload/${upcy.ORIGINNAME }"> --%>
					<img alt="상품 이미지"	src="/resources/image/plastic_01.jpg">
					<a href="/buyer/upcycling/upcydetail?prdCode=${upcy.PRDCODE }">${upcy.PRDNAME }</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>

</body>
</html>
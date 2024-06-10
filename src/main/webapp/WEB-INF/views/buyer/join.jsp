<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	var bCt = $("#bCtPri").val();
	
	if(bCt === "P") {
		$("#pri").css("display", "block");				
	}
	
	$("#bCtPri").click(function() {
		$("#pri").css("display", "block");		
		$("#cmp").css("display", "none");		
	})
	
	$("#bCtCmp").click(function() {
		$("#pri").css("display", "none");		
		$("#cmp").css("display", "block");		
	})
	
})
</script>
<style type="text/css">
div .buyerCt input[type='radio'] {
/* 	웹킷 브라우저에서 기본 스타일 제거 */
	-webkit-appearance: none; 
/*  	 모질라 브라우저에서 기본 스타일 제거  */
 	-moz-appearance: none; 
 	appearance: none;
 	width: 20px;
 	height: 20px;
 	border: 2px solid black;
 	border-radius: 50%;
 	outline: none;
 	cursor: pointer;
}

div .buyerCt input[type='radio']:checked {
	background-color: #4CAF50;
	border: 3px solid white;
	box-shadow: 0 0 0 1.6px #4CAF50;
}

.wrap {
	text-align: center;
}

.join {
	width: 600px;
	margin: 0 auto;
	text-align: left;
}

#buyerCt {
	text-align: center;
}

.section #buyerCt label {
	display: inline-block;
	width: 50px;
	height: 50px;
}

.section #buyer label {
	display: inline-block;
	width: 200px;
	height: 50px;
}

.a-move {
	color: white;
}

.btn-list {
	display: flex;
	justify-content: space-around;
	margin-top: 50px;
}

#pri, #cmp {
	text-align: center;
}

.line {
	margin-top: 20px;
	margin-bottom: 20px;
}

#btnLogin {
	margin-top: 20px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<div class="page-header">
			<h3>회원가입</h3>
		</div>
		
		<div class="section">
		<div class="join">
			<div id="buyerCt" class="buyerCt">
				<input type="radio" name="bCtCode" id="bCtPri" value="P" checked="checked"> 
				<label for="bCtPri">개인</label>
				
				<input type="radio" name="bCtCode" id="bCtCmp" value="C">
				<label for="bCtCmp">기업</label>	
			</div>
			
			<div style="width: 600px;" class="line">
					<hr>
			</div>
				
			<div id="pri" style="display: none;">
				<a href="/buyer/prijoin"><button class="btn btnRight" style="width: 150px;">개인 일반 회원가입</button></a>
				
<!-- 				<div style="width: 600px;" class="line"> -->
<!-- 					<hr> -->
<!-- 				</div> -->
				
<!-- 				<div id="social" class="btn-list"> -->
<!-- 					<button class="btn btnLeft" style="width: 120px;">네이버 로그인</button> -->
<!-- 					<button class="btn btnLeft" style="width: 120px;">카카오 로그인</button> -->
<!-- 					<button class="btn btnLeft" style="width: 120px;">구글 로그인</button> -->
<!-- 				</div> -->
			</div>
			
			<div id="cmp" style="display: none;">
				<a href="/buyer/cmpjoin"><button class="btn btnRight" style="width: 150px;">기업 일반 회원가입</button></a>
			</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
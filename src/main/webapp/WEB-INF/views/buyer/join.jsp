<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/common.css">
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
</head>
<body>
<div class="full">
	<div class="wrap">
		<div class="page">
		<h3>회원가입</h3>
		</div>
		
		<div class="section">
			<div id="buyerCt">
				<input type="radio" name="bCtCode" id="bCtPri" value="P" checked="checked"> 
				<label for="bCtPri">개인</label>
				
				<input type="radio" name="bCtCode" id="bCtCmp" value="C">
				<label for="bCtCmp">기업</label>	
			</div>
			
			<div id="pri" style="display: none;">
				<button><a href="./prijoin">개인 일반 회원가입</a></button>
				
				<div id="social">
					<button>네이버 로그인</button>
					<button>카카오 로그인</button>
					<button>구글 로그인</button>
				</div>
			</div>
			
			<div id="cmp" style="display: none;">
				<button><a href="./cmpjoin">기업 일반 회원가입</a></button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
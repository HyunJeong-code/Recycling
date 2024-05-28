<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
	
	// 아이디
	$("#bId").blur(function() {
		if($("#bId").val() == '') {
			$("#id").css("display", "block");
		} else {
			$("#id").css("display", "none");
		}
	})
	
	// 비밀번호
	$("#bPw").blur(function() {
		if($("#bPw").val() == '') {
			$("#pw").css("display", "block");
		} else {
			$("#pw").css("display", "none");
		}
	})
})
</script>
</head>
<body>

<div class="full">
	<div class="wrap">
		<div class="page">
		</div>
		
		<div class="section">
			<form action="./login" method="post">
				
				<div id="buyerCt">
					<input type="radio" name="bCtCode" id="bCtPri" value="P" checked="checked"> 
					<label for="bCtPri">개인</label>
					
					<input type="radio" name="bCtCode" id="bCtCmp" value="C">
					<label for="bCtCmp">기업</label>
				</div>
				
				<div id="buyer">
					<label for="bId">ID</label>
					<input id="bId" name="bId" placeholder="아이디를 입력해주세요."><br>
					<div id="id" style="display:none; color:red;">아이디는 필수입니다.</div>
					
					<label for="bPw">PW</label>
					<input id="bPw" name="bPw" placeholder="비밀번호를 입력해주세요."><br>
					<div id="pw" style="display:none; color:red;">비밀번호는 필수입니다.</div>
					
					<button id="btnLogin">로그인</button>
				</div>
			</form>
				
				<div id="pri" style="display: none;">
				<button><a href="/buyer/prijoin">개인 일반 회원가입</a></button>
				
				<div id="social">
					<button>네이버 로그인</button>
					<button>카카오 로그인</button>
					<button>구글 로그인</button>
				</div>
				</div>
				
				<div id="cmp" style="display: none;">
					<button><a href="/buyer/cmpjoin">기업 일반 회원가입</a></button>
				</div>
		</div>
	</div>
</div>
</body>
</html>
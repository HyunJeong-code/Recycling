<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	$("#mgrId").blur(function() {
		if($("#mgrId").val() == '') {
			$("#id").css("display", "block");
		} else {
			$("#id").css("display", "none");
		}
	})
	
	// 비밀번호
	$("#mgrPw").blur(function() {
		if($("#mgrPw").val() == '') {
			$("#pw").css("display", "block");
		} else {
			$("#pw").css("display", "none");
		}
	})
	
	$("form").submit(function(e) {
		 if($("#bId").val() == '' || $("#bPw").val() == '') {
			 alert("필수 입력 정보를 모두 입력해야합니다.");
			 e.preventDefault();
		 }
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

.section #buyerCt label {
	display: inline-block;
	width: 50px;
	height: 50px;
	vertical-align: middle;
}

.section #buyer {
	text-align: center;
}

.section table {
	margin : 0 auto;
}

.section th {
	width: 200px;
}

.section input[type="text"] {
	width: 200px;
	height: 50px;
	border: none;
	border-bottom: 1px solid black;
}

/* .section #bId { */
/* 	width: 200px; */
/* 	height: 50px; */
/* 	border: none; */
/* 	border-bottom: 1px solid black; */
/* 	position: relative; */
/* } */

/* .section #bPw { */
/* 	width: 200px; */
/* 	height: 50px; */
/* 	border: none; */
/* 	border-bottom: 1px solid black; */
/* 	position: relative; */
/* } */

/* #id { */
/* 	position: absolute; */
/* 	width: 200px; */
/* 	height: 30px; */
/* 	left: 850px;	 */
/* }  */

/* #pw { */
/* 	position: absolute; */
/* 	width: 200px; */
/* 	height: 30px; */
/* 	left: 850px;	 */
/* } */

.btn {
	width: 100px;
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

.section label {
	display: inline-block;
	width: 200px;
	height: 50px;
	vertical-align: middle;
	line-height: 50px;
}

.section input[type="text"], input[type="password"] {
	height: 50px;
	border: none;
	border-bottom: 1px solid black;
}

.btn-list {
	display: flex;
	justify-content: space-around;
	margin-top: 50px;
}

.agree {
	display: flex;
	justify-content: flex-end;
}

.section .agree .ag-chk {
	width: 100px;
}

.ag-box {
	margin-top: 50px;
	text-align: center;
}

.ag-content {
	width: 590px;
	height: 200px;
    overflow: auto;
}

.ag-content::-webkit-scrollbar {
    width: 10px;
}

.ag-content::-webkit-scrollbar-thumb {
    background-color: #4CAF50;
}

.ag-content::-webkit-scrollbar-track {
    background-color: #ccc;
}

.ne {
	color: red;
}

.j-info {
	font-size: 12px;
	height: 30px;
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
<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<div class="page">
		<h3>관리자 로그인</h3>
		</div>
		
		<div class="section">
		<div class="join">
			<form action="/manager/login" method="post">
				<div id="manager">
					<label for="mgrId">ID</label>
					<input type="text" id="mgrId" name="mgrId" placeholder="아이디를 입력해주세요.">
					<div class="j-info">
						<div id="id" style="display:none; color:red;">
							<label></label>
							아이디는 필수입니다.
						</div>
					</div>
					
					<label for="mgrPw">PW</label>
					<input type="password" id="mgrPw" name="mgrPw" placeholder="비밀번호를 입력해주세요." style="width: 200px;">
					<div class="j-info">
						<div id="pw" style="display:none; color:red;">
							<label></label>
							비밀번호는 필수입니다.
						</div>
					</div>
					
					<div class="btn-list">
						<button class="btn btnRight">로그인</button>
					</div>
				</div>
			</form>
								
				<div style="width: 600px;" class="line">
					<hr>
				</div>
				
				<div class="btn-list">
				<a href="/manager/join"><button type="button" class="btn btnLeft">회원가입</button></a>
				</div>				
				
				<div style="width: 600px;" class="line">
					<hr>
				</div>
				
				<div class="btn-list">
					<a href="/manager/findid"><button>아이디 찾기</button></a><a href="/manager/findpw"><button>비밀번호 찾기</button></a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
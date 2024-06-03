<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager/hr/empform.css">

<script type="text/javascript">
$(function() {
	
	$("#inEmail").hide();
	
	$("#mgrEmail2").change(function() {
		if($("#mgrEmail2").val() === "in") {
			$("#inEmail").show();
			$("#mgrEmail2").hide();
		} else {
			$("#inEmail").hide();
			$("#mgrEmail2").show();
		}
	})
	
	$("#inPhone").hide();
	
	$("#sPhone").change(function() {
		if($("#sPhone").val() === "in") {
			$("#inPhone").show();		
			$("#sPhone").hide();		
		} else {
			$("#inPhone").hide();				
			$("#sPhone").show();		
		}		
	})
	
}) // End Jquery
</script>
<style type="text/css">
/* 전체 기본 설정 */
* {
	margin: 0;
	padding: 0;
	border: 0;
	vertical-align: baseline;
	box-sizing: border-box;
	font: inherit;
	font-size: 100%;
	line-height: 1.5;
	color: #333;
}

/* 외부 레이아웃 설정 */
.full {
	width: 1200px;
	border: 1px solid #ccc;
	margin: 0 auto;
	display: flex;
	border-radius: 8px;
	overflow: hidden;
}

aside {
	width: 300px;
	background-color: #f1f1f1;
	border-right: 1px solid #ddd;
	box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.05);
}

.wrap {
	flex: 1;
	display: flex;
	flex-direction: column;
	padding: 20px;
}

/* 상단 페이지 */
.page {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	color: #007BFF;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

/* [우]하단 페이지 */
.btn_bot_style {
	display: flex;
	float: right;
	margin: 0 0 20px 0;
}

/* ------------------------------------- */

/* 섹션 스타일 */
.section {
	padding-top: 20px;
	width: 500px;
	margin: 0 auto;
}

.section select {
	padding: 12px;
	text-align: center;
	width: 100%;
}

.section input[type="date"] {
	padding: 12px;
	text-align: center;
	width: 100%;
}

.section div {
	margin-bottom: 20px;
	border: 1px solid #ccc;
}

.section div {
	margin-bottom: 20px;
	border: 1px solid #ccc;
}

label {
	color: #373f57;
	font-size: 16px;
	font-weight: bold;
}

.section input[type="text"] {
	padding: 12px;
	height: 46px;
	width: 100%;
}

.section .hyphen {
	height: 46px;
	padding: 10px 10px;
	font-weight: bold;
	vertical-align: middle;
	margin: 0px;
	border: 0px;
}

/* 파일버튼 디자인 */
.filebox {
	display: flex;
	justify-content: flex-end;
}

.filebox input[type="file"] {
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.filebox .upload_name
, .filebox .profile_name {
	display: inline-block;
	height: 46px;
	padding: 0 10px;
	vertical-align: middle;
	width: 79%;
	color: #999999;
}

.filebox label {
	display: inline-block;
	width: 21%;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 46px;
}

.phone_box {
	display: flex;
}

.phone_box input[type="text"] {
	width: calc(1/ 3);
	text-align: center;
}

.email_box {
	display: flex;
}

/* 버튼 세팅 */
.btn_inform{
	border: 0;
	width: 106px;
	margin: 0 auto;
}


.btn_bot_join, .btn_bot_cencle {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

.btn_bot_join {
	background-color: #4CAF50;
	color: white;
}

.btn_bot_join:hover {
	background-color: #45a049;
}

.btn_bot_cencle {
	background-color: #f44336;
	color: white;
	margin-left: 10px;
}

.btn_bot_cencle:hover {
	background-color: #da190b;
}

#mgrEmail1{
	border-right: 1px solid #ccc;
}
	
</style>

</head>
<body>
	<div class="full">
		<aside>
			옆에
		</aside>
		<div class="wrap">

			<div class="page">
				<h3>사원 등록</h3>
				<hr>
			</div>

			<div class="section">
				<form action="./empform" method="post" enctype="multipart/form-data">

				<label>사원증</label>
				<div class="filebox">
					<input class="upload_name" type="file" id="mgrProf" name="mgrProf" required="required">
					<label for="mgrProf">파일찾기</label>
				</div>
		
				<label for="mgrCode">사원 번호</label>
                <div>
                	<input type="text" id="mgrCode" name="mgrCode" required="required">
                </div>
				
                <label for="deptno">부서</label>
                <div>
	                <select class="deptno" id="deptno" name="deptno" required="required">
	                    <option value="20">인사팀</option>
	                    <option value="30">판매제휴팀</option>
	                    <option value="40">구매CS팀</option>
	                </select>
                </div>		
			
				<label for="mgrName">이름</label>
                <div>
                	<input type="text" id="mgrName" name="mgrName" required="required"> 
                </div>
<<<<<<< Updated upstream
                
				<label for="sPhone">핸드폰 번호</label>
				<div class="phone_box">
				<select class="sPhone" id="sPhone" name="sPhone">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="016">016</option>
					<option value="in">직접 입력</option>
				</select>
	                <input type="text" class="s" id="inPhone" name="inPhone" maxlength="3">
						<div class="hyphen">-</div>
	                <input type="text" class="s" id="mPhone" name="mPhone" maxlength="4">
	                    <div class="hyphen">-</div>
	                <input type="text" class="s" id="lPhone" name="lPhone" maxlength="4">
=======
				
                <label for="sPhone">핸드폰 번호</label>
                <div class ="phone_box">
	                <select class="sPhone" id="sPhone" name="sPhone" required="required">
	                    <option>010</option>
	                    <option>011</option>
	                    <option>017</option>
	                    <option>016</option>
	                    <option value="in">직접 입력</option>
	                </select>
	                <input type="text" id="inPhone" name="inPhone">
						<div class="hyphen">-</div>
	                <input type="text" id="mPhone" name="mPhone" required="required">
	                    <div class="hyphen">-</div>
	                <input type="text" id="lPhone" name="lPhone" required="required">
>>>>>>> Stashed changes
                </div>
				
				<label for="mgrBirth">생년월일</label>
				<div>
					<input type="date" id="mgrBirth" name="mgrBirth" required="required">
				</div>
				
				<label for="mgrGender">성별</label>
				<div>
					<select class="mgrGender" id="mgrGender" name="mgrGender" required="required">
						<option value="W">여성</option>
						<option value="M">남성</option>
					</select>
				</div>

				<label for="mgrEmail">이메일</label>	
				<div class="email_box">
				
					<input type="text" id="mgrEmail" name="mgrEmail" required="required">
			
					<select class="mgrEmail2" name="mgrEmail2" id="mgrEmail2" required="required">
						<option>@naver.com</option>
						<option>@gmail.com</option>
						<option>@daum.net</option>
						<option value="in">직접 입력</option>
					</select>
			</div>
						<div>
							<label for ="file">파일 업로드</td></label>
							<input type="file" id="file" name="file" required="required">
						</div>

					<div class ="btn_inform">
						<button class="btn_bot_join">등록하기</button>
					</div>
				</form>
			</div><!-- section -->
			</div>
		</div>
	</div>


</body>
</html>
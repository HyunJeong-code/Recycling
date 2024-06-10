<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">

<script type="text/javascript">
$(function() {
	// 직접 입력 선택 시 입력 필드 표시
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
		
	// 폼 제출 시 이메일 합쳐서 숨겨진 입력 필드에 설정
	$("form").submit(function() {
	    var mgrEmail1 = $("#mgrEmail1").val();
	    var mgrEmail2 = $("#mgrEmail2").val();
	    var inEmail = $("#inEmail").val();
	    var fullEmail;
	    
	    // sPhone에서 직접 입력을 선택한 경우
	    if ($("#mgrEmail2").val() === "in") {
	    	fullEmail = mgrEmail1 + "@" + mgrEmail2;
	    } else {
	        // sPhone에서 직접 입력이 아닌 경우
	        var inEmail = $("#inEmail").val();
	        fullEmail = mgrEmail1 + "@" + mgrEmail2;
	    }
	    
	    // 숨겨진 입력 필드에 값 설정
	    $("#mgrEmail").val(fullEmail);
	});
	
	
	// 일반 파일 이름 표시
	$('#file').on('change', function(event) {
	    var fileName = event.target.files[0].name;
	    $('.upload_name').val(fileName);
	});
	
	$('#profile').on('change', function(event) {
	    var profileName = event.target.files[0].name;
	    $('.profile_name').val(profileName);
	});
	
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

	// 폼 제출 시 핸드폰 번호를 합쳐서 숨겨진 입력 필드에 설정
	$("form").submit(function() {
	        var email1 = $("#inPhone").val();
	        var mPhone = $("#mPhone").val();
	        var lPhone = $("#lPhone").val();
	        var fullPhone;
	        
	        // sPhone에서 직접 입력을 선택한 경우
	        if ($("#sPhone").val() === "in") {
	            fullPhone = inPhone + "-" + mPhone + "-" + lPhone;
	        } else {
	            // sPhone에서 직접 입력이 아닌 경우
	            var sPhone = $("#sPhone").val();
	            fullPhone = sPhone + "-" + mPhone + "-" + lPhone;
	        }
	        
	        // 숨겨진 입력 필드에 값 설정
	        $("#mgrPhone").val(fullPhone);
	        console.log("mgrPhone : " + $("#mgrPhone").val()); // 값 확인
	});
	
}) // End Jquery
</script>
<style type="text/css">
/* [우]하단 페이지 */
.btn_bot_style {
	display: flex;
	float: right;
	margin: 0 0 20px 0;
}

/* 섹션 스타일 */
.section {
	padding-top: 20px;
	width: 500px;
	margin: 0 auto;
}

.section input[type="date"] {
	padding: 12px;
	text-align: center;
	width: 95%;
}

.section input[type="text"] {
	border: 1px solid #ccc;
}

.section div {
	margin-bottom: 20px;
}

.section textarea {
	border: 1px solid #ccc;
	width: 100%;
}

.btn_modal_wrap {
	display: flex;
}

label {
	color: #373f57;
	font-size: 16px;
	font-weight: bold;
}

.section input[type="text"] {
	padding: 12px;
	width: 95%;
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
	height: 37px;
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
	text-align: center;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
}

.deptno, .mgrGender{
	display: inline-block;
    height: 46px;
    padding: 0 10px;
    vertical-align: middle;
    width: 100%;
    color: #999999;
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

/* 모달1버튼 */
#btnSearchCmp {
	padding: 6px 12px;
	background-color: #652CB3;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	white-space: nowrap;
}

#btnSearchCmp:hover {
	background-color: #652CB3;
}

.modal-header {
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid black;
	padding-bottom: 10px;
}

/* 모달2버튼 */
.btnPostcode_wrap {
	width: 230px;
	margin: 0 auto;
}

#postcodeWrap {
	margin: 0 auto;
	display: flex;
	border-radius: 8px;
	overflow: auto;
}

#btnPostcode {
	padding: 12px 25px;
	background-color: #652CB3;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	white-space: nowrap;
}

#btnPostcode:hover {
	background-color: #652CB3;
}

#schDate {
	border: 1px solid #ccc;
}

.modal_time_con {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.modal_time_section {
	margin: 10px 0;
}

.modal_time_section h2 {
	margin: 0;
	font-size: 1.2em;
	color: #333;
}

.modal_time_buttons {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.modal_time-buttons input {
	margin: 5px;
	padding: 10px 20px;
	font-size: 1em;
	background-color: #f0f0f0;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.modal_time-buttons input:hover {
	background-color: #ddd;
}

.modal_body_title {
	margin-bottom: 5px;
	font-size: 20px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}


#applyBtn, #time_modal_cencle{
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

.applyBtn {
	background-color: #4CAF50;
	color: white;
}

.applyBtn:hover {
	background-color: #45a049;
}

.time_modal_cencle {
	background-color: #f44336;
	color: white;
	margin-left: 10px;
}

.time_modal_cencle:hover {
	background-color: #da190b;
}

button[type="submit"] {
    outline: 0;
    border: none;
    transition: all 0.2s ;
   	width: 90px;
   	height: 36px;
    background-color: #652CB3;
    border-radius: 5px;
   	color: white;
   	font-size: 15px;
}

button[type="submit"]:hover {
	background-color: #652CB3;
}

.btn_inform{
	margin: 0 auto;
    display: flex;
}

.btn_bot_join{
	margin: 0 auto;
}

.page{
margin-bottom: 20px;
}

#btn_insert_form{
	width: 105px;
	margin: 0 auto;
}

.phone_box{
	height: 46px;
}

</style>

</head>
<body>
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
			<div class="wrap">

			<div class="page">
				사원 등록
				<hr>
			</div>

			<div class="section">
				<form action="./empform" method="post" enctype="multipart/form-data">

				<label>사원증</label>
				<div class="filebox">
				    <input class="profile_name" placeholder="선택된 파일 없음" disabled>
				    <input type="file" id="profile" name="profile" required="required">
				    <label for="profile">파일찾기</label>
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
                </div>
                <input type="hidden" id="mgrPhone" name="mgrPhone">
				
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

				<label for="mgrEmail1">이메일</label>	
				<div class="email_box">
				
					<input type="text" id="mgrEmail1" name="mgrEmail1" required="required">
			
					<select class="mgrEmail2" name="mgrEmail2" id="mgrEmail2" required="required">
						<option value="naver.com">@naver.com</option>
						<option value="gmail.com">@gmail.com</option>
						<option value="daum.net">@daum.net</option>
						<option value="in">직접 입력</option>
					</select>
					<input type="text" id="inEmail" name="inEmail" placeholder="@test.com 형식으로 입력하세요.">
				</div>
				<input type="hidden" id="mgrEmail" name="mgrEmail">

				<label>일반 파일</label>
				<div class="filebox">
					<input class="upload_name" placeholder="선택된 파일 없음" disabled>
					<input type="file" id="file" name="file" required="required">
				<label for="file">파일찾기</label>
				</div>

				<div class ="btn_inform">
					<button class="btn btnRight" id ="btn_insert_form">등록하기</button>
				</div>
				</form>
			</div><!-- section -->
		</div><!-- wrap -->
		</div>
	</div>


</body>
</html>
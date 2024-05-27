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


				<button class="btn_bot_join">등록하기</button>
				<a href="./main"><button class="btn_bot_cencle">취소하기</button></a>

				</form>
			</div><!-- section -->
			</div>
		</div>
	</div>


</body>
</html>
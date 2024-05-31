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
	
	    // 직접 입력 선택 시 입력 필드 표시
	    $("#inPhone").hide();
	    
	    $("#sPhone").change(function() {
	        if ($("#sPhone").val() === "in") {
	            $("#inPhone").show();      
	            $("#sPhone").hide();    
	        } else {
	            $("#inPhone").hide();               
	            $("#sPhone").show();
	        }
	    });

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
	
})//end


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
	                <input type="text" class="s" id="inPhone" name="inPhone">
						<div class="hyphen">-</div>
	                <input type="text" class="s" id="mPhone" name="mPhone">
	                    <div class="hyphen">-</div>
	                <input type="text" class="s" id="lPhone" name="lPhone">
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
					<button class="btn_bot_join">등록하기</button>
				</div>
				</form>
			</div><!-- section -->
		</div><!-- wrap -->
	</div><!-- full -->


</body>
</html>
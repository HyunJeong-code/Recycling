<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webapp/resources/css/common.css">
<link rel="stylesheet" href="/webapp/resources/css/input.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	
	$("#update").click(function() {
		console.log("deptno : " + $("#detpno").val());
		
		if($("#detpno").val() === 'CEO') {
			$("#detpno").val(10);
		} else if ($("#detpno").val() === '인사팀') {
			$("#detpno").val(20);
		} else if($("#detpno").val() === '판매제휴팀') {
			$("#detpno").val(30);			
		} else {
			$("#detpno").val(40);						
		}
	})
	
	// 핸드폰 번호 처리
	var mgrPhone = "${manager.mgrPhone}".split("-");
	console.log("mgrPhone : " + mgrPhone);

	if($("#sPhone").val(mgrPhone[0])) {
		$("#inPhone").hide();
		$("#sPhone").val(mgrPhone[0]).attr("selected", "selected");
	} else {
		$("#inPhone").val(mgrPhone[0])
	}
	
	$("#mPhone").val(mgrPhone[1]);
	$("#lPhone").val(mgrPhone[2]);
	
	$("#sPhone").change(function() {
		if($("#sPhone").val() === "in") {
			$("#inPhone").show();		
			$("#sPhone").hide();		
		} else {
			$("#inPhone").hide();				
			$("#sPhone").show();		
		}		
	})
	
	// 이메일 처리
	var mgrEmail = "${manager.mgrEmail}".split("@");
	console.log("mgrEmail: " + mgrEmail);
	
	$("#mgrEmail").val(mgrEmail[0]);
	
	if($("#mgrEmail2").val("@" + mgrEmail[1])) {
		$("#inEmail").hide();
		$("mgrEmail2").val(mgrEmail[1]).attr("selected", "selected");
	} else {
		$("#inEmail").val(mgrEmail[1]);
	}
	
	$("#mgrEmail2").change(function() {
		if($("#mgrEmail2").val() === "in") {
			$("#inEmail").show();
			$("#mgrEmail2").hide();
		} else {
			$("#inEmail").hide();
			$("#mgrEmail2").show();
		}
	})
	
	// 핸드폰 번호
	$("#sPhone").blur(function() {
		if($("#sPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	// 핸드폰 번호 직접 입력
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
	
	$("#sPhone").blur(function() {
		if($("#sPhone").val() === 'in' && $("#inPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	$("#mPhone").blur(function() {
		if($("#sPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	$("#lPhone").blur(function() {
		if($("#sPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	// 이름
	$("#mgrName").blur(function() {
		if($("#mgrName").val() == '') {
			$("#name").css("display", "block");
		} else {
			$("#name").css("display", "none");			
		}
	})
	
	// 이메일
	$("#bEmail").blur(function() {
		if($("#bEmail").val() == '') {
			$("#email").css("display", "block");	
		} else {
			$("#email").css("display", "none");
		}
	})
	
	// 이메일 직접 입력
	$("#inEmail").hide();
	
	$("#bEmail2").change(function() {
		if($("#bEmail2").val() === "in") {
			$("#inEmail").show();
			$("#bEmail2").hide();
		} else {
			$("#inEmail").hide();
			$("#bEmail2").show();
		}
	})
	
	$("#bEmail2").blur(function() {
		if($("#bEmail2").val() == '') {
			$("#email").css("display", "block");				
		} else {
			$("#email").css("display", "none");			
		}
	})
	
	$("#bEmail2").blur(function() {
		if($("#bEmail2").val() === 'in' || $("#inEmail").val() == '') {
			$("#email").css("display", "block");				
		} else {
			$("#email").css("display", "none");			
		}
	})
})
</script>
</head>
<body>
<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
<div class="admin-container">
<sec:authentication var="managerLogin" property="principal"/>
<c:if test="${managerLogin.deptno eq 10}">
	<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
</c:if>
<c:if test="${managerLogin.deptno eq 20}">
	<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
</c:if>
<c:if test="${managerLogin.deptno eq 30}">
	<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
</c:if>
<c:if test="${managerLogin.deptno eq 40}">
	<c:import url="/WEB-INF/views/layout/manager/managercsmenu.jsp"/>
</c:if>
	<div class="full content">
		<div class="wrap">
		<div class="page">
			<h3>사원 정보 변경</h3>
		</div>
		
		<div class="section">
		<c:set var="manager" value="${manager }"/>
		<c:set var="mgrFile" value="${mgrFile }"/>
			<form action="./mgrdetail" method="post" enctype="multipart/form-data">
				<div>
					<label for="mgrProf">사원증</label>
					<input type="file" id="mgrProf" name="mgrProf" required="required">
					<input type="hidden" id="mgrFlNo" name="mgrFlNo" value="${mgrFile.mgrFlNo }">
				</div>
		
			<div>
				<label for="mgrCode">사원 번호</label>	
				<input type="text" class="m" id="mgrCode" name="mgrCode" value="${manager.mgrCode }" readonly="readonly"><br>
				
				<label for="deptno">부서</label>
					<c:if test="${manager.deptno eq 20}">
						<input type="text" class="m" id="deptName" name="deptName" value="인사팀" readonly="readonly">
						<input type="hidden" class="m" id="deptno" name="deptno" value="${manager.deptno }">
					</c:if>
					<c:if test="${manager.deptno eq 10}">
						<input type="text" class="m" id="deptName" name="deptName" value="CEO" readonly="readonly">
						<input type="hidden" class="m" id="deptno" name="deptno" value="${manager.deptno }">
					</c:if>
					<c:if test="${manager.deptno eq 30}">
						<input type="text" class="m" id="deptName" name="deptName" value="판매제휴팀"  readonly="readonly">
						<input type="hidden" class="m" id="deptno" name="deptno" value="${manager.deptno }">
					</c:if>
					<c:if test="${manager.deptno eq 40}">
						<input type="text" class="m" id="deptName" name="deptName" value="구매CS팀" readonly="readonly">
						<input type="hidden" class="m" id="deptno" name="deptno" value="${manager.deptno }">
					</c:if>
				<br>			
				
				<label for="mgrEntDate">입사일</label>
				<input type="date" id="mgrEntDate" name="mgrEntDate" value="${manager.mgrEntDate }" readonly="readonly"><br>
				
				<label for="mgrId">아이디</label>
				<input type="text" class="m" id="mgrId" name="mgrId" value="${manager.mgrId }" readonly="readonly"><br>
				
				<label for="mgrName">이름</label>	
				<input type="text" class="m" id="mgrName" name="mgrName" value="${manager.mgrName }"><br>
				<div id="name" style="display:none; color:red;">이름은 필수입니다.</div>	
				
				<label for="sPhone">핸드폰 번호</label>
				<select class="sPhone" id="sPhone" name="sPhone">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="016">016</option>
					<option value="in">직접 입력</option>
				</select>
				<input type="text" class="s" id="inPhone" name="inPhone">-<input type="text" class="s" id="mPhone" name="mPhone">-<input type="text" class="s" id="lPhone" name="lPhone"><br>
				<div id="phone" style="display:none; color:red;">핸드폰 번호는 필수입니다.</div>
				
				<label for="mgrBirth">생년월일</label>
				<input type="date" id="mgrBirth" name="mgrBirth" value="${manager.mgrBirth }" readonly="readonly"><br>
				
				<label for="mgrGender">성별</label>
				<c:if test="${manager.mgrGender eq 'W' }">
					<input type="text" class="s" id="mgrGender" name="mgrGender" value="여성">
				</c:if>
				<c:if test="${manager.mgrGender eq 'M' }">
					<input type="text" class="s" id="mgrGender" name="mgrGender" value="남성">
				</c:if>
			</div>

			<div>
				<label for="mgrEmail">이메일</label>	
				<input type="text" id="mgrEmail" name="mgrEmail" required="required">
				
				<select class="mgrEmail2" name="mgrEmail2" id="mgrEmail2">
					<option>@naver.com</option>
					<option>@gmail.com</option>
					<option>@daum.net</option>
					<option value="in">직접 입력</option>
				</select>
				<input type="text" id="inEmail" name="inEmail" placeholder="@test.com 형식으로 입력하세요.">		
				<div id="email" style="display:none; color:red;">이메일은 필수입니다.</div>		
			</div>
				
				
				<button class="btn btnRight">변경하기</button>
			</form>
		</div> <!-- section End -->
		</div>
	</div> <!-- wrap End -->
</div> <!-- full End -->

</body>
</html>
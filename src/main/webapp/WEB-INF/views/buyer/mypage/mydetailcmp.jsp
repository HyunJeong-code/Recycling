<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myDetailCmp</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>

<script type="text/javascript">
$(function() {
	var num;
	var originalEmail = $('#bEmail').val();
    var emailChanged = false;
	
    $("#bEmail").on('input', function() {
        var currentEmail = $(this).val();
        emailChanged = currentEmail !== originalEmail;
    });
    
	$("#btnEmail").click(function() {
		if (!emailChanged) {
            alert("이메일을 변경해주세요.");
            return;
        }
		
		var email = $('#bEmail').val();
		console.log("이메일 : " + email);
		var emailNum = $("#emailNum")
		
		$.ajax({
			type: 'post',
			url : './EmailAuth',
			data: {email : email},
			dataType: 'json',
			success: function(res) {
				console.log("res : " + res);
				$("#emailChk").css("display", "block");
				num = res;
				alert("인증번호가 발송되었습니다. 입력하신 메일의 메일함을 확인해주세요.");
			}
		})
	})
	
	$("#emailNum").focusout(function() {
		var inputNum = $("#emailNum").val();
		
		console.log("입력 인증 번호 : " + inputNum);
		console.log("전송 인증 번호 : " + num);
		
		if(Number(inputNum) === num) {
			$("#emailOk").css("display", "block");
			$("#bEmail").css("disabled", "true");
			$("#bEmail2").css("disabled", "true");
			$("#btnEmail").css("disabled", "true");
			$("#emailNo").css("display", "none");			
		} else {
			$("#emailNo").css("display", "block");			
			$("#emailOk").css("display", "none");			
		}
	});
	
	$("form").submit(function(e) {
		if (emailChanged && $("#emailOk").css("display") !== "block") {
            alert("이메일 인증을 완료해주세요.");
            e.preventDefault();
        }
	});
	
	<c:if test="${not empty success }">
    	alert("${success }");
	</c:if>
	
})
</script>

<script>
var previousChecked = {};

function toggleRadioButton(element) {
	
	var name = element.name;
	
	if(previousChecked[name] === element) {
		
		element.checked = false;
		previousChecked[name] = null;
		
	} else {
		
		previousChecked[name] = element;
		
	}
	
}
	
function cancelUpdate() {
		
	window.history.back();
		
}
</script>

<style>
body {
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}
.full {
    display: flex;
    justify-content: center;
    padding: 20px;
}
h2 {
    margin-top: 0;
    color: #333;
}
hr {
    border: 0;
    border-top: 1px solid #ccc;
    margin: 20px 0;
}
.page a {
    display: block;
    margin: 10px 0;
    color: #0066cc;
    text-decoration: none;
}
.page a:hover {
    text-decoration: underline;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}
table, th, td {
    border: 1px solid #dddddd;
}
th, td {
    padding: 15px;
    text-align: left;
}
th {
    background-color: #f2f2f2;
}
.form-group {
    margin-bottom: 20px;
}
.custom-file-upload {
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
}
.button-group {
	text-align: center;
	margin-top: 20px;
}
.button-group input {
    margin-right: 10px;
    padding: 10px 20px;
    background-color: #0066cc;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
.button-group input[type="button"] {
    background-color: #ccc;
}
.button-group input:hover {
    background-color: #005bb5;
}
.button-group input[type="button"]:hover {
    background-color: #bbb;
}
</style>

</head>
<body>
	<div class="full">
		<div class="wrap">
			
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
<!-- 마이페이지 버튼 -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${buyerLogin.bCtCode == 'P' }"> --%>
<%-- 						<a href="${pageContext.request.contextPath }/buyer/mypage/mypagepri">마이페이지</a> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${buyerLogin.bCtCode == 'C' }"> --%>
<%-- 						<a href="${pageContext.request.contextPath }/buyer/mypage/mypagecmp">마이페이지</a> --%>
<%-- 					</c:when> --%>
<%-- 				</c:choose> --%>
				<form action="${pageContext.request.contextPath }/buyer/mypage/mydetailcmp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="bCode" value="${currentBuyer.bCode }">
					
					<div class="mydetailcmp">
						<table>
							<tr>
								<th colspan="2">기업 정보 수정</th>
							</tr>
							<tr>
								<td>프로필 선택</td>
								<td>
									<img src="${pageContext.request.contextPath}/resources/image/${buyerProf.storedName}" alt="프로필 이미지" style="width: 100px; height: 100px;">
                    				<input type="file" id="cmpProf" name="cmpProf">
								</td>
							</tr>
							<tr>
								<td>담당자 이름</td>
								<td><input type="text" id="bName" name="bName" value="${currentBuyer.bName}"></td>
							</tr>
							<tr>
								<td>아이디</td>
								<td><input type="text" id="bId" name="bId" value="${currentBuyer.bId }" readonly></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>
									<select id="phoneSelect">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="custom">직접입력</option>
									</select>
									<input type="text" id="bPhone1" name="bPhone1" maxlength="3" style="width: 50px;">
				                    - <input type="text" id="bPhone2" name="bPhone2" maxlength="4" style="width: 70px;">
				                    - <input type="text" id="bPhone3" name="bPhone3" maxlength="4" style="width: 70px;">
								</td>
							</tr>
							<tr>
								<td>담당자 이메일</td>
								<td>
									<input type="text" id="bEmail" name="bEmail" value="${fn:substringBefore(currentBuyer.bEmail, '@')}">
				                    @ <input type="text" id="emailDomain" name="emailDomain" value="${fn:substringAfter(currentBuyer.bEmail, '@')}">
				                    <select id="emailSelect">
										<option value="naver.com">naver.com</option>
				                        <option value="gmail.com">gmail.com</option>
				                        <option value="daum.net">daum.net</option>
				                        <option value="custom">직접입력</option>
									</select>
									<input type="button" id="btnEmail" value="이메일 인증">
									<div id="emailChk" style="display: none;">
										<label for="emailNum">이메일 인증 번호</label>
										<input type="text" id="emailNum" name="emailNum" placeholder="인증번호 6자리를 입력해주세요.">
										<div id="emailOk" style="color: green; display: none;">
											인증번호가 일치합니다.
										</div>
										<div id="emailNo" style="color: red; display: none;">
											인증번호가 불일치합니다. 다시 입력해주세요.
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>광고성 정보 수신 여부</td>
								<td>
									<label for="adSms">SMS</label>
									<input type="radio" name="adSms" id="adSms" value="Y" 
									<c:if test="${currentBuyer.adSms eq 'Y' }">checked</c:if> onclick="toggleRadioButton(this)">
									
									<label for="adEmail">Email</label>
									<input type="radio" name="adEmail" id="adEmail" value="Y" 
									<c:if test="${currentBuyer.adEmail eq 'Y' }">checked</c:if> onclick="toggleRadioButton(this)">
								</td>
							</tr>
							<tr>
								<td>대표자명</td>
								<td><input type="text" id="cmpCeo" name="cmpCeo" value="${currentCmp.cmpCeo }"></td>
							</tr>
							<tr>
								<td>상호명(법인명)</td>
								<td><input type="text" id="cmpName" name="cmpName" value="${currentCmp.cmpName }"></td>
							</tr>
							<tr>
								<td>사업자 등록 번호 / 법인 등록 번호</td>
								<td><input type="text" id="cmpNo" name="cmpNo" value="${currentCmp.cmpNo }"></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>
									<input type="text" id="cmpPostcode" name="cmpPostcode" value="${currentCmp.cmpPostcode }">
									<input type="button" value="우편번호 찾기">
								</td>
							</tr>
							<tr>
								<td>사업자 등록증 주소</td>
								<td><input type="text" id="cmpAddr" name="cmpAddr" value="${currentCmp.cmpAddr }"></td>
							</tr>
							<tr>
								<td>상세 주소</td>
								<td><input type="text" id="cmpDetail" name="cmpDetail" value="${currentCmp.cmpDetail }"></td>
							</tr>
							<tr>
								<td>사업자 등록증 첨부</td>
								<td>
									<c:if test="${not empty cmpFile }">
		    							<img src="${pageContext.request.contextPath }/resources/cmpfile/${cmpFile.storedName }" alt="사업자 등록증" style="width: 100px; height: 100px;">
									</c:if>
									<input type="file" id="cmpFile" name="cmpFile">
								</td>
							</tr>
						</table>
						<div class="button-group">
							<input type="submit" value="수정하기">
							<input type="button" value="취소하기" onclick="cancelUpdate()">
						</div>
					</div>
					
					<h3>광고성 정보 수신 여부 </h3>
					<label for="adSms">SMS</label>
					<input type="radio" name="adSms" id="adSms" value="Y" 
						<c:if test="${currentBuyer.adSms eq 'Y' }">checked</c:if> onclick="toggleRadioButton(this)">
					
					<label for="adEmail">Email</label>
					<input type="radio" name="adEmail" id="adEmail" value="Y" 
						<c:if test="${currentBuyer.adEmail eq 'Y' }">checked</c:if> onclick="toggleRadioButton(this)"><br>
					
					<label for="cmpCeo">대표자명 </label>
					<input type="text" id="cmpCeo" name="cmpCeo" value="${currentCmp.cmpCeo }"><br>
					
					<label for="cmpName">상호명(법인명) </label>
					<input type="text" id="cmpName" name="cmpName" value="${currentCmp.cmpName }"><br>
					
					<label for="cmpNo">사업자 등록 번호 / 법인등록번호 </label>
					<input type="text" id="cmpNo" name="cmpNo" value="${currentCmp.cmpNo }"><br>
					
					<label for="cmpPostcode">우편번호 </label>
					<input type="text" id="cmpPostcode" name="cmpPostcode" value="${currentCmp.cmpPostcode }">
					<input type="button" value="우편번호 찾기"><br>
					
					<label for="cmpAddr">사업자 등록증 주소 </label>
					<input type="text" id="cmpAddr" name="cmpAddr" value="${currentCmp.cmpAddr }"><br>
					
					<label for="cmpDetail">상세 주소 </label>
					<input type="text" id="cmpDetail" name="cmpDetail" value="${currentCmp.cmpDetail }"><br>
					
					<label for="cmpFile">사업자 등록증 첨부 </label><br>
					<c:if test="${not empty cmpFile }">
    					<img src="${pageContext.request.contextPath }/resources/cmpfile/${cmpFile.storedName }" alt="사업자 등록증" style="width: 100px; height: 100px;">
					</c:if>
					<input type="file" id="cmpFile" name="cmpFile"><br>
					
					<input type="submit" value="수정하기">
					<input type="button" value="취소하기" onclick="cancelUpdate()">
				</form>
				<c:if test="${not empty success }">
					<p style="color: green;">${success }</p>
				</c:if>
				<c:if test="${not empty error }">
					<p style="color: red;">${error }</p>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
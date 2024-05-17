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
	
	$("#btnEmail").click(function() {
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
		}) // End Ajax
	}) // End 이메일 인증
	
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
	
	// 수정 버튼 클릭 시 이메일 인증 여부 확인
	$("form").submit(function(e) {
		if($("#emailOk").css("display") !== "block") {
			alert("이메일 인증을 완료해주세요.");
			e.preventDefault();
		}
	});
	
}) // End Jquery
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

</head>
<body>
	<div class="full">
		<div class="wrap">
			<h2>기업 정보 수정</h2>
			<hr>
			<div class="page">
				<a href="/buyer/main">메인</a>
				<form action="${pageContext.request.contextPath }/buyer/mypage/mydetailcmp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="bCode" value="${currentBuyer.bCode }">
					<input type="hidden" name="adrCode" value="${buyerAdr.adrCode }">
					
					<label for="cmpProf">프로필 이미지 </label>
                    <input type="file" id="cmpProf" name="cmpProf"><br>
					
					<label for="bName">담당자 이름 </label>
					<input type="text" id="bName" name="bName" value="${currentBuyer.bName}"><br>
					
					<label for="bId">아이디 </label>
					<input type="text" id="bId" name="bId" value="${currentBuyer.bId }" readonly><br>
					
					<label for="bPhone">전화번호 </label>
					<input type="text" id="bPhone" name="bPhone" value="${currentBuyer.bPhone }"><br>
					
					<label for="bEmail">담당자 이메일 </label>
					<input type="text" id="bEmail" name="bEmail" value="${currentBuyer.bEmail }">
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
					
					<label for="cmpFile">사업자 등록증 첨부 </label>
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
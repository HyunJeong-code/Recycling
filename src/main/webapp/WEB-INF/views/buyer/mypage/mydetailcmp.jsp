<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myDetailCmp</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>

<script type="text/javascript">
$(document).ready(function() {
	var num;
    var originalEmail = $('#bEmail').val() + '@' + $('#emailDomain').val();
    var emailChanged = false;
    var emailVerified = false;
	
 // 이메일 입력 변경 감지
    $("#bEmail, #emailDomain").on('input', function() {
        var currentEmail = $('#bEmail').val() + '@' + $('#emailDomain').val();
        emailChanged = currentEmail !== originalEmail;
        emailVerified = false;
        $("#emailChk").hide();
        $("#emailOk").hide();
        $("#emailNo").hide();
        $("#emailNum").val('');
    });
    
 	// 이메일 인증 버튼 클릭
    $("#btnEmail").click(function() {
        if (!emailChanged) {
            alert("이메일을 변경해주세요.");
            return;
        }
        
        var email = $('#bEmail').val() + '@' + $('#emailDomain').val();
        console.log("이메일 : " + email);
        
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/buyer/mypage/EmailAuth',
            data: {email: email},
            dataType: 'json',
            success: function(res) {
                console.log("res : " + res);
                $("#emailChk").show();
                num = res;
                alert("인증번호가 발송되었습니다. 입력하신 메일의 메일함을 확인해주세요.");
            },
            error: function(xhr, status, error) {
                console.error("Ajax 오류:", status, error);
                alert("인증번호 발송에 실패했습니다. 다시 시도해주세요.");
            }
        });
    });
    
 	// 인증번호 입력 확인
    $("#emailNum").on('input', function() {
        var inputNum = $("#emailNum").val();
        
        console.log("입력 인증 번호 : " + inputNum);
        console.log("전송 인증 번호 : " + num);
        
        if (Number(inputNum) === num) {
            $("#emailOk").show();
            $("#emailNo").hide();
            emailVerified = true;
        } else {
            $("#emailNo").show();
            $("#emailOk").hide();
            emailVerified = false;
        }
    });
    
 	// 폼 제출 시 이메일 인증 확인 및 이메일 병합
    $("form").submit(function(e) {
        console.log("폼 제출 시 상태:", emailChanged, emailVerified);
        if (emailChanged && !emailVerified) {
            alert("이메일 인증을 완료해주세요.");
            e.preventDefault();
        } else {
            // 이메일 병합
            var email = $('#bEmail').val() + '@' + $('#emailDomain').val();
            $('#fullEmail').val(email);
        }
    });
    
 	// 이메일 도메인 선택에 따른 처리
    $("#emailSelect").change(function() {
        var selected = $(this).val();
        if (selected === 'custom') {
            $('#emailDomain').val('').prop('readonly', false);
        } else {
            $('#emailDomain').val(selected).prop('readonly', true);
        }
        // 도메인 선택 변경도 이메일 변경으로 처리
        var currentEmail = $('#bEmail').val() + '@' + $('#emailDomain').val();
        emailChanged = currentEmail !== originalEmail;
        emailVerified = false;
        $("#emailChk").hide();
        $("#emailOk").hide();
        $("#emailNo").hide();
        $("#emailNum").val('');
    });
 	
 	// 초기 이메일 도메인 설정
    var currentEmailDomain = "${fn:substringAfter(currentBuyer.bEmail, '@')}";
    if (["naver.com", "gmail.com", "daum.net"].includes(currentEmailDomain)) {
        $('#emailSelect').val(currentEmailDomain);
        $('#emailDomain').val(currentEmailDomain).prop('readonly', true);
    } else {
        $('#emailSelect').val('custom');
        $('#emailDomain').val(currentEmailDomain).prop('readonly', false);
    }
	
	// 전화번호 옵션 설정
	var phonePrefixes = ["010", "011", "016", "017"];
    var currentPhone = "${currentBuyer.bPhone}";
    var phoneParts = currentPhone.split("-");
	
    if (phonePrefixes.includes(phoneParts[0])) {
        $('#phoneSelect').val(phoneParts[0]);
        $('#bPhone1').val(phoneParts[0]).prop('readonly', true);
    } else {
        $('#phoneSelect').val('custom');
        $('#bPhone1').val(phoneParts[0]).prop('readonly', false);
    }
	
	$('#bPhone2').val(phoneParts[1]);
    $('#bPhone3').val(phoneParts[2]);
    
    $('#phoneSelect').change(function() {
        var selected = $(this).val();
        if (selected === 'custom') {
            $('#bPhone1').val('').prop('readonly', false);
        } else {
            $('#bPhone1').val(selected).prop('readonly', true);
        }
    })
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

<style type="text/css">
.mydetailcmp {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: center;
	height: 100vh;
	padding-top: 50px;
	text-align: center;
}

.form-group {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	margin-bottom: 15px;
	width: 100%;
}

label {
	margin-right: 10px;
	width: 150px;
	text-align: right;
}

input[type="text"], input[type="file"], select {
    width: 200px;
}

input[type="file"] {
	display: none;
}

.custom-file-upload {
	display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #f8f8f8;
    text-align: center;
}

.button-group {
    display: flex;
    justify-content: center;
    gap: 10px;
}

.button-group input[type="submit"], .button-group input[type="button"] {
    margin: 0 10px;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
			<h2>기업 정보 수정</h2>
			<hr>
			<div class="page">
				<c:choose>
					<c:when test="${buyerLogin.bCtCode == 'P' }">
						<a href="${pageContext.request.contextPath }/buyer/mypage/mypagepri">마이페이지</a>
					</c:when>
					<c:when test="${buyerLogin.bCtCode == 'C' }">
						<a href="${pageContext.request.contextPath }/buyer/mypage/mypagecmp">마이페이지</a>
					</c:when>
				</c:choose>
				<form action="${pageContext.request.contextPath }/buyer/mypage/mydetailcmp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="bCode" value="${currentBuyer.bCode }">
					<input type="hidden" id="fullEmail" name="fullEmail" value="${currentBuyer.bEmail}">
					
					<div class="mydetailcmp">
						<div class="form-group">
							<label for="buyerProf" class="custom-file-upload">프로필 선택</label><br>
							<img src="${pageContext.request.contextPath}/resources/image/${buyerProf.storedName}" alt="프로필 이미지" style="width: 100px; height: 100px;"><br>
                    		<input type="file" id="cmpProf" name="cmpProf"><br>
						</div>
						<div class="form-group">
							<label for="bName">담당자 이름 </label>
							<input type="text" id="bName" name="bName" value="${currentBuyer.bName}">
						</div>
						<div class="form-group">
							<label for="bId">아이디 </label>
							<input type="text" id="bId" name="bId" value="${currentBuyer.bId }" readonly>
						</div>
						<div class="form-group">
							<label for="bPhone">전화번호 </label>
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
						</div>
						<div class="form-group">
							<label for="bEmail">담당자 이메일 </label>
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
						</div>
						<div class="form-group">
							<label>광고성 정보 수신 여부 </label>
							<label for="adSms">SMS</label>
							<input type="radio" name="adSms" id="adSms" value="Y" 
								<c:if test="${currentBuyer.adSms eq 'Y' }">checked</c:if> onclick="toggleRadioButton(this)">
							
							<label for="adEmail">Email</label>
							<input type="radio" name="adEmail" id="adEmail" value="Y" 
								<c:if test="${currentBuyer.adEmail eq 'Y' }">checked</c:if> onclick="toggleRadioButton(this)">
						</div>
						<div class="form-group">
							<label for="cmpCeo">대표자명 </label>
							<input type="text" id="cmpCeo" name="cmpCeo" value="${currentCmp.cmpCeo }">
						</div>
						<div class="form-group">
							<label for="cmpName">상호명(법인명) </label>
							<input type="text" id="cmpName" name="cmpName" value="${currentCmp.cmpName }">
						</div>
						<div class="form-group">
							<label for="cmpNo">사업자 등록 번호 / 법인등록번호 </label>
							<input type="text" id="cmpNo" name="cmpNo" value="${currentCmp.cmpNo }">
						</div>
						<div class="form-group">
							<label for="cmpPostcode">우편번호 </label>
							<input type="text" id="cmpPostcode" name="cmpPostcode" value="${currentCmp.cmpPostcode }">
							<input type="button" value="우편번호 찾기">
						</div>
						<div class="form-group">
							<label for="cmpAddr">사업자 등록증 주소 </label>
							<input type="text" id="cmpAddr" name="cmpAddr" value="${currentCmp.cmpAddr }">
						</div>
						<div class="form-group">
							<label for="cmpDetail">상세 주소 </label>
							<input type="text" id="cmpDetail" name="cmpDetail" value="${currentCmp.cmpDetail }">
						</div>
						<div class="form-group">
							<label for="cmpFile">사업자 등록증 첨부 </label><br>
							<c:if test="${not empty cmpFile }">
		    					<img src="${pageContext.request.contextPath }/resources/cmpfile/${cmpFile.storedName }" alt="사업자 등록증" style="width: 100px; height: 100px;">
							</c:if>
							<input type="file" id="cmpFile" name="cmpFile">
						</div>
						<div class="button-group">
							<input type="submit" value="수정하기">
							<input type="button" value="취소하기" onclick="cancelUpdate()">
						</div>
					</div>
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
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
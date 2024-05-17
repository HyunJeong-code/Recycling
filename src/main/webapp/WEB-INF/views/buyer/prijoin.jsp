<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buyer Join</title>
<link rel="stylesheet" href="../../../resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	$("#btnEmail").click(function() {
		var email = $('#bEmail').val() + $('#bEmail2').val();
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
	})
	
}) // End Jquery
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('adrPostcode').value = data.zonecode;
            document.getElementById("adrAddr").value = (addr + " " + extraAddr);
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("adrDetail").focus();
        }
    }).open();
}
</script>
</head>
<body>

<div class="full">
	<div class="wrap">
		<div class="page">
		<h3>개인 회원가입</h3>
		</div>
		
		<div class="section">
			<form action="./prijoin" method="post" enctype="multipart/form-data">
			<div>
				<input type="file" id="buyerProf" name="buyerProf">
			</div>
			
			<div>
				<input type="text" id="bCtCode" name="bCtCode" value="P">
				<label for="bId">아이디</label>
				<input type="text" id="bId" name="bId">
				<button id="chkBid">중복 확인</button><br>
				
				<label for="bPw">비밀번호</label>
				<input type="text" id="bPw" name="bPw"><br>
				
				<label for="chkBpw">비밀번호 확인</label>
				<input type="text" id="chkBpw" name="chkBpw"><br>
				
				<div>
				<label for="bEmail">이메일</label>
				<input type="text" id="bEmail" name="bEmail">
				
				<select class="bEmail2" name="bEmail2" id="bEmail2">
					<option>@naver.com</option>
					<option>@gmail.com</option>
					<option>@daum.net</option>
				</select>
				<input type="button" id="btnEmail" value="이메일 인증">
				</div>
				
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
				
				<label for="bName">이름</label>
				<input type="text" id="bName" name="bName"><br>
				
				<label for="bPhone">핸드폰 번호</label>
				<input type="text" id="bPhone" name="bPhone">-<input type="text" id="mPhone" name="mPhone">-<input type="text" id="lPhone" name="lPhone">
				<br>
			</div>
			
			<div>
				<div id="infoAd">
					<label for="adEmail">이메일</label>
					<input type="checkbox" id="adEmail" name="adEmail" value="Y">
					  
					<label for="adSms">문자</label>
					<input type="checkbox" id="adSms" name="adSms" value="Y">  
				</div>
				
				<div id="address">
					<label for="adrPostcode">우편번호</label>
					<input type="text" id="adrPostcode" name="adrPostcode">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
					<br>
					
					<label for="adrAddr">주소</label>
					<input type="text" id="adrAddr" name="adrAddr"><br>
					
					<label for="adrDetail">상세 주소</label>
					<input type="text" id="adrDetail" name="adrDetail"><br>
				</div>
			</div>
				<button>가입하기</button>
				<button><a href="./join">취소하기</a></button>			
			</form>
		</div>
	</div>
</div>

</body>
</html>
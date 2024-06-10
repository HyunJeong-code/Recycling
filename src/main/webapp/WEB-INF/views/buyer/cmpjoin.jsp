<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	
	var rexId = /[a-z0-9]{8, 15}/;
	var rexPw = /[a-zA-Z0-9!@#$%]{8, 15}/;
	
	// 프로필
	$("#buyerProf").blur(function() {
		if($("#buyerProf").val() == '') {
			$("#prof").css("display", "block");
		} else {
			$("#prof").css("display", "none");			
		}
	})
	
	// 아이디
	$("#bId").blur(function() {
		if($("#bId").val() == '') {
			$("#id").css("display", "block");
		} else {
			$("#id").css("display", "none");
			
			if(rexId.test($("#bId"))) {
				$("#chkId").css("display", "block");				
			} else {
				$("#chkId").css("display", "none");								
			}
		}
	})
	
	// 아이디 중복 확인
	$("#chkBid").click(function() {
		var bId = $("#bId").val();
		
		$.ajax({
			type: 'post',
			url : './chkbid',
			data: {bId : bId},
			dataType: 'json',
			success: function(res) {
				console.log("res : " + res);
				
				if(res > 0) {
					alert("중복된 아이디가 존재합니다.");
				} else {
					alert("사용 가능한 아이디 입니다.");					
				}
			}
		}) // End Ajax
	})
	
	// 비밀번호
	$("#bPw").blur(function() {
		if($("#bPw").val() == '') {
			$("#pw").css("display", "block");
		} else {
			$("#pw").css("display", "none");
			
			if(rexPw.test($("#bPw"))) {
				$("#chkPw").css("display", "block");				
			} else {
				$("#chkPw").css("display", "none");								
			}
		}
	})
	
	// 비밀번호 확인
	$("#newPw").blur(function() {
		if($("#newPw").val() == '') {
			$("#cfmPw").css("display", "block");			
		} else {
			$("#cfmPw").css("display", "none");
			
			// 비밀번호 일치
			if($("#newPw").val() === $("#bPw").val()) {
				$("#okPw").css("display", "block");				
				$("#noPw").css("display", "none");				
			} else {
				$("#okPw").css("display", "none");				
				$("#noPw").css("display", "block");				
			}
		}
	})
	
	// 이메일
	$("#bEmail").blur(function() {
		if($("#bEmail").val() == '') {
			$("#email2").css("display", "block");	
		} else {
			$("#email2").css("display", "none");
		}
	})
	
	// 이메일 직접 입력
	$("#inEmail").hide();
	
	$("#bEmail2").change(function() {
		if($("#bEmail2").val() === "in") {
			$("#inEmail").show();
			$("#bEmail2").hide();
			$(".selectE").hide();
		} else {
			$("#inEmail").hide();
			$(".selectE").show();
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
	
	// 이메일 인증
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
	
	$("#chkEmail").click(function() {
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
	
	// 이름
	$("#bName").blur(function() {
		if($("#bName").val() == '') {
			$("#name").css("display", "block");
		} else {
			$("#name").css("display", "none");			
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
	
	// 기업 정보
	
	// 상호명
	$("#cmpNmae").blur(function() {
		if($("#cmpName").val() == '') {
			$("#cName").css("display", "block");
		} else {
			$("#cName").css("display", "none");			
		}
	})
	
	// 대표자명
	$("#cmpCeo").blur(function() {
		if($("#cmpCeo").val() == '') {
			$("#ceo").css("display", "block");
		} else {
			$("#ceo").css("display", "none");			
		}
	})
	
	// 사업자 등록 번호
	$("#cmpNum").blur(function() {
		if($("#cmpNum").val() == '') {
			$("#cNum").css("display", "block");
		} else {
			$("#cNum").css("display", "none");			
		}
	})
	
	// 우편 번호
	$("#cmpPostcode").blur(function() {
		if($("#cmpPostcode").val() == '') {
			$("#postcode").css("display", "block");
		} else {
			$("#postcode").css("display", "none");			
		}
	})
	
	// 주소
	$("#cmpAddr").blur(function() {
		if($("#cmpAddr").val() == '') {
			$("#addr").css("display", "block");
		} else {
			$("#addr").css("display", "none");			
		}
	})
	
	// 제출 서류
	$("#cmpNum").blur(function() {
		if($("#cmpNum").val() == '') {
			$("#cNum").css("display", "block");
		} else {
			$("#cNum").css("display", "none");			
		}
	})
	
	$("form").submit(function(e) {
		 if($("input[name=agree1]:checked").val() == 'N' ||  $("input[name=agree2]:checked").val() == 'N') {
			 alert("필수 약관 동의가 필요합니다.");
			 e.preventDefault();
		 } else if($("#bId").val() == '' || $("#bPw").val() == '' || $("#bName").val() == '' || $("#newPw").val() == ''
			 || $("#emailNum").val() == '' || $("#bEmail").val() == '' || $("#mPhone").val() == '' || $("#lPhone").val() == ''
				 || $("#cmpName").val() == '' || $("#cmpCeo").val() == '' || $("#cmpNum").val() == '' || $("#cmpPostcode").val() == '' || $("#cmpAddr").val() == '' || $("#cmpFile").val() == '') {
			 alert("필수 입력 정보를 모두 입력해야합니다.");
			 e.preventDefault();
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function cmpDaumPostcode() {
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
            document.getElementById('cmpPostcode').value = data.zonecode;
            document.getElementById("cmpAddr").value = (addr + " " + extraAddr);
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("cmpDetail").focus();
        }
    }).open();
}
</script>
<style type="text/css">
input[type='radio'] {
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

input[type='radio']:checked {
	background-color: #4CAF50;
	border: 3px solid white;
	box-shadow: 0 0 0 1.6px #4CAF50;
}

.wrap {
	text-align: center;
}

.join {
	width: 600px;
	margin: 0 auto;
	text-align: left;
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

.selectE {
	display: inline-block;
	position: relative;
	width: 100px;
	height: 35px;
	border-radius: 4px;
	border: 2px solid #4CAF50;
}

.selectP {
	display: inline-block;
	position: relative;
	width: 50px;
	height: 35px;
	border-radius: 4px;
	border: 2px solid #4CAF50;
}

select::-ms-expand { 
	display: none;
}

.selectE .select {
	-o-appearance: none;
  	-webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
  	width: inherit;
    height: inherit;
    background: transparent;
    border: 0 none;
    outline: 0 none;
    padding: 0 5px;
    position: relative;
    z-index: 3;
}

.selectP .select {
	-o-appearance: none;
  	-webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
  	width: inherit;
    height: inherit;
    background: transparent;
    border: 0 none;
    outline: 0 none;
    padding: 0 5px;
    position: relative;
    z-index: 3;
}

.select option {
	background-color: #4CAF50;
	color: white;
}

.j-info {
	font-size: 12px;
}

.btn {
	width: 150px;
}

.section fieldset {
	margin: 0 auto;
	width: 600px;
}

/* .section #infoAd { */
/* 	width: 50px; */
/* } */

.agree {
	display: flex;
	justify-content: flex-end;
}

.section .agree .ag-chk {
	width: 100px;
}

.s {
	width: 70px;
}

.m {
	width: 150px;
}

.l {
	width: 300px;
}

.mm {
	width: 100px;
}

.btn-list {
	display: flex;
	justify-content: space-around;
	margin-top: 50px;
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

.ad-title {
	float: left;
}

.ad-list {
	
}

#infoAd .in-label {
	width: 100px;
}

input[type=file]::file-selector-button {
	width: 100px;
   	height: 36px;
	background: #4CAF50;
	border: 1px solid white;
	color: white;
	border-radius: 5px;
	font-size: 15px;
	cursor: pointer;
}

.ne {
	color: red;
}

.j-info {
	font-size: 12px;
	height: 30px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<div class="page-header">
			<h3>기업 회원가입</h3>
			<br>
			<p><span class="ne"> *</span> 은 필수 입력정보 입니다.</p>
		</div>
		
		<div class="section">
			<div class="join">
				<form action="/buyer/cmpjoin" method="post" enctype="multipart/form-data">
				<div id="prof">
					<label for="buyerProf">프로필 사진</label>
					<input type="file" id="buyerProf" name="buyerProf" accept="image/*">
				</div>
				
				<div id="infoBuyer">
					<input type="text" id="bCtCode" name="bCtCode" value="C" style="display: none;">
					
					<label for="bId">아이디<span class="ne"> *</span></label>
					<input type="text" id="bId" name="bId" class="m">
					<button type="button" id="chkBid" class="btn btnRight">중복 확인</button>
					<div class="j-info" >
						<div id="id" style="display:none; color:red;" class="j-info">
							<label></label>
							아이디는 필수입니다.
						</div>
						<div id="chkId" style="display:none; color:red;" class="j-info">
							<label></label>
							아이디는 영어소문자와 숫자로 8자리 ~ 15자리로 입력 필요
						</div>
					</div>
					
					<br>
					
					<label for="bPw">비밀번호<span class="ne"> *</span></label>
					<input type="password" id="bPw" name="bPw" class="m">
					<div class="j-info" >
						<div id="pw" style="display:none; color:red;" class="j-info">
							<label></label>
							비밀번호는 필수입니다.
							</div>
						<div id="chkPw" style="display:none; color:red;" class="j-info">
							<label></label>
							대소문자, 숫자, 특수문자(!, @, #, $, %)로 8자리 ~ 15자리로 입력 필요
						</div>
					</div>
					<br>
					
					<label for="newPw">비밀번호 확인<span class="ne"> *</span></label>
					<input type="password" id="newPw" name="newPw" class="m">
					<div class="j-info" >
						<div id="cfmPw" style="display:none; color:red;" class="j-info">
							<label></label>
							비밀번호 확인은 필수입니다.
						</div>
						<div id="okPw" style="display:none; color:green;" class="j-info">
							<label></label>
							비밀번호가 일치합니다.
						</div>
						<div id="noPw" style="display:none; color:red;" class="j-info">
							<label></label>
							비밀번호가 일치하지 않습니다.
						</div>
					</div>
					
					<div id="email">
						<label for="bEmail">이메일<span class="ne"> *</span></label>
						<input type="text" id="bEmail" name="bEmail" class="m">
						
						<div class="selectE">
						<select class="bEmail2 select" name="bEmail2" id="bEmail2">
							<option>@naver.com</option>
							<option>@gmail.com</option>
							<option>@daum.net</option>
							<option value="in">직접 입력</option>
						</select>
						</div>
						<input type="text" id="inEmail" name="inEmail" placeholder="@test.com 형식으로 입력하세요." class="mm">
						<input type="button" id="btnEmail" value="이메일 인증" class="btn btnRight">
						<div class="j-info" >
							<div id="email2" style="display:none; color:red;" class="j-info">
								<label></label>
								이메일은 필수입니다.
							</div>
						</div>
					</div>
					
					<div id="emailChk" style="display: none;">
						<label for="emailNum">이메일 인증 번호<span class="ne"> *</span></label>
						<input type="text" id="emailNum" name="emailNum" placeholder="인증번호 6자리를 입력해주세요." class="m">
						<button type="button" id="chkEmail" class="btn btnRight" style="width: 120px;">인증번호 확인</button>
						<div class="j-info" >
							<div id="emailChk2" style="display:none; color:red;" class="j-info">
								<label></label>
								이메일 인증은 필수입니다.
							</div>
							<div id="emailOk" style="color: green; display: none;" class="j-info">
								<label></label>
								인증번호가 일치합니다.
							</div>
							<div id="emailNo" style="color: red; display: none;" class="j-info">
								<label></label>
								인증번호가 불일치합니다. 다시 입력해주세요.
							</div>
						</div>
					</div>
					
					<label for="bName">이름<span class="ne"> *</span></label>
					<input type="text" id="bName" name="bName" class="m">
					<div class="j-info" >
						<div id="name" style="display:none; color:red;" class="j-info">
							<label></label>
							이름은 필수입니다.
						</div>				
					</div>
					
					
					<label for="sPhone">핸드폰 번호<span class="ne"> *</span></label>
					<div class="selectP">
					<select class="sPhone select" id="sPhone" name="sPhone">
						<option>010</option>
						<option>011</option>
						<option>017</option>
						<option>016</option>
						<option value="in">직접 입력</option>
					</select>
					</div>
					<input type="text" id="inPhone" name="inPhone" class="s">-<input type="text" id="mPhone" name="mPhone" class="s">-<input type="text" id="lPhone" name="lPhone" class="s">
					<div class="j-info" >
						<div id="phone" style="display:none; color:red;" class="j-info">
							<label></label>
							핸드폰 번호는 필수입니다.
						</div>
					</div>			
				</div>
				
				<div id="infoPlus">
					<div id="infoAd">
						<div class="ad-title">
						<label for="adEmail">광고 수신 동의</label>
						</div>
						<div class="ad-list">
							<label for="adEmail" class="in-label">
							<input type="checkbox" id="adEmail" name="adEmail" value="Y">
							이메일</label>
							  
							<label for="adSms" class="in-label">
							<input type="checkbox" id="adSms" name="adSms" value="Y">  
							문자</label>
						</div>
					</div>
					
					<div id="infoAdr">
						<label for="adrPostcode">우편번호</label>
						<input type="text" id="adrPostcode" name="adrPostcode" class="s">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btnRight" style="width: 100px;">
						<br>
						
						<label for="adrAddr">배송 주소</label>
						<input type="text" id="adrAddr" name="adrAddr" class="m"><br>
						
						<label for="adrDetail">배송 상세 주소</label>
						<input type="text" id="adrDetail" name="adrDetail" class="l"><br>
						
						<input type="text" id="adrChk" name="adrChke" value="Y" style="display:none;">
					</div>
				</div>
				
			<div id="infoCmp">
				<label for="cmpName">상호명<span class="ne"> *</span></label>
				<input type="text" id="cmpName" name="cmpName">
				<div class="j-info" >
					<div id="cName" style="display:none; color:red;">
						<label></label>
						상호명은 필수입니다.
					</div>
				</div>
				
				<label for="cmpCeo">대표자명<span class="ne"> *</span></label>
				<input type="text" id="cmpCeo" name="cmpCeo">
				<div class="j-info" >
					<div id="ceo" style="display:none; color:red;">
						<label></label>
						대표자명은 필수입니다.
					</div>
				</div>
						
				<label for="cmpNum">사업자 등록 번호<span class="ne"> *</span></label>
				<input type="text" id="cmpNum" name="cmpNum">
				<div class="j-info" >
					<div id="cNum" style="display:none; color:red;">
						<label></label>
						사업자 등록번호는 필수입니다. ('-'를 제외하고 입력)
					</div>
				</div>
				
				<label for="cmpPostcode">사업장 우편번호<span class="ne"> *</span></label>
				<input type="text" id="cmpPostcode" name="cmpPostcode">
				<input type="button" onclick="cmpDaumPostcode()" value="우편번호 찾기" class="btn btnRight" style="width: 100px;">
				<div class="j-info" >
					<div id="postcode" style="display:none; color:red;">
						<label></label>
						우편번호는 필수입니다.
					</div>
				</div>
				
				<label for="cmpAddr">사업장 주소<span class="ne"> *</span></label>
				<input type="text" id="cmpAddr" name="cmpAddr">
				<div class="j-info" >
					<div id="addr" style="display:none; color:red;">
						<label></label>
						주소는 필수입니다.
					</div>
				</div>
				
				<label for="cmpDetail">사업장 상세 주소</label>
				<input type="text" id="cmpDetail" name="cmpDetail"><br><br>
				
				<label for="cmpFile">사업자 등록증 첨부<span class="ne"> *</span></label>
				<input type="file" id="cmpFile" name="cmpFile">
			</div>
			
			<div id="agree1" class="ag-box">
					<fieldset>
						<div>
							<h3>개인정보 이용 약관(필수)<span class="ne"> *</span></h3>
							<div class="ag-content">
								오나셈개히나 갤볘주으고 새콈의, 혀하, 하오틋먼어 흐끙더게 온이삼길보다. 엿에군로 아왼기료구가, 운에고 여거려에 른사른길까지 지오다 롲츼이이슨당겅으면 므래비반에 니아알쩻힢에서 솔미지폰에. 여그으할 아한죄센고 너장홀, 깅기 오셔니용산톤에 히디미의 세나를 삭둨 순여름조를 져드다산이나. 붤으힙셔 그사에 치오인이가, 개나란에 가수가는 리춍하서는 솜롬기흐는. 곤으려고 에실하게 징자곳띱은 온암언학으로 팅팀부김헬어 시흔서아구긴으로. 조깐거눠의 히있품크야 바죠자다 잴아더라 챌너이러암들는비지 산산으로서 볼븜아와 완신 팔뷰우. 탄어부니 머존다 굴보순상 널덕을 아람에븐밌슈는, 가비론데가, 산멜굼즚은 마도만핱기 즈아슬렴밖에 수당기애애아길이게. 어자어쟝딤 끼건어 나킴흐갭오 느군사 기와저 야간다.
								얀산오이면 지금으므로 아둔이 안므를 자아읐익의 수안에서 서느를, 큰귾악긍녀를 오뎔아마를 체련다. 쩌긴미을 뷔럆람먀존 렌자직아를 아운저저, 디파건븥에서 램차니누늬만 옥즈보는. 게닥이다 호과다래어야, 키과차게떼다 나욱어야 조데므얼과 낭을까. 은디는 겐근투로더히 오배콘미결의 꾕수시뵈는 얼누에 여해솔마다. 선즌비듸에 기앟을 리아 쓰든자 다듵는 여이옹자 랑하와 거제 에김잔으로 쳉곡거긔널지. 녠랑맸의 간무친앤 재숱주까지 단규사땋을 이이깬솨아스가 사거란랑 본바고압의 하하와 댜덩놀부러다. 젼가강은 눈에느바, 긱스조께서 패핸판미의 겔참여옴은 동해까지 글든스어 난칫사디젠으로 르룽죄허가. 지왜장긴 낌칱밴 앙기우사제세요, 민은지 번키의 시사는 티우긔파에 더아에. 므룐보에 증즌과 라므날킨다 홈초라고 끈하구오아 게디누이라 궈고아스이 버더그꽁이생보 예반다.
							</div>
						</div>
						<div class="agree">
							<label class="ag-chk">
							<input type="radio" id="agree1" name="agree1" value="Y">
							동의</label>
							
							<label class="ag-chk">
							<input type="radio" id="agree1" name="agree1" value="N" checked="checked">
							비동의</label>
						</div>
					</fieldset>
				</div>
				
				<div id="agree2" class="ag-box">
					<fieldset>
						<div>
							<h3>새활용 이용약관(필수)<span class="ne"> *</span></h3>
							<div class="ag-content">
								오나셈개히나 갤볘주으고 새콈의, 혀하, 하오틋먼어 흐끙더게 온이삼길보다. 엿에군로 아왼기료구가, 운에고 여거려에 른사른길까지 지오다 롲츼이이슨당겅으면 므래비반에 니아알쩻힢에서 솔미지폰에. 여그으할 아한죄센고 너장홀, 깅기 오셔니용산톤에 히디미의 세나를 삭둨 순여름조를 져드다산이나. 붤으힙셔 그사에 치오인이가, 개나란에 가수가는 리춍하서는 솜롬기흐는. 곤으려고 에실하게 징자곳띱은 온암언학으로 팅팀부김헬어 시흔서아구긴으로. 조깐거눠의 히있품크야 바죠자다 잴아더라 챌너이러암들는비지 산산으로서 볼븜아와 완신 팔뷰우. 탄어부니 머존다 굴보순상 널덕을 아람에븐밌슈는, 가비론데가, 산멜굼즚은 마도만핱기 즈아슬렴밖에 수당기애애아길이게. 어자어쟝딤 끼건어 나킴흐갭오 느군사 기와저 야간다.
								얀산오이면 지금으므로 아둔이 안므를 자아읐익의 수안에서 서느를, 큰귾악긍녀를 오뎔아마를 체련다. 쩌긴미을 뷔럆람먀존 렌자직아를 아운저저, 디파건븥에서 램차니누늬만 옥즈보는. 게닥이다 호과다래어야, 키과차게떼다 나욱어야 조데므얼과 낭을까. 은디는 겐근투로더히 오배콘미결의 꾕수시뵈는 얼누에 여해솔마다. 선즌비듸에 기앟을 리아 쓰든자 다듵는 여이옹자 랑하와 거제 에김잔으로 쳉곡거긔널지. 녠랑맸의 간무친앤 재숱주까지 단규사땋을 이이깬솨아스가 사거란랑 본바고압의 하하와 댜덩놀부러다. 젼가강은 눈에느바, 긱스조께서 패핸판미의 겔참여옴은 동해까지 글든스어 난칫사디젠으로 르룽죄허가. 지왜장긴 낌칱밴 앙기우사제세요, 민은지 번키의 시사는 티우긔파에 더아에. 므룐보에 증즌과 라므날킨다 홈초라고 끈하구오아 게디누이라 궈고아스이 버더그꽁이생보 예반다.
							</div>
						</div>
						<div class="agree">
							<label class="ag-chk">
							<input type="radio" id="agree2" name="agree2" value="Y">
							동의</label>
							
							<label class="ag-chk">
							<input type="radio" id="agree2" name="agree2" value="N" checked="checked">
							비동의</label>
						</div>
					</fieldset>
				</div>
				<div class="btn-list">
					<button id="btnJoin" class="btn btnRight">가입하기</button>
					<a href="/buyer/join"><button class="btn btnLeft">취소하기</button></a>		
				</div>
			</form>
			</div>
		</div> <!-- section End -->
	</div> <!-- wrap End -->
</div> <!-- full End -->
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
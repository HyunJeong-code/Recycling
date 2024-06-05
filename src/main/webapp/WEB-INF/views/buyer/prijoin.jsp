<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 회원가입</title>
<link rel="stylesheet" href="/resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	
	var rexId = /[a-z0-9]{8, 15}/;
	var rexPw = /[a-zA-Z0-9!@#$%]{8, 15}/;
	
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
	
	$("#mPhone").blur(function() {
		if($("#mPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	$("#lPhone").blur(function() {
		if($("#lPhone").val() == '') {
			$("#phone").css("display", "block");
		} else {
			$("#phone").css("display", "none");			
		}
	})
	
	// 동의
	$("#btnJoin").hover(function() {
		if($("#agree1").val() === 'N' || $("#agree2").val() === 'N') {
			alert("필수 이용약관에 동의해야 가입이 가능합니다.")
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
			<div id="prof">
				<label for="buyerProf">프로필 사진</label>
				<input type="file" id="buyerProf" name="buyerProf"><br>
			</div>
			
			<div id="infoBuyer">
				<input type="text" id="bCtCode" name="bCtCode" value="P" style="display: none;">
				
				<label for="bId">아이디</label>
				<input type="text" id="bId" name="bId"><br>
				<button type="button" id="chkBid">중복 확인</button><br>
				<div id="id" style="display:none; color:red;">아이디는 필수입니다.</div>
				<div id="chkId" style="display:none; color:red;">아이디는 영어소문자와 숫자로 8자리 ~ 15자리로 입력 필요</div>
				
				<label for="bPw">비밀번호</label>
				<input type="password" id="bPw" name="bPw"><br>
				<div id="pw" style="display:none; color:red;">비밀번호는 필수입니다.</div>
				<div id="chkPw" style="display:none; color:red;">대소문자, 숫자, 특수문자(!, @, #, $, %)로 8자리 ~ 15자리로 입력 필요</div>
				
				<label for="newPw">비밀번호 확인</label>
				<input type="password" id="newPw" name="newPw"><br>
				<div id="cfmPw" style="display:none; color:red;">비밀번호 확인은 필수입니다.</div>
				<div id="okPw" style="display:none; color:green;">비밀번호가 일치합니다.</div>
				<div id="noPw" style="display:none; color:red;">비밀번호가 일치하지 않습니다.</div>
				
				<div id="email">
					<label for="bEmail">이메일</label>
					<input type="text" id="bEmail" name="bEmail">
					
					<select class="bEmail2" name="bEmail2" id="bEmail2">
						<option>@naver.com</option>
						<option>@gmail.com</option>
						<option>@daum.net</option>
						<option value="in">직접 입력</option>
					</select>
					<input type="text" id="inEmail" name="inEmail" placeholder="@test.com 형식으로 입력하세요.">
					<input type="button" id="btnEmail" value="이메일 인증"><br>
					<div id="email2" style="display:none; color:red;">이메일은 필수입니다.</div>				
				</div>
				
				<div id="emailChk" style="display: none;">
					<label for="emailNum">이메일 인증 번호</label>
					<input type="text" id="emailNum" name="emailNum" placeholder="인증번호 6자리를 입력해주세요.">
					<button type="button" id="chkEmail">인증번호 확인</button><br>
					<div id="emailChk2" style="display:none; color:red;">이메일 인증은 필수입니다.</div>				
					<div id="emailOk" style="color: green; display: none;">
						인증번호가 일치합니다.
					</div>
					<div id="emailNo" style="color: red; display: none;">
						인증번호가 불일치합니다. 다시 입력해주세요.
					</div>
				</div>
				
				<label for="bName">이름</label>
				<input type="text" id="bName" name="bName"><br>
				<div id="name" style="display:none; color:red;">이름은 필수입니다.</div>				
				
				
				<label for="sPhone">핸드폰 번호</label>
				<select class="sPhone" id="sPhone" name="sPhone">
					<option>010</option>
					<option>011</option>
					<option>017</option>
					<option>016</option>
					<option value="in">직접 입력</option>
				</select>
				<input type="text" id="inPhone" name="inPhone">-<input type="text" id="mPhone" name="mPhone">-<input type="text" id="lPhone" name="lPhone"><br>
				<div id="phone" style="display:none; color:red;">핸드폰 번호는 필수입니다.</div>				
			</div>
			
			<div id="infoPlus">
				<div id="infoAd">
					<div class="ad">광고 수신 동의</div>
					<label for="adEmail">이메일</label>
					<input type="checkbox" id="adEmail" name="adEmail" value="Y">
					  
					<label for="adSms">문자</label>
					<input type="checkbox" id="adSms" name="adSms" value="Y">  
				</div>
				
				<div id="infoAdr">
					<label for="adrPostcode">우편번호</label>
					<input type="text" id="adrPostcode" name="adrPostcode">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
					<br>
					
					<label for="adrAddr">배송 주소</label>
					<input type="text" id="adrAddr" name="adrAddr"><br>
					
					<label for="adrDetail">배송 상세 주소</label>
					<input type="text" id="adrDetail" name="adrDetail"><br>
					
					<input type="text" id="adrChk" name="adrChke" value="Y" style="display:none;">
				</div>
			</div>
			
			<div id="agree1">
				<div>
					<h3>개인정보 이용 약관(필수)</h3>
					<p>
						오나셈개히나 갤볘주으고 새콈의, 혀하, 하오틋먼어 흐끙더게 온이삼길보다. 엿에군로 아왼기료구가, 운에고 여거려에 른사른길까지 지오다 롲츼이이슨당겅으면 므래비반에 니아알쩻힢에서 솔미지폰에. 여그으할 아한죄센고 너장홀, 깅기 오셔니용산톤에 히디미의 세나를 삭둨 순여름조를 져드다산이나. 붤으힙셔 그사에 치오인이가, 개나란에 가수가는 리춍하서는 솜롬기흐는. 곤으려고 에실하게 징자곳띱은 온암언학으로 팅팀부김헬어 시흔서아구긴으로. 조깐거눠의 히있품크야 바죠자다 잴아더라 챌너이러암들는비지 산산으로서 볼븜아와 완신 팔뷰우. 탄어부니 머존다 굴보순상 널덕을 아람에븐밌슈는, 가비론데가, 산멜굼즚은 마도만핱기 즈아슬렴밖에 수당기애애아길이게. 어자어쟝딤 끼건어 나킴흐갭오 느군사 기와저 야간다.
						얀산오이면 지금으므로 아둔이 안므를 자아읐익의 수안에서 서느를, 큰귾악긍녀를 오뎔아마를 체련다. 쩌긴미을 뷔럆람먀존 렌자직아를 아운저저, 디파건븥에서 램차니누늬만 옥즈보는. 게닥이다 호과다래어야, 키과차게떼다 나욱어야 조데므얼과 낭을까. 은디는 겐근투로더히 오배콘미결의 꾕수시뵈는 얼누에 여해솔마다. 선즌비듸에 기앟을 리아 쓰든자 다듵는 여이옹자 랑하와 거제 에김잔으로 쳉곡거긔널지. 녠랑맸의 간무친앤 재숱주까지 단규사땋을 이이깬솨아스가 사거란랑 본바고압의 하하와 댜덩놀부러다. 젼가강은 눈에느바, 긱스조께서 패핸판미의 겔참여옴은 동해까지 글든스어 난칫사디젠으로 르룽죄허가. 지왜장긴 낌칱밴 앙기우사제세요, 민은지 번키의 시사는 티우긔파에 더아에. 므룐보에 증즌과 라므날킨다 홈초라고 끈하구오아 게디누이라 궈고아스이 버더그꽁이생보 예반다.
					</p>
				</div>
				<div>
					<label>동의
						<input type="radio" id="agree1" name="agree1" value="Y">
					</label>
					
					<label>비동의
						<input type="radio" id="agree1" name="agree1" value="N" checked="checked">
					</label>
				</div>
			</div>
			
			<div id="agree2">
				<div>
					<h3>새활용 이용약관(필수)</h3>
					<p>
						오나셈개히나 갤볘주으고 새콈의, 혀하, 하오틋먼어 흐끙더게 온이삼길보다. 엿에군로 아왼기료구가, 운에고 여거려에 른사른길까지 지오다 롲츼이이슨당겅으면 므래비반에 니아알쩻힢에서 솔미지폰에. 여그으할 아한죄센고 너장홀, 깅기 오셔니용산톤에 히디미의 세나를 삭둨 순여름조를 져드다산이나. 붤으힙셔 그사에 치오인이가, 개나란에 가수가는 리춍하서는 솜롬기흐는. 곤으려고 에실하게 징자곳띱은 온암언학으로 팅팀부김헬어 시흔서아구긴으로. 조깐거눠의 히있품크야 바죠자다 잴아더라 챌너이러암들는비지 산산으로서 볼븜아와 완신 팔뷰우. 탄어부니 머존다 굴보순상 널덕을 아람에븐밌슈는, 가비론데가, 산멜굼즚은 마도만핱기 즈아슬렴밖에 수당기애애아길이게. 어자어쟝딤 끼건어 나킴흐갭오 느군사 기와저 야간다.
						얀산오이면 지금으므로 아둔이 안므를 자아읐익의 수안에서 서느를, 큰귾악긍녀를 오뎔아마를 체련다. 쩌긴미을 뷔럆람먀존 렌자직아를 아운저저, 디파건븥에서 램차니누늬만 옥즈보는. 게닥이다 호과다래어야, 키과차게떼다 나욱어야 조데므얼과 낭을까. 은디는 겐근투로더히 오배콘미결의 꾕수시뵈는 얼누에 여해솔마다. 선즌비듸에 기앟을 리아 쓰든자 다듵는 여이옹자 랑하와 거제 에김잔으로 쳉곡거긔널지. 녠랑맸의 간무친앤 재숱주까지 단규사땋을 이이깬솨아스가 사거란랑 본바고압의 하하와 댜덩놀부러다. 젼가강은 눈에느바, 긱스조께서 패핸판미의 겔참여옴은 동해까지 글든스어 난칫사디젠으로 르룽죄허가. 지왜장긴 낌칱밴 앙기우사제세요, 민은지 번키의 시사는 티우긔파에 더아에. 므룐보에 증즌과 라므날킨다 홈초라고 끈하구오아 게디누이라 궈고아스이 버더그꽁이생보 예반다.
					</p>
				</div>
				<div>
					<label>동의
						<input type="radio" id="agree2" name="agree2" value="Y">
					</label>
					
					<label>비동의
						<input type="radio" id="agree2" name="agree2" value="N" checked="checked">
					</label>
				</div>
			</div>
				<button id="btnJoin">가입하기</button>
				<button><a href="/buyer/join">취소하기</a></button>			
			</form>
		</div> <!-- section End -->
	</div> <!-- wrap End -->
</div> <!-- full End -->

</body>
</html>
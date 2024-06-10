<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.btn-list {
	display: flex;
	justify-content: space-around;
	margin-top: 50px;
}

.agree {
	display: flex;
	justify-content: flex-end;
}

.section .agree .ag-chk {
	width: 100px;
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

.ne {
	color: red;
}

.j-info {
	font-size: 12px;
	height: 30px;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	
	$("#accName").blur(function() {
		if($("#accName").val() == '') {
			$(".acc").css("display", "block");
		} else {
			$(".acc").css("display", "none");			
		}
	})
	
	$("#accBank").blur(function() {
		if($("#accBank").val() == '') {
			$(".bank").css("display", "block");
		} else {
			$(".bank").css("display", "none");			
		}
	})
	
	$("#accNo").blur(function() {
		if($("#accNo").val() == '') {
			$(".no").css("display", "block");
		} else {
			$(".no").css("display", "none");			
		}
	})
	
	$("form").submit(function(e) {
		 if($("input[name=agree1]:checked").val() == 'N' ||  $("input[name=agree2]:checked").val() == 'N') {
			 alert("필수 약관 동의가 필요합니다.");
			 e.preventDefault();
		 } else if($("#accName").val() == '' || $("#accNo").val() == '' || $("#accBank").val() == '') {
			 alert("필수 입력 정보를 모두 입력해야합니다.");
			 e.preventDefault();
		 }
	 })
})
</script>
</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
	<div class="full">
		<div class="wrap">
			<div class="page">
			<h1>판매자 겸용 신청서</h1>
			</div>
			
			<div class="section">
			<div class="join">
				<!-- 라디오 버튼 연결 확인 -->
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
							동의
						</label>
						
						<label class="ag-chk">
							<input type="radio" id="agree1" name="agree1" value="N" checked="checked">
							비동의
						</label>
					</div>
					</fieldset>
				</div>
					
					
				<div id="agree2" class="ag-box">
					<fieldset>
					<div>
						<h3>판매자 이용 약관(필수)<span class="ne"> *</span></h3>
						<div class="ag-content">
							오나셈개히나 갤볘주으고 새콈의, 혀하, 하오틋먼어 흐끙더게 온이삼길보다. 엿에군로 아왼기료구가, 운에고 여거려에 른사른길까지 지오다 롲츼이이슨당겅으면 므래비반에 니아알쩻힢에서 솔미지폰에. 여그으할 아한죄센고 너장홀, 깅기 오셔니용산톤에 히디미의 세나를 삭둨 순여름조를 져드다산이나. 붤으힙셔 그사에 치오인이가, 개나란에 가수가는 리춍하서는 솜롬기흐는. 곤으려고 에실하게 징자곳띱은 온암언학으로 팅팀부김헬어 시흔서아구긴으로. 조깐거눠의 히있품크야 바죠자다 잴아더라 챌너이러암들는비지 산산으로서 볼븜아와 완신 팔뷰우. 탄어부니 머존다 굴보순상 널덕을 아람에븐밌슈는, 가비론데가, 산멜굼즚은 마도만핱기 즈아슬렴밖에 수당기애애아길이게. 어자어쟝딤 끼건어 나킴흐갭오 느군사 기와저 야간다.
							얀산오이면 지금으므로 아둔이 안므를 자아읐익의 수안에서 서느를, 큰귾악긍녀를 오뎔아마를 체련다. 쩌긴미을 뷔럆람먀존 렌자직아를 아운저저, 디파건븥에서 램차니누늬만 옥즈보는. 게닥이다 호과다래어야, 키과차게떼다 나욱어야 조데므얼과 낭을까. 은디는 겐근투로더히 오배콘미결의 꾕수시뵈는 얼누에 여해솔마다. 선즌비듸에 기앟을 리아 쓰든자 다듵는 여이옹자 랑하와 거제 에김잔으로 쳉곡거긔널지. 녠랑맸의 간무친앤 재숱주까지 단규사땋을 이이깬솨아스가 사거란랑 본바고압의 하하와 댜덩놀부러다. 젼가강은 눈에느바, 긱스조께서 패핸판미의 겔참여옴은 동해까지 글든스어 난칫사디젠으로 르룽죄허가. 지왜장긴 낌칱밴 앙기우사제세요, 민은지 번키의 시사는 티우긔파에 더아에. 므룐보에 증즌과 라므날킨다 홈초라고 끈하구오아 게디누이라 궈고아스이 버더그꽁이생보 예반다.
						</div>
					</div>
					
					<div class="agree">
						<label class="ag-chk">
							<input type="radio" id="agree2" name="agree2" value="Y">
							동의
						</label>
						
						<label class="ag-chk">
							<input type="radio" id="agree2" name="agree2" value="N" checked="checked">
							비동의
						</label>
					</div>
					</fieldset>
				</div>
				
				<form action="/seller/sellerinfo" method="post">
					
					<label for="accName">예금주<span class="ne"> *</span></label>
					<input type="text" id="accName" name="accName">
					<div class="j-info">
						<div class="acc" style="display:none; color:red;">
							<label></label>
							예금주는 필수입니다.
						</div>
					</div>
					
					<label for="accBank">은행명<span class="ne"> *</span></label>
					<input type="text" id="accBank" name="accBank">
					<div class="j-info">
						<div class="bank" style="display:none; color:red;">
							<label></label>
							은행명은 필수입니다.
						</div>
					</div>
					
					<label for="accNo">계좌번호<span class="ne"> *</span></label>
					<input type="text" id="accNo" name="accNo" placeholder="-를 빼고 입력해주세요.">
					<div class="j-info" >
						<div class="no" style="display:none; color:red;">
							<label></label>
							계좌번호는 필수입니다.
						</div>
					</div>
					
					<div class="btn-list">
					<button class="btn btnRight">신청하기</button>
					<a href="/buyer/main"><button class="btn btnLeft">취소하기</button></a>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
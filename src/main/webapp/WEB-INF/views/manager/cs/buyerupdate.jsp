<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="/resources/css/manager/cs/buyerupdate.css"> -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 이미지 클릭 시 파일 선택 창 열기
		$("#profilePreview").on('click', function() {
		    $("#buyerfileUpdate").click();
		    console.log(profilePreview)
		});
		
		// 파일 선택 시 미리보기 이미지 업데이트
		$("#buyerfileUpdate").on('change', function() {
		    if (this.files && this.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function(e) {
		            $("#profilePreview").attr("src", e.target.result);
		            console.log(profilePreview)
		        }
		        reader.readAsDataURL(this.files[0]);
		    }
		});
		
	    // 일반 파일 이름 표시
		$('#buyerFileUpdate').on('change', function(event) {
			console.log(buyerFileUpdate)
		    var files = event.target.files;
		    var fileNames = $('#fileNames').text().split(', '); // 이전에 선택한 파일 이름 가져오기
		    for (var i = 0; i < files.length; i++) {
		        fileNames.push(files[i].name);
		    }
		    $('#fileNames').text(fileNames.join(', ')); // 이전 파일 이름에 새로운 파일 이름 추가하여 표시
		    console.log(fileNames)
		});
	
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
	    
	    // 전화번호를 분리하여 각 필드에 값 설정
	    var phone = "${view.bPhone}";
	    console.log("Full phone number: " + phone); // 전체 전화번호 출력
	    var phoneParts = phone.split("-");
	    
	    if (["010", "011", "017", "016"].includes(phoneParts[0])) {
	        $("#sPhone").val(phoneParts[0]);
	    } else {
	        $("#sPhone").val("in");
	        $("#inPhone").val(phoneParts[0]).show();
	    }

	    $("#mPhone").val(phoneParts[1]);
	    
	    $("#lPhone").val(phoneParts[2]);
	    

	    // 폼 제출 시 핸드폰 번호를 합쳐서 숨겨진 입력 필드에 설정
	   $("form").submit(function() {

	      	var sPhone = $("#inPhone").val();
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
	        $("#bPhone").val(fullPhone);
	        console.log("bPhone : " + $("#bPhone").val()); // 값 확인
	    });
	    
	   // 직접 입력 선택 시 입력 필드 표시
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
	   
	   // 이메일을 분리하여 각 필드에 값 설정
	    var phone = "${view.bEmail}";
	    var phoneParts = phone.split("@");
	    
	    if (["@naver.com", "@gmail.com", "@daum.net"].includes(phoneParts[1])) {
	        $("#bEmail2").val(phoneParts[1]);
	    } else {
	        $("#bEmail1").val("in");
	        $("#bEmail2").val(phoneParts[1]).show();
	    }

	    $("#bEmail1").val(phoneParts[0]);
	    $("#bEmail2").val(phoneParts[1]);
	    
	   
	   // 이메일 처리
	   $("form").submit(function() {
	       var empEmail1 = $("#bEmail1").val();
	       var empEmail2 = $("#bEmail2").val();
	       var inEmail = $("#inEmail").val();
	       var fullEmail;
	       
	       // sPhone에서 직접 입력을 선택한 경우
	       if ($("#bEmail2").val() === "in") {
	          fullEmail = empEmail1 + "@" + empEmail2;
	       } else {
	           // sPhone에서 직접 입력이 아닌 경우
	           var inEmail = $("#inEmail").val();
	           fullEmail = empEmail1 + "@" + empEmail2;
	       }
	       
	       // 숨겨진 입력 필드에 값 설정
	       $("#bEmail").val(fullEmail);
	       $("#bEmail").val(fullEmail);
	   });
	
		$("#update").click(function() {
			console.log("bCtCode : " + $("#bCtCode").val());
			
			if($("#bCtCode").val() === '기업') {
				$("#bCtCode").val('C');
			} else if ($("#bCtCode").val() === '개인') {
				$("#bCtCode").val('P');
			} 
		});
		
	});
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
<style type="text/css">
/* 중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.section_top {
	display: flex;
	align-items: flex-start;
	margin-bottom: 20px;
}

.section img {
	height: 200px;
	width: 200px;
	border-radius: 50%;
	object-fit: cover;
	margin: 20px;
}

.section .bCode_box, .section .bName_box, .section .rankNo_box {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}

label {
	color: #373f57;
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 5px;
	width: 200px;
	text-align: justify;
}

input[type="text"], select {
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
}

.section h3 {
	color: #333;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 5px;
	margin-bottom: 20px;
}

.section_top_privacy {
	padding: 20px;
	margin-left: 20px;
	margin-top: 20px;
	flex: 1;
}

.section_top_privacy div {
	margin-bottom: 10px;
}

/* --------------------------------------- */
/* 색션 하단 */
.section_bot_title {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

.section_bot_itembox {
	width: 500px;
	margin-left: 280px;
}

.section .bPhone_box, .section .bEmail_box, .section .bEntDate_box {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}

/* 파일버튼 디자인 */
.bot_document_filebox {
	display: flex;
	margin-left: 20px;
	margin-bottom: 15px;
}


.bot_document_filebox .file_find {
	text-align: right;
	width: 100px;
}

.bot_document_filebox .file_name{
	overflow: auto;
}

.bot_document_filebox input[type="file"] {
	width: 0;
	height: 0;
	overflow: hidden;
	display: none;
}

.bot_document_filebox .document_file {
	display: inline-block;
	height: 46px;
	padding: 0 10px;
	vertical-align: middle;
	width: 79%;
	color: #999999;
}

.btnRight{
	margin-right: 20px;
}

.phone_box{
	display: flex;
}

.email_box{
	display: flex;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
			<div class="wrap">
				<div class="page">	
				    <h1>회원 정보 수정</h1>
				    <hr>
	    		</div>
	    		
	    		<div class="section">
	    			<form action="./buyerupdate?bCode=${view.bCode }" method="post" enctype="multipart/form-data">
		    			<div class ="section_top">
		    			
		    				<input type="file" id="buyerfileUpdate" name="buyerfileUpdate" style="display: none;" />
							<div class="select_img">
							    <img alt="없음" id="profilePreview" src="${pageContext.request.contextPath}/upload/${buyerProfdetail.storedName}" />
								<input type="hidden" id="bProfNo" name="bProfNo" value="${buyerProfdetail.bProfNo }"/>
							</div>
		    				
							<div class="section_bot_itembox">
								<div class="bCode_box">
									<label>회원번호</label>
									<div>${view.bCode }</div>
								</div>
								
								<div class="bCode_box">
								<!-- <div class="bCt_box"> -->
								    <div>
								        <label for=rankNo>분류</label>
										<select name="bCtCode" id="bCtCode">
											<option value="C">기업</option>
											<option value="P">개인</option>
										</select>
								    </div>
								</div>
								
								<div class="bName_box">
									<label for ="bName">이 름</label>
									<input type="text" name ="bName" id="bName" value="${view.bName }">
								</div>
								
								<div class="rankNo_box">
								    <label for="rankNo">등급</label>
									<select name="rankNo" id="rankNo">
										<option value="0">씨앗</option>
										<option value="1">새싹</option>
										<option value="2">꽃</option>
										<option value="3">과일</option>
										<option value="4">나무</option>
									</select>
								</div>
							</div>
						</div>
					
						<div class="section_bot_title">상세 정보</div>
		
						<div class="section_bot_itembox">
							<div class="phone_box">
					            <label for="sPhone">전화 번호</label>
					            <select class="sPhone" id="sPhone" name="sPhone">
					               <option value="010">010</option>
					               <option value="011">011</option>
					               <option value="017">017</option>
					               <option value="016">016</option>
					               <option value="in">직접 입력</option>
					            </select>
					                  <input type="text" class="s" id="inPhone" name="inPhone" maxlength="3">
					                  <div class="hyphen">-</div>
					                   <input type="text" class="s" id="mPhone" name="mPhone" maxlength="4">
					                       <div class="hyphen">-</div>
					                   <input type="text" class="s" id="lPhone" name="lPhone" maxlength="4" >
					                </div>
					                <input type="hidden" id="bPhone" name="bPhone">
					                
					               
					            <div class="email_box">
					            	<label for="bEmail1">이메일</label>   
					            
					               <input type="text" id="bEmail1" name="bEmail1" required="required">
					         
					               <select class="bEmail2" name="bEmail2" id="bEmail2" required="required">
					                  <option value="naver.com">@naver.com</option>
					                  <option value="gmail.com">@gmail.com</option>
					                  <option value="daum.net">@daum.net</option>
					                  <option value="in">직접 입력</option>
					               </select>
					               <input type="text" id="inEmail" name="inEmail" placeholder="@test.com 형식으로 입력하세요.">
					            </div>
					            <input type="hidden" id="bEmail" name="bEmail">
							
							<div class="bEmail_box">
								<label for ="adrPostcode">우편번호</label>
							 	<input type="text" name="adrPostcode" id="adrPostcode" value="${buyerAdrdetail.adrPostcode }">
							 	<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
							</div>
							
							<div class="bEmail_box">
								<label for ="adrAddr">주소</label>
							 	<input type="text" name="adrAddr" id="adrAddr" value="${buyerAdrdetail.adrAddr }">
							</div>
							
							<div class="bEmail_box">
								<label for ="buyerAdrdetail">상세주소</label>
							 	<input type="text" name="adrDetail" id="adrDetail" value="${buyerAdrdetail.adrDetail }">
							</div>
							
							<div class="bEmail_box">
							    <label> SMS 수신동의 </label>
							    <input type="radio" name="adSms" id="adSmsY" value="Y" ${view.adSms == 'Y' ? 'checked' : ''}>
							    <label for="adSmsY"> Y </label>
							    <input type="radio" name="adSms" id="adSmsN" value="N" ${view.adSms == 'N' ? 'checked' : ''}>
							    <label for="adSmsN"> N </label>
							</div>
							
							<div class="bEmail_box">
							    <label> 이메일 수신동의 </label>
							    <input type="radio" name="adEmail" id="adEmailY" value="Y" ${view.adEmail == 'Y' ? 'checked' : ''}>
							    <label for="adEmailY"> Y </label>
							    <input type="radio" name="adEmail" id="adEmailN" value="N" ${view.adEmail == 'N' ? 'checked' : ''}>
							    <label for="adEmailN"> N </label>
							</div>
	
							<div class="bEntDate_box">
								<label>가 입 일</label>
								<div>
									<fmt:parseDate value="${view. bEntDate }" var="bEntDate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${bEntDate }" pattern="yyyy-MM-dd" />
								</div>
							</div>
						</div>
						
						<div class="btn_bot_wrap">
						    <a href="./buyerupdate"><button class="btn_bot_update">수정</button></a>					    
						</div>
					</form>
					<div class="btn_bot_wrap">
						<a href="./buyerdetail?bCode=${view.bCode }"><button class="btn_bot_return">돌아가기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

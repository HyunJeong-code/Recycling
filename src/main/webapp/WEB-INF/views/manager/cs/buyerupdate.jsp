<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 이미지 클릭 시 파일 선택 창 열기
		$("#profilePreview").on('click', function() {
		    $("#buyerfileUpdate").click();
		    console.log(profilePreview)
		    console.log(expfileUpdate)
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
		})
		
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
	
		
		
	})
	
	//핸드폰 번호 처리
	var mgrPhone = "${buyer.bPhone}".split("-");
	console.log("bPhone : " + bPhone);
	
	if($("#sPhone").val(bPhone[0])) {
		$("#inPhone").hide();
		$("#sPhone").val(bPhone[0]).attr("selected", "selected");
	} else {
		$("#inPhone").val(bPhone[0])
	}
	
	$("#mPhone").val(bPhone[1]);
	$("#lPhone").val(bPhone[2]);
	
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
	var bEmail = "${buyer.bEmail}".split("@");
	console.log("bEmail: " + bEmail);
	
	$("#bEmail").val(bEmail[0]);
	
	if($("#bEmail2").val("@" + bEmail[1])) {
		$("#inEmail").hide();
		$("bEmail2").val(bEmail[1]).attr("selected", "selected");
	} else {
		$("#inEmail").val(bEmail[1]);
	}
	
	$("#bEmail2").change(function() {
		if($("#bEmail2").val() === "in") {
			$("#inEmail").show();
			$("#bEmail2").hide();
		} else {
			$("#inEmail").hide();
			$("#bEmail2").show();
		}
	})
	
	$("#update").click(function() {
		console.log("bCtCode : " + $("#bCtCode").val());
		
		if($("#bCtCode").val() === '기업') {
			$("#bCtCode").val('C');
		} else if ($("#bCtCode").val() === '개인') {
			$("#bCtCode").val('P');
		} 
	})
</script>
<link rel="stylesheet" href="/resources/css/manager/cs/buyerupdate.css">
</head>
<body>
	<div class="full">
		<aside>
			왼쪽
		</aside>
		<div class="wrap">
			<div class="page">	
			    <h1>회원 정보 수정</h1>
			    <hr>
    		</div>
    		
    		<div class="section">
    			<form action="./buyerupdate?bCode=${view.bCode }" method="post">
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
									<option value="0">seed</option>
									<option value="1">bud</option>
									<option value="2">flower</option>
									<option value="3">fruit</option>
									<option value="4">tree</option>
								</select>
							</div>
						</div>
					</div>
				
					<div class="section_bot_title">상세 정보</div>
	
					<div class="section_bot_itembox">
						<div class="bPhone_box">
							<label for ="bPhone">전화번호</label> 
							<input type="text" name="bPhone" id="bPhone" value="${view.bPhone }">
						</div>
						
						<div class="bEmail_box">
							<label for ="bEmail">이메일</label>
						 	<input type="text" name="bEmail" id="bEmail" value="${view.bEmail }">
						</div>
						
						<%-- <div class="bEmail_box">
							<label for ="adrPostcode">우편번호</label>
						 	<input type="text" name="adrPostcode" id="adrPostcode" value="${view.adrPostcode }">
						</div>
						
						<div class="bEmail_box">
							<label for ="adrAddr">주소</label>
						 	<input type="text" name="adrAddr" id="adrAddr" value="${view.adrAddr }">
						</div>
						
						<div class="bEmail_box">
							<label for ="buyerAdrdetail">상세주소</label>
						 	<input type="text" name="adrAddr" id="adrAddr" value="${view.adrDetail }">
						</div> --%>
						
						<div class="bEntDate_box">
							<label>가 입 일</label>
							<div>
								<fmt:parseDate value="${view. bEntDate }" var="bEntDate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${bEntDate }" pattern="yyyy-MM-dd" />
							</div>
						</div>
					</div>
					
					<div class="btn_bot_wrap">
					    <a href="./buyerupdate"><button class="btn_bot_update">수정완료</button></a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

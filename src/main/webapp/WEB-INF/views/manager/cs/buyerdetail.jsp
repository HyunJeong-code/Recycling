<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/manager/cs/buyerdetail.css"> -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    function checkDelete(bCode) {
        if (confirm("삭제하시겠습니까?")) {
            // 확인을 선택한 경우, 삭제 요청을 서버로 전송
            var bOutValue = 'Y';
            var bOutDateValue = new Date().toISOString().slice(0, 10);
            var url = "./buyerdel?bCode=" + bCode + "&bOut=" + bOutValue + "&bOutDate=" + bOutDateValue;
            window.location.href = url;
        }
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

</style>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
			<div class="wrap">
				<div class="page">	
				    <h1>회원 정보</h1>
				    <hr>
	    		</div>
	    		
	    		<div class="section">
	    			<div class ="section_top">
	    				<img alt=""src="${pageContext.request.contextPath}/upload/${buyerProfdetail.storedName}">
	    				
						<div class="section_bot_itembox">
							<div class="bCode_box">
								<label>회원번호</label>
								<div>${buyerdetail.bCode }</div>
							</div>
							
							<div class="bCode_box">
							<!-- <div class="bCt_box"> -->
							    <label>분류</label>
							    <div>
							        <c:choose>
							            <c:when test="${buyerdetail.bCtCode == 'C'}">
							                기업
							            </c:when>
							            <c:when test="${buyerdetail.bCtCode == 'P'}">
							                개인
							            </c:when>
							            <c:otherwise>
							                ${buyerdetail.bCtCode}
							            </c:otherwise>
							        </c:choose>
							    </div>
							</div>
							
							<div class="bName_box">
								<label>이 름</label>
								<div>${buyerdetail.bName }</div>
							</div>
							
							<div class="rankNo_box">
							    <label for="rankNo">등급</label>
							    <div>
							        <c:choose>
							            <c:when test="${buyerdetail.rankNo == 0}">
							                씨앗
							            </c:when>
							            <c:when test="${buyerdetail.rankNo == 1}">
							                새싹
							            </c:when>
							            <c:when test="${buyerdetail.rankNo == 2}">
							                꽃
							            </c:when>
							            <c:when test="${buyerdetail.rankNo == 3}">
							                과일
							            </c:when>
							            <c:when test="${buyerdetail.rankNo == 4}">
							                나무
							            </c:when>
							            <c:otherwise>
							                ${buyerdetail.rankNo}
							            </c:otherwise>
							        </c:choose>
							    </div>
							</div>
						</div>
					</div>
					
					<div class="section_bot_title">상세 정보</div>
	
					<div class="section_bot_itembox">
						<div class="bPhone_box">
							<label for ="bPhone">전화번호</label> 
							<div>${buyerdetail.bPhone }</div>
						</div>
						
						<div class="bEmail_box">
							<label for ="bEmail">이메일</label>
						 	<div>${buyerdetail.bEmail }</div>
						</div>
						
						<div class="bEmail_box">
							<label for ="buyerPostcode">우편번호</label>
						 	<div>${buyerAdrdetail.adrPostcode }</div>
						</div>
						
						<div class="bEmail_box">
							<label for ="buyerAdr">주소</label>
						 	<div>${buyerAdrdetail.adrAddr }</div>
						</div>
						
						<div class="bEmail_box">
							<label for ="buyerAdrdetail">상세주소</label>
						 	<div>${buyerAdrdetail.adrDetail }</div>
						</div>
						
						<div class="bEmail_box">
							<label for ="buyerAdSms">SMS 수신동의</label>
						 	<div>${buyerdetail.adSms }</div>
						</div>
						
						<div class="bEmail_box">
							<label for ="buyerAdEmail">이메일 수신동의</label>
						 	<div>${buyerdetail.adEmail }</div>
						</div>
						
						<div class="bEntDate_box">
							<label>가 입 일</label>
							<div>
								<fmt:parseDate value="${buyerdetail. bEntDate }" var="bEntDate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${bEntDate }" pattern="yyyy-MM-dd" />
							</div>
						</div>
					</div>
						
					<div class="btn_bot_wrap">
					    <%-- <a href="./buyerupdate?bCode=${buyer.bCode }"><button>수정</button></a> --%>
					    <div>
					    	<a href="./buyerupdate?bCode=${buyer.bCode }"><button class="btn btnRight">수정</button></a>
					    </div>
					    <button class="btn btnRight" onclick="checkDelete('${buyer.bCode}')">삭제</button>
						
						<div><a href="./buyerlist"><button class="btn btnLeft">돌아가기</button></a></div>
					    <!-- <a href="./buyerlist"><button>목록</button></a> -->
					    
					    <input type="hidden" id="bOut" name="bOut" value="Y">
					    <input type="hidden" id="bOutDate" name="bOutDate" value="">
					    
					    <input type="hidden" id="bCode" name="bCode" value="${buyer.bCode }">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

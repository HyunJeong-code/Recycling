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
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">

<script type="text/javascript">

$(document).ready(function() {
	//전화번호를 형식에 맞게 변환하는 함수[DB 변경으로 안씀]
    function formatPhoneNumber(phoneNumber) {
        phoneNumber = phoneNumber.replace(/\D/g, ''); // 숫자 이외의 문자 제거
        return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3'); // 형식에 맞게 번호 변환
    }

    // 전화번호 요소 선택 후 형식 변환
    var phoneNumberElement = $('.mgrPhone_box div');
    var phoneNumber = phoneNumberElement.text();
    phoneNumberElement.text(formatPhoneNumber(phoneNumber));
});

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

.section .deptno_box, .section .mgrName_box, .section .mgrCode_box,
	.section .mgrEntDate_box {
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

.section .mgrPhone_box, .section .mgrEmail_box, .section .mgrBirth_box,
	.section .mgrGender_box {
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
				사원 상세조회
			</div>

			<div class="section">
				<div class ="section_top">
					<img alt=""src="/upload/${profileList.storedName}">
					
				<div class="section_top_privacy">
					<div class="mgrCode_box">
						<label>사원번호</label>
						<div>${view. mgrCode }</div>
					</div>
					
					<div class="deptno_box">
						<label>부 서 명</label> 
						<c:choose>
							<c:when test="${view.deptno == 20 }">인사팀</c:when>
							<c:when test="${view.deptno == 30 }">판매제휴팀</c:when>
							<c:when test="${view.deptno == 40 }">구매CS팀</c:when>
						</c:choose>
					</div>
					
					<div class="mgrName_box">
						<label>이 름</label>
						<div>${view.mgrName }</div>
					</div>
					
					
					<div class="mgrEntDate_box">
						<label>입 사 일</label>
						<div>
							<fmt:parseDate value="${view. mgrEntDate }" var="mgrEntDate" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${mgrEntDate }" pattern="yyyy-MM-dd" />
						</div>
					</div>
					
				</div><!-- section_top_privacy -->
			</div><!-- section_top -->
			
			<div class="section_bot_title">사원 정보</div>

				<div class="section_bot_itembox">
					<div class="mgrPhone_box">
						<label for ="mgrPhone">전화번호</label> 
						<div>${view.mgrPhone }</div>
					</div>
					
					<div class="mgrEmail_box">
						<label for ="mgrEmail">이메일</label>
					 	<div>${view.mgrEmail }</div>
					</div>
					
					<div class="mgrBirth_box">
						<label for ="mgrBirth">생년월일</label>	
						<fmt:parseDate value="${view.mgrBirth }" var="mgrBirth" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${mgrBirth }" pattern="yyyy-MM-dd" />
					</div>
			
					<div class="mgrGender_box">
						<label for ="mgrGender">성별</label>
						<div>${view.mgrGender }</div>
					</div>
					
					<div class="bot_document_filebox">				
						<label>입사서류 파일</label>
						<a href="/upload/${fileList.storedName }" download="${fileList.originName }">${fileList.originName }</a></div>
					</div>
					

			<div class="btn_bot_wrap">
				<div><a href="./empupdate?mgrCode=${view.mgrCode }"><button class="btn btnRight">수정하기</button></a> <br></div>
				<div><a href="./main"><button class="btn btnLeft">돌아가기</button></a></div>
			</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>
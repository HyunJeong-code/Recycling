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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager/hr/empdetail.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
    // 전화번호를 형식에 맞게 변환하는 함수
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


</head>
<body>

	<div class="full">
	<aside>
		왼쪽
	</aside>
		<div class="wrap">
			<div class="page">
				<h1>사원 상세조회</h1>
				<hr>
			</div>

			<div class="section">
				<div class ="section_top">
					<img alt="${pageContext.request.contextPath}/resources/image/basicProf.png" src="${pageContext.request.contextPath}/upload/${profileList.storedName}">
					
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
				<div><a href="./empupdate?mgrCode=${view.mgrCode }"><button class="btn_bot_update">수정하기</button></a> <br></div>
				<div><a href="./main"><button class="btn_bot_return">돌아가기</button></a></div>
			</div>
			</div>
		</div>
	</div>



</body>
</html>
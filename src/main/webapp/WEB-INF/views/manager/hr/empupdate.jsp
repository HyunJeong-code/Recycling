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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager/hr/empupdate.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">

</script>

</head>
<body>

	<div class="full">
	<aside>
		왼쪽
	</aside>
		<div class="wrap">
			<div class="page">
				<h1>사원정보 수정하기</h1>
			</div>

			<div class="section">
				<form action="./empupdate?mgrCode=${view.mgrCode }" method="post">
					
					<div class ="section_top">
							<img alt="" src="">
							
						<div class="section_top_privacy">
							<div class="mgrCode_box">
								<label for ="mgrCode">사원번호</label>
								<div>${view. mgrCode }</div>
							</div>
						
							<div class="deptno_box">
								<label for="detpno">부 서 명</label>
								<select name="deptno" id="deptno">
									<option value="20">인사팀</option>
									<option value="30">판매제휴팀</option>
									<option value="40">구매CS팀</option>
								</select>
							</div>
							
							<div class="mgrName_box">
								<label for ="mgrName">이 름</label>
								<input type="text" name ="mgrName" id="mgrName" value="${view.mgrName }">
							</div>
							

							<div class="mgrEntDate_box">
								<label for ="mgrEntDate">입 사 일</label>
									<div>
										<fmt:parseDate value="${view. mgrEntDate }" var="mgrEntDate" pattern="yyyy-MM-dd" />
										<fmt:formatDate value="${mgrEntDate }" pattern="yyyy-MM-dd" />
									</div>
							</div>
						</div>
					</div>

					<div class="section_bot_title">사원 정보</div>
				
				<div class="section_bot_itembox">
					<div class="mgrPhone_box">
						<label for ="mgrPhone">전화번호</label> 
						<input type="text" name="mgrPhone" id="mgrPhone" value="${view.mgrPhone }">
					</div>
					
					<div class="mgrEmail_box">
						<label for ="mgrEmail">이메일</label>
					 	<input type="text" name="mgrEmail" id="mgrEmail" value="${view.mgrEmail }">
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

					<!-- 근로계약서, 등본 등 -->
					<div>
						입사서류 파일
						<a href="./hrdownload?mgrCode=${mgrFile.mgrCode }">${fileList.originName }</a>
					</div>

					<!-- 개명, 주소지변경 등 -->
					<div class="bot_document_filebox">
						<label>필요서류 파일</label>		
							<input class="document_file" type="file" id="docfile" name="docfile" required="required">
							<div id="file_name" class="file_name">선택된 파일 없음</div>
						<label class="file_find" for="docfile">파일찾기</label>
					</div>
				</div>
				</form>

	
	
				<div class="btn_bot_wrap">
					<a href="./empupdate"><button class="btn_bot_update">수정완료</button></a>
					<a href="./empdetail?mgrCode=${view.mgrCode }"><button class="btn_bot_return">돌아가기</button></a>
				</div>
				
			</div>
		</div>
	</div>



</body>
</html>
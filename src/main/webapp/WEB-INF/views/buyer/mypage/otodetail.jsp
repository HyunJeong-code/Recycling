<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>otodetail</title>
<link rel="stylesheet" href="/resources/css/buyer.css">
</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
			<h3>1:1 문의 상세 조회</h3>
			<hr>
			
			<div class="page">
				<div class="form-group">
					<label>분류: </label>
					<span>${oto.ctOtoNo }</span>
				</div>
				<div class="form-group">
					<label>작성자: </label>
					<span>${oto.otoName }</span>
				</div>
				<div class="form-group">
					<label>이메일: </label>
					<span>${oto.otoEmail }</span>
				</div>
				<div class="form-group">
					<label>제목: </label>
					<span>${oto.otoTitle }</span>
				</div>
				<div class="form-group">
					<label>내용: </label>
					<span>${oto.otoContent }</span>
				</div>
				<div class="form-group">
					<label>작성일: </label>
					<span>${oto.otoDate }</span>
				</div>
				<div class="form-group">
					<label>첨부 파일: </label>
					<c:forEach var="file" items="${otoFile }">
						<a href="${pageContext.request.contextPath }/buyer/mypage/download?fileName=${file.storedName }">${file.originName }</a><br>
					</c:forEach>
				</div>
				<div class="form-group">
					<label>공개 여부: </label>
					<span>
						<c:if test="${oto.publicYn == 'Y' }">공개</c:if>
						<c:if test="${oto.publicYn == 'N' }">비공개</c:if>
					</span>
				</div>
				<div class="button-group">
					<button onclick="location.href='${pageContext.request.contextPath }/buyer/mypage/otodel?otoCode=${oto.otoCode }'">삭제하기</button>
					<button onclick="history.back();">뒤로가기</button>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
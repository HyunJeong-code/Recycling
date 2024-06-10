<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 상세내용</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/list.css">

<style type="text/css">
.wrap {
	margin: auto;
}

.detail-container {
	margin: 20px;
}

.oto_content {
	margin-top: 50px; 
}
.view-table tr{

border-right: 1px solid #d6d6d6;
}

.view-table tr td:nth-child(2) {
	border-right: 0
}
.imgSum {
	width: 200px;
	height: 200px;
}

.oto-btn {
	text-align: center;
}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
<div class="wrap">

	<div class="page">
	<h2>1:1문의</h2>
	</div>

	<div class="detail-container">
		<div class="oto_header">
			<table class="view-table">
				<tr>
					<th>분류</th>
					<td>
						<c:forEach items="${oct }" var="otoct">
						<c:if test="${otoct.ctOtoNo eq oto.ctOtoNo}">
		                    ${otoct.ctOtoName}
		                </c:if>
						</c:forEach>
	                </td>
				</tr>
		        <tr>
		            <th>제목</th>
		            <td>${oto.otoTitle}</td> 
		        
		            <th>작성자</th>
		            <td>${oto.otoName }</td> 
		        </tr>
		        <tr>
		            <th>작성일</th>
		            <td>
	                	<fmt:parseDate value="${oto.otoDate}" var="otoDate" pattern="yyyy-MM-dd HH:mm:ss" />
	               		<fmt:formatDate value="${otoDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                </td>
		        
		            <th>조회수</th>
		            <td>${oto.otoHit}</td>
		        </tr>
	    	</table>
		</div>
		
		<div class="oto_content">
			<p>${oto.otoContent}</p>
		</div>
		
		<div class="oto_file">
			<c:forEach var="file" items="${otoFiles}">
<%-- 		        <c:choose> --%>
<%-- 		            <c:when test="${file.originName.endsWith('.jpg') || file.originName.endsWith('.jpeg') || file.originName.endsWith('.png') || file.originName.endsWith('.gif')}"> --%>
<%-- 		                <img src="${pageContext.request.contextPath}/upload/${file.storedName}" alt="${file.originName}" style="max-width: 100%;"> --%>
					<img alt="문의 이미지"	src="/resources/image/${file.originName }" class="imgSum">
<%-- 		            </c:when> --%>
<%-- 		            <c:otherwise> --%>
<%-- 		                <a href="${pageContext.request.contextPath}/upload/${file.storedName}">${file.originName}</a> --%>
<%-- 		            </c:otherwise> --%>
<%-- 		        </c:choose> --%>
		    </c:forEach>
		</div>
		<hr><br>
		<!-- 답변 내용 추가 -->
		<div class="oto_answer">
			<c:if test="${not empty ans}">
				<h3>답변 내용</h3>
				<br>
				<table class="view-table">
					<tr>
						<th>답변 날짜</th>
						<td>
							<fmt:parseDate value="${ans.ansDate}" var="ansDate" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${ansDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
					</tr>
					<tr>
						<th>답변</th>
						<td>${ans.ansContent}</td>
					</tr>
				</table>
			</c:if>
		</div>
	</div>

	<div class="oto-btn">
		<a href="./otolist"><button class="btnLeft" type="button">목록으로</button></a>
		<a href="/buyer/mypage/myboard"><button class="btnLeft" type="button">내 문의보기</button></a>
	</div>


</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
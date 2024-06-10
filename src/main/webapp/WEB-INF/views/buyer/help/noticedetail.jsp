<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세내용</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/list.css">
<style type="text/css">

.nct-btn{
	text-align: center;
}
.page_box {
	border-bottom: 2px solid #444444;
}

.detail-container {
	margin: 50px;
}

.notice_content {
	margin-top: 50px; 
}

</style>

</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
<div class="wrap">

	<div class="page_box">
	<h2>공지사항</h2>
	</div>

	<div class="detail-container">
		<div class="notice_header">
			<table class="view-table">
		        <tr>
		            <th>제목</th>
		            <td>${notice.ntcTitle}</td> 
		        
		            <th>작성자</th>
		            <td>관리자</td> 
		        </tr>
		        <tr>
		            <th>작성일</th>
		            <td>
	                	<fmt:parseDate value="${notice.ntcDate}" var="ntcDate" pattern="yyyy-MM-dd HH:mm:ss" />
	               		<fmt:formatDate value="${ntcDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                </td>
		        
		            <th>조회수</th>
		            <td>${notice.ntcHit}</td>
		        </tr>
	    	</table>
		</div>
		
		<div class="notice_content">
			<p>${notice.ntcContent}</p>
		</div>
	</div>

	<div class="nct-btn">
		<a href="./noticelist"><button class="btnLeft" type="button">목록으로</button></a>
	</div>


</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
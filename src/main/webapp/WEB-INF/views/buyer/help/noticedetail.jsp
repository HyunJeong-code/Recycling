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

<style type="text/css">
.wrap {
	width: 800px;
	margin: auto;
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

table {
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 20px;
    margin-top: 40px;
}
th, td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
th {
    background-color: #f2f2f2;
}

</style>

</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="wrap">

<div class="page_box">
<h2>공지사항</h2>
</div>

<div class="detail-container">
	<div class="notice_header">
		<table>
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

<div>
	<button class="btn" type="button"><a href="./noticelist">목록으로</a></button>
</div>


</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
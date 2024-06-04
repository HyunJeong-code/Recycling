<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 상세내용</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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

.oto_content {
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
<div class="wrap">

<div class="page_box">
<h2>공지사항</h2>
</div>

<div class="detail-container">
	<div class="oto_header">
		<table>
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
	        <c:choose>
	            <c:when test="${file.originName.endsWith('.jpg') || file.originName.endsWith('.jpeg') || file.originName.endsWith('.png') || file.originName.endsWith('.gif')}">
	                <img src="${pageContext.request.contextPath}/upload/${file.storedName}" alt="${file.originName}" style="max-width: 100%;">
	            </c:when>
	            <c:otherwise>
	                <a href="${pageContext.request.contextPath}/upload/${file.storedName}">${file.originName}</a>
	            </c:otherwise>
	        </c:choose>
	    </c:forEach>
	</div>
	<hr><br>
	<!-- 답변 내용 추가 -->
	<div class="oto_answer">
		<c:if test="${not empty ans}">
			<h3>답변 내용</h3>
			<br>
			<table>
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

<div>
	<button type="button"><a href="./otolist">목록</a></button>
</div>


</div>
</body>
</html>
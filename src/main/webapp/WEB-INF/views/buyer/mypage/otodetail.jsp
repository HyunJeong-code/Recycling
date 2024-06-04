<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>otodetail</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style type="text/css">
body {
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}
.wrap {
    width: 800px;
    margin: auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.page_box {
    border-bottom: 2px solid #444444;
    padding-bottom: 10px;
    margin-bottom: 20px;
}
.page_box h2 {
    margin: 0;
    color: #333;
}
.detail-container {
    margin: 20px 0;
}
.oto_content {
    margin-top: 20px;
    padding: 10px;
    background-color: #fafafa;
    border-radius: 4px;
}
table {
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 20px;
}
th, td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
th {
    background-color: #f2f2f2;
}
.button-group {
    text-align: center;
    margin-top: 20px;
}
.button-group button {
    margin-right: 10px;
    padding: 10px 20px;
    background-color: #0066cc;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
.button-group button:hover {
    background-color: #005bb5;
}
.button-group a {
    color: white;
    text-decoration: none;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="wrap">
	
		<div class="page_box">
			<h2>1:1 문의 상세조회</h2>
			<hr>
		</div>
	
		<div class="detail-container">
			<div class="oto_header">
				<table>
					<tr>
						<th>분류</th>
						<td>
						<c:forEach items="${oct }" var="otoct">
						<c:if test="${otoct.ctOtoNo == oto.ctOtoNo }">
		                    ${otoct.ctOtoName }
		                </c:if>
						</c:forEach>
		                </td>
					</tr>
			        <tr>
			            <th>제목</th>
			            <td>${oto.otoTitle }</td> 
			        
			            <th>작성자</th>
			            <td>${oto.otoName }</td> 
			        </tr>
			        <tr>
			            <th>작성일</th>
			            <td>
		                	<fmt:parseDate value="${oto.otoDate }" var="otoDate" pattern="yyyy-MM-dd HH:mm:ss" />
		               		<fmt:formatDate value="${otoDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
		                </td>
			        
			            <th>조회수</th>
			            <td>${oto.otoHit }</td>
			        </tr>
		    	</table>
			</div>
		
			<div class="oto_content">
				<p>${oto.otoContent }</p>
			</div>
		
			<div class="oto_file">
				<c:forEach var="file" items="${otoFiles }">
			        <c:choose>
			            <c:when test="${file.originName.endsWith('.jpg') || file.originName.endsWith('.jpeg') || file.originName.endsWith('.png') || file.originName.endsWith('.gif') }">
			                <img src="${pageContext.request.contextPath }/upload/${file.storedName }" alt="${file.originName }" style="max-width: 100%;">
			            </c:when>
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath }/upload/${file.storedName }">${file.originName }</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			</div>
		</div>
	
		<div class="button-group">
			<button class="btnLeft" type="button" onclick="history.back();">목록으로</button>
			<button class="btn1" type="button"><a href="/buyer/help/otoform">1:1 문의 작성하기</a></button>
			<form action="/buyer/mypage/otodel" method="post" style="display: inline;">
				<input type="hidden" name="otoCode" value="${oto.otoCode }">
				<button class="btn2" type="submit">삭제하기</button>
			</form>
		</div>
	</div>

	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>

</body>
</html>
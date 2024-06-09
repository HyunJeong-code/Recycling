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

<style>
body {
    margin: 0;
    padding: 0;
}

.full {
    width: 1200px;
    height: auto;
    margin: 0 auto;
    padding: 50px 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.wrap {
    display: flex;
    width: 100%;
    justify-content: center;
    align-items: center;
    border-radius: 8px;
    padding: 20px;
}

h3 {
    margin-bottom: 20px;
    color: #333;
    text-align: center;
}

.page {
    margin-top: 20px;
    width: 100%;
    text-align: center;
}

.otodetail {
    text-align: center;
    width: 100%;
}

.otodetail table {
    width: 85%;
    border-collapse: collapse;
    margin: 0 auto 20px;
}

.otodetail th, .otodetail td {
    padding: 15px;
    text-align: left;
}

.otodetail th {
    background-color: #f2f2f2;
}

.button-group {
    text-align: center;
    margin-top: 40px;
    margin-bottom: 40px;
}

.button-group button, .button-group a button {
    margin: 0 10px;
    padding: 10px 20px;
    background-color: #878787;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    display: inline-block;
}

.button-group button.btnLeft {
    background-color: #878787;
}

.button-group button.btnRight {
    background-color: #4CAF50;
}

.button-group button:hover, .button-group a button:hover {
    background-color: #0066cc;
}

.button-group button.btnLeft:hover {
    background-color: #bbb;
}

.button-group button.btnRight:hover {
    background-color: #45A049;
}

.button-group form {
    display: inline;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

		<div class="wrap">
	
		<div class="page">
		<h3>1:1 문의 상세조회</h3>
			<div class="otodetail">
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
			        <tr>
			        	<th>내용</th>
			        	<td>${oto.otoContent }</td>
			        </tr>
			        <tr>
			        	<th>첨부파일</th>
			        	<td>
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
			        	</td>
			        </tr>
		    	</table>
			</div>
		</div>
	
		<div class="button-group">
			<button class="btnLeft" type="button" onclick="history.back();">목록으로</button>
			<a href="/buyer/help/otoform"><button class="btnRight" type="button">1:1 문의 작성하기</button></a>
			<form action="/buyer/mypage/otodel" method="post" style="display: inline;">
				<input type="hidden" name="otoCode" value="${oto.otoCode }">
				<button class="btn" type="submit">삭제하기</button>
			</form>
		</div>
	</div>

	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>

</body>
</html>
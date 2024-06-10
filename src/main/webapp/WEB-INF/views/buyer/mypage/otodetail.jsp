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

.wrap {
    width: 800px;
    margin: auto;
    padding: 20px;
    border-radius: 8px;
}

.page {
    margin-bottom: 20px;
}

h3 {
    margin: 0;
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}

table {
    border-collapse: collapse;
    width: 60%;
    margin-bottom: 40px;
    margin: auto;
}

th, td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 10px 10px;
}

th {
    background-color: #CEE741;
    text-align: center;
}

.button-group {
    text-align: center;
    margin-top: 20px;
    margin-bottom: 50px;
}

.button-group button {
    margin-right: 10px;
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

.button-group button.btnDel {
    background-color: #db2525;
}

.button-group button.btnLeft:hover {
    background-color: #9e9e9e;
}

.button-group button.btnRight:hover {
	background-color: #58c05c;
}

.button-group button.btnDel:hover {
    background-color: #f13535;
}

.button-group a {
    color: white;
    text-decoration: none;
}

.separator {
    border-bottom: 2px solid #444444;
    margin-top: 20px;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="wrap">
	<h3>1:1 문의 상세조회</h3>
		<div class="page">
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
			        </tr>
			        <tr>
			            <th>작성자</th>
			            <td>${oto.otoName }</td> 
			        </tr>
			        <tr>
			            <th>작성일</th>
			            <td>
		                	<fmt:parseDate value="${oto.otoDate }" var="otoDate" pattern="yyyy-MM-dd HH:mm:ss" />
		               		<fmt:formatDate value="${otoDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
		                </td>
			        </tr>
			        <tr>
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
				<button class="btnDel" type="submit">삭제하기</button>
			</form>
		</div>
	</div>

	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<title>공지사항</title>

<style type="text/css">
.wrap {
	width: 1000px;
	margin: auto;
}

thead{
	text-align: center;
}

td, th {
	border-right: 1px solid #444444;
	height: 50px;
}

a {
	text-decoration: none;
	color: #444444;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="wrap">
<h1>공지사항</h1>
<form action="./noticelist" method="get">
        <label for="ct_ntcno">분류 선택:</label>
        <select name="ct_ntcno" id="ct_ntcno">
            <option value="buyers" ${ctNtcNo == 'buyers' ? 'selected' : ''}>구매자</option>
	        <c:if test="${isSeller}">
	            <option value="sellers" ${ctNtcNo == 'sellers' ? 'selected' : ''}>판매자</option>
	        </c:if>
        </select>
        <button class="btnSrch" value="검색하기">검색</button>
        
    </form>
    <table border="1" class="table table-hover table-sm" style="width: 1000px; border: 2px solid #444444;">
    
    	<colgroup>
		<col style="width: 15%;">
		<col style="width: 55%;">
		<col style="width: 10%;">
		<col style="width: 20%;">
	</colgroup>
	
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>조회수</th>
                <th>등록일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${noticeList}" var="notice">
                <tr>
                    <td>${notice.ntcCode}</td>
                    <td><a href="./noticedetail?ntcCode=${notice.ntcCode}">${notice.ntcTitle}</a></td>
                    <td>${notice.ntcHit}</td>
                    <td>${notice.ntcDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
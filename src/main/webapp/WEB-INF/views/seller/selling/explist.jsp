<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>내 체험단 판매상품 조회</title>

<style type="text/css">
.wrap {
	width: 1100px;
}

table, th{
	text-align: center;
	border: 1px solid #444444;
}

table{
	border: 1px solid #444444;
}

th, td {
	border-bottom: 1px solid #444444;
	border-left: 1px solid #444444;
	padding: 10px;
}

th:first-child, td:first-child {
	border-left: none;
}

th {
	background-color: #adb5bd;
}

.searching {
	flex: 1;
}
</style>

</head>
<body>
<h1>체험단 조회</h1>
<hr>

<div class="container">
<div class="searching">
	<form action="./explist" method="get">
		<select class="detailSearch" name="detailSearch">
		    <option value="all">전체</option>
		    <option value="Name">제목</option>
		    <option value="status">상태</option>
		</select>
		<input type="text" id="search" name="search"> 	
		<button id="btnSearch">검색</button>
	</form>
</div>

<table border="1" class="table table-hover table-sm" style="width:1000px;">

	<colgroup>
		<col style="width: 5%;">
		<col style="width: 10%;">
		<col style="width: 25%;">
		<col style="width: 10%;">
		<col style="width: 8%;">
		<col style="width: 15%;">
		<col style="width: 14%;">
		<col style="width: 14%;">
	</colgroup>
    <thead style="background-color: gray;">
        <tr>
            <th></th>
            <th>상품 번호</th>
            <th>체험 제목</th>
            <th>참가 비용</th>
            <th>조회수</th>
            <th>등록일</th>
            <th>예약 관리</th>
            <th>상세 조회</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${list}" var="exp">
            <tr>
                <td>
                	<input type="checkbox" id="${exp.expCode}" name="expCheckbox" value="${exp.expCode}">
                </td>
                <td class="code">${exp.expCode}</td>
                <td class="name">${exp.expName}</td>
                <td class="price">${exp.expPrice}</td>
                <td class="hit">${exp.expHit}</td>
                <td>
                	<fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
               		<fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td class="resdetail"><a href="./expresdetail?expCode"><button>예약하기</button></a></td>
                <td class="expdetail"><a href="#"><button>상세 보기</button></a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
<c:import url="/WEB-INF/views/layout/paging.jsp"/>
</body>
</html>
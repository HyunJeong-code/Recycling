<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<title>체험단 예약 관리</title>
<style type="text/css">

table, th{
	text-align: center;
	border: 1px solid #444444;
}

tbody{
	border-left: none;
	border-right: none;
}
th, td {
	border-bottom: 1px solid #444444;
	border-left: 1px solid #444444;
	border-right: 1px solid #444444;
	padding: 10px;
}

thead {
	background-color: gray;
}

</style>

</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>

<h1>체험단 예약 관리</h1>
<hr>
<br>

<table border="1" class="table table-hover table-sm" style="width:1000px;">
	
	<colgroup>
		<col style="width: 15%;">
		<col style="width: 35%;">
		<col style="width: 15%;">
		<col style="width: 25%;">
	</colgroup>
	
	<thead>
        <tr>
            <th>상품 번호</th>
            <th>체험 제목</th>
            <th>참가 비용</th>
            <th>등록일</th>
        </tr>
    </thead>
	<tbody>
            <tr>
                <td class="code">${exp.expCode}</td>
                <td class="name">${exp.expName}</td>
                <td class="price">${exp.expPrice}</td>
                <td>
                	<fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
               		<fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
            </tr>
    </tbody>
</table>

<table>
	<tbody>
		<td>예약 관리</td>
		<td><button class="btn">예약완료</button></td>
		<td><button class="btn">예약취소</button></td>
	</tbody>
</table>

<hr>
<h2>체험단 예약 리스트</h2>

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
	
	<thead>
        <tr>
        	<th></th>
            <th>예약번호</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>인원</th>
            <th>예약시간</th>
            <th>상태</th>
        </tr>
    </thead>
	<tbody>
            <tr>
<!--             	<td> -->
<%--                 	<input type="checkbox" id="${resList.resCode}" name="expCheckbox" value="${resList.resCode}"> --%>
<!--                 </td> -->
<%--                 <td class="code">${resList.resCode}</td> --%>
<%--                 <td class="name">${resList.resName}</td> --%>
<%--                 <td class="phone">${resList.resPhone}</td> --%>
<%--                 <td class="email">${resList.resEmail}</td> --%>
<%--                 <td class="cnt">${resList.resCnt}</td> --%>
<%--                 <td class="time">${resList.resTime}</td> --%>
<!--                 <td class="status"></td> -->
            </tr>
    </tbody>
</table>

		<button class="btn" type="button"><a href="./explist">목록으로</a></button>

<c:import url="/WEB-INF/views/layout/paging.jsp"/>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>

</body>
</html>
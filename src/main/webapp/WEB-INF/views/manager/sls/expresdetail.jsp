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
<title>체험단 예약 관리</title>
</head>
<body>
    <div class="full">
        <div class="wrap">
            <div class="page">
	            <h1>체험단 예약 관리</h1>
				<hr>
				<br>
            </div>
        
            <div class="section">
                <table border="1" class="table table-hover table-sm" style="width:1000px;">
	
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
                <td>${exp.expCode}</td>
                <td>${exp.expName}</td>
                <td>${exp.expPrice}</td>
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
		<td><button>예약완료</button></td>
		<td><button>예약취소</button></td>
	</tbody>
</table>

<hr>
<h2>체험단 예약 리스트</h2>

<table border="1" class="table table-hover table-sm" style="width:1000px;">
	
	<thead>
        <tr>
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
			<c:forEach var="res" items="${resList}">
            <tr>
                <td>${res.resCode }</td>
                <td>${res.resName }</td>
                <td>${res.resPhone }</td>
                <td>${res.resEmail }</td>
                <td>${res.resCnt }</td>
                
                
                <td>${res.resTime }</td>
                <td></td>
            </tr>
            </c:forEach>
    </tbody>
</table>
            </div>
        </div>
    </div>


</body>
</html>
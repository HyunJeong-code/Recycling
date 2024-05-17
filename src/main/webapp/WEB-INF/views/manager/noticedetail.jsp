<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="full">
        <div class="wrap">
            <div class="page">
            <h1>공지사항 자세히 보기</h1>
 			<hr>
 			</div>
            <div class="section">
                
            <table border="1">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>조회수</td>
					<td>등록일</td>
					<td>내용</td>
				</tr>

				<tr>
					<td>${view.ntcCode }</td>
					<td>${view.ntcTitle }</td>
					<td>${view.ntcHit }</td>
					<td>${view.ntcDate }</td>
					<td>${view.ntcContent }</td>
				</tr>
			</table>
                
            </div>
        </div>
    </div>
    
</body>


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">

</head>
<body>
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
		<div class="wrap">
			<div class="page">
				<h1>체험 수정하기</h1>
				<hr>
			</div>

			<div class="section">
				<form action="./changeexpres?expCode=${update.expCode}&schNo=${update.schNo}" method="post">
				<div>
					<input type="hidden" name="resCode" value="${update.resCode}" >			
				</div>
	
				<div>
					<label>대표자 이름</label> <input type="text" name="resName" value="${update.resName}">
				</div>

				<div>
					<label>전화 번호</label> <input type="text" name="resPhone" value="${update.resPhone}">
				</div>
				
				<div>
					<label>이메일</label> <input type="text" name="resEmail" value="${update.resEmail}">
				</div>

				<div>
					<label>예약인원</label> <input type="text" name="resCnt" value="${update.resCnt}">
				</div>
				
				<div>
					<label>예약일</label><input type="date" name="schDate" value="${update.schDate }">
				</div>
				
				<div>
				<c:forEach var="expSch" items="${expSch}">
					<label>예약시간</label><input type="text" name="schTime" value="${expSch.schTime }">
				</c:forEach>
				</div>

				<div>
					<button type="submit">수정완료</button>
				</div>
				</form>

			</div>
		</div>
	</div>
	</div>
</body>



</html>
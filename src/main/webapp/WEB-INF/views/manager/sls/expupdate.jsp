<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager/sls/expupdate.css">

</head>
<body>
	<div class="full">
		<aside>
			<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
			<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
		</aside>
		<div class="wrap">
			<div class="page">
				<h1>체험 수정하기</h1>
				<hr>
			</div>

			<div class="section">
				<form action="./expupdate?expCode=${update.expCode }" method="post">

					<div>
						<img alt="없음" src="/upload/${profile.storedName }">
					</div>
					
					<div class="expName">
						<label>체험제목</label>
						<input type="text" name="expName" value="${update.expName}">
					</div>
	
					<div class="expPrice">
						<label>참가비용</label>
						<input type="text" name="expPrice" value="${update.expPrice}">원
					</div>
	
					<div class="expDetail">
						<label>체험설명</label>
						<textarea name="expDetail">${update.expDetail}</textarea>
					</div>
	
					
					<c:forEach var="fileImage" items="${fileImage }">
			    		<img alt="없음" src="/upload/${fileImage.storedName }">
					</c:forEach>
					
					
					<div>
						<button type="submit">수정하기</button>
					</div>
				
				</form>

				<div>
					<a href="./expdetail?expCode=${update.expCode }"><button type="button">돌아가기</button></a>
				</div>
			</div>
		</div>
	</div>
</body>



</html>
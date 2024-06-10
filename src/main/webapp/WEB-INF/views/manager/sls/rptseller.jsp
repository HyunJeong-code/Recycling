<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
		<sec:authentication var="managerLogin" property="principal"/>
		<c:if test="${managerLogin.deptno eq 10}">
			<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		</c:if>
		<c:if test="${managerLogin.deptno eq 20}">
			<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		</c:if>
		<c:if test="${managerLogin.deptno eq 30}">
			<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
		</c:if>
		<c:if test="${managerLogin.deptno eq 40}">
			<c:import url="/WEB-INF/views/layout/manager/managercsmenu.jsp"/>
		</c:if>
		<div class = "full content" >
	<div class="wrap">
		<div class="page">
			<h3>판매자 신고 조회</h3>
		</div>
		
		<div class="section">
			<table>
				<tr>
					<th>번호</th>
					<th>신고 번호</th>
					<th>구매자 코드</th>
					<th>상품 코드</th>
					<th>상품 신고 대분류</th>
				</tr>
			</table>
		</div> <!-- section End -->
	</div> <!-- wrap End -->
</div> <!-- full End -->
</div>
</body>
</html>
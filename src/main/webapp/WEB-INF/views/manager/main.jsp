<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
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
	<div class="full content">
			<div class="wrap">		
				<div class="page">
					전체사원 조회
				</div>
			<div class="search">
				<form action="./emplist" method="get" class ="search_form">
					<input type="hidden" name="sCtg" value="UP">
					<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
					<button class ="btn btnRight">검색</button>
				</form>
			</div>
				
			<div class = "section">
				<table>
					<thead>
						<tr>
							<th>부서명</th>
							<th>이름</th>
							<th>사원번호</th>
							<th>핸드폰 번호</th>
							<th>이메일</th>
						</tr>
					</thead>
		
					<tbody>
						<c:forEach var="select" items="${select }" varStatus="status">
							<!-- mgrOut상태가 'N' 이면 보여주고 'Y'이면 숨기기 -->
							<c:if test="${select.mgrOut eq 'N'}">
							<tr>
								<td>${select.dname }</td>
								<td>${select.mgrName }</td>
								<td>${select.mgrCode }</td>
								<td>${select.mgrPhone }</td>
								<td>${select.mgrEmail }</td>
							</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- section -->
			<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
			</div><!-- wrap -->
		</div><!-- full -->
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>

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


</body>
</html>

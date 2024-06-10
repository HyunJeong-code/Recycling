<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	// 비밀번호
	$("#mgrPw").blur(function() {
		if($("#mgrPw").val() == '') {
			$("#pw").css("display", "block");
		} else {
			$("#pw").css("display", "none");
			
			if(rexPw.test($("#mgrPw"))) {
				$("#chkPw").css("display", "block");				
			} else {
				$("#chkPw").css("display", "none");								
			}
		}
	})
})
</script>
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
			<h3>비밀번호 입력</h3>
		</div>
		
		<div class="section">
			<form action="./main" method="post">
				<label for="mgrPw">비밀번호 입력</label>
				<input type="text" id="mgrPw" name="mgrPw"><br>
				<div id="pw" style="display:none; color:red;">비밀번호는 필수입니다.</div>
				
				<button class="btn btnRight">확인</button>
			</form>
		</div> <!-- section End -->
		</div>
	</div> <!-- wrap End -->
</div> <!-- full End -->

</body>
</html>

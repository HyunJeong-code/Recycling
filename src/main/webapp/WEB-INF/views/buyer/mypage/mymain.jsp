<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myMain</title>

<script type="text/javascript">

</script>

<style type="text/css">
.page {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: center;
	height: 100vh;
	padding-top: 50px;
	text-align: center;
}

.form-group {
	display: flex;
	flex-direction: row;
	align-items: center;
	margin-bottom: 15px;
}

label {
	margin-right: 10px;
	width: 150px;
	text-align: right;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
		
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
				<form action="${pageContext.request.contextPath }/buyer/mypage/mymain" method="post">
					<h3>개인 정보 변경을 위해 비밀번호를 입력해주세요.</h3>
					<label for="password">비밀번호 </label>
					<input type="password" id="password" name="password" required>
					<button type="submit">확인</button>
				</form>
				<c:if test="${not empty error }">
					<p style="color: red;">${error }</p>
				</c:if>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
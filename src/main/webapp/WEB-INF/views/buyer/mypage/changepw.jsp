<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changePw</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">

</script>

<style type="text/css">
body {
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}
.full {
    display: flex;
    justify-content: center;
    padding: 20px;
}
h2 {
    margin-top: 0;
    color: #333;
}
hr {
    border: 0;
    border-top: 1px solid #ccc;
    margin: 20px 0;
}
.page a {
    display: block;
    margin: 10px 0;
    color: #0066cc;
    text-decoration: none;
}
.page a:hover {
    text-decoration: underline;
}
.form-group {
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}
label {
    margin-right: 10px;
    width: 150px;
    text-align: right;
}
.changepw {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    height: 100vh;
    padding-top: 50px;
    text-align: center;
}
.changepw h3 {
    margin-bottom: 30px;
}
.button-group {
    text-align: center;
    margin-top: 20px;
}
.button-group button {
    margin-right: 10px;
    padding: 10px 20px;
    background-color: #0066cc;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
.button-group button:hover {
    background-color: #005bb5;
}
</style>


</head>
<body>
	<div class="full">
		<div class="wrap">
		
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
				<form action="${pageContext.request.contextPath }/buyer/mypage/changepw" method="post">
					<div class="changepw">
						<div>
							<h3>비밀번호 변경</h3>
						</div>
						<div class="form-group">
							<label for="currentPw">현재 비밀번호</label>
							<input type="text" id="currentPw" name="currentPw" required>
						</div>
						<div class="form-group">
							<label for="newPw">새 비밀번호 </label>
							<input type="text" id="newPw" name="newPw" required>
						</div>
						<div class="form-group">
							<label for="confirmPw">새 비밀번호 확인 </label>
							<input type="text" id="conformPw" name="confirmPw" required><br>
						</div>
						<div class="button-group">
							<button class="btn">비밀번호 변경</button>
						</div>
					</div>
				</form>
				<c:if test="${not empty success }">
					<p style="color: green;">${success }</p>
				</c:if>
				<c:if test="${not empty error }">
					<p style="color: red;">${error }</p>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
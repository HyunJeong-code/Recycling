<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>otoform</title>
<link rel="stylesheet" href="/resources/css/buyer.css">
</head>
<body>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
	
	<div class='full'>
		<div class="wrap">
			<h3>1:1 문의 작성</h3>
			<hr>
			<div class="page">
				<form action="${pageContext.request.contextPath }/buyer/mypage/otoform" method="post" enctype='multipart/form-data'>
					<div class="form-group">
						<label for='ctOtoNo'>분류: </label>
						<select id="ctOtoNo" name="ctOtoNo">
							<option value="100">재활용품</option>
							<option value="200">업사이클링</option>
							<option value="300">체험단</option>
							<option value="400">기타</option>
						</select>
					</div>
					<div class="form-group">
						<label for="otoName">작성자: </label>
						<input type="text" id="otoName" name="otoName" required>
					</div>
					<div class="form-group">
						<label for="otoEmail">이메일: </label>
						<input type="text" id="otoEmail" name="otoEmail" required>
					</div>
					<div class="form-group">
						<label for="otoTitle">제목: </label>
						<input type="text" id="otoTitle" name="otoTitle" required>
					</div>
					<div class="form-group">
						<label for="otoContent">내용: </label>
						<textarea id="otoContent" name="otoContent" rows="10" cols="50" required></textarea>
					</div>
					<div class="form-group">
						<label>공개 여부: </label>
						<input type="radio" id="publicY" name="publicYn" value="Y">
					</div>
					<div class="form-group">
						<label for="otoName">작성자: </label>
						<input type="text" id="otoName" name="otoName" required>
					</div>			
				</form>
			
			
			</div>
		
		
		
		</div>
	
	
	</div>


</body>
</html>
<%@page import="recycling.dto.buyer.OtoCt"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<title>1:1 문의 작성</title>
<script type="text/javascript">

$(document).ready(function() {
    $('input[name="visibility"]').change(function() {
        var passwordField = $('#password_field');
        if ($(this).val() === 'private') {
            passwordField.show();
        } else {
            passwordField.hide();
        }
    });
});

</script>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<h1>1:1 문의 작성</h1>
    <form action="/buyer/mypage/otoform" method="post" enctype="multipart/form-data">
        <br>
        
        <label for="ct_otono">분류:</label>
   		<select id="ct_otono" name="ct_otono">
	        <option value="210">업사이클링</option>
	        <option value="200">재활용</option>
	        <option value="230">세탁</option>
	        <option value="220">체험단</option>
	        <option value="240">기타</option>
   		</select><br> 
   		
   		<label for="otoName">작성자</label>
   		<input type="text" value="${oto.otoName}" readonly onclick="this.blur()" >
   		<br>
   		
    	<label for="otoEmail">이메일</label>
    	<input type="text" value="${oto.otoEmail}" readonly onclick="this.blur()" >
    	<br>
    	
        <label for="otoTitle">제목:</label>
        <input type="text" id="otoTitle" name="otoTitle" required><br>
        
        <label for="otoContent">내용:</label><br>
        <textarea id="otoContent" name="otoContent" rows="10" cols="100" required></textarea><br>
        
        <label for="detail">파일 첨부:</label>
        <input type="file" id="detail" name="detail" multiple><br>
        
        <input type="submit" value="작성하기">
        
    </form>
    
    <div>
		<button class="btn" type="button"><a href="/buyer/mypage/otodetail">취소하기</a></button>
	</div>
    
    <c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
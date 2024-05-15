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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<title>1:1 문의 작성</title>
<script type="text/javascript">

// document.querySelector('input[name="visibility"]').addEventListener('change', function() {
//     var passwordField = document.getElementById('password_field');
//     passwordField.style.display = (this.value === 'private') ? 'block' : 'none';
// });

</script>
</head>
<body>
<h1>1:1 문의 작성</h1>
    <form action="./otoform" method="post" enctype="multipart/form-data">
        
        <br>
        
        <label for="ct_otono">분류:</label>
   		<select id="ct_otono" name="ct_otono">
	        <option value="210">업사이클링</option>
	        <option value="200">재활용</option>
	        <option value="230">세탁</option>
	        <option value="220">체험단</option>
	        <option value="240">기타</option>
   		</select><br>
    
        <label for="title">제목:</label>
        <input type="text" id="title" name="title"><br>
        
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="10" cols="100"></textarea><br>
        
        <label for="file">파일 첨부:</label>
        <input type="file" id="file" name="file"><br>
        
        <label><input type="radio" name="visibility" value="public" checked>공개</label>
        <label><input type="radio" name="visibility" value="private">비공개</label>
        
        <div id="password_field" style="display: none;">
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password">
        </div>
        
        <input type="submit" value="작성하기">
        
    </form>
    
    
    
</body>
</html>
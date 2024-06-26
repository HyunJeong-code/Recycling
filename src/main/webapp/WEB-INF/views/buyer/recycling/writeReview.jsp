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
    <h1>제품 문의 작성</h1>
    <form action="./writeProc" method="post" enctype="multipart/form-data">
        <br>
        <input type="hidden" name="prdcode" value="${param.prdCode}">
        
        <label for="ct_otono">분류:</label>
        <select id="ct_otono" name="ctOtoNo">
            <!-- <option value="210">업사이클링</option> -->
            <option value="200">재활용</option>
            <!-- <option value="230">세탁</option> -->
            <!-- <option value="220">체험단</option> -->
            <!-- <option value="240">기타</option> -->
        </select><br> 
        
        <label for="otoName">작성자</label>
		<input type="text" id="otoName" name="otoName" value="${buyer.bName}" readonly>
		<br>
        
		<label for="otoEmail">이메일</label>
		<input type="text" id="otoEmail" name="otoEmail" value="${buyer.bEmail}" required>
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
        <button type="button"><a href="./rcydetail?prdcode=${param.prdCode}">취소</a></button>
    </div>    
</body>
</html>
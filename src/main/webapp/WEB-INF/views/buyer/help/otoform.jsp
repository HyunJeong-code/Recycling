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

<style type="text/css">
.wrap {
    width: 100%;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    box-sizing: border-box;
}


form {
    display: flex;
    flex-direction: column;
}

label {
    margin-top: 15px;
    font-weight: bold;
    color: #555;
}

input[type="text"],
textarea,
select {
    width: calc(100% - 20px);
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 16px;
    color: #333;
}

textarea {
    height: 200px;
    resize: none;
}

input[type="file"] {
    margin-top: 10px;
}

.btn {
	cursor: pointer;
}

.btnRight {
	padding: 10px 20px;
    border: none;
    color: white;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
}
.form-footer {
    display: flex;
    justify-content: space-between;
    margin-top: 30px;
}


</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
	<div class="wrap">
	<div class="page">
		<h1>1:1 문의 작성</h1>
	</div>
	
    <form action="./otoform" method="post" enctype="multipart/form-data">
        <br>
        
        <label for="ct_otono">분류</label>
   		<select id="ct_otono" name="ct_otono">
	        <option value="210">업사이클링</option>
	        <option value="200">재활용</option>
	        <option value="230">세탁</option>
	        <option value="220">체험단</option>
	        <option value="240">기타</option>
   		</select> 
   		
   		<label for="otoName">작성자</label>
   		<input type="text" value="${oto.otoName}" readonly onclick="this.blur()" >
   		
   		
    	<label for="otoEmail">이메일</label>
    	<input type="text" value="${oto.otoEmail}" readonly onclick="this.blur()" >
    	
    	
        <label for="otoTitle">제목</label>
        <input type="text" id="otoTitle" name="otoTitle" required>
        
        <label for="otoContent">내용</label>
        <textarea id="otoContent" name="otoContent" rows="10" cols="100" required></textarea>
        
        <label for="detail">파일 첨부</label>
        <input type="file" id="detail" name="detail" multiple>
        
    <div class="form-footer">
        <button class="btnRight">작성하기</button>
		<a href="./otolist"><button class="btn" type="button">작성 취소</button></a>
	</div>
        
    </form>
    
	</div>
</div>
    
    <c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
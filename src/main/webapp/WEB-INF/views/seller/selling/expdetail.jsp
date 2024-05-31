<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험 상세조회</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style type="text/css">
wrap {
             width: 700px;
             margin:200px;
        }
        h1 {
            color: #333;
        }
        .detail-container {
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .detail-container label {
            font-weight: bold;
        }
        .detail-container input[type="text"]{
        	width: 50%;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        
        .detail-container textarea {
            width: 80%;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        .detail-container textarea {
            resize: none;
            height: 200px;
        }
        
        .detail-container select {
            width: 30%;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        
        .detail-container img {
            max-width: 100%;
            margin-top: 10px;
        }

</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
<div class="wrap">
<h1>체험 상세조회</h1>
<hr>

<div class="detail-container">
<label>체험제목</label>
<input type="text" value="${exp.expName}" readonly onclick="this.blur()" >
</div>

<div class="detail-container">
<label>참가비용</label>
<input type="text" value="${exp.expPrice}" readonly onclick="this.blur()"> 원
</div>

<div class="detail-container">
<label>모집 인원</label>
<select readonly onclick="this.blur()">
    <option value="${schCnt}">${schCnt}명</option>
</select>
</div>

<div class="detail-container">
<label>체험설명</label>
<textarea readonly onclick="this.blur()" >${exp.expDetail}</textarea>
</div>



<div>
	<button class="btn" type="button"><a href="./explist">목록으로</a></button>
</div>

</div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
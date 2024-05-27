<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">
	
let ctQstNo = {100:"상품 문의", 110:"결제 문의", 120:"배송 문의", 130:"기타"}

let ctQst = ctQstNo[${qst.ctQstNo }];

console.log(ctQst);

$(function() {
	$("#ctQst").html(ctQst);
	
	$("#qnaBtn").on("click", function() {
        $.post("./qnaform",
        	{ qstCode: "${qst.qstCode}"
        	, qnaContent: $("#qnaContent").val()
        	, function(){
        		location.href="./main";
        	}}
        )
    })
})



</script>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
	
	<div class="full">
	
		<h1>고객 문의사항 답변 등록</h1>
		<hr>
		
		<div>
			<div><img alt="" src=""></div>
			<div>${qst.qstCode }</div>
		</div>
		
		<table>
			<tr>
				<td>문의 분류</td>
				<td id="ctQst"></td>
			</tr>
			<tr>
				<td>문의 제목</td>
				<td>${qst.qstTitle }</td>
			</tr>
			<tr>
				<td>문의 내용</td>
				<td>${qst.qstContent }</td>
			</tr>
		</table>
		
		<table>
			<tr>
				<td>답변 내용</td>
				<td><textarea id="qnaContent" name="qnaContent"></textarea></td>
			</tr>
		</table>
		
		<button id="qnaBtn">등록하기</button>
		<button><a href="./main">목록</a></button>
	</div>

	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
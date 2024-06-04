<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnadetail</title>
</head>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">
	
let ctQstNo = {100:"상품 문의", 110:"결제 문의", 120:"배송 문의", 130:"기타"}

let ctQst = ctQstNo[${qst.ctQstNo }];

$(function() {
	$("#ctQst").html(ctQst);
	
	$("#qnaBtn").on("click", function() {
        let qnaContent = $("#qnaContent").val();
        if(qnaContent.trim() === "") {
        	alert("답변 내용을 입력해주세요.");
        	return false;
        }
		$.post("./qnaform",
        	{ qstCode: "${qst.qstCode}", qnaContent: qnaContent },
        	function(){
        		location.href="./myboard";
        	}
        );
    })
})

function submitDeleteForm() {
	
	document.getElementById('deleteForm').submit();

}

</script>

<style type="text/css">
body {
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}
.wrap {
    width: 800px;
    margin: auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.page_box {
    border-bottom: 2px solid #444444;
    padding-bottom: 10px;
    margin-bottom: 20px;
}
.page_box h2 {
    margin: 0;
    color: #333;
}
.detail-container {
    margin: 20px 0;
}
table {
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 20px;
}
th, td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
th {
    background-color: #f2f2f2;
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
.button-group a {
    color: white;
    text-decoration: none;
}
</style>

<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
	
	<div class="wrap">
	
		<div class="page_box">
			<h2>고객 문의사항 상세 조회</h2>
			<hr>
		</div>	
			
		<div class="detail-container">
			<div class="qna_header">
				<table>
					<tr>
						<th>분류</th>
						<td>
						<c:forEach items="${qct }" var="qstct">
						<c:if test="${qstct.ctQstNo == qst.ctQstNo }">
		                    ${qstct.ctQstName }
		                </c:if>
						</c:forEach>
		                </td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${qst.qstTitle }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${qst.qstContent }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><img alt="" src=""></td>
					</tr>
				</table>
			</div>
			
			<div class="button-group">
				<button class="btnLeft" type="button" onclick="history.back();">목록으로</button>
				<button class="btn1" type="button"><a href="/seller/qna/qnaform">판매자 문의 작성하기</a></button>
				<button class="btn2" id="deleteBtn"><a href="#" onclick="submitDeleteForm()">삭제하기</a></button>
				<form id="deleteForm" action="/buyer/mypage/qnadel" method="post" style="display: none;">
				    <input type="hidden" name="qstCode" value="${qst.qstCode}">
				    <input type="hidden" name="qnaCode" value="${qna.qnaCode}">
				</form>
				
			</div>
		</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
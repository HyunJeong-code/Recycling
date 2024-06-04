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
.wrap {
	width: 800px;
	margin: auto;
}

.page_box {
	border-bottom: 2px solid #444444;
}

.detail-container {
	margin: 50px;
}

.qna_content {
	margin-top: 50px; 
}

table {
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 20px;
    margin-top: 40px;
}
th, td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
th {
    background-color: #f2f2f2;
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
			
			<div>
				<button class="btn" type="button" onclick="history.back();">목록으로</button>
				<button class="btn" type="button"><a href="/seller/qna/qnaform">판매자 문의 작성하기</a></button>
				<button id="deleteBtn"><a href="#" onclick="submitDeleteForm()">삭제하기</a></button>
				<form id="deleteForm" action="/buyer/mypage/qnadel" method="post" style="display: none;">
				    <input type="hidden" name="qstCode" value="${qst.qstCode}">
				    <input type="hidden" name="qnaCode" value="${qna.qnaCode}">
				</form>
				
			</div>
		</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
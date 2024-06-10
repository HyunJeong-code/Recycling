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

<style>
body {
    margin: 0;
    padding: 0;
}

.wrap {
    width: 800px;
    margin: auto;
    padding: 20px;
    border-radius: 8px;
}

.page {
    border-bottom: 2px solid #444444;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

h3 {
    margin: 0;
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}

table {
    border-collapse: collapse;
    width: 60%;
    margin-bottom: 20px;
    margin: auto;
}

th, td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

th {
    background-color: #CEE741;
    text-align: center;
}

.button-group {
    text-align: center;
    margin-top: 20px;
    margin-bottom: 40px;
}

.button-group button {
    margin-right: 10px;
    padding: 10px 20px;
    background-color: #878787;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    display: inline-block;
}

.button-group button.btnLeft {
	background-color: #878787;
}

.button-group button.btnRight {
	background-color: #4CAF50;
}

.button-group button.btnDel {
    background-color: #db2525;
}

.button-group button.btnLeft:hover {
    background-color: #9e9e9e;
}

.button-group button.btnRight:hover {
	background-color: #58c05c;
}

.button-group button.btnDel:hover {
    background-color: #f13535;
}

.button-group a {
    color: white;
    text-decoration: none;
}

footer {
    width: 100%;
    position: fixed;
    bottom: 0;
    left: 0;
    text-align: center;
    padding: 10px 0;
}
</style>

<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
	
	<div class="wrap">
	<h3>고객 문의사항 상세 조회</h3>
		<div class="page">
			<div class="qnadetail">
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
						<td>
							<c:forEach var="file" items="${qstFiles }">
								<img src="/resources/image/${file.originName }" alt="문의 이미지">
							</c:forEach>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="button-group">
				<button class="btnLeft" type="button" onclick="history.back();">목록으로</button>
				<a href="/seller/qna/qnaform"><button class="btnRight" type="button">판매자 문의 작성하기</button></a>
				<a href="#" onclick="submitDeleteForm()"><button class="btnDel" type="button" id="deleteBtn">삭제하기</button></a>
				<form id="deleteForm" action="/buyer/mypage/qnadel" method="post" style="display: none;">
				    <input type="hidden" name="qstCode" value="${qst.qstCode}">
				    <input type="hidden" name="qnaCode" value="${qna.qnaCode}">
				</form>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
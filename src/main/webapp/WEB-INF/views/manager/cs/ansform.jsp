<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$("#btnCom").click(function() {
		
		var comment = $("#ansContent").val();
		console.log("ansContent : ", ansContent);
		
		$.ajax({
			url: "/ansform/insert",
			type: "post",
			data: {"ansCode" : ansCode, "ansContent": ansContent},
			success: function(res) {
				console.log("success");
				console.log("res: ", res);
				
				if(res > 0) {
					location.reload();					
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
</script>
</head>
<body>

	<h1>문의글 상세</h1>
	<hr>
	
	<h3>카테고리 번호: ${ansform.ctOtoNo }</h3>
	<h3>내용: ${ansform.otoContent }</h3>
	
	<%-- <div id="comList">
		<c:if test="${chkNull }">
			<table class="table">
				<c:forEach var="list" items="${comments }">
					<tr>
						<th>댓글 번호</th>
						<td>${list.commentno }</td>
						<th>작성자</th>
						<td>${list.userid }</td>
						<th>작성일</th>
						<td>${list.writeDate }</td>
					</tr>
					
					<tr>
						<th>댓글 내용</th>
						<td colspan="2">${list.content }</td>
						<c:if test="${list.userid eq nick }">
							<td><button id="btnDelCom" value="${list.commentno }">삭제하기</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		
		<c:if test="${chkNull }">
			<p>댓글 없음</p>
		</c:if>
	</div> --%>
	
	<div>
		<input type="text" id=ansContent name="ansContent" placeholder="댓글">
		<button id="btnCom">작성하기</button>
	</div>

</body>
</html>

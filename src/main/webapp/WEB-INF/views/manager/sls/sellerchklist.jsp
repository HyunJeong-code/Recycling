<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	
$(function() {
	
	$("#allChk").click(function() {
		var chk = $("#allChk").val();
		console.log(chk);
		
		if($("#allChk").prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);			
		}
	})
	
// 	$("#sellerDt").click(function() {
// 		var seller = $("#sellerDt").val().split('+');
// 		console.log("seller : ", seller);
		
// 		if(seller[1] === "P") {
// 			$.ajax({
// 				url: "/manager/sls/sellerpridetail", 
// 				type: "get",
// 				data: {
// 					sCode: seller[0],
// 					ctCode: seller[1]
// 				},
// 				success: function(res) {
// 					console.log("sucess");
// 				},
// 				error: function() {
// 					console.log("error");
// 				}
// 			})			
// 		}
// 	})
})
</script>
</head>
<body>
<div class="full">
	<div class="wrap">
		<div class="page">
		<h3>판매자 전환 요청 관리</h3>
		</div>
		
		<div class="section">
		<table border="1">
			<tr>
				<th><input type="checkbox" id="allChk" name="allChk"></th>
				<th>분류</th>
				<th>판매자 번호</th>
				<th>상호명</th>
				<th>담당자 이름</th>
				<th>담당자 번호</th>
				<th>담당자 이메일</th>
				<th>상세 조회</th>
				<th>수락 여부</th>
			</tr>
			
			<c:forEach var="list" items="${sellerList }">
				<c:if test="${list eq null }">
					<tr>
						<td colspan="9">판매자 전환 신청이 없습니다.</td>
					</tr>
				</c:if>
				
				<tr>
					<td>
						<input type="checkbox" id="${list.S_CODE }" name="chkSel">
					</td>
					<td>${list.CT_CODE }</td>
					<td>${list.S_CODE }</td>
					<td>${list.CMP_NAME }</td>
					<td>${list.B_NAME }</td>
					<td>${list.B_PHONE }</td>
					<td>${list.B_EMAIL }</td>
					<td>
						<c:if test="${list.CT_CODE eq 'P'}">
							<button id="sellerDt"><a href="./sellerpridetail?sCode=${list.S_CODE }">상세조회</a></button>
						</c:if>
						<c:if test="${list.CT_CODE eq 'C'}">
							<button id="sellerDt"><a href="./sellerpridetail?sCode=${list.S_CODE }">상세조회</a></button>
						</c:if>
					</td>
					<td>
						<button id="selOk">수락</button>
						<button id="selNo">거절</button>
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</div>

</body>
</html>
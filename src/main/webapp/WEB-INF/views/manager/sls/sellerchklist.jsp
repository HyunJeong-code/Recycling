<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">	

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
<style type="text/css">
.search_form{
	padding-bottom: 20px;
}

.btn_bot_wrap{
	display: flex;
	
}

</style>

</head>
<body>
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
			<sec:authentication var="managerLogin" property="principal"/>
	<c:if test="${managerLogin.deptno eq 10}">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 20}">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 30}">
		<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 40}">
		<c:import url="/WEB-INF/views/layout/manager/managercsmenu.jsp"/>
	</c:if>
		<div class = "full content" >
	<div class="wrap">
		<div class="page">
			판매자 전환 요청 관리
		</div>
		
		<div class="section">
			<form action="/manager/sls/sellerchklist" method="get" class ="search_form">
				<input type="hidden" name="sCtg" value="UP" >
				<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
				<button class ="btn btnRight">검색</button>
			</form>
			<table>
				<tr>
					<th>번호</th>
					<th>판매자 번호</th>
					<th>상호명</th>
					<th>(담당자) 이름</th>
					<th>(담당자) 번호</th>
					<th>(담당자) 이메일</th>
					<th>상세 조회</th>
					<th>수락/거절</th>
				</tr>
				
				<c:if test="${listSize eq 0 }">
					<tr>
						<td colspan="8">판매자 전환 신청이 없습니다.</td>
					</tr>
				</c:if>
				
				<c:if test="${listSize ne 0 }">
					<c:forEach var="list" items="${sellerList }">
						
						<tr>
							<td>${list.NO }</td>
							<td>${list.S_CODE }</td>
							<td>${list.CMP_NAME }</td>
							<td>${list.B_NAME }</td>
							<td>${list.B_PHONE }</td>
							<td>${list.B_EMAIL }</td>
							<td>
								<c:if test="${list.CT_CODE eq 'P'}">
									<a href="/manager/sls/sellerpridetail?sCode=${list.S_CODE }"><button class="btn btnRight">상세조회</button></a>
								</c:if>
								<c:if test="${list.CT_CODE eq 'C'}">
									<a href="/manager/sls/sellercmpdetail?sCode=${list.S_CODE }"><button class="btn btnRight">상세조회</button></a>
								</c:if>
							</td>
							<td>
								<a href="/manager/sls/sellerchk?selChk=Y&sCode=${list.S_CODE }"><button id="selChk" name="selChk">수락</button></a>
								<a href="/manager/sls/sellerchk?selChk=N&sCode=${list.S_CODE }"><button id="selChk" name="selChk">거절</button></a>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				
			</table>
			<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
<!-- 			<button type="button" id="AllSel" name="AllSel" value="Y">수락</button> -->
<!-- 			<button type="button" id="AllSel" name="AllSel" value="N">거절</button> -->
		</div>
	</div>
</div>
</div>
</body>
</html>
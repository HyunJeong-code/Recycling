<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

/* 체험 리스트 삭제기능 */
$(function() {
	$("#expListDel").click(function() {

		var len = $("input[name=chkBox]:checked").length;
		var chk = new Array();

		$("input:checkbox[name=chkBox]").each(function() {
			if ($(this).is(":checked") == true) {
				chk.push($(this).attr('id'));
			}
		})

		console.log(len);
		console.log(chk);

		if (len == 0) {
			alert("삭제할 게시물 선택해주세요.");
		} else {
			$.ajax({
				url : "./explistdel",
				type : "post",
				data : {
					chBox : chk
				},
				success : function(res) {
					if (res <= 0) {
						alert("삭제 실패");
					} else {
						alert("삭제 성공");
						location.reload();
					}
				},
				error : function() {
					console.log("error");
				}
			})
		}

	})
})

</script>
<style type="text/css">
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
				체험단 조회
			</div>
			
			<div class="search">
				<form action="./noticelist" method="get" class ="search_form">
					<input type="hidden" name="sCtg" value="UP">
					<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
					<button class ="btn btnRight">검색</button>
				</form>
			</div>
						
			<div class="section">
				<table>
					<thead>
						<tr>
							<th></th>
							<th>판매자 ID</th>
							<th class="expName_fix" >체험 제목</th>
							<th>참가 비용</th>
							<th>등록일</th>
							<th>상세보기</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="explist" items="${explist }">
							<tr>
								<td><input type="checkbox" id="${explist.expCode }" name="chkBox"></td>
								<td>${explist.sCode }</td>
								<td class="expName_fix_con">${explist.expName }</td>
								<td>${explist.expPrice }</td>
								<td>
									<fmt:parseDate value="${explist.expDate }" var="expDate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${expDate }" pattern="yyyy-MM-dd" />
								</td>
								
								<td>
								<a href="./expdetail?expCode=${explist.expCode }">
									<button class="btn btndetail" id ="${explist.expCode }">상세조회</button></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- section -->
				<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
				
				    <div class="btn_bot_wrap">
				        <a href="./expform"><button class="btn btnLeft" style="margin-right: 20px;">작성하기</button></a>
				        <button class ="btn btnDel" id="expListDel">삭제하기</button>
				    </div>
				    
		</div><!-- wrap -->
	</div><!-- full -->
</div>
</body>
</html>
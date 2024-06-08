<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		$("#listDel").click(function() {

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
					url : "./emplistdelete",
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
</head>
<body>
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
			<div class="wrap">		
				<div class="page">
					전체사원 조회
				</div>
			<div class="search">
				<form action="./emplist" method="get" class ="search_form">
					<input type="hidden" name="sCtg" value="UP">
					<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
					<button class ="btn btnRight">검색</button>
				</form>
			</div>
				
			<div class = "section">
				<table>
					<thead>
						<tr>
							<th>부서명</th>
							<th>이름</th>
							<th>사원번호</th>
							<th>핸드폰 번호</th>
							<th>이메일</th>
						</tr>
					</thead>
		
					<tbody>
						<c:forEach var="select" items="${select }" varStatus="status">
							<!-- mgrOut상태가 'N' 이면 보여주고 'Y'이면 숨기기 -->
							<c:if test="${select.mgrOut eq 'N'}">
							<tr>
								<td>${select.dname }</td>
								<td>${select.mgrName }</td>
								<td>${select.mgrCode }</td>
								<td>${select.mgrPhone }</td>
								<td>${select.mgrEmail }</td>
							</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- section -->
			<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
			</div><!-- wrap -->
		</div><!-- full -->
	</div>
</body>
</html>
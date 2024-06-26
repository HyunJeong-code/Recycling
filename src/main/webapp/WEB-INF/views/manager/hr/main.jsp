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
<style type="text/css">
/* 상세정보보기 */
.btndetail {
    background-color: #652CB3;
    width: 70%;
}

.btndetail:hover {
    background-color:#652CB3;
}

.btnLeft{
    margin-right: 20px;
    width: 150px;
}

.btnDel{
	width: 150px;
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
				전체사원 조회
			</div>
			
			<div class="search">
				<form action="./main" method="get" class ="search_form" >
					<input type="hidden" name="sCtg" value="UP">
					<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
					<button class ="btn btnRight" >검색</button>
				</form>
			</div>
			
					<div class = "section">
						<table>
							<thead>
								<tr>
									<th></th>
									<th>부서명</th>
									<th>이름</th>
									<th>사원번호</th>
									<th>핸드폰 번호</th>
									<th>이메일</th>
									<th>입사일</th>
									<th>생년월일</th>
									<th>성별</th>
									<th>상세조회</th>
								</tr>
							</thead>
				
							<tbody>
								<c:forEach var="select" items="${select }" varStatus="status">
									<!-- mgrOut상태가 'N' 이면 보여주고 'Y'이면 숨기기 -->
									<c:if test="${select.mgrOut eq 'N'}">
									<tr>
										<td><input type="checkbox" id="${select.mgrCode }"name="chkBox"></td>
											<td>
										<c:choose>
											<c:when test="${select.deptno == 10 }">
												CEO
											</c:when>
											<c:when test="${select.deptno == 20 }">
												인사팀
											</c:when>
											<c:when test="${select.deptno == 30 }">
												판매제휴팀
											</c:when>
											<c:when test="${select.deptno == 40 }">
												구매CS팀
											</c:when>
											
										</c:choose>
											</td>
										<td>${select.mgrName }</td>
										<td>${select.mgrCode }</td>
										<td>${select.mgrPhone }</td>
										<td>${select.mgrEmail }</td>
										<td>
											<fmt:parseDate value="${select.mgrEntDate}" pattern="yyyy-MM-dd" var="mgrEntDate"/>
											<fmt:formatDate value="${mgrEntDate}" pattern="yyyy-MM-dd" />
										</td>
										<td>
											<fmt:parseDate value="${select.mgrBirth}" pattern="yyyy-MM-dd" var="mgrBirth"/>
											<fmt:formatDate value="${mgrBirth}" pattern="yyyy-MM-dd" />
										</td>
										<td>${select.mgrGender }</td>
										<td>
											<c:choose>
												<c:when test="${not empty select.mgrId}">
													<a href="./empdetail?mgrCode=${select.mgrCode }"><button class="btn btndetail">상세조회</button></a>
												</c:when>
												<c:when test="${empty select.mgrId}">
													<button class="btn btndetail" disabled>미 가입</button>
												</c:when>
											</c:choose>
										</td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div><!-- section -->
					<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
							<div class="btn_bot_wrap">
									<a href="./empform"><button class="btn btnLeft">사원등록</button></a>
									<button id ="listDel" class="btn btnDel">삭제하기</button>
							</div>
		</div><!-- wrap -->
	</div><!-- full -->
	</div>


</body>
</html>
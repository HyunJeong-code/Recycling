<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">
<style type="text/css">
#noticeContent {
	margin: 20px 0;
	padding: 10px;
	background-color: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 4px;
	height: 500px;
}

/* 표 중앙정렬 */
.noticeTable .center_align {
    text-align: center;
}

/* 버튼 효과 */
.btn{
	text-align: center;
	margin : 0 auto;
}

.section{
	margin-top: 20px
}

</style>

<script type="text/javascript">
function cancelUpdate() {
	
	window.history.back(-1);
		
}

</script>
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
				공지사항
				<hr>
			</div>
			
			<div></div>
			
			<div class="section">
				<table class="noticeTable">
				<colgroup>
					<col width="20%" />
					<col width="50%" />
					<col width="10%" />
					<col width="20%" />
				</colgroup>
				
					<thead>
						<tr>
							<th class ="center_align">제목</th>
							<td>${view.ntcTitle}</td>
							<th class ="center_align">작성자</th>
							<td>관리자</td>

						</tr>
					</thead>
					<tbody>
						<tr>
							<th class ="center_align">등록일</th>
							<td class ="center_align">${view.ntcDate}</td>
							<th class ="center_align">조회수</th>
							<td class ="center_align">${view.ntcHit}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div></div>
			<div id="noticeContent">${view.ntcContent}</div>
			
			<button type="button" class ="btn btnLeft" onclick="cancelUpdate()">돌아가기</button>
			
		</div>
	</div>
	</div>
</body>


</html>
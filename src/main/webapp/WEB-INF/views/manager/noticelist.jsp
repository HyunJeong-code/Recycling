<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">
<style type="text/css">

</style>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
        <div class="wrap">
            
            <div class="page">
            	공지사항
            <hr>
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
				<colgroup>
					<col width="20%" />
					<col width="50%" />
					<col width="10%" />
					<col width="20%" />
				</colgroup>

				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="${notice }">
						<tr>
							<td>${notice.ntcCode }</td>
							<td>
							<a href="./noticedetail?ntcCode=${notice.ntcCode }">${notice.ntcTitle }</a>
							</td>
							<td>${notice.ntcHit }</td>
							<td>
								<fmt:parseDate value="${notice.ntcDate }" var="ntcDate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${ntcDate }" pattern="yyyy-MM-dd" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
            </div>
<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>

        </div><!-- wrap -->
    	</div><!-- full -->
    </div>
</body>


</html>

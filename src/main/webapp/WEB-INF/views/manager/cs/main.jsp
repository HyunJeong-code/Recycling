<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/manager/cs/list.css">
</head>
<body>

	<div class="full">
		<aside>
		</aside>
		<div class="wrap">
			<div class="page">
				게시글 목록
			</div>
			
			<div class="search">
				<form action="./main" method="get">
					<input type="hidden" name="sCtg" value="UP">
					<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
					<button>검색</button>
				</form>
			</div>
			
			<div class="section">
				<table>
					<thead>
						<tr>
							<th>문의코드</th>
							<th>제목</th>
							<th>이름</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="oto" items="${list }">
							<tr>
								<td>${oto.otoCode }</td>
								<td>
									<a href="./ansform?otoCode=${oto.otoCode }">${oto.otoTitle }</a>
									<%-- <a href="./ansform?otoCode=${oto.otoCode }&ansCode=${comments.ansCode }">${oto.otoTitle }</a> --%>
								</td>
								<td>${oto.otoName }</td>
								<td>${oto.otoHit }</td>
								<td>
									<fmt:parseDate value="${oto.otoDate }" var="otoDate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${otoDate }" pattern="yyyy-MM-dd" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
		</div>
	</div>
</body>
</html>

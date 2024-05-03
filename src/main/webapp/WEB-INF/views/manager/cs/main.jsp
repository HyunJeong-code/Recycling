<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
	table, th {
		text-align: center;
	}
	
	/* 게시글 제목 */
	td:nth-child(2) {
		text-align: left;
	}
</style>

<div class="container">

	<h1>게시글 목록</h1>
	<hr>
	
	<table class="table table-striped table-hover table-sm">
	
		<colgroup>
			<col style="width: 10%;">
			<col style="width: 45%;">
			<col style="width: 15%;">
			<col style="width: 10%;">
			<col style="width: 20%;">
		</colgroup>
		
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
						<a href="./view?boardNo=${oto.otoCode }">${oto.otoTitle }</a>
					</td>
					<td>${oto.otoName }</td>
					<td>${oto.otoHit }</td>
					<td>
						<fmt:formatDate value="${oto.otoDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</div><!-- .container -->

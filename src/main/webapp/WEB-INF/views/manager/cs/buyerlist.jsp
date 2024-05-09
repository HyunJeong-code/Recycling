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

	<h1>구매자 리스트</h1>
	<hr>
	
	<table class="table table-striped table-hover table-sm">
	
		<colgroup>
			<col style="width: 10%;">
			<col style="width: 5%;">
			<col style="width: 15%;">
			<col style="width: 10%;">
			<col style="width: 20%;">
		</colgroup>
		
		<thead>
			<tr>
				<th>구매자 코드</th>
				<th>구매자 분류 코드</th>								
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>이메일</th>
				<th>등급</th>
				<th>가입일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="buyer" items="${buyerList }">
				<tr>
					<td>${buyer.bCode }</td>
					<td>${buyer.bCtCode }</td>
					<td>
						<a href="./buyerDetail?bCode=${buyer.bCode }">${buyer.bId }</a>
					</td>
					<td>${buyer.bName }</td>
					<td>${buyer.bPhone }</td>
					<td>${buyer.bEmail }</td>
					<td>${buyer.rankNo }</td>
					<td>
						<fmt:parseDate value="${buyer.bEntDate }" var="bEntDate" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${bEntDate }" pattern="yyyy-MM-dd" />
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</div><!-- .container -->

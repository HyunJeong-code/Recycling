<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
<ul class="pagination pagination-sm justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
	<li class="page-item">
		<a class="page-link" href="/manager/noticelist">&larr; 처음</a>
	</li>
	</c:if>

	<%-- 이전 페이지로 이동 --%>
	<c:if test="${paging.curPage > 1 }">
	<li class="page-item">
		<a class="page-link" href="/manager/noticelist?curPage=${paging.curPage - 1 }">&lt;</a>
	</li>
	</c:if>


	<%-- 이전 페이징 리스트 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li class="page-item">
			<a class="page-link" href="/manager/noticelist?curPage=${paging.startPage - paging.pageCount }">&laquo;</a>
		</li>
	</c:when>

	<c:when test="${paging.startPage eq 1 }">
		<li class="page-item">
			<a class="page-link disabled">&laquo;</a>
		</li>
	</c:when>
	</c:choose>

	
	<%-- 페이징 번호 목록 --%>
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	<c:if test="${paging.curPage eq i }">
	<li class="page-item">
		<a class="page-link active" href="/manager/noticelist?curPage=${i }">${i }</a>
	</li>		
	</c:if>
	
	<c:if test="${paging.curPage ne i }">
	<li class="page-item">
		<a class="page-link" href="/manager/noticelist?curPage=${i }">${i }</a>
	</li>		
	</c:if>
	</c:forEach>
	
	<%-- 다음 페이지로 이동 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
	<li class="page-item">
		<a class="page-link" href="/manager/noticelist?curPage=${paging.curPage + 1 }">&gt;</a>
	</li>
	</c:if>



	<%-- 다음 페이징 리스트 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne paging.totalPage }">
		<li class="page-item">
			<a class="page-link" href="/manager/noticelist?curPage=${paging.startPage + paging.pageCount }">&raquo;</a>
		</li>
	</c:when>

	<c:when test="${paging.startPage eq paging.totalPage }">
		<li class="page-item">
			<a class="page-link disabled">&raquo;</a>
		</li>
	</c:when>
	</c:choose>
	


	<%-- 마지막 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
	<li class="page-item">
		<a class="page-link" href="/manager/noticelist?curPage=${paging.totalPage }">끝 &rarr;</a>
	</li>
	</c:if>
</ul>

</div>

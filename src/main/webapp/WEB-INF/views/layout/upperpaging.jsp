<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="paging">

	<ul class="page-ul">	
		<!-- 첫 페이지로 이동 -->
		<c:if test="${upPaging.curPage ne 1 }">
		<li class="page-item">
			<a class="page-link" href="${upUrl}">&larr; 처음</a>
		</li>
		</c:if>
		
		<!-- 이전 페이지로 이동 -->
		<c:if test="${upPaging.curPage > 1 }">
		<li class="page-item">
			<a class="page-link" href="${upUrl}?curPage=${upPaging.curPage - 1}&search=${upPaging.search }">&lt;</a>
		</li>
		</c:if>
		
		<!-- 이전 페이징 리스트로 이동 -->
		<c:choose>
			<c:when test="${upPaging.startPage ne 1 }">
				<li class="page-item">
					<a class="page-link" href="${upUrl}?curPage=${upPaging.curPage - 1}&search=${upPaging.search }">&laquo;</a>
				</li>
			</c:when>
			
			<c:when test="${upPaging.startPage eq 1 }">
				<li class="page-item">
					<a class="page-link disabled">&laquo;</a>
				</li>
			</c:when>
		</c:choose>
		
		<!-- 페이징 번호 목록 -->
		<c:forEach var="i" begin="${upPaging.startPage }" end="${upPaging.endPage }">
			<c:if test="${upPaging.curPage eq i }">
				<li class="page-item">
					<a class="page-link active" href="${upUrl}?curPage=${i }&search=${upPaging.search }">${i }</a>
				</li>
			</c:if>
			
			<c:if test="${upPaging.curPage ne i }">
				<li class="page-item">
					<a class="page-link" href="${upUrl}?curPage=${i }&search=${upPaging.search }">${i }</a>
				</li>
			</c:if>
		</c:forEach>
		
	<%-- 	<c:forEach var="i" begin="${upPaging.startPage }" end="${upPaging.endPage }"> --%>
	<!-- 	<li class="page-item"> -->
	<%-- 		<a class="page-link ${(upPaging.curPage eq i) ?'active' :'' }" href="${upUrl}?curPage=${i }">${i }</a> --%>
	<!-- 	</li>		 -->
	<%-- 	</c:forEach> --%>
		
		<!-- 다음 페이지로 이동 -->
		<c:if test="${upPaging.curPage < upPaging.totalPage }">
		<li class="page-item">
			<a class="page-link" href="${upUrl}?curPage=${upPaging.curPage + 1}&search=${upPaging.search }">&gt;</a>
		</li>
		</c:if>
		
		<!-- 다음 페이징 리스트로 이동 -->
		<c:choose>
			<c:when test="${upPaging.startPage ne upPaging.totalPage }">
				<li class="page-item">
					<a class="page-link" href="${upUrl}?curPage=${upPaging.startPage + upPaging.pageCount}&search=${upPaging.search }">&raquo;</a>
				</li>
			</c:when>
			
			<c:when test="${upPaging.startPage eq upPaging.totalPage }">
				<li class="page-item">
					<a class="page-link disabled">&raquo;</a>
				</li>
			</c:when>
		</c:choose>
		
		<!-- 마지막 페이지로 이동 -->
		<c:if test="${upPaging.curPage ne upPaging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="${upUrl}?curPage=${upPaging.totalPage }&search=${upPaging.search }">끝 &rarr;</a>
			</li>
		</c:if>
	</ul>
</div>
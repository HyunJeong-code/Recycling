<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/paging.css">
<div class="paging">

	<ul class="page-ul">	
		<!-- 첫 페이지로 이동 -->
		<c:if test="${unPaging.curPage ne 1 }">
		<li class="page-item">
			<a class="page-link" href="${unUrl}">&larr; 처음</a>
		</li>
		</c:if>
		
		<!-- 이전 페이지로 이동 -->
		<c:if test="${unPaging.curPage > 1 }">
		<li class="page-item">
			<a class="page-link prev" href="${unUrl}?curPage=${unPaging.curPage - 1}&search=${unPaging.search }&sCtg=UN"></a>
		</li>
		</c:if>
		
		<!-- 이전 페이징 리스트로 이동 -->
		<c:choose>
			<c:when test="${unPaging.startPage ne 1 }">
				<li class="page-item">
					<a class="page-link pprev" href="${unUrl}?curPage=${unPaging.curPage - 1}&search=${unPaging.search }&sCtg=UN"></a>
				</li>
			</c:when>
			
			<c:when test="${unPaging.startPage eq 1 }">
				<li class="page-item">
					<a class="page-link pprev disabled"></a>
				</li>
			</c:when>
		</c:choose>
		
		<!-- 페이징 번호 목록 -->
		<c:forEach var="i" begin="${unPaging.startPage }" end="${unPaging.endPage }">
			<c:if test="${unPaging.curPage eq i }">
				<li class="page-item">
					<a class="page-link active" href="${unUrl}?curPage=${i }&search=${unPaging.search }&sCtg=UN">${i }</a>
				</li>
			</c:if>
			
			<c:if test="${unPaging.curPage ne i }">
				<li class="page-item">
					<a class="page-link" href="${unUrl}?curPage=${i }&search=${unPaging.search }&sCtg=UN">${i }</a>
				</li>
			</c:if>
		</c:forEach>
		
	<%-- 	<c:forEach var="i" begin="${unPaging.startPage }" end="${unPaging.endPage }"> --%>
	<!-- 	<li class="page-item"> -->
	<%-- 		<a class="page-link ${(unPaging.curPage eq i) ?'active' :'' }" href="${unUrl}?curPage=${i }">${i }</a> --%>
	<!-- 	</li>		 -->
	<%-- 	</c:forEach> --%>
		
		<!-- 다음 페이지로 이동 -->
		<c:if test="${unPaging.curPage < unPaging.totalPage }">
		<li class="page-item">
			<a class="page-link next" href="${unUrl}?curPage=${unPaging.curPage + 1}&search=${unPaging.search }&sCtg=UN"></a>
		</li>
		</c:if>
		
		<!-- 다음 페이징 리스트로 이동 -->
		<c:choose>
			<c:when test="${unPaging.startPage ne unPaging.totalPage }">
				<li class="page-item">
					<a class="page-link nnext" href="${unUrl}?curPage=${unPaging.startPage + unPaging.pageCount}&search=${unPaging.search }&sCtg=UN"></a>
				</li>
			</c:when>
			
			<c:when test="${unPaging.startPage eq unPaging.totalPage }">
				<li class="page-item">
					<a class="page-link nnext disabled"></a>
				</li>
			</c:when>
		</c:choose>
		
		<!-- 마지막 페이지로 이동 -->
		<c:if test="${unPaging.curPage ne unPaging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="${unUrl}?curPage=${unPaging.totalPage }&search=${unPaging.search }&sCtg=UN">끝 &rarr;</a>
			</li>
		</c:if>
	</ul>
</div>
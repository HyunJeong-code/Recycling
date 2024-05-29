<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="paging">
<ul class="page-ul">

	<!-- 첫 페이지로 이동 -->
	<c:if test="${paging.curPage ne 1 }">
	<li class="page-item">
		<a class="page-link" href="<c:out value="${pageContext.request.contextPath}"/>${url}">&larr; 처음</a>
	</li>
	</c:if>
	
	<!-- 이전 페이지로 이동 -->
	<c:if test="${paging.curPage > 1 }">
	<li class="page-item">
		<a class="page-link" href="<c:out value="${pageContext.request.contextPath}"/>${url}?curPage=${paging.curPage - 1}&search=${paging.search }">&lt;</a>
	</li>
	</c:if>
	
	<!-- 이전 페이징 리스트로 이동 -->
	<c:choose>
		<c:when test="${paging.startPage ne 1 }">
			<li class="page-item">
				<a class="page-link" href="<c:out value="${pageContext.request.contextPath}"/>${url}?curPage=${paging.curPage - 1}&search=${paging.search }">&laquo;</a>
			</li>
		</c:when>
		
		<c:when test="${paging.startPage eq 1 }">
			<li class="page-item">
				<a class="page-link disabled">&laquo;</a>
			</li>
		</c:when>
	</c:choose>
	
	<!-- 페이징 번호 목록 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.curPage eq i }">
			<li class="page-item">
				<a class="page-link active" href="<c:out value="${pageContext.request.contextPath}"/>${url}?curPage=${paging.curPage - 1}&search=${paging.search }">${i }</a>
			</li>
		</c:if>
		
		<c:if test="${paging.curPage ne i }">
			<li class="page-item">
				<a class="page-link" href="<c:out value="${pageContext.request.contextPath}"/>${url}?curPage=${paging.curPage - 1}&search=${paging.search }">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
<%-- 	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }"> --%>
<!-- 	<li class="page-item"> -->
<%-- 		<a class="page-link ${(paging.curPage eq i) ?'active' :'' }" href="/board/list?curPage=${i }">${i }</a> --%>
<!-- 	</li>		 -->
<%-- 	</c:forEach> --%>
	
	<!-- 다음 페이지로 이동 -->
	<c:if test="${paging.curPage < paging.totalPage }">
	<li class="page-item">
		<a class="page-link" href="/<c:out value="${pageContext.request.contextPath}"/>${url}?curPage=${paging.curPage - 1}&search=${paging.search }">&gt;</a>
	</li>
	</c:if>
	
	<!-- 다음 페이징 리스트로 이동 -->
	<c:choose>
		<c:when test="${paging.startPage ne paging.totalPage }">
			<li class="page-item">
				<a class="page-link" href="<c:out value="${pageContext.request.contextPath}"/>${url}?curPage=${paging.curPage - 1}&search=${paging.search }">&raquo;</a>
			</li>
		</c:when>
		
		<c:when test="${paging.startPage eq paging.totalPage }">
			<li class="page-item">
				<a class="page-link disabled">&raquo;</a>
			</li>
		</c:when>
	</c:choose>
	
	<!-- 마지막 페이지로 이동 -->
	<c:if test="${paging.curPage ne paging.totalPage }">
	<li class="page-item">
		<a class="page-link" href="<c:out value="${pageContext.request.contextPath}"/>${url}?curPage=${paging.curPage - 1}&search=${paging.search }">끝 &rarr;</a>
	</li>
	</c:if>
</ul>

</div>
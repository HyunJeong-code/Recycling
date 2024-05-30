<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
<c:set var="seller" value="${seller }" />

<div class="page">
	<h3>판매자 상세 조회</h3>
</div>

<div class="section">
	<div id="main">
	
		<div id="prof">
		</div>
		
		<div id="info">
			<table border="1">
				<tr>
					<th>이름</th>
					<td>${seller.B_NAME }</td>
				</tr>
				
				<tr>
					<th>판매자 전환 여부</th>
					<td>
						<c:if test="${seller.S_CHK eq 'Y' }">
							전환 완료
						</c:if>
						<c:if test="${seller.S_CHK eq 'N' }">
							전환 대기중
						</c:if>
					</td>
				</tr>
				
				<tr>
					<c:if test="${seller.S_CHK eq 'Y' }">
						<th>전환일</th>
						<td>
							<fmt:parseDate value="${seller.S_ENTDATE }"  var="S_ENTDATE" pattern="yyyy-MM-dd" />
	                   			<fmt:formatDate value="${S_ENTDATE }" pattern="yyyy-MM-dd"/>
						</td>
					</c:if>
					
					<c:if test="${seller.S_CHK eq 'N' }">
						<th>전환 신청일</th>
						<td>
							<fmt:parseDate value="${seller.S_ENTDATE }"  var="S_ENTDATE" pattern="yyyy-MM-dd" />
	                   			<fmt:formatDate value="${S_ENTDATE }" pattern="yyyy-MM-dd"/>
						</td>							
					</c:if>
				</tr>
				<c:if test="${seller.S_CHK eq 'Y' }">
				
				<tr>
					<th>총 거래 건수</th>
					<td></td>
				</tr>
				<tr>
					<th>총 신고 횟수</th>
					<td></td>
				</tr>
				</c:if>
			</table>	
		</div> <!-- info End -->
			
	</div> <!-- main End -->
</div> <!-- section End -->

<div class="page">
	<h3>판매자 상세 정보</h3>
</div>

<div class="section">
		<table border="1">
			<tr>
				<th></th>
				<td></td>
			</tr>
		</table>
</div> <!-- section End -->

</body>
</html>
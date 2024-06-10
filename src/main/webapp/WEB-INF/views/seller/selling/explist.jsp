<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>내 체험단 판매상품 조회</title>
<style type="text/css">

table .expName_fix_con{
	text-align: left;	
}

button {
	cursor: pointer;
}
</style>

</head>
<body>
	<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
	<div class="full">
		<div class="wrap">
			<c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>
			
			<div class=main-section>
				<h1>체험단 조회</h1>

				<div class="search">
		            <form action="./explist" method="get">
		                <input type="hidden" name="sCtg" value="UP">
		                <input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
		                <button>
							<span class="sch_send">
								<i class="fa-solid fa-magnifying-glass"></i>
							</span>
						</button>
		            </form>
	        	</div>
			
				<table class="s-table">
				    <thead>
				        <tr>
				            <th>상품 번호</th>
				            <th class="expName_fix">체험 제목</th>
				            <th>참가 비용</th>
				            <th>조회수</th>
				            <th>등록일</th>
				            <th>상세 관리</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach items="${list}" var="exp">
				            <tr>
				                <td>${exp.expCode}</td>
				                <td class="expName_fix_con">${exp.expName}</td>
				                <td>${exp.expPrice}</td>
				                <td>${exp.expHit}</td>
				                <td>
				                	<fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
				               		<fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				                </td>
				                <td><a href="./expdetail?expCode=${exp.expCode }"><button class="btn">상세 관리</button></a></td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
				<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
			</div>
		</div>
	</div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
<div class="full">
		<div class="wrap">
			<c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>
			
			<div class="">
			<div class="page">
				<h3>상품 관리</h3>
			</div>
			
			<div class="section">
				<form action="./main" method="get">
					<input type="hidden" name="sCtg" value="UP">
					<input type="text" id="undersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
					<button>검색</button>
				</form>
				
				<table>
					<tr>
						<th>번호</th>
						<th>상품 분류</th>
						<th>상품 이름</th>
						<th>가격</th>
						<th>배송비</th>
						<th>수량</th>
						<th>등록일</th>
					</tr>
					
					<c:if test="${prdSize eq 0 }">
						<td colspan="7">등록된 상품이 없습니다.</td>
					</c:if>
					
					<c:if test="${prdSize ne 0 }">
						<c:forEach var="prd" items="${prdList }">
							<tr>
								<td>${prd.NO }</td>
								<c:if test="${prd.CTPNO eq 0}">
									<td>재활용품</td>				
								</c:if>
								<c:if test="${prd.CTPNO eq 1}">
									<td>새활품</td>				
								</c:if>
								<td>
									<c:if test="${prd.CT_PNO eq 0}">
										<a href="/seller/rcydetail?prdCode=${prd.PRD_CODE }">${prd.PRD_NAME }</a>
									</c:if>
									<c:if test="${prd.CT_PNO eq 1}">
										<a href="/seller/upcydetail?prdCode=${prd.PRD_CODE }">${prd.PRD_NAME }</a>
									</c:if>
								</td>
								<td>${prd.PRICE }</td>
								<td>${prd.PRD_FEE }</td>
								<td>${prd.PRD_CNT }</td>
								<td>${prd.PRD_DATE }</td>
							</tr>
						</c:forEach>
					</c:if>			
				</table>
				
				<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
			</div> <!-- section End -->
			
			<div class="page">
	
			</div>
				<h3>판매 관리</h3>		
			<div class="section">
				<form action="./main" method="get">
					<input type="hidden" name="sCtg" value="UN">
					<input type="text" id="undersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
					<button>검색</button>
				</form>
					
				<table>
					<tr>
						<th>번호</th>
						<th>주문 번호</th>
						<th>상품 이름</th>
						<th>가격</th>
						<th>총금액</th>
						<th>주문일</th>
						<th>주문 상태</th>
					</tr>
					
					<c:if test="${ordSize eq 0 }">
						<td colspan="7">등록된 상품이 없습니다.</td>
					</c:if>
					
					<c:if test="${ordSize ne 0 }">
						<c:forEach var="ord" items="${ordList }">
							<tr>
								<td>${ord.NO }</td>
								<td>${ord.ORDDTCODE }</td>
								<td>${ord.PRDNAME }</td>
								<td>${ord.PRICE }</td>
								<td>${ord.ORDSUM }</td>
								<td>${ord.ORDDATE }</td>
								<c:if test="${ord.STTNO eq 900 }">
									<td>결제 완료</td>
								</c:if>
								<c:if test="${ord.STTNO eq 910 }">
									<td>배송 준비 중</td>
								</c:if>
								<c:if test="${ord.STTNO eq 920 }">
									<td>배송중</td>
								</c:if>
								<c:if test="${ord.STTNO eq 930 }">
									<td>배송 완료</td>
								</c:if>
								<c:if test="${ord.STTNO eq 940 }">
									<td>구매 확정</td>
								</c:if>
								<c:if test="${ord.STTNO eq 950 }">
									<td>환불</td>
								</c:if>
								<c:if test="${ord.STTNO eq 960 }">
									<td>반품</td>
								</c:if>
								<c:if test="${ord.STTNO eq 970 }">
									<td>교환</td>
								</c:if>
								<c:if test="${ord.STTNO eq 980 }">
									<td>취소</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<c:import url="/WEB-INF/views/layout/underpaging.jsp"/>
			</div> <!-- section End -->
		</div>
	</div> <!-- wrap End -->
</div> <!-- full End -->
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
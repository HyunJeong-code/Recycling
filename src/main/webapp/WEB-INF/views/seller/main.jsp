<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style type="text/css">
.section .search {
	justify-content: flex-end;
}

.section table .center {
	text-align: center;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>	
		<div class="main-section">
			<div class="page-header">
				<h3>간단 통계</h3>
			</div>
			
			<div class="section">
				<table class="view-table">
				
				<colgroup>
					<col width="20%">
					<col width="10%">
					<col width="20%">
					<col width="15%">
					<col width="20%">
					<col width="15%">
				</colgroup>
				
					<tr>
						<th>총 등록한 상품 수</th>
						<td>${prdCnt }</td>
						<th>결제 완료 진행 수</th>
						<td>${payCnt }</td>
						<th>배송 중 진행 수</th>
						<td>${shipCnt }</td>
					</tr>
				</table>
			</div>
			
			<div class="page-header">
				<h3>진행 중인 주문 목록</h3>
			</div>
			
			<div class="section">
				<div class="search">
					<form action="/seller/main" method="get">
						<input type="hidden" name="sCtg" value="UP">
						<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
						<button>검색</button>
					</form>
				</div>
				<table class="s-table">
				
				<colgroup>
					<col width="5%">
					<col width="20%">
					<col width="30%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				
				<thead>
					<tr>
						<th>번호</th>
						<th>주문 번호</th>
						<th>상품 이름</th>
						<th>가격</th>
						<th>총금액</th>
						<th>주문일</th>
						<th>주문 상태</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${ordSize eq 0 }">
						<tr>
							<td colspan="7">등록된 상품이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${ordSize ne 0 }">
						<c:forEach var="ord" items="${ordList }">
							<tr>
								<td class="center">${ord.NO }</td>
								<td class="center">${ord.ORDDTCODE }</td>
								<td>${ord.PRDNAME }</td>
								<td class="center">${ord.PRICE }</td>
								<td class="center">${ord.ORDSUM }</td>
								<td class="center">
									<fmt:parseDate value="${ord.ORDDATE }"  var="ENTDATE" pattern="yyyy-MM-dd" />
		                   			<fmt:formatDate value="${ENTDATE }" pattern="yyyy-MM-dd"/>
								</td>
								<c:if test="${ord.STTNO eq 900 }">
									<td class="center">결제 완료</td>
								</c:if>
								<c:if test="${ord.STTNO eq 910 }">
									<td class="center">배송 준비 중</td>
								</c:if>
								<c:if test="${ord.STTNO eq 920 }">
									<td class="center">배송중</td>
								</c:if>
								<c:if test="${ord.STTNO eq 930 }">
									<td class="center">배송 완료</td>
								</c:if>
								<c:if test="${ord.STTNO eq 940 }">
									<td class="center">구매 확정</td>
								</c:if>
								<c:if test="${ord.STTNO eq 950 }">
									<td class="center">환불</td>
								</c:if>
								<c:if test="${ord.STTNO eq 960 }">
									<td class="center">반품</td>
								</c:if>
								<c:if test="${ord.STTNO eq 970 }">
									<td class="center">교환</td>
								</c:if>
								<c:if test="${ord.STTNO eq 980 }">
									<td class="center">취소</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				</table>
				<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
			</div>
			
			<div class="page-header">
				<h3>미답변 문의</h3>
			</div>
			
			<div class="section">
				<div class="search">
					<form action="/seller/main" method="get">
						<input type="hidden" name="sCtg" value="UN">
						<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
						<button>검색</button>
					</form>
				</div>
				<table class="s-table">
				<thead>
					<tr>
						<th>번호</th>
						<th>문의 분류</th>
						<th>문의 제목</th>
						<th>작성자</th>
						<th>답변 여부</th>
						<th>작성일</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${qnaSize eq 0 }">
						<tr>
							<td colspan="6">미답변 문의가 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${qnaSize ne 0 }">
						<c:forEach var="qna" items="${qnaList }">
							<tr>
								<td>${qna.NO }</td>
								<c:if test="${qna.CT_QSTNO eq 100}">
									<td>상품</td>
								</c:if>
								<c:if test="${qna.CT_QSTNO eq 110}">
									<td>결제</td>
								</c:if>
								<c:if test="${qna.CT_QSTNO eq 120}">
									<td>배송</td>
								</c:if>
								<c:if test="${qna.CT_QSTNO eq 130}">
									<td>기타</td>
								</c:if>
								<td><a href="/seller/qna/qnadetail?qstCode=${qna.QST_CODE }">${qna.QST_TITLE }</a></td>
								<td>${qna.QST_NAME }</td>
								<c:if test="${qna.QNA_CODE eq null }">
									<td>미답변</td>
								</c:if>
								<td class="center">
									<fmt:parseDate value="${qna.QST_DATE }"  var="ENTDATE" pattern="yyyy-MM-dd" />
		                   			<fmt:formatDate value="${ENTDATE }" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				</table>
				<c:import url="/WEB-INF/views/layout/underpaging.jsp"/>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
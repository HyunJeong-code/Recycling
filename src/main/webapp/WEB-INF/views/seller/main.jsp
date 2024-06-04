<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새활용 판매자 페이지</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>
			
		<div class="">
			<div class="page">
				<h3>간단 통계</h3>
			</div>
			
			<div class="section">
				<table>
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
			
			<div class="page">
				<h3>진행 중인 주문 목록</h3>
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
				<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
			</div>
			
			<div class="page">
				<h3>미답변 문의</h3>
			</div>
			
			<div class="section">
				<form action="./main" method="get">
					<input type="hidden" name="sCtg" value="UN">
					<input type="text" id="undersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
					<button>검색</button>
				</form>
				
				<tr>
					<th>번호</th>
					<th>문의 분류</th>
					<th>문의 제목</th>
					<th>작성자</th>
					<th>답변 여부</th>
					<th>작성일</th>
				</tr>
				
				<c:if test="${QnaSize eq 0 }">
					<tr>
						<td colspan="6">미답변 문의가 없습니다.</td>
					</tr>
				</c:if>
				
				<c:if test="${QnaSize ne 0 }">
					<c:forEach var="qna" items="QnaList">
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
							<td>${qna.QST_NAME }</td>
							<td><a href="/seller/qna/qnadetail?qstCode=${qna.QST_CODE }">${qna.QST_TITLE }</a></td>
							<c:if test="${qna.QNA_CODE eq null }">
								<td>미답변</td>
							</c:if>
							<td>${qna.QST_DATE }</td>
						</tr>
					</c:forEach>
				</c:if>
			
				<c:import url="/WEB-INF/views/layout/underpaging.jsp"/>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
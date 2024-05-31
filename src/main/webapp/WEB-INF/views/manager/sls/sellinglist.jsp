<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let pdtList = {0:"플라스틱", 1:"유리", 2:"종이", 3:"캔", 4:"천", 5:"기타"}

let sttList = {900: "결제 완료", 910: "배송 준비 중", 920: "배송 중", 930: "배송 완료" 
	, 940: "구매 확정", 950: "거래 완료", 960: "반품", 970: "교환", 980: "취소"}
	
</script>
</head>
<body>
	<div class = "full" >
		<aside>
			확인
		</aside>
		<div class="wrap">		
			<div class="page">
				전체 상품 판매관리
			</div>
				<table>
					<tr>
						<th>판매자 분류</th>
						<th>판매자 번호</th>
						<th>이름/상호명</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>전체 주문수</th>
						<th>판매 상품수</th>
					</tr>
					
					<!-- 개인 -->
					<tr>
<%-- 						<th>${selList.bCtCode }</th> --%>
<%-- 						<th>${selList.sCode }</th> --%>
<%-- 						<th>${selList.bName }</th> --%>
<%-- 						<th>${selList.bPhone }</th> --%>
<%-- 						<th>${selList.bEmail }</th> --%>
<%-- 						<th>${selList. }</th> --%>
<%-- 						<th>${selList. }</th> --%>
					</tr>
					
					
				</table>
				
					<div class="page">
						상품관리
					</div>
					<div class = "section">
						<table>
							<thead>
								<tr>
									<th></th>
									<th>상품번호</th>
									<th>제품분류</th>
									<th>상품상세분류</th>
									<th>제품이름</th>
									<th>제품가격</th>
									<th>거래일</th>
									<th>상태</th>
									<th>상세조회</th>
								</tr>
							</thead>
				
							<tbody>
									<c:forEach var="prdList" items="${prdList }">
										<c:if test="${prdList.sttName ne 'pay'}">
											<tr>
												<td><input type="checkbox" id="${prdList.prdCode }"name="chkBox"></td>
												<td>${prdList.prdCode }</td>
												<td>
													<c:choose>
														<c:when test="${prdList.ctPno == 0 }">
															재활용품
														</c:when>
														<c:when test="${prdList.ctPno == 1 }">
															업사이클링
														</c:when>
													</c:choose>
												</td>
												<td><script>document.write(pdtList[${prdList.ctPdtNo}])</script></td>
												<td>${prdList.prdName }</td>
												<td>${prdList.price }</td>
												
												<td>
													<fmt:parseDate value="${prdList.ordDate}" var="ordDate" pattern="yy-MM-dd" />
													<fmt:formatDate value="${ordDate}" pattern="yy-MM-dd"/>
												</td>
												<td><script>document.write(sttList[${prdList.sttNo}])</script></td>
		
												<td>
														<a href="/manager/sls/prddetail?prdCode=${prdList.prdCode }">
															<button class="btn">상세조회</button>
														</a>
												</td>
												
											</tr>
										</c:if>
									</c:forEach>
							</tbody>
						</table>
					</div><!-- section -->
					
					
							<div class="btn_bot_wrap">
									<button id="listDel" class="btn_bot_del">삭제하기</button>
							</div>
							
					<div class="page">
						판매관리
					</div>
					<div class = "section">
						<table>
							<thead>
								<tr>
									<th></th>
									<th>상품번호</th>
									<th>제품분류</th>
									<th>상품상세분류</th>
									<th>제품이름</th>
									<th>제품가격</th>
									<th>거래일</th>
									<th>상태</th>
									<th>상세조회</th>
								</tr>
							</thead>
				
							<tbody>
									<c:forEach var="prdList" items="${prdList }">
										<c:if test="${prdList.sttName ne 'pay'}">
											<tr>
												<td><input type="checkbox" id="${prdList.prdCode }"name="chkBox"></td>
												<td>${prdList.prdCode }</td>
												<td>
													<c:choose>
														<c:when test="${prdList.ctPno == 0 }">
															재활용품
														</c:when>
														<c:when test="${prdList.ctPno == 1 }">
															업사이클링
														</c:when>
													</c:choose>
												</td>
												<td><script>document.write(pdtList[${prdList.ctPdtNo}])</script></td>
												<td>${prdList.prdName }</td>
												<td>${prdList.price }</td>
												
												<td>
													<fmt:parseDate value="${prdList.ordDate}" var="ordDate" pattern="yy-MM-dd" />
													<fmt:formatDate value="${ordDate}" pattern="yy-MM-dd"/>
												</td>
												<td><script>document.write(sttList[${prdList.sttNo}])</script></td>
		
												<td>
													<a href="/manager/sls/prddetail?prdCode=${prdList.prdCode }">
														<button class="btn">상세조회</button>
													</a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
							</tbody>
						</table>
					</div><!-- section -->
		</div><!-- wrap -->
	</div><!-- full -->
</html>
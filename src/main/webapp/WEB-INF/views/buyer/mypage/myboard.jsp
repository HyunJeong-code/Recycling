<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시물</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$("#allQna").click(function() {
		var chk = $("#allQna").val();
		console.log(chk);
		
		if($("#allQna").prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);			
		}
	})
	
	function popUp() {
		var openPop = window.open('/buyer/mypage/rvwform', '후기 등록', 'width=700px,height=800px,scrollbars=yes');
		
		
	})
	
})
</script>
<style type="text/css">
.search {
	align-items: center;
	justify-content: flex-end;
}

.btn-list {
	display: flex;
	justify-content: space-between;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		<div class="main-section">
			
			<div class="page-header">
				<h3>내가 쓴 게시글 조회</h3>
			</div>
			
			<div class="page">
				<h4>문의글 조회</h4>
			</div>
			
			<div class="section">
	<!-- 			<div class="dropctg"> -->
	<!-- 				<select id="ctgdrop" name="ctg"> -->
	<!-- 					<option value="" selected="selected">전체</option> -->
	<!-- 					<option value="OTO">일대일 문의</option> -->
	<!-- 					<option value="QST">판매자 문의</option> -->
	<!-- 				</select> -->
	<!-- 			</div> -->
	
				<div class="search">
					<form action="./myboard" method="get">
						<input type="hidden" name="sCtg" value="UP">
						<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요.">
						<button>검색</button>
					</form>
				</div>
	
				<table class="b-table">
				
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="35%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th class="no">번호</th>
						<th class="ctg">문의글 분류</th>
						<th class="stt">문의 분류</th>
						<th class="title">제목</th>
						<th class="ans">답변 여부</th>
						<th class="entdate">작성일</th>
						<th class="hit">조회수</th>
					</tr>
				</thead>
					
				<tbody>
					<c:if test="${qnaSize ne 0 }">
						<c:forEach var="qna" items="${qna }">
							<tr>
								<td class="no">${qna.NO }</td>
								<td class="ctg">
								<c:if test="${qna.CTG eq 'OTO' }">
									일대일 문의
								</c:if>
								<c:if test="${qna.CTG eq 'QST' }">
									판매자 문의
								</c:if>
								</td>
								<td class="stt">
									<c:if test="${qna.CTNO eq 100}">
										상품
									</c:if>
									<c:if test="${qna.CTNO eq 110}">
										결제
									</c:if>
									<c:if test="${qna.CTNO eq 120}">
										배송
									</c:if>
									<c:if test="${qna.CTNO eq 130}">
										기타
									</c:if>
									
									<c:if test="${qna.CTNO eq 200}">
										재활용품
									</c:if>
									<c:if test="${qna.CTNO eq 210}">
										새활용
									</c:if>
									<c:if test="${qna.CTNO eq 220}">
										체험단
									</c:if>
									<c:if test="${qna.CTNO eq 230}">
										세척
									</c:if>
									<c:if test="${qna.CTNO eq 240}">
										기타
									</c:if>
								</td>
	
								<td class="title">
									<c:if test="${qna.CTG eq 'OTO' }">
										<a href="/buyer/mypage/otodetail?otoCode=${qna.CODE }">${qna.TITLE }</a>
									</c:if>
									<c:if test="${qna.CTG eq 'QST' }">
										<a href="/buyer/mypage/qnadetail?qstCode=${qna.CODE }">${qna.TITLE }</a>
									</c:if>
								</td>
								
								<td class="ans">
									<c:if test="${qna.ANS eq '-' }">
										미답변
									</c:if>
									
									<c:if test="${qna.ANS ne '-' }">
										답변 완료
									</c:if>
								</td>
	
								<td class="entdate">
									<fmt:parseDate value="${qna.ENTDATE }"  var="ENTDATE" pattern="yyyy-MM-dd" />
		                   			<fmt:formatDate value="${ENTDATE }" pattern="yyyy-MM-dd"/>
								</td>
								<td class="hit">${qna.HIT }</td>
							</tr>
						</c:forEach>
					</c:if>
					
					<c:if test="${qnaSize eq 0 }">
						<tr>
							<td colspan="6" class="none">작성한 문의글이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
				</table>
				<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
				
<!-- 				<div class="btn-list"> -->
<%-- 				<c:if test="${qnaSize ne 0 }"> --%>
<!-- 					<button type="button" id="delQst" class="btn btnLeft">삭제하기</button> -->
<%-- 				</c:if> --%>
<!-- 				<a href="/buyer/mypage/form"><button type="button" class="btn btnRight">작성하기</button></a> -->
<!-- 				</div> -->
	
			</div>
			
			<div class="page-header">
				<h4>후기 조회</h4>
			</div>
			
			<div class="section">
				<div class="search">
					<form action="./myboard" method="get">
						<input type="hidden" name="sCtg" value="UN">
						<input type="text" id="undersearch" name="search" placeholder="검색어를 입력해주세요.">
						<button class="btn btnRight">검색</button>
					</form>
				</div>
				<table class="b-table">
				
				<colgroup>
					<col width="15%">
					<col width="15%">
					<col width="60%">
					<col width="10%">
				</colgroup>
				
				<thead>
					<tr>
						<th class="stt">후기 분류</th>
						<th class="grade">평점</th>
						<th class="review">후기</th>
						<th class="entdate">작성일</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${rvwSize ne 0 }">
						<c:forEach var="rvw" items="${rvw }">
							<tr>
								<td class="ctg">${rvw.CTG }</td>
								
								<td class="grade star">
									<c:forEach begin="1" end="${rvw.GRADE }">
										★
									</c:forEach>
								</td>
								<td class="review">
								<c:if test="${rvw.CTG eq '새활용' }">
										${rvw.CONTENT }
									</a>
								</c:if>
								<c:if test="${rvw.CTG eq '체험단' }">
										${rvw.CONTENT }
									</a>
								</c:if>
								</td>
								<td class="entdate">
									<fmt:parseDate value="${rvw.ENTDATE }"  var="ENTDATE" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${ENTDATE }" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
					</c:if>				
						
					<c:if test="${rvwSize eq 0 }">
						<tr>
							<td colspan="5" class="none">작성한 후기가 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
				</table>
				<c:import url="/WEB-INF/views/layout/underpaging.jsp"/>
<!-- 				<div class="btn-list"> -->
<%-- 				<c:if test="${rvwSize ne 0 }"> --%>
<!-- 					<button type="button" id="delrvw" class="btn btnLeft">삭제하기</button> -->
<%-- 				</c:if> --%>
<!-- 				<a href="/buyer/mypage/rvwform"><button type="button" class="btn btnRight" id="btnRvw">작성하기</button></a> -->
<!-- 				</div> -->
			</div> <!-- section End -->
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험 상세조회</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style type="text/css">
/* 중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.section .top_section_con{
	width: 700px;
	margin: 0 auto;
}

.section img {
	height: 200px;
	width: 200px;
	object-fit: cover;
	margin: 20px;
}

.section .expName
, .section .expPrice
, .section .expDetail {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}
.section .expName div
, .section .expPrice div{
	width: 300px;
	border: 1px solid #ccc;
}

.section .expDetail textarea{
	border: 1px solid #ccc;
	width: 300px;
	height: 300px;
	
}


label {
	color: #373f57;
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 5px;
	width: 180px;
	text-align: justify;
}

input[type="text"], select {
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
}

.section .mgrPhone_box, .section .mgrEmail_box, .section .mgrBirth_box,
	.section .mgrGender_box {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}

/* 버튼 스타일 */
button {
	cursor: pointer;
}

.btn_bot_box{
	margin-top: 20px;
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
				<h1>체험 상세조회</h1>
		
		<div class="section">
			<label>썸네일 이미지</label>
			<div>
				<img alt="썸네일 이미지" src="/resources/image/${main.originName}" class="imgSum">
				
			</div>
			
			<div class="top_section_con">
				<div class="expName">
					<label>제목</label>
					<div>${exp.expName}</div>
				</div>
				
				<div class="expPrice">
					<label>참가비용</label>
					<div>${exp.expPrice}원</div>
				</div>
				
				<div class="expDetail">
					<label>내용</label>
					<textarea readonly onclick="this.blur()" >${exp.expDetail}</textarea>
				</div>
			</div>
		<label>체험상세 이미지</label>
		<div>
			<c:forEach var="file" items="${detail}">
<%--                 <c:choose> --%>
<%--                     <c:when test="${file.originName.endsWith('.jpg') || file.originName.endsWith('.jpeg') || file.originName.endsWith('.png') || file.originName.endsWith('.gif') || file.originName.endsWith('.PNG')}"> --%>
           					<img alt="상세 이미지" src="/resources/image/${file.originName}" >
                        
<%--                     </c:when> --%>
<%--                     <c:otherwise> --%>
<%--                         <a href="/upload/${file.storedName}">${file.originName}</a> --%>
<%--                     </c:otherwise> --%>
<%--                 </c:choose> --%>
            </c:forEach>
		</div>
		
		<div class="section">
			<table class="s-table">
				<thead>
					<tr>
						<th>모집날짜</th>
						<th>시간</th>
						<th>신청한인원</th>
						<th>등록가능인원</th>
						<th>예약관리</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
				<!-- 합계 합산 -->
	
					<c:forEach var="expSchList" items="${expSchList}">
						<tr>
							<td>
							
								<fmt:parseDate value="${expSchList.schDate}" var="schDate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${schDate}" pattern="yyyy-MM-dd" />
							</td>
							<td>${expSchList.schTime}</td>
					
							<!-- 예약인원 합계계산 -->
							<c:set var="totalResCnt" value="0" />
							<c:forEach var="resCnt" items="${resCnt}">
								<c:if test="${expSchList.schNo == resCnt.schNo}">
									<c:set var="totalResCnt" value="${totalResCnt + resCnt.resCnt}" />
								</c:if>
							</c:forEach>
							<td class ="totalResCnt">${totalResCnt }</td>
					
							<td>${expSchList.schCnt}</td>
							<td>
								<c:choose>
			                		<c:when test="${expSchList.schCnt == totalResCnt }">
			                			모집마감
			                		</c:when>
			                		<c:when test="${expSchList.schCnt > totalResCnt }">
			                			모집중
			                		</c:when>
			                		<c:when test="${expSchList.schCnt < totalResCnt }">
			                			에러
			                		</c:when>
		                		</c:choose>
							</td>
							<td><a href="./expresdetail?expCode=${expSchList.expCode}&schNo=${expSchList.schNo }"><button class="btn">예약관리</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:import url="/WEB-INF/views/layout/upperdetailpaging.jsp"/>
		</div>
		</div>
			
			<div class="btn_bot_box">
				<a href="./explist"><button class="btn" type="button">목록으로</button></a>
			</div>
		</div>
	</div>	
	</div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
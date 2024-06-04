<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험 상세조회</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style type="text/css">
<<<<<<< Updated upstream
/* 전체 기본 설정 */
* {
	margin: 0;
	padding: 0;
	border: 0;
	vertical-align: baseline;
	box-sizing: border-box;
	font: inherit;
	font-size: 100%;
	line-height: 1.5;
	color: #333;
	text-align: center;
}
=======
body {
             font-family: Arial, sans-serif; 
             width: 700px;
             margin:200px;
        }
        h1 {
            color: #333;
        }
        .detail-container {
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .detail-container label {
            font-weight: bold;
        }
        .detail-container input[type="text"]{
        	width: 50%;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        
        .detail-container textarea {
            width: 80%;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        .detail-container textarea {
            resize: none;
            height: 200px;
        }
        
        .detail-container select {
            width: 30%;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        
        .detail-container img {
            max-width: 100%;
            margin-top: 10px;
        }
>>>>>>> Stashed changes

/* 외부 레이아웃 설정 */
.full {
	width: 1200px;
	border: 1px solid #ccc;
	margin: 0 auto;
	background-color: #f9f9f9;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
}

aside {
	background-color: #f1f1f1;
	border-right: 1px solid #ddd;
	box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.05);
}

.wrap {
	flex: 1;
	display: flex;
	flex-direction: column;
	padding: 20px;
}

/* 상단 페이지 */
.page {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	color: #007BFF;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

/* 중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.section .top_section_con{
	width: 700px;
	margin: 0 auto;
}

.section img {
	height: 200px;
	width: 200px;
	border-radius: 50%;
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

.section h3 {
	color: #333;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 5px;
	margin-bottom: 20px;
}

.section_top_privacy {
	padding: 20px;
	margin-left: 20px;
	margin-top: 20px;
	flex: 1;
}

.section_top_privacy div {
	margin-bottom: 10px;
}

/* --------------------------------------- */
/* 색션 하단 */
.section_bot_title {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

.section_bot_itembox {
	width: 500px;
	margin: 0 auto;
}

.section .mgrPhone_box, .section .mgrEmail_box, .section .mgrBirth_box,
	.section .mgrGender_box {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}

/* 하단 페이지 버튼 스타일 */
.btn_bot_wrap {
	display: flex;
	width: 500px;
	padding-top: 20px;
	margin: 0 auto;
	justify-content: space-around;
}

/* 버튼 스타일 */
button {
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	font-size: 16px;
	margin-left: 10px;
}

button:hover {
	background-color: #0056b3;
}

table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 100%;
	text-align: center;
}

table td {
	padding: 9px;
}

table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table th:first-child, .table td:first-child {
	border-left: 0;
}

table th:last-child, .table td:last-child {
	border-right: 0;
}

table tr td:first-child {
	text-align: center;
}table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 100%;
	text-align: center;
}

table td {
	padding: 9px;
}

table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table th:first-child, .table td:first-child {
	border-left: 0;
}

table th:last-child, .table td:last-child {
	border-right: 0;
}

table tr td:first-child {
	text-align: center;
}

table caption {
	caption-side: bottom;
	display: none;
}

table tr:hover {
  background-color: #f5f5f5;
}table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 100%;
	text-align: center;
}

table td {
	padding: 9px;
}

table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table th:first-child, .table td:first-child {
	border-left: 0;
}

table th:last-child, .table td:last-child {
	border-right: 0;
}

table tr td:first-child {
	text-align: center;
}

table caption {
	caption-side: bottom;
	display: none;
}

table tr:hover {
  background-color: #f5f5f5;
}

table caption {
	caption-side: bottom;
	display: none;
}

table tr:hover {
  background-color: #f5f5f5;
}

.btn_bot_box{
	margin-top: 20px;
}
</style>
</head>
<body>
<<<<<<< Updated upstream
	<div class="full">
		<aside>
			<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
		</aside>
		<div class="wrap">
			<div class="page">
				<h1>체험 상세조회</h1>
				<hr>
			</div>
		
		<div class="section">
			<label>프로필 이미지</label>
			<div>
				<img src="/upload/${main.storedName}" alt="${main.originName}">
			</div>
			
			<div class="top_section_con">
				<div class="expName">
					<label>체험제목</label>
					<div>${exp.expName}</div>
				</div>
				
				<div class="expPrice">
					<label>참가비용</label>
					<div>${exp.expPrice}</div>
				</div>
				
				<div class="expDetail">
					<label>체험설명</label>
					<textarea readonly onclick="this.blur()" >${exp.expDetail}</textarea>
				</div>
			</div>
		<label>체험상세 이미지</label>
		<div>
			<c:forEach var="file" items="${detail}">
                <c:choose>
                    <c:when test="${file.originName.endsWith('.jpg') || file.originName.endsWith('.jpeg') || file.originName.endsWith('.png') || file.originName.endsWith('.gif') || file.originName.endsWith('.PNG')}">
                        <img src="/upload/${file.storedName}" alt="${file.originName}" style="max-width: 100%;">
                    </c:when>
                    <c:otherwise>
                        <a href="/upload/${file.storedName}">${file.originName}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
		</div>
		
		<div class="section">
			<table>
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
			<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
		</div>
			
			<div class="btn_bot_box">
				<a href="./explist"><button class="btn" type="button">목록으로</button></a>
			</div>
			<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
		</div>
	</div>	
=======
<h1>체험 상세조회</h1>
<hr>

<div class="detail-container">
<label>체험제목</label>
<input type="text" value="${exp.expName}" readonly onclick="this.blur()" >
</div>

<div class="detail-container">
<label>참가비용</label>
<input type="text" value="${exp.expPrice}" readonly onclick="this.blur()"> 원
</div>

<div class="detail-container">
<label>모집 인원</label>
<select readonly onclick="this.blur()">
    <option value="${schCnt}">${schCnt}명</option>
</select>
</div>

<div class="detail-container">
<label>체험설명</label>
<textarea readonly onclick="this.blur()" >${exp.expDetail}</textarea>
</div>



<div>
	<button type="button"><a href="./explist">목록</a></button>
</div>

>>>>>>> Stashed changes
</body>
</html>
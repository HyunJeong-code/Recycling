<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>내 체험단 판매상품 조회</title>

<style type="text/css">
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
}

h3 {
	color: #333;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 5px;
	margin-bottom: 20px;
}

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
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

/* [우]중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* [우]하단 페이지 */
.btn_bot_style {
	display: flex;
	float: right;
	margin: 0 0 20px 0;
}

/* ------------------------------------- */
/* 상단 */
/* 검색 */
.search_form_wrap {
	padding-top: 20px;
	margin: 0 0 20px 0;
	display: flex;
	border-top: 3px solid #d8d8d8;
	flex-direction: row-reverse;
}
/* 검색창 */
.search_form {
	display: flex;
	align-items: center;
	margin-top: 20px;
	border-radius: 5px;
}

.search_form button[type="submit"] {
	padding: 6px 15px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px; /* 버튼 둥글게 */
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.search_form button[type="submit"]:hover {
	background-color: #0056b3;
}

/* 버튼 */
button[type="submit"] {
	padding: 6px 12px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}

/* 본문 */
/* 테이블 세팅 */
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
}

table caption {
	caption-side: bottom;
	display: none;
}

table tr:hover {
  background-color: #f5f5f5;
}

/* 버튼세팅 */
.btn_section_detail {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	cursor: pointer;
}

/* 하단 */
.btn_bot_wrap {
	padding-top: 10 px;
	display: flex;
	float: right;
	margin: 20px 0;
	justify-content: flex-end
}

/* 버튼 세팅 */
.btn_bot_inform, .btn_bot_del {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	cursor: pointer;
}

.btn_bot_inform {
	background-color: #4CAF50;
	color: white;
}

.btn_bot_inform:hover {
	background-color: #45a049;
}

.btn_bot_del {
	background-color: #f44336;
	color: white;
	margin-left: 10px;
}

.btn_bot_del:hover {
	background-color: #da190b;
}

button[type="submit"]:hover,
.btn_section_detail:hover,
.btn_bot_inform:hover,
.btn_bot_del:hover {
  background-color: #0056b3;
}

table .expName_fix{
	width: 330px;
}

table .expName_fix_con{
	text-align: left;	
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
				<h1>체험단 조회</h1>
				<hr>
			</div>

			<div class="search">
            <form action="./explist" method="get">
                <input type="hidden" name="sCtg" value="UP">
                <input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
                <button>검색</button>
            </form>
        </div>

			<div class="section">
			
			<table>
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
		<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
			</div>
	</div>
</div>
<<<<<<< HEAD
=======
=======
>>>>>>> TEST
<div class="page_box">
<h1>체험단 조회</h1>
<hr>
</div>

<div class="container">
<div class="searching">
	<form action="./explist" method="get">
		<div class="detailSearch">
			<select id="detailSearch" name="detailSearch">
			    <option value="expName">제목</option>
			    <option value="expCode">상품 번호</option>
			</select>
			<div class="search">
	            <input type="text" name="search" placeholder="검색어를 입력해 주세요" value="${search}">
	            <button onclick="this.form.submit()" class="btn btn-primary">검색</button>
	        </div>
		</div>
	</form>
</div>


<table border="1" class="table table-hover table-sm" style="width:1000px;">

	<colgroup>
		<col style="width: 5%;">
		<col style="width: 10%;">
		<col style="width: 25%;">
		<col style="width: 10%;">
		<col style="width: 8%;">
		<col style="width: 15%;">
		<col style="width: 14%;">
		<col style="width: 14%;">
	</colgroup>
    <thead style="background-color: gray;">
        <tr>
            <th></th>
            <th>상품 번호</th>
            <th>체험 제목</th>
            <th>참가 비용</th>
            <th>조회수</th>
            <th>등록일</th>
            <th>예약 관리</th>
            <th>상세 조회</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${list}" var="exp">
            <tr>
                <td>
                	<input type="checkbox" id="${exp.expCode}" name="expCheckbox" value="${exp.expCode}">
                </td>
                <td class="code">${exp.expCode}</td>
                <td class="name">${exp.expName}</td>
                <td class="price">${exp.expPrice}</td>
                <td class="hit">${exp.expHit}</td>
                <td>
                	<fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
               		<fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td class="resdetail"><a href="./expresdetail?expCode=${exp.expCode }"><button>예약하기</button></a></td>
                <td class="expdetail"><a href="./expdetail?expCode=${exp.expCode }"><button>상세 보기</button></a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
<c:import url="/WEB-INF/views/layout/paging.jsp"/>
<<<<<<< HEAD
>>>>>>> Stashed changes
=======
>>>>>>> TEST
</body>
</html>
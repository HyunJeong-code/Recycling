<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
	color: #333;
}

.full {
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

.wrap {
	border: 1px solid #ddd;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.page {
	text-align: center;
	margin-bottom: 20px;
}

h1 {
	margin: 0;
	padding-bottom: 10px;
	font-size: 2em;
}

hr {
	border: none;
	height: 1px;
	background-color: #ddd;
	margin-bottom: 20px;
}

.section {
	border-top: 1px solid #ddd;
	padding-top: 20px;
}

.noticeTable {
	width: 100%;
	border-collapse: collapse;
}

.noticeTable th, .noticeTable td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

.noticeTable th {
	background-color: #f2f2f2;
	font-weight: bold;
}

#noticeContent {
	margin-top: 20px;
	padding: 10px;
	background-color: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 4px;
}
</style>
</head>
<body>
	<div class="full">
		<div class="wrap">
			<div class="page">
				<h1>공지사항</h1>
				<hr>
			</div>
			<div class="section">
				<table class="noticeTable">
					<thead>
						<tr>
							<th>제목</th>
							<td>${view.ntcTitle}</td>
							<th>작성자</th>
							<td>관리자</td>

						</tr>
					</thead>
					<tbody>
						<tr>
							<th>등록일</th>
							<td>${view.ntcDate}</td>
							<th>조회수</th>
							<td>${view.ntcHit}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div></div>
			<div id="noticeContent">${view.ntcContent}</div>
		</div>
	</div>
</body>


</html>
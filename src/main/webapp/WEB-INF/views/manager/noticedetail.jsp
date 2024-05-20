<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 전체 페이지를 꽉 채우는 스타일 */
.full {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* 컨텐츠를 감싸는 영역의 스타일 */
.wrap {
    width: 80%;
    max-width: 800px; /* 최대 너비 설정 */
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background-color: #f9f9f9;
}

/* 페이지 제목 스타일 */
.page h1 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
}

/* 섹션 영역의 스타일 */
.section {
    margin-top: 20px;
}

</style>
</head>
<body>
	<div class="full">
		<div class="wrap">
			<div class="page">
				<h1>공지사항 자세히 보기</h1>
				<hr>
			</div>
			<div class="section">

				<table>
				<tr>
					<td>제목 :  ${view.ntcTitle }</td>
					<td>작성자 : 관리자</td>
				</tr>
				<tr>
					<td>등록일 :  ${view.ntcDate }</td>
					<td>조회수 :  ${view.ntcHit }</td>
				</tr>
			</table>
				<br>
				<br>


				<div>${view.ntcContent }</div>

			</div>
		</div>
	</div>

</body>


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
    color: #333;
}

.full {
    display: flex;
    justify-content: center;
    padding: 20px;
}

.wrap {
    width: 80%;
    max-width: 1200px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    border-radius: 8px;
}

.page {
    text-align: center;
    margin-bottom: 20px;
}

h1 {
    font-size: 2em;
    margin-bottom: 10px;
}

hr {
    border: none;
    height: 1px;
    background-color: #ddd;
    margin-bottom: 20px;
}

/* Notice Search Form */
#noticeSearch {
    margin-bottom: 20px;
    text-align: center;
}

#noticeSearch form {
    display: inline-block;
}

#category {
    padding: 5px;
    margin-right: 10px;
}

#search {
    padding: 5px;
    width: 200px;
}

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

/* Notice Table */
.section {
    margin-top: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background-color: #007BFF;
    color: #fff;
}

th, td {
    padding: 10px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    font-weight: bold;
}

td a {
    color: #007BFF;
    text-decoration: none;
}

td a:hover {
    text-decoration: underline;
}

/* Paging Styles */
.paging {
    text-align: center;
    margin-top: 20px;
}

.paging a {
    display: inline-block;
    padding: 6px 12px;
    margin: 0 5px;
    border: 1px solid #ddd;
    border-radius: 4px;
    color: #007BFF;
    text-decoration: none;
}

.paging a:hover {
    background-color: #f1f1f1;
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
     
    <div id="noticeSearch">
	<form action="./noticelist" method="get">
		<select id="noticeList_category" name="category">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		
		<input type="text" id="search" name="search"  placeholder="검색어를 입력하세요">
        <button type="submit">검색하기</button>
	</form>
    </div>
	
            <div class="section">
            <table border = "1">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="${notice }">
						<tr>
							<td>${notice.ntcCode }</td>
							<td>
							<a href="./noticedetail?ntcCode=${notice.ntcCode }">${notice.ntcTitle }</a>
							</td>
							<td>${notice.ntcHit }</td>
							<td>
								<fmt:parseDate value="${notice.ntcDate }" var="ntcDate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${ntcDate }" pattern="yyyy-MM-dd" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
                
            </div>

        </div><!-- wrap -->
    </div><!-- full -->
</body>

<c:choose>
	<c:when test="${paging.search != null}">
		<c:import url="/WEB-INF/views/layout/manager/noticePagingSearch.jsp" />
	</c:when>
	<c:otherwise>
		<c:import url="/WEB-INF/views/layout/manager/noticePaging.jsp" />
	</c:otherwise>
</c:choose>

</html>
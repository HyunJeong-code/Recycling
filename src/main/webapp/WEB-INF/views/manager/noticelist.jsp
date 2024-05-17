<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<select id="category" name="category" class="type-box">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		
		<input type="text" id="search" name="search"  placeholder="검색어를 입력하세요">
        <button type="submit">검색하기</button>
	</form>
    </div>
	
            <div class="section">
            <table>
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
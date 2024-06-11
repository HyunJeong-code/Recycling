<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<title>공지사항</title>
<link rel="stylesheet" href="/resources/css/list.css">
<style type="text/css">
.t-title {
	width: 500px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
<div class="wrap">
<h1>공지사항</h1>
    	<div class="search">
            <form action="./noticelist" method="get">
                <input type="hidden" name="sCtg" value="UP">
                <input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
                <button>
					<span class="sch_send">
						<i class="fa-solid fa-magnifying-glass"></i>
					</span>
				</button>
            </form>
     	</div>
     	
     	
    <table class="n-table">
    
    	<colgroup>
			<col style="width: 70%;">
			<col style="width: 10%;">
			<col style="width: 20%;">
		</colgroup>
	
        <thead>
            <tr>
                <th>제목</th>
                <th>조회수</th>
                <th>등록일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${noticeList}" var="notice">
                <tr>
                    <td class="t-title"><a href="./noticedetail?ntcCode=${notice.ntcCode}">${notice.ntcTitle}</a></td>
                    <td>${notice.ntcHit}</td>
                    <td>${notice.ntcDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<title>1:1 문의 전체 조회</title>
<link rel="stylesheet" href="/resources/css/list.css">
<style type="text/css">
.form-btn {
    text-align: right;
    margin: 10px;
}

.n-table td.title{
	width: 400px;
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
        <div class="page">
            <h1>1:1 문의 전체 조회</h1>
        </div>
    
        <div class="search">
            <form action="./otolist" method="get">
                <input type="hidden" name="sCtg" value="UP">
                <input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search_form">
                <button>
					<span class="sch_send">
						<i class="fa-solid fa-magnifying-glass"></i>
					</span>
				</button>
            </form>
        </div>
        
        
        <div class="form-btn">
            <a href="./otoform"><button class="btnRight">작성하기</button></a>
        </div>
        
        
        <table class="n-table">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 35%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
            </colgroup>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제품 분류</th>
                    <th>제목</th>
                    <th>상태</th>
                    <th>작성자</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty list}">
                        <tr>
                            <td colspan="6">조회된 문의글이 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list}" var="oto">
                            <tr>
                                <td>${oto.NO}</td>
                                <td>
                                    <c:forEach items="${ctlist}" var="otoct">
                                        <c:if test="${otoct.ctOtoNo eq oto.CTOTONO}">
                                            ${otoct.ctOtoName}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td class="title"><a href="./otodetail?otoCode=${oto.OTOCODE}">${oto.OTOTITLE}</a></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${oto.ANSSTATUS == '-'}">
                                            답변 대기
                                        </c:when>
                                        <c:otherwise>
                                            답변 완료
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${oto.OTONAME}</td>
                                <td>
                                    <fmt:parseDate value="${oto.OTODATE}" var="OTODATE" pattern="yyyy-MM-dd HH:mm:ss" />
                                    <fmt:formatDate value="${OTODATE}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
		<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
    </div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>

</body>
</html>
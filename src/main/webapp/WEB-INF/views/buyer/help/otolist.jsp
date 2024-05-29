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

<style type="text/css">
.wrap{
	width:800px;
}

</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="wrap">
<h1>1:1 문의 전체 조회</h1>
<form action="./otolist" method="get">
        <label for="ct_otono">분류 선택:</label>
        <select name="ct_otono" id="ct_otono">
            <option value="0">전체</option>
            <option value="210" >upcycling</option>
            <option value="200" >recycling</option>
            <option value="230" >wash</option>
            <option value="220" >exp</option>
            <option value="240" >etc</option>
        </select>
        <input type="submit" value="검색">
    </form>
    
    <div>
		<button class="btn" type="button" style="text-align: right;"><a href="./otoform">작성하기</a></button>
	</div>
    <table border="1" class="table table-hover table-sm" style="width: 800px; border: 2px solid #444444;">
    
    	<colgroup>
		<col style="width: 10%;">
		<col style="width: 15%;">
		<col style="width: 25%;">
		<col style="width: 10%;">
		<col style="width: 15%;">
		<col style="width: 20%;">
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
			                <td>${oto.otoCode}</td>
			                <td>
			               		<c:forEach items="${ctlist}" var="otoct">
                        			<c:if test="${otoct.ctOtoNo eq oto.ctOtoNo}">
                            			${otoct.ctOtoName}
                        			</c:if>
                    			</c:forEach>
			                </td>
			                <td><a href="./otodetail?otoCode=${oto.otoCode}">${oto.otoTitle}</a></td>
			                <td></td>
			                <td>${oto.otoName}</td>
			                <td>
			                    <fmt:parseDate value="${oto.otoDate}" var="otoDate" pattern="yyyy-MM-dd HH:mm:ss" />
			                    <fmt:formatDate value="${otoDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
			                </td>
			            </tr>
			        </c:forEach>
			    </c:otherwise>
			</c:choose>
        </tbody>
    </table>
    <c:import url="/WEB-INF/views/layout/paging.jsp"/>
    
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험단 메인페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style type="text/css">
.wrap { 
    width: 1000px; margin: auto; 
}

.top-section { 
    margin: 20px 0; 
}

.top-exp {
	text-align: center;
    margin-bottom: 30px;
}

div#topExpList{
	display: flex;
	    gap: 10px;
}
a {
	display: contents;
}

div.title{
	border-bottom: 1px solid #ddd;
}

.body-section {
    display: flex;
}

.category, .search {
    margin: 10px 0; 
}

.body-expList {
    display: flex; 
    flex-wrap: wrap; 
    gap: 20px;
}

.expList {
    border: 1px solid #ddd; 
    padding: 10px; 
    box-sizing: border-box;
}

.expList img {
    max-width: 100%; 
    height: auto; 
    display: block; 
    margin: 0 auto 10px;
}

.expList .title {
    font-weight: bold; 
    margin: 10px 0;
}

.expList .price {
    color: #f00; 
    margin: 10px 0;
}

.expAllList {
    border: 1px solid #ddd; 
    padding: 10px; 
    box-sizing: border-box;
}

.expAllList img {
    max-width: 100%; 
    height: auto; 
    display: block; 
    margin: 0 auto 10px;
}

.expAllList .title {
    font-weight: bold; 
    margin: 10px 0;
}

.expAllList .price {
    color: #f00; 
    margin: 10px 0;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
    function updateTopList(listClass) {
        $('.expList').hide(); // 모든 리스트 숨기기
        $('.' + listClass).show(); // 선택된 리스트만 보이기
    }

    $('#popularButton').on('click', function() {
        updateTopList('topPopList');
    });

    $('#recentButton').on('click', function() {
        updateTopList('topRecList');
    });

    // 페이지 로드 시 기본으로 인기 체험 리스트를 보여줌
    updateTopList('topPopList');
});
</script>

</head>
<body>
<div class="wrap">
    <h1>체험단 메인페이지</h1>
    <div class="top-section">
        <!-- 상단 체험단 인기, 최신 -->
        <div class="top-exp">
            <button id="popularButton">인기 체험</button>
            <button id="recentButton">새 체험</button>
        </div>
        <div id="topExpList">
            <c:forEach var="exp" items="${topPopList}">
            <a href="./expdetail?expCode=${exp.expCode }">
                <div class="expList topPopList">
						<c:if test="${not empty main[exp.expCode]}">
                        	<img src="${pageContext.request.contextPath}/upload/${main[exp.expCode].storedName}" alt="${main[exp.expCode].originName}" style="width: 200px;">
                    	</c:if>
                    <div class="title">${exp.expName}</div>
                    <div class="price">${exp.expPrice}원</div>
                    <div>조회수: ${exp.expHit}</div>
                    <div>등록일: 
                        <fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
                        <fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </div>
                </div>
            </a>
            </c:forEach>
            <c:forEach var="exp" items="${topRecList}">
           	<a href="./expdetail?expCode=${exp.expCode }">
                <div class="expList topRecList" style="display: none;">
               		<c:if test="${not empty main[exp.expCode]}">
                       	<img src="${pageContext.request.contextPath}/upload/${main[exp.expCode].storedName}" alt="${main[exp.expCode].originName}" style="width: 200px;">
                   	</c:if>
                    <div class="title">${exp.expName}</div>
                    <div class="price">${exp.expPrice}원</div>
                    <div>조회수: ${exp.expHit}</div>
                    <div>등록일: 
                        <fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
                        <fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </div>
                </div>
            </a>
            </c:forEach>
        </div>
    </div>
    <hr>

    <div class="body-section">
        <form action="./main" method="get">
        <div class="category">
            <select name="category" id="category" class="form-select" onchange="this.form.submit()">
                <option value="all" ${category == 'all' ? 'selected' : ''}>전체</option>
                <option value="recent" ${category == 'recent' ? 'selected' : ''}>최신순</option>
                <option value="popular" ${category == 'popular' ? 'selected' : ''}>조회순</option>
            </select>
        </div>

        <div class="search">
            <input type="text" name="search" placeholder="검색어를 입력해 주세요" value="${search}">
            <button onclick="this.form.submit()" class="btn btn-primary">검색</button>
        </div>
        </form>
        
        <div class="search">
            <form action="./main" method="get">
                <input type="hidden" name="sCtg" value="UP">
                <input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
                <button>검색</button>
            </form>
        </div>
    </div>
    <div class="body-expList">
        <c:forEach var="exp" items="${list}">
           	<a href="./expdetail?expCode=${exp.expCode }">
	            <div class="expAllList">
	            	<c:if test="${not empty main[exp.expCode]}">
                       	<img src="${pageContext.request.contextPath}/upload/${main[exp.expCode].storedName}" alt="${main[exp.expCode].originName}" style="width: 200px;">
                   	</c:if>
	                <div class="title">${exp.expName}</div>
	                <div class="price">${exp.expPrice}원</div>
	                <div>조회수: ${exp.expHit}</div>
	                <div>등록일:
	                    <fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
	                    <fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                </div>
	            </div>
           	</a>
        </c:forEach>
    </div>
    <c:import url="/WEB-INF/views/layout/paging.jsp"/>
</div>
<<<<<<< HEAD
=======
<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
>>>>>>> TEST
</body>
</html>

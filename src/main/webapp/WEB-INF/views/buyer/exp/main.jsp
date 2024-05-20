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

<script type="text/javascript">
$(document).ready(function() {
    function updateTopList(list) {
        var container = $('#topExpList');
        container.html('');
        $.each(list, function(index, exp) {
            var expHtml = `
                <div class="expList">
                    <div class="title">` + exp.expName + `</div>
                    <div class="price">` + exp.expPrice + `원</div>
                    <div>조회수: ` + exp.expHit + `</div>
                    <div>등록일: ` + exp.expDate + `</div>
                </div>
            `;
            container.append(expHtml);
        });
    }

    $('#popularButton').on('click', function() {
        updateTopList(${topPopList});
    });

    $('#recentButton').on('click', function() {
        updateTopList(${topRecList});
    });
});

</script>
<style type="text/css">
.wrap { 
	width: 1200px; margin: auto; 
}

.top-section { 
	display: flex; 
	justify-content: space-between; 
	align-items: center; 
	margin: 20px 0; 
}

.topPopList {
	display: flex;
	
}

.topRecList {
	display: flex;
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

</style>
<title>체험단 메인페이지</title>
</head>
<body>
<div class="wrap">
    <h1>체험단 메인페이지</h1>
    <div class="top-section">
        <!-- 상단 체험단 인기, 최신 -->
        <div>
        	<button id="popularButton">인기 체험</button>
        </div>
        <div class="topPopList" id="topPopList">
	        <c:forEach var="exp" items="${topPopList}">
	            <div class="expList">
	                <div class="title">${exp.expName}</div>
	                <div class="price">${exp.expPrice}원</div>
	                <div>조회수: ${exp.expHit}</div>
	                <div>등록일: 
		           		<fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
		          		<fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                </div>
	            </div>
	        </c:forEach>
        </div>
        <br><br>
        <div>
        	<button id="recentButton">새 체험</button>
        </div>
        <div class="topRecList" id="topRecList">
	        <c:forEach var="exp" items="${topRecList}">
	            <div class="expList">
	                <div class="title">${exp.expName}</div>
	                <div class="price">${exp.expPrice}원</div>
	                <div>조회수: ${exp.expHit}</div>
	                <div>등록일: 
		           		<fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
		          		<fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                </div>
	            </div>
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
            <button onclick="this.form.submit()">검색</button>
        </div>
        </form>
    </div>
	<div class="body-expList">
        <c:forEach var="exp" items="${list}">
            <div class="expList">
<%--                 <img src="${exp.image}" alt="Product Image"> --%>
                <div class="title">${exp.expName}</div>
                <div class="price">${exp.expPrice}원</div>
                <div>조회수: ${exp.expHit}</div>
                <div>등록일:
                	<fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
                	<fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </div>
            </div>
        </c:forEach>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/paging.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험단 메인페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style type="text/css">


div#topExpList{
	display: flex;
    gap: 50px;
    justify-content: center;
}
a {
	display: contents;
}

div.title{
	border-bottom: 1px solid #ddd;
}

.body-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
}


button {
	cursor: pointer;
}
.body-expList {
    display: flex; 
    flex-wrap: wrap; 
    gap: 10px;
}

.expList {
    border: 1px solid #ddd; 
    padding: 10px; 
    box-sizing: border-box;
}

.expList img {
    width: 200px; 
    height: 200px; 
    display: block; 
    margin: 0 auto 10px;
}

.expList .title {
    font-weight: bold; 
    margin: 10px 0;
    width: 200px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
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

.page {
    text-align: center;
}

.expAllList img {
    width: 200px; 
    height: 200px; 
    display: block; 
    margin: 0 auto 10px;
}

.expAllList .title {
    font-weight: bold; 
    margin: 10px 0;
    width: 200px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.mainBanner {
		max-width: 1200px;
		height: auto; /* 높이 자동으로 설정 */
		border: 1px solid black;
		overflow: hidden;
		padding-top: 20px;
		padding-bottom: 20px; /* 하단 패딩 추가 */
		background-color: #f8f9fa;
	}
	
.expAllList .price {
    color: #f00; 
    margin: 10px 0;
}

.category button.active {
    background-color: #4CAF50; /* 선택된 버튼의 배경색 */
    color: #fff;
}

.category {
	display: flex;
    justify-content: flex-start;
    margin-bottom: 20px;
    margin-left: 15px;
}

.category button {
	padding: 10px 20px;
    background-color: gray;
    color: white;
    border: none;
    cursor: pointer;
    margin-right: 10px;
    border-radius: 5px;
}

.


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
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">

<div class="wrap">
    
    <div class="section mainBanner">
        <!-- 상단 체험단 인기, 최신 -->
        <div class="btnBox">
            <button class="btn" id="popularButton">인기 체험</button>
            <button class="btn" id="recentButton">새 체험</button>
        </div>
        <div id="topExpList">
            <c:forEach var="exp" items="${topPopList}">
            <a href="./expdetail?expCode=${exp.expCode }">
                <div class="expList topPopList">
<%-- 						<c:if test="${not empty main[exp.expCode]}"> --%>
<%--                         	<img src="${pageContext.request.contextPath}/upload/${main[exp.expCode].storedName}" alt="${main[exp.expCode].originName}" style="width: 200px;"> --%>
					<img alt="체험단 이미지" src="/resources/image/${main[exp.expCode].originName}" class="imgSum">
<%--                     	</c:if> --%>
                    <div class="title">${exp.expName}</div>
                    <div class="price">${exp.expPrice}원</div>
                    <div>조회수: ${exp.expHit}</div>
                </div>
            </a>
            </c:forEach>
            <c:forEach var="exp" items="${topRecList}">
           	<a href="./expdetail?expCode=${exp.expCode }">
                <div class="expList topRecList" style="display: none;">
<%--                		<c:if test="${not empty main[exp.expCode]}"> --%>
<%--                        	<img src="${pageContext.request.contextPath}/upload/${main[exp.expCode].storedName}" alt="${main[exp.expCode].originName}" style="width: 200px;"> --%>
					<img alt="체험단 이미지" src="/resources/image/${main[exp.expCode].originName}" class="imgSum">
<%--                    	</c:if> --%>
                    <div class="title">${exp.expName}</div>
                    <div class="price">${exp.expPrice}원</div>
                    <div>조회수: ${exp.expHit}</div>
                </div>
            </a>
            </c:forEach>
        </div>
    </div>
    <hr>
    <br>
    <br>
    <br>
    <hr>
    <br>
    <div class="page">
    	<h3>전체</h3>
    </div>
    <br>

    <div class="body-section">
        <form action="./main" method="get">
        <div class="category">
<!--             <select name="category" id="category" class="form-select" onchange="this.form.submit()"> -->
<%--                 <option value="all" ${category == 'all' ? 'selected' : ''}>전체</option> --%>
<%--                 <option value="recent" ${category == 'recent' ? 'selected' : ''}>최신순</option> --%>
<%--                 <option value="popular" ${category == 'popular' ? 'selected' : ''}>조회순</option> --%>
<!--             </select> -->
			<button type="submit" name="category" value="all" class="category-btn ${category == 'all' ? 'active' : ''}">전체</button>
            <button type="submit" name="category" value="recent" class="category-btn ${category == 'recent' ? 'active' : ''}">최신순</button>
            <button type="submit" name="category" value="popular" class="category-btn ${category == 'popular' ? 'active' : ''}">조회순</button>
        </div>
        </form>
        <div class="search">
            <form action="./main" method="get">
                <input type="hidden" name="sCtg" value="UP">
                <input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
                <button>
					<span class="sch_send">
						<i class="fa-solid fa-magnifying-glass"></i>
					</span>
				</button>
            </form>
        </div>
    </div>
    <div class="body-expList">
        <c:forEach var="exp" items="${list}">
           	<a href="./expdetail?expCode=${exp.expCode }">
	            <div class="expAllList">
<%-- 	            	<c:if test="${not empty main[exp.expCode]}"> --%>
<%--                        	<img src="${pageContext.request.contextPath}/upload/${main[exp.expCode].storedName}" alt="${main[exp.expCode].originName}" style="width: 200px;"> --%>
					<img alt="체험단 이미지" src="/resources/image/${main[exp.expCode].originName}" class="imgSum">
<%--                    	</c:if> --%>
	                <div class="title">${exp.expName}</div>
	                <div class="price">${exp.expPrice}원</div>
	                <div>조회수: ${exp.expHit}</div>
	            </div>
           	</a>
        </c:forEach>
    </div>
</div>
<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
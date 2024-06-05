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

<title>1:1 문의 전체 조회</title>

<style type="text/css">
.wrap{
	width:800px;
}

</style>
</head>
<body>
<<<<<<< HEAD
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
		<button type="button" style="text-align: right;"><a href="./otoform">작성하기</a></button>
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
=======
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
    <div class="wrap">
        <div class="page">
            <h1>1:1 문의 전체 조회</h1>
        </div>
        <form action="./otolist" method="get">
            <label for="ct_otono">분류 선택:</label>
            <select name="ct_otono" id="ct_otono">
                <option value="0">전체</option>
                <c:forEach items="${ctlist}" var="otoct">
                    <option value="${otoct.ctOtoNo}">${otoct.ctOtoName}</option>
                </c:forEach>
            </select>
            <input type="submit" value="검색">
        </form>
<!-- <form action="./otolist" method="get"> -->
<!-- 	        <label for="ct_otono">분류 선택:</label> -->
<!-- 		        <select name="ct_otono" id="ct_otono"> -->
<!-- 		            <option value="0">전체</option> -->
<!-- 		            <option value="210" >upcycling</option> -->
<!-- 		            <option value="200" >recycling</option> -->
<!-- 		            <option value="230" >wash</option> -->
<!-- 		            <option value="220" >exp</option> -->
<!-- 		            <option value="240" >etc</option> -->
<!-- 		        </select> -->
<!-- 	        <input type="submit" value="검색"> -->
<!-- 	    </form> -->
    
        <div class="search">
            <form action="./otolist" method="get">
                <input type="hidden" name="sCtg" value="UP">
                <input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
                <button>검색</button>
            </form>
        </div>
        
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
                                <td>${oto.OTOCODE}</td>
                                <td>
                                    <c:forEach items="${ctlist}" var="otoct">
                                        <c:if test="${otoct.ctOtoNo eq oto.CTOTONO}">
                                            ${otoct.ctOtoName}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td><a href="./otodetail?otoCode=${oto.OTOCODE}">${oto.OTOTITLE}</a></td>
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
    </div>
</div>
<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>

>>>>>>> TEST
</body>
</html>
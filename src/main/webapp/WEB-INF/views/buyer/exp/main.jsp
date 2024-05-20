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


<title>체험단 메인페이지</title>
</head>
<body>

<h2>전체</h2>
<c:forEach var="exp" items="${list }">
<div class="container">
        <!-- 체험단 카드 시작 -->
        <div class="card mb-3">
            <div class="row no-gutters">
                <div class="col-md-4">
                    <img src="https://cdn.imweb.me/thumbnail/20240415/c7ddd12b338cf.jpg" class="card-img" alt="체험단 이미지">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">${exp.expName }</h5>
                        <p class="card-text">가격: ${exp.expPrice }</p>
                        <p class="card-text">${exp.expHit } 회</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 체험단 카드 끝 -->
    </div>
</c:forEach>
<c:import url="/WEB-INF/views/layout/paging.jsp"/>
</body>
</html>
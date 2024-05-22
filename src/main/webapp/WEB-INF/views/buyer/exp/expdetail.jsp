<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험단 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
function scrollToSection(sectionId) {
    var section = document.getElementById(sectionId);
    if(section) {
        section.scrollIntoView({ behavior: 'smooth' });
    }
}
</script>

<style type="text/css">
body { font-family: Arial, sans-serif; }
.container { width: 80%; margin: 0 auto; }
.product-header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #ccc; padding-bottom: 10px; }
.product-image { width: 150px; height: 150px; background-color: #e9e9e9; display: flex; justify-content: center; align-items: center; }
.product-info { flex-grow: 1; margin-left: 20px; }
.tabs { display: flex; margin-top: 20px; }
.tab { margin-right: 20px; cursor: pointer; }
.tab-content { margin-top: 20px; }
.seller-info { display: flex; align-items: center; margin-top: 20px; }
.seller-photo { width: 50px; height: 50px; background-color: #e9e9e9; border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-right: 10px; }
</style>
</head>
<body>
<div class="wrap">
<div class="top_section">
	<div class="exp_header">
		<div class="exp_file_main">
			<c:if test="${not empty main}">
                    <img src="${pageContext.request.contextPath}/upload/${main.storedName}" alt="${main.originName}" style="max-width: 100%;">
            </c:if>
		</div>
		<div class="exp_info">
			<h2>${exp.expName }</h2>
			<p>${exp.expPrice }원</p>
			<a href="./expresform?expCode=${exp.expCode }">
			<button>예약하기</button>
			</a>
		</div>
	</div>
</div>

<div class="tabs">
        <div class="tab" onclick="scrollToSection('detail-info')">상세정보</div>
        <div class="tab" onclick="scrollToSection('seller-info')">판매자 정보</div>
        <div class="tab" onclick="scrollToSection('reviews')">후기평</div>
</div>

<div class="tab-content" id="detail-info">
		<div class="exp_file_detail">
            <c:forEach var="file" items="${detail}">
		        <c:choose>
		            <c:when test="${file.originName.endsWith('.jpg') || file.originName.endsWith('.jpeg') || file.originName.endsWith('.png') || file.originName.endsWith('.gif')}">
		                <img src="${pageContext.request.contextPath}/upload/${file.storedName}" alt="${file.originName}" style="max-width: 100%;">
		            </c:when>
		            <c:otherwise>
		                <a href="${pageContext.request.contextPath}/upload/${file.storedName}">${file.originName}</a>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>
		</div>
            <p>${exp.expDetail }</p>
        </div>
        
        
        <div class="tab-content" id="seller-info">
            <div class="seller-info">
                <div class="seller-photo">
<!--                     <img src="path/to/seller/photo" alt="판매자 사진" /> -->
                </div>
                <div>
                    <p>${seller.accName }</p>
                    <p>${buyer.bPhone }</p>
                    <p>${buyer.bEmail }
                    <p>판매자 유형: ${selType }</p>
                </div>
            </div>
        </div>
        
        
        <div class="tab-content" id="reviews">
            <h2>후기평</h2>
            <p>후기평 내용</p>
        </div>
        
	<div>
		<button type="button"><a href="./main">메인으로</a></button>
	</div>
</div>
</body>
</html>
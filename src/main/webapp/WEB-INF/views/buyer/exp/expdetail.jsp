<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험단 상세페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/list.css">
<style type="text/css">

div.group {
	margin-left: 20px;
}

.detailUpper {
    display: flex;
    width: 100%;
    max-width: 1200px;
    margin-bottom: 20px;
    justify-content: space-between;
}

.mainThumbnail {
    width: 300px;
    height: 300px; /* 고정 높이 */
    background-color: #f0f0f0; /* 배경색 설정 */
    margin-bottom: 20px;
    margin-right: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
}

.mainThumbnail img {
    object-fit: cover;
}

.prdInfo {
    flex: 1;
}

.prdInfo p {
    margin: 10px 0;
}


button {
	cursor: pointer;
}

.prdInfo button {
	display: inline-block;
    padding: 10px 20px;
    margin-right: 10px;
    background-color: #4CAF50;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}


.section {
    width: 100%;
    max-width: 1200px;
    margin-top: 20px;
    padding: 20px;
    border: 1px solid #ddd;
    background-color: #fff;
    border-radius: 5px;
}

.navBar {
    display: flex;
    justify-content: space-between;
    width: 100%;
    max-width: 1200px;
    margin-bottom: 20px;
}

.navBtn {
    flex-grow: 1;
    padding: 10px 20px;
    cursor: pointer;
    color: gray;
    font-weight: normal;
    border: 1px solid #ddd;
    border-bottom: 5px solid gray;
    text-align: center;
    font-size: 16px;
    transition: background-color 0.3s, color 0.3s;
}

.navBtn.active {
    color: black;
    font-weight: bold;
    background-color : #CEE741;
    border-bottom: 5px solid black;
}

.review-item {
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ddd;
}

.review-form {
    display: flex;
    flex-direction: column;
    margin-top: 20px;
    width: 100%;
}

.review-form textarea {
    margin-bottom: 10px;
    padding: 10px;
    font-size: 14px;
    width: 100%;
    max-width: 100%; 
    min-width: 100%;
}

select#rvwGrade {
	width: 70px;
 font-size: 15px;
 height: 30px;
}

.seller-info {
    display: flex;
    align-items: center;
    margin-top: 20px;
    margin-bottom: 20px;
}

.seller-photo {
    width: 75px;
    height: 75px;
    background-color: #e9e9e9;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 10px;
    border-radius: 50%;
    overflow: hidden;
}
.seller-photo img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지를 컨테이너에 맞추고 잘 맞게 표시 */
}

.star-rating .filled {
    color: gold;
}

.star-rating .empty {
    color: lightgray;
}


.btn {
    display: inline-block;
    padding: 10px 20px;
    margin-top: 20px;
    background-color: #4CAF50;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.btn:hover {
    background-color: #0056b3;
}

table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    th {
        background-color: #CEE741;
    }

    
</style>

<script type="text/javascript">
function scrollToSection(sectionId) {
    var section = document.getElementById(sectionId);
    if (section) {
        section.scrollIntoView({ behavior: 'smooth' });
    }
}

function checkLoginAndRedirect(url) {
    var isLoggedIn = '${isLoggedIn}';
    if (isLoggedIn) {
        window.location.href = url;
    } else {
        alert("로그인 후 이용해주세요.");
        window.location.href = "/buyer/login";
    }
}
</script>
</head>
<body>
<header>
    <c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
</header>
<div class="full">
<div class="wrap">
    <div class="group">
        <p>체험단 > 상세페이지</p>
    </div>
    
    <div class="detailUpper">
        <div class="mainThumbnail">
        	<c:choose>
                <c:when test="${not empty main}">
                    <img alt="썸네일 이미지" 
                         src="/resources/image/${main.originName}" 
                         onerror="this.onerror=null; this.src='/resources/image/basicProf.png';">
                </c:when>
                <c:otherwise>
                	<img alt="기본 프로필 이미지" src="/resources/image/basicProf.png">
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="prdInfo">
            <p class="prdName">${exp.expName}</p>
            <hr>
            <p class="prdPrice">${exp.expPrice}원</p>
            <hr>
            <c:choose>
                <c:when test="${isLoggedIn}">
                    <a href="./expresform?expCode=${exp.expCode}"><button class="btnRight" type="button">예약하기</button></a>
                </c:when>
                <c:otherwise>
                    <a href="/buyer/login" ><button class="btnLeft" type="button">로그인 후 예약하기</button></a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="navBar">
        <div id="btn-detail-info" class="navBtn" onclick="scrollToSection('detail-info')">상세정보</div>
        <div id="btn-seller-info" class="navBtn" onclick="scrollToSection('seller-info')">판매자 정보</div>
        <div id="btn-reviews" class="navBtn" onclick="scrollToSection('reviews')">후기평</div>
    </div>
    
    <div id="detail-info" class="section">
        <h3>상세정보</h3>
        <div class="exp_file_detail">
            <c:forEach var="file" items="${detail}">
                <c:choose>
                    <c:when test="${file.originName.endsWith('.jpg') || file.originName.endsWith('.jpeg') || file.originName.endsWith('.png') || file.originName.endsWith('.gif') || file.originName.endsWith('.PNG')}">
<%--                         <img src="${pageContext.request.contextPath}/upload/${file.storedName}" alt="${file.originName}" style="max-width: 100%;"> --%>
                        <img alt="상세 이미지" src="/resources/image/${file.originName}" style="max-width: 100%;">
                    </c:when>
                    <c:otherwise>
                        <a href="/resources/image/${file.storedName}">${file.originName}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p>${exp.expDetail}</p>
    </div>
    
    <div id="seller-info" class="section">
	    <h3>판매자 정보</h3>
	    <div class="seller-info">
	        <div class="seller-photo">
	            <c:choose>
	                <c:when test="${not empty buyerProf}">
	                    <img alt="프로필 이미지" 
	                         src="/resources/image/${buyerProf.originName}" 
	                         onerror="this.onerror=null; this.src='/resources/image/basicProf.png';">
	                </c:when>
	                <c:otherwise>
	                    <img alt="기본 프로필 이미지" 
	                         src="/resources/image/basicProf.png">
	                </c:otherwise>
	            </c:choose>
	        </div>
	        <div>
	            <p>${seller.accName}</p>
	            <p>${buyer.bPhone}</p>
	            <p>${buyer.bEmail}</p>
	            <p>판매자 유형: ${selType}</p>
	        </div>
	    </div>
	</div>

    
    

    <div class="review-form">
        <h4>후기 작성</h4>
        <c:choose>
            <c:when test="${isLoggedIn}">
                <form action="/buyer/exp/expdetail" method="post">
                    <input type="hidden" name="expCode" value="${exp.expCode}">
                    <input type="hidden" name="bCode" value="${loggedInUser.bCode}">
                    <label for="rvwGrade">평점:</label>
                    <select id="rvwGrade" name="rvwGrade" required>
                        <option value="1">1점</option>
                        <option value="2">2점</option>
                        <option value="3">3점</option>
                        <option value="4">4점</option>
                        <option value="5">5점</option>
                    </select>
                    <br>
                    <label for="rvwContent">후기 내용:</label>
                    <textarea id="rvwContent" name="rvwContent" rows="4" required></textarea>
                    <br>
                    <button class="btnRight">작성하기</button>
                </form>
            </c:when>
            <c:otherwise>
                <textarea id="rvwContent" name="rvwContent" rows="4" readonly>로그인 후 작성해주세요</textarea><br>
                <a href="/buyer/login" class="btnLeft">로그인</a>
            </c:otherwise>
        </c:choose>
    </div>
    
    <div id="reviews" class="section">
        <h3>후기</h3>
        <table>
            <colgroup>
            	<col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 40%;">
                <col style="width: 20%;">
            </colgroup>
            <tr>
                <th>작성자</th>
                <th>평점</th>
                <th>후기</th>
                <th>작성일</th>
            </tr>
            <c:if test="${not empty expReviews}">
                <c:forEach var="expReview" items="${expReviews}">
                    <tr>
                        <td>${expReview.BUYERID}</td>
                        <td class="grade star-rating">
                            <c:forEach begin="1" end="5" var="i">
                                <c:choose>
                                    <c:when test="${i <= expReview.RVW_GRADE}">
                                        <span class="filled">★</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="empty">☆</span>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </td>
                        <td>${expReview.RVW_CONTENT}</td>
                        <td>
                            <fmt:parseDate value="${expReview.RVW_DATE}" var="RVW_DATE" pattern="yyyy-MM-dd" />
                            <fmt:formatDate value="${RVW_DATE}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                </c:forEach>
            </c:if>

            <c:if test="${empty expReviews}">
                <tr>
                    <td colspan="4" class="none">작성한 후기가 없습니다.</td>
                </tr>
            </c:if>
        </table>
        <c:import url="/WEB-INF/views/layout/upperdetailpaging.jsp"/>
    </div>
    <br>
    
    <div>
        <a href="./main"><button class="btnLeft">메인으로</button></a>
    </div>
</div>
</div>
<footer>
    <c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</footer>
</body>
</html>

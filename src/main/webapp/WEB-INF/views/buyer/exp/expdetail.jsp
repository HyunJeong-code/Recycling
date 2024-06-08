<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험단 상세페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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

<style type="text/css">
.wrap{
    width: 1000px;
    margin: auto;
}
.exp_file_main {
    width: 350px;
    height: 250px;
    background-color: #e9e9e9;
    display: flex;
    justify-content: center;
    align-items: center;
}
.exp_file_detail {
    width: 100%;
    max-width: 500px;
    height: auto;
}
.tabs {
    display: flex;
    margin-top: 20px;
}
.tab {
    margin-right: 20px;
    cursor: pointer;
}
.tab-content {
    margin-top: 20px;
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
}
.star-rating {
    display: inline-block;
}
.star-rating .filled {
    color: gold;
}
.star-rating .empty {
    color: lightgray;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="wrap">

    <div>
        <div class="exp_info">
            <h2>${exp.expName }</h2>
            <div class="exp_file_main">
	            <c:if test="${not empty main}">
	                <img src="${pageContext.request.contextPath}/upload/${main.storedName}" alt="${main.originName}" style="max-width: 100%;">
	            </c:if>
        	</div>
            <p>${exp.expPrice }원</p>
            <c:choose>
                <c:when test="${isLoggedIn}">
                    <a href="./expresform?expCode=${exp.expCode }">
                        <button class="btn">예약하기</button>
                    </a>
                </c:when>
                <c:otherwise>
                    <button class="btn" onclick="window.location.href='/buyer/login'">로그인 후 예약하기</button>
                </c:otherwise>
            </c:choose>
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
                    <c:when test="${file.originName.endsWith('.jpg') || file.originName.endsWith('.jpeg') || file.originName.endsWith('.png') || file.originName.endsWith('.gif') || file.originName.endsWith('.PNG')}">
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
    
    <hr>

    <div class="tab-content" id="seller-info">
        <div class="seller-info">
            <div class="seller-photo">
                <c:if test="${not empty buyerProf}">
                    <img src="${pageContext.request.contextPath}/upload/${buyerProf.storedName}" alt="${buyerProf.originName}" style="max-width: 100%; max-height: 100%; border-radius: 100%;">
                </c:if>
            </div>
            <div>
                <p>${seller.accName }</p>
                <p>${buyer.bPhone }</p>
                <p>${buyer.bEmail }</p>
                <p>판매자 유형: ${selType }</p>
            </div>
        </div>
    </div>
    
    <hr>

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
                    <textarea id="rvwContent" name="rvwContent" rows="4" cols="100" required></textarea>
                    <br>
                    <button type="submit" class="btn">작성하기</button>
                </form>
            </c:when>
            <c:otherwise>
                <textarea id="rvwContent" name="rvwContent" rows="4" cols="50" required readonly>로그인 후 작성해주세요</textarea><br>
                <button class="btn" onclick="window.location.href='/buyer/login'">로그인</button>
            </c:otherwise>
        </c:choose>
    </div>
    
    <hr>

    <div class="page">
        <h4>후기</h4>
    </div>

    <div class="tab-content" id="reviews">
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

		<div>
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
                    <td colspan="5" class="none">작성한 문의글이 없습니다.</td>
                </tr>
            </c:if>
		</div>
		
        </table>
    </div>
        <c:import url="/WEB-INF/views/layout/upperdetailpaging.jsp"/>

    <div>
        <button class="btn" type="button"><a href="./main">메인으로</a></button>
    </div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
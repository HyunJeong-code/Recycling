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
.exp_file_main { width: 350px; height: 250px; background-color: #e9e9e9; display: flex; justify-content: center; align-items: center; }
.exp_file_detail {
	width: 500px; 
	height: 500px;
}
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
<<<<<<< HEAD
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
        </table>
        <c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
    </div>

    <div>
        <button class="btn" type="button"><a href="./main">메인으로</a></button>
    </div>
=======
>>>>>>> 3d49b70ceb3e69504b6cc1711701076f8fcf76a3
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
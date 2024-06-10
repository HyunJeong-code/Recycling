<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새상품 재활용품 상품페이지</title>
<style type="text/css">
	body {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 0;
		overflow-x: hidden;
		width: 100%;
		min-height: 100vh;
		position: relative;
	}
	
	header, footer {
        width: 100%;
        flex-shrink: 0;
    }
	
	.mainContainer {
		padding: 20px;
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 20px;
		width: 100%;
		max-width: 1200px;
	}
	
	.group {
		width: 200px;
		margin-bottom: 20px;
		margin-right: auto;
	}
	
	.detailUpper {
		display: flex;
		width: 100%;
		max-width: 1200px;
		margin-bottom: 20px;
		justify-content: space-between;
	}
	
	.mainThumbnail {
		width: 500px;
		height: 500px; /* 고정 높이 */
		background-color: #f0f0f0; /* 배경색 설정 */
		margin-bottom: 20px;
		margin-right: 20px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.mainThumbnail img {
		max-width: 100%;
		max-height: 100%;
	}
	
	.prdInfo {
		flex: 1;
	}
	
	.buyBtn, .reportBtn {
		display: inline-block;
		padding: 10px 20px;
		margin-right: 10px;
		background-color: #4CAF50;
		color: #fff;
		text-decoration: none;
		border-radius: 5px;
	}
	
	.buyBtn:hover, .reportBtn:hover {
		background-color: #0056b3;
	}
	
	.section {
		width: 100%;
		max-width: 1200px;
		margin-top: 20px;
		padding: 20px;
		border: 1px solid #ddd;
	}
	
	#detail {
	    display: block;
	    margin-left: auto;
	    margin-right: auto;
	    max-width: 100%;
	    height: auto; /* 이미지 비율을 유지하면서 크기를 조절 */
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
	    text-align: center;
	}
	
	.review-form textarea {
	    margin-bottom: 10px;
	    padding: 0px;
	    font-size: 14px;
	    width: 100%;
	}
	
	.comment-textarea {
	    width: 100%;
	    max-width: 100%; 
	    min-width: 100%;
	    padding: 10px; /* 내부 여백 조정 */
	    font-size: 14px; /* 글자 크기 설정 */
	}
	
	.review-form button {
	    padding: 10px;
	    background-color: #007bff;
	    color: white;
	    border: none;
	    cursor: pointer;
	}
	
	.review-form button:hover {
	    background-color: #0056b3;
	}
    
        /*------------------------ 퍼온 CSS -------------------------- */
    .page {
		border: none;
		border-bottom: 3px solid black;
		vertical-align: middle;
	}

	h3, h4 {
		margin: 0;
		margin-bottom: 10px;
	}
	
	.chk {
		width: 50px;
	}
	
	.ctg {
		width: 150px;
	}
	
	.stt {
		width: 100px;
	}
	
	.title {
		width: 500px;
	}
	
	.ans {
		width: 150px;
	}
	
	.entdate {
		width: 200px;
	}
	
	.hit {
		width: 50px;
	}
	
	.grade {
		width: 150px;
	}
	
	.content {
		width: 400px;
	}
	
	.none {
		width: 900px;
	}
	
	.dropctg {
		display: inline;
	}
	
	th {
		background-color:#CEE741;
	}
	
	td {
		border-bottom: 1px solid black;
		text-align: center;
	}
	
	input[type=text] {
		border: none;
		border-bottom: 1px solid black;
	}
	
	input[type=button] {
		width: 100px;
		border: none;
	}
	
	button {
		width: 100px;
		border: none;
		background-color:#CEE741;
	}
	
	.section4 table {
		width: 980px;
	}
	
	.ans {
		min-width: 200px;
	}
	
	
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5141af38fa883955ccca452855c2266&libraries=services"></script>
<script>
	function scrollToSection(sectionId) {
		document.querySelectorAll('.navBtn').forEach(btn => btn.classList.remove('active'));
		document.getElementById('btn-' + sectionId).classList.add('active');
		document.getElementById(sectionId).scrollIntoView({ behavior: 'auto' });
	}

    window.onload = function () {
        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
        var mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption); 
        
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();
        
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('${seller.sAddr}', function(result, status) {
        
            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
        
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        
                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
        
                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${seller.sAddr}</div>'
                });
                infowindow.open(map, marker);
        
                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        });
    };
    
    function toggleAnswerForm(rcyCode) {
        var answerForm = document.getElementById("answerForm" + rcyCode);
        if (answerForm.style.display === "none") {
            answerForm.style.display = "table-row";
        } else {
            answerForm.style.display = "none";
        }
    }

    function checkSeller(sellerSCode, buyerSCode) {
        if (sellerSCode !== buyerSCode) {
            alert("판매자만 답변을 작성할 수 있습니다.");
            return false;
        }
        return true;
    }
    
    function checkSellerAndBuyer(rcyCode, buyerBCode, sellerSCode, prdSCode) {
        // Ajax 요청을 통해 서버 측의 조건 확인
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.allowAnswer) {
                        toggleAnswerForm(rcyCode);
                    } else {
                        alert("판매자만 답변을 작성할 수 있습니다.");
                    }
                } else {
                    console.error("요청 중 오류 발생");
                }
            }
        };
        xhr.open("GET", "/checkAnswerPermission?rcyCode=" + rcyCode + "&buyerBCode=" + buyerBCode + "&sellerSCode=" + sellerSCode + "&prdSCode=" + prdSCode, true);
        xhr.send();
    }
    
    
</script>
</head>
	<header>
		<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
	</header>
<body>

	<div class="mainContainer">
		<div class="group">
			<p>재활용품>중분류</p>
		</div>
		
		<div class="detailUpper">
			<div class="mainThumbnail">
			    <img src="${pageContext.request.contextPath}/resources/image/${prdImageThumName}"
			         onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/image/error_400px.png';">
			</div>
			
			<div class="prdInfo">
				<p class="prdName">${prd.prdName}</p>
				<hr>
				<p class="prdPrice">${prd.price}원<p>
				<hr>
				<p class="prdSum">${prd.prdDetail}</p>
				<hr>
				<a href="./pay?prdCode=${prd.prdCode}" class="buyBtn">바로구매</a>
				<a href="#" class="reportBtn">신고하기</a>
			</div>
		</div>
		
		<div class="navBar">
			<div id="btn-section1" class="navBtn" onclick="scrollToSection('section1')">상품상세</div>
			<div id="btn-section2" class="navBtn" onclick="scrollToSection('section2')">판매자 정보</div>
			<div id="btn-section3" class="navBtn" onclick="scrollToSection('section3')">거래위치 정보</div>
			<div id="btn-section4" class="navBtn" onclick="scrollToSection('section5')">상품문의</div>
		</div>
		
		<div id="section1" class="section">
		    <h3>상품상세</h3>
		    <c:forEach var="imageName" items="${prdImageDetails}">
			    <img id="detail" src="${pageContext.request.contextPath}/resources/image/${imageName}"
			         onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/image/error_860px.png';">
			</c:forEach>
		</div>
		
		<div id="section2" class="section">
			<h3>판매자 정보</h3>
			<div class="seller-info">
				<div class="seller-section">
					
					<%-- <img src="${seller.storedName}" alt="${seller.originName}" class="seller-photo"> --%>
					<p><b>아이디: </b> ${buyer.bId}</p>
		            <p><b>회원분류: </b>
		                <c:choose>
		                    <c:when test="${buyer.bCtCode eq 'P'}">개인회원</c:when>
		                    <c:when test="${buyer.bCtCode eq 'C'}">기업회원</c:when>
		                    <c:otherwise>알 수 없음</c:otherwise>
		                </c:choose>
		            </p>
					<c:if test="${buyer.bCtCode eq 'C'}">
						<p><b>담당자 연락처: </b> ${buyer.bPhone}</p>
						<p><b>담당자 이메일: </b> ${buyer.bEmail}</p>
					</c:if>
					<p><b>총 거래 횟수: </b> ${shipCnt}</p>
				</div>
			</div>
		</div>
		
		<div id="section3" class="section">
			<h3>거래위치 정보</h3>
			<div id="map" style="width:100%;height:350px;"></div>
			<h2>${seller.sAddr}</h2>
		</div>
		
		
		<div id="section4" class="section">
		    <h3>상품문의</h3>
		    <div class="table">
		        <table>
		            <tr>
		                <th class="title">질문</th>
		                <th class="ans">답변 여부</th>
		                <th class="writer">작성자</th>
		                <th class="entdate">작성일</th>
		            </tr>
		            
					<c:if test="${not empty rcy}">
							    <c:forEach var="rcyItem" items="${rcy}">
							        <tr>
							            <td class="title" onclick="toggleAnswerForm('${rcyItem.RCY_CODE}')">
							                ${rcyItem.RCY_CMT}
							            </td>
							            <td class="ans">
							                <c:set var="isAnswered" value="false" />
							                <c:forEach var="cmtItem" items="${cmt}">
							                    <c:if test="${cmtItem.RCY_CODE == rcyItem.RCY_CODE}">
							                        <c:set var="isAnswered" value="true" />
							                        <c:set var="cmtAns" value="${cmtItem.CMT_ANS}" />
							                    </c:if>
							                </c:forEach>
							                <c:choose>
							                    <c:when test="${isAnswered}">
							                        답변 완료<br>
							                        <div class="answer-content">
							                            ${cmtAns}
							                        </div>
							                    </c:when>
							                    <c:otherwise>
							                        <c:choose>
							                            <c:when test="${not empty buyerLogin && buyerLogin.sCode == prd.sCode}">
							                                미답변 <button onclick="toggleAnswerForm('${rcyItem.RCY_CODE}')">답변하기</button>
							                            </c:when>
							                            <c:otherwise>
							                                미답변
							                            </c:otherwise>
							                        </c:choose>
							                        <c:if test="${not empty buyerLogin && (buyerLogin.bCode == rcyItem.B_CODE || buyerLogin.sCode == prd.sCode)}">
							                            <c:choose>
							                                <c:when test="${not empty cmtItem && cmtItem.B_CODE == buyerLogin.bCode}">
							                                    <button onclick="viewAnswer('${rcyItem.RCY_CODE}')">답변 확인</button>
							                                </c:when>
							                                <c:otherwise>
							                                    <!-- 판매자와 작성자가 같은 경우에만 버튼이 나타남 -->
							                                    <button onclick="viewAnswer('${rcyItem.RCY_CODE}')">답변 확인</button>
							                                </c:otherwise>
							                            </c:choose>
							                        </c:if>
							                    </c:otherwise>
							                </c:choose>
							            </td>
							            <td class="writer">${rcyItem.B_NAME}</td>
							            <td class="entdate">
							                <fmt:parseDate value="${rcyItem.RCY_DATE}" var="ENTDATE" pattern="yyyy-MM-dd" />
							                <fmt:formatDate value="${ENTDATE}" pattern="yyyy-MM-dd"/>
							            </td>
							        </tr>
							        <!-- 답변 작성 폼 (기본은 숨김) -->
							        <tr id="answerForm${rcyItem.RCY_CODE}" style="display:none;">
							            <td colspan="4">
							                <form action="${pageContext.request.contextPath}/buyer/recycling/rcycmt" method="post" onsubmit="return checkSeller('${seller.sCode}', '${buyerLogin.sCode}')">
							                    <input type="hidden" name="rcyCode" value="${rcyItem.RCY_CODE}">
							                    <input type="hidden" name="prdCode" value="${prd.prdCode}">
							                    <!-- 답변 내용을 작성하는 입력 폼 -->
							                    <textarea name="cmtAns" rows="4" cols="50" placeholder="답변을 작성하세요"></textarea><br>
							                    <button type="submit">답변 등록</button>
							                </form>
							            </td>
							        </tr>
							    </c:forEach>
							</c:if>
		            
		            <c:if test="${rcySize == 0}">
		                <tr>
		                    <td colspan="6" class="none">작성한 문의글이 없습니다.</td>
		                </tr>
		            </c:if>
		        </table>
		        
		        <div class="review-form">
		            <form action="./writeProc" method="post">
		                <input type="hidden" name="prdCode" value="${param.prdCode}">
		                <textarea class="comment-textarea" name="rcyCmt" rows="4" placeholder="질문 작성"></textarea>
		                <button type="submit">질문 작성</button>
		            </form>
		        </div>
		    </div> <!-- section End -->
		</div>
		
	</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>

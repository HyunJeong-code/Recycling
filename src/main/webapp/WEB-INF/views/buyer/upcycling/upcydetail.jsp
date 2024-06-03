<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새상품 업사이클 상품페이지</title>
<style type="text/css">
	body {
		margin: 0;
		padding: 0;
		display: flex;
		justify-content: center;
	}
	
	.container {
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
		background-color: #007bff;
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
		width: 850px;
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
</script>
</head>
<body>
	<div class="container">
		<div class="group">
			<p>업사이클링>중분류</p>
		</div>
		
		<div class="detailUpper">
			<div class="mainThumbnail">
				<img src="./resources/img/popular_400px.png">
			</div>
			
			<div class="prdInfo">
				<p class="prdName">${prd.prdName}</p>
				<hr>
				<p class="prdPrice">${prd.price}<p>
				<hr>
				<p class="prdSum">${prd.prdDetail}</p>
				<hr>
				<a href="#" class="buyBtn">바로구매</a>
				<a href="#" class="reportBtn">신고하기</a>
			</div>
		</div>
		
		<div class="navBar">
			<div id="btn-section1" class="navBtn" onclick="scrollToSection('section1')">상품상세</div>
			<div id="btn-section2" class="navBtn" onclick="scrollToSection('section2')">판매자 정보</div>
			<div id="btn-section3" class="navBtn" onclick="scrollToSection('section3')">거래위치 정보</div>
			<div id="btn-section4" class="navBtn" onclick="scrollToSection('section4')">상품평</div>
			<!-- <div id="btn-section5" class="navBtn" onclick="scrollToSection('section5')">상품문의</div> -->
		</div>
		
		<div id="section1" class="section">
			<h3>상품상세</h3>
			<p>상품상세 이미지</p>
		</div>
		
		<div id="section2" class="section">
			<h3>판매자 정보</h3>
			<div class="seller-info">
				<div class="seller-section">
					
					<%-- <img src="${sellerProf.storedName}" alt="${sellerProf.originName}" class="seller-photo"> --%>
					<p>아이디: ${seller.sCode}</p>
					<p>등급: ${seller.sTier}</p>
					<p>평점: ${seller.sRating}/10</p>
					<p>총 거래 횟수: ${seller.totalTransaction}</p>
				</div>
			</div>
		</div>
		
		<div id="section3" class="section">
			<h3>거래위치 정보</h3>
			<div id="map" style="width:100%;height:350px;"></div>
			<h2>${seller.sAddr}</h2>
		</div>
		
		<div id="section4" class="section">
		<div class="page">
					<h3>상품 후기</h3>
				</div>
				
				<div class="table">
					<table>
						<tr>
							<th class="">작성자</th>
							<th class="grade">평점</th>
							<th class="review">후기</th>
							<th class="entdate">작성일</th>
						</tr>
						
						<c:if test="${not empty upcyvwlist }">
						    <c:forEach var="rvw" items="${upcyvwlist }">
						        <tr>
						            <td class="writer">${rvw.B_CODE }</td>
						            <td class="grade star">
						                <c:forEach begin="1" end="${rvw.UPCY_GRADE }">
						                    ★
						                </c:forEach>
						            </td>
						            <td class="review">
						                ${rvw.UPCY_CONTENT }
						            </td>
						            <td class="entdate">
						                <fmt:parseDate value="${rvw.UPCY_DATE }"  var="ENTDATE" pattern="yyyy-MM-dd" />
						                <fmt:formatDate value="${ENTDATE }" pattern="yyyy-MM-dd"/>
						            </td>
						        </tr>
						    </c:forEach>
						</c:if>			
							
						<c:if test="${empty upcyvwlist }">
							<tr>
								<td colspan="4" class="none">작성된 리뷰가 없습니다.</td>
							</tr>
						</c:if>
					</table>
				</div> <!-- section End -->
				
				<div class="review-form">
				    <form action="./upcyrvwformProc" method="post">
				        <input type="hidden" name="prdcode" value="${param.prdCode}">
				        <textarea class="comment-textarea" name="upcyContent" rows="4" placeholder="리뷰를 작성하세요"></textarea>
				        <label for="upcyGrade">평점:</label>
				        <select name="upcyGrade">
				            <option value="1">1점</option>
				            <option value="2">2점</option>
				            <option value="3">3점</option>
				            <option value="4">4점</option>
				            <option value="5">5점</option>
				        </select>
				        <!-- <button type="submit">리뷰 작성</button> -->
				    </form>
				</div>
				
			</div>
		</div>
		
		
	</div>

</body>
</html>
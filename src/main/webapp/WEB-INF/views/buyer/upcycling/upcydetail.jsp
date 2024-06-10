<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새상품 업사이클 상품페이지</title>
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
<<<<<<< HEAD
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
=======
        margin-bottom: 20px;
        padding: 10px;
        border: 1px solid #ddd;
    }
    .review-form {
        display: flex;
        flex-direction: column;
        margin-top: 20px;
    }
    .review-form textarea {
        margin-bottom: 10px;
        padding: 10px;
        font-size: 14px;
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
>>>>>>> main
	
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5141af38fa883955ccca452855c2266&libraries=services"></script>
<script>


	$(function() {
		
		//수량 부족알림
		$("#prdCnt").change(function() {
			if ($("#prdCnt").val() > ${prd.prdCnt}) {
		      alert("수량이 부족합니다.");
		      $("#prdCnt").val("${prd.prdCnt}");  
		    }
		})
		
		$("#buyBtn").click(function() {
			var prdCode = "${prd.prdCode }";
			var prdCnt = $("#prdCnt").val();
			location.href="./pay?prdCode=" + prdCode + "&cCnt=" + prdCnt;
		})
		
		$("#cartBtn").click(function() {
			$.ajax({
				type: "get"
				, url: "./cartchk"
				, data: {
					prdCode: "${prd.prdCode }"
					, cCnt: $("#prdCnt").val()
				}
				, dataType : "Json"
				, success: function(res) {
					console.log("AJAX 성공");
					
					var prdCode = "${prd.prdCode }";
					var prdCnt = Number($("#prdCnt").val());
					
					if(res.cCnt != null){
						let isCnt = confirm("이미 카트에 같은 상품이 있습니다 추가하시겠습니까?");
						if(isCnt){
							prdCnt += res.cCnt;
							location.href="./cart?prdCode=" + prdCode + "&cCnt=" + prdCnt + "&isCart=" + true;
						}
					} else {
						location.href="./cart?prdCode=" + prdCode + "&cCnt=" + prdCnt + "&isCart=" + false;
					}
					
				}
				, error: function() {
					console.log("AJAX 실패");
				}
			})
		    
		})
		
	}) 	//$ end

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
	<header>
		<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
	</header>

	<div class="mainContainer">
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
				<p>수량 : <input type="number" id="prdCnt" value="1" min="1" max="${prd.prdCnt}"></p>
				<hr>
				<button id="buyBtn" class="buyBtn">바로구매</button>
				<button id="cartBtn" class="buyBtn">장바구니 추가</button>
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
<<<<<<< HEAD
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
=======
					<p>아이디: ${sellerProf.sCode}</p>
					<p>등급: ${sellerProf.tierName}</p>
					<p>평점: ${sellerProf.sRating}/10</p>
					<p>총 거래 횟수: ${sellerProf.totalTransaction}</p>
>>>>>>> main
				</div>
			</div>
		</div>
		
		<div id="section3" class="section">
			<h3>거래위치 정보</h3>
			<div id="map" style="width:100%;height:350px;"></div>
			<h2>${seller.sAddr}</h2>
		</div>
		
		<div id="section4" class="section">
			<h3>상품평</h3>
			<div id="reviews">
				<c:forEach var="upcyReview" items="${upcyvwlist}">
					<div class="review-item">
						<p><strong>${upcyReview.bCode}</strong></p>
						<p>${upcyReview.upcyContent}</p>
						<p>${upcyReview.upcyDate}</p>
					</div>
				</c:forEach>
				
				<div class="review-form">
				    <form action="./upcyrvwformProc" method="post">
				        <input type="hidden" name="prdcode" value="${param.prdCode}">
<!-- 				        <textarea class="comment-textarea" name="upcyContent" rows="4" placeholder="리뷰를 작성하세요"></textarea> 
				        <label for="upcyGrade">평점:</label>
				        <select name="upcyGrade">
				            <option value="1">1점</option>
				            <option value="2">2점</option>
				            <option value="3">3점</option>
				            <option value="4">4점</option>
				            <option value="5">5점</option>
				        </select>
				        <button type="submit">리뷰 작성</button> -->
				    </form>
				</div>
				
			</div>
		</div>
		
		
	</div>

</body>
</html>
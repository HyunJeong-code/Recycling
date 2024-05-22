<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새상품 업사이클 상품페이지</title>
<style type="text/css">
	body {
		margin: 0;
		padding: 0;
<<<<<<< HEAD
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
=======
	}
	
	.container {
		display: flex;
		align-items: flex-start;
		padding: 20px;
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e
	}
	
	.group {
		width: 200px;
<<<<<<< HEAD
		margin-bottom: 20px;
		margin-right: auto;
	}
	
	.detailUpper {
		display: flex;
		width: 100%;
		max-width: 1200px;
		margin-bottom: 20px;
		justify-content: space-between;
=======
		margin-right: 20px;
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e
	}
	
	.mainThumbnail {
		width: 500px;
<<<<<<< HEAD
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
=======
		margin-bottom: 20px;
	}
	
	.prdInfo {
		margin-bottom: 20px;
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e
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
	
<<<<<<< HEAD
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
		padding: 10px;
		font-size: 14px;
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
	
	
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba546373fe2d97f20f50b230fdbb91ed"></script>
<script>
	function scrollToSection(sectionId) {
		document.querySelectorAll('.navBtn').forEach(btn => btn.classList.remove('active'));
		document.getElementById('btn-' + sectionId).classList.add('active');
		document.getElementById(sectionId).scrollIntoView({ behavior: 'auto' });
	}
	
	let map;
	function initMap() {
		// 지도 초기화 및 설정
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		var mapOption = { 
			center: new kakao.maps.LatLng(37.5665, 126.978), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

		map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 판매자의 거래위치 정보를 표시할 마커 추가
		var markerPosition  = new kakao.maps.LatLng(37.5665, 126.978); 
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});

		marker.setMap(map);
	}
	
	window.onload = initMap;
</script>
=======
	
	
	
	
</style>
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e
</head>
<body>
	<div class="container">
		<div class="group">
<<<<<<< HEAD
			<p>업사이클링>중분류</p>
		</div>
		
		<div class="detailUpper">
			<div class="mainThumbnail">
				<img src="./resources/img/popular_400px.png">
			</div>
			
=======
			<h2>업사이클링>중분류</h2>
		</div>
		
		<div class="detailUpper">
			<img src="${pageContext.request.contextPath}/resources/img/popular_400px.png"
				class="mainThumbnail">
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e
			<div class="prdInfo">
				<p class="prdName">${prd.prdName}</h1>
				<hr>
				<p class="prdPrice">${prd.price}<p>
				<hr>
				<p class="prdSum">${prd.prdDetail}</p>
				<hr>
				<a href="#" class="buyBtn">바로구매</a>
				<a href="#" class="reportBtn">신고하기</a>
			</div>
		</div>
<<<<<<< HEAD
		
		<div class="navBar">
			<div id="btn-section1" class="navBtn" onclick="scrollToSection('section1')">상품상세</div>
			<div id="btn-section2" class="navBtn" onclick="scrollToSection('section2')">판매자 정보</div>
			<div id="btn-section3" class="navBtn" onclick="scrollToSection('section3')">거래위치 정보</div>
			<div id="btn-section4" class="navBtn" onclick="scrollToSection('section4')">상품평</div>
			<div id="btn-section5" class="navBtn" onclick="scrollToSection('section5')">상품문의</div>
		</div>
		
		<div id="section1" class="section">
			<h3>상품상세</h3>
			<p>상품상세 내용</p>
		</div>
		
		<div id="section2" class="section">
			<h3>판매자 정보</h3>
			<div class="seller-info">
				<div class="seller-section">
					<img src="${sellerProf.storedName}" alt="${sellerProf.originName}" class="seller-photo">
					<p>아이디: ${sellerProf.sCode}</p>
					<p>등급: ${sellerProf.sellerTier}</p>
					<p>평점: ${sellerProf.sellerRating}/10</p>
					<p>총 거래 횟수: ${sellerProf.totalTransactions}</p>
				</div>
			</div>
		</div>
		
		<div id="section3" class="section">
			<h3>거래위치 정보</h3>
			<div id="map" style="height: 400px; width: 100%;"></div>
			<p>거래위치 정보 내용</p>
		</div>
		
		<div id="section4" class="section">
			<h3>상품평</h3>
			<div id="reviews">
				<c:forEach var="review" items="${upcyvwlist}">
					<div class="review-item">
						<p><strong>${review.bCode}</strong></p>
						<p>${review.rvwContent}</p>
						<p>${review.rvwDate}</p>
					</div>
				</c:forEach>
				
				<div class="review-form">
					<form action="/upcyrvwform" method="post">
						<textarea class="comment-textarea" name="rvwContent" rows="4" placeholder="리뷰를 작성하세요"></textarea>
						<button type="submit">리뷰 작성</button>
					</form>
				</div>
				
			</div>
		</div>
		
		<div id="section5" class="section">
			<h3>상품문의</h3>
			<p>상품문의 내용</p>
		</div>
		
=======
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e
	</div>

</body>
</html>
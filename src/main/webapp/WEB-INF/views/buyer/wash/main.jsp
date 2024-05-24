<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세척업체</title>
<style>

    body {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        height: 100vh;
        margin: 0;
        overflow: auto;
    }

    .mainContainer {
        margin-top: 20px;
        width: 1000px;
        text-align: center;
    }

    .mainBanner {
        width: 1000px;
        height: 400px;
        border: 1px solid black;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 20px;
        background-color: #f8f9fa;
    }

    .bannerInfo {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 20px;
    }

    .bannerContent {
        width: 800px;
        padding: 10px;
        background-color: #f8f9fa;
        text-align: left;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .bannerContent img {
        width: 800px;
        height: 400px;
        margin-top: 10px;
        margin-bottom: 5px;
    }

    .bannerTitle,
    .bannerPhone,
    .bannerLocation {
        margin-top: 5px;
        margin-bottom: 5px;
    }
    
    .categoryContainer {
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        margin-top: 5px;
        margin-bottom: 10px;
        padding: 10px 0;
    }

    .categoryBig {
        font-weight: bold;
        font-size: large;
        text-align: left;
        margin-bottom: 10px;
    }

    .categoryBox {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        background-color: #d1d1d1;
        padding: 3px;
    }

    .categoryMid {
        cursor: pointer;
        padding: 8px 16px;
        color: #6b6b6b;
    }

    .sortBtn {
        display: flex;
        justify-content: flex-start;
        margin-bottom: 20px;
    }

    .sortBtn button {
        padding: 10px 20px;
        background-color: gray;
        color: white;
        border: none;
        cursor: pointer;
        margin-right: 10px;
        border-radius: 15px;
    }

    .washContainer {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20px;
        padding: 1 20px;
        justify-content: flex-start;
    }

    .washList {
        width: 100%;
        box-sizing: border-box;
    }

    .prd {
        width: 220px;
        padding: 10px;
        margin-bottom: 20px;
        text-align: left;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .prd img {
        width: 200px;
        height: 200px;
        margin-top: 10px;
        margin-bottom: 5px;
    }

    .prdTitle,
    .prdPrice,
    .washPhone,
    .washLocation {
        margin-top: 5px;
        margin-bottom: 5px;
    }

    .prdPrice {
        font-size: 16px;
        font-weight: bold;
    }

</style>

</head>

<body>
	<div class="mainContainer">
		<div class="mainBanner">
			<div class="bannerInfo">
				<!-- 추천 업체  -->
				<div class="bannerContent" id="newWash1">
					<img src="${pageContext.request.contextPath}/resources/img/empty_400px.png">
					<p class="bannerTitle">세척 업체 1</p>
					<p class="bannerPhone">010-0000-0000</p>
					<p class="bannerLocation">서울 강남구</p>
				</div>
				<div class="bannerContent" id="newWash2">
					<img src="${pageContext.request.contextPath}/resources/img/empty_400px.png">
					<p class="bannerTitle">세척 업체 2</p>
					<p class="bannerPhone">010-0000-0000</p>
					<p class="bannerLocation">서울 강북구</p>
				</div>

			</div>
		</div>
		
		<div class="categoryContainer">
				<div class="categoryBig"><strong>세척 업체 리스트</strong></div>
				<div class="categoryBox">
					<div class="categoryMid">서울</div>
					<div class="categoryMid">경기</div>
					<div class="categoryMid">경북</div>
					<div class="categoryMid">경남</div>
					<div class="categoryMid">전북</div>
					<div class="categoryMid">전남</div>
					<div class="categoryMid">충북</div>
					<div class="categoryMid">충남</div>
					<div class="categoryMid">강원</div>
					<div class="categoryMid">제주</div>
				</div>
			</div>
		<div class="sortBtn">
			<button id="wash">세척</button>
			<button id="gruouWash">분류 + 세척</button>
			<button id="groupWashMade">분류 + 세척 + 가공</button>
		</div>
		
		<div class="washContainer">
			<div class="washList">
			<!-- 예시형 업체 10개 -->
				<div class="prd">
					<img src="${pageContext.request.contextPath}/resources/img/product_1.jpg">
					<p class="washTitle">세척 업체 1</p>
					<p class="washPhone">010-1111-1111</p>
					<p class="washLocation">서울</p>
				</div>
				<div class="prd">
					<img src="${pageContext.request.contextPath}/resources/img/product_2.jpg">
					<p class="washTitle">세척 업체 2</p>
					<p class="washPhone">010-2222-2222</p>
					<p class="washLocation">경기</p>
				</div>
				<div class="prd">
					<img src="${pageContext.request.contextPath}/resources/img/product_3.jpg">
					<p class="washTitle">세척 업체 3</p>
					<p class="washPhone">010-3333-3333</p>
					<p class="washLocation">경북</p>
				</div>
				<div class="prd">
					<img src="${pageContext.request.contextPath}/resources/img/product_4.jpg">
					<p class="washTitle">세척 업체 4</p>
					<p class="washPhone">010-4444-4444</p>
					<p class="washLocation">경남</p>
				</div>
				<div class="prd">
					<img src="${pageContext.request.contextPath}/resources/img/product_5.jpg">
					<p class="washTitle">세척 업체 5</p>
					<p class="washPhone">010-5555-5555</p>
					<p class="washLocation">전북</p>
				</div>
				<div class="prd">
					<img src="${pageContext.request.contextPath}/resources/img/product_6.jpg">
					<p class="washTitle">세척 업체 6</p>
					<p class="washPhone">010-6666-6666</p>
					<p class="washLocation">전남</p>
				</div>
				<div class="prd">
					<img src="${pageContext.request.contextPath}/resources/img/product_7.jpg">
					<p class="washTitle">세척 업체 7</p>
					<p class="washPhone">010-7777-7777</p>
					<p class="washLocation">충북</p>
				</div>
				<div class="prd">
					<img src="${pageContext.request.contextPath}/resources/img/product_8.jpg">
					<p class="washTitle">세척 업체 8</p>
					<p class="washPhone">010-8888-8888</p>
					<p class="washLocation">충남</p>
				</div>
				<div class="prd">
					<img src="${pageContext.request.contextPath}/resources/img/product_9.jpg">
					<p class="washTitle">세척 업체 9</p>
					<p class="washPhone">010-9999-9999</p>
					<p class="washLocation">강원</p>
				</div>
				<div class="prd">
					<img src="${pageContext.request.contextPath}/resources/img/product_10.jpg">
					<p class="washTitle">세척 업체 10</p>
					<p class="washPhone">010-0000-0000</p>
					<p class="washLocation">제주</p>
				</div>
				
<%-- 				<c:forEach var="prd" items="${list}">
				    <div class="prd">
				        <a href="${pageContext.request.contextPath}/buyer/wash/washDetail?wcode=${wash.wCode}"">
				            <img src="${pageContext.request.contextPath}/resources/img/product_${prd.prdCode}.jpg">
				            <p class="washTitle">${wash.prdName}</p>
				            <p class="washPhone">${wash.wPhone}</p>
				            <p class="washLocation">${wash.wPostcode}</p>
				        </a>
				    </div>
				</c:forEach> --%>
                
			</div>
		</div>
		
		<!-- 페이지 이동 버튼 -->
		<div class="pagination">
			<button onclick="prevPage()">이전</button>
			<button onclick="nextPage()">다음</button>
		</div>
	</div>

    <script>
	    document.addEventListener('DOMContentLoaded', function() {
	        const newPrdBtn = document.getElementById('newPrdBtn');
	        const popPrdBtn = document.getElementById('popPrdBtn');
	        const newPrds = document.querySelectorAll('.bannerContent[id^="newPrd"]');
	        const popPrds = document.querySelectorAll('.bannerContent[id^="popPrd"]');
	        const sortButtons = document.querySelectorAll('.sortBtn button');
	        const categoryItems = document.querySelectorAll('.categoryMid');
	        const prdLists = document.querySelectorAll('.prdList');
	
	        let currentPage = 1;
	
	        // 초기 설정: 신규 상품 표시
	        newPrdBtn.style.backgroundColor = '#007bff';
	        newPrdBtn.style.color = 'white';
	        popPrds.forEach(prd => {
	            prd.style.display = 'none';
	        });
	
	        // 중분류 '전체' 활성화
	        const allCategory = document.querySelector('.categoryMid:first-child');
	        allCategory.classList.add('active');
	        allCategory.style.fontWeight = 'bold';
	        allCategory.style.color = 'black';
	
	        // 정렬 버튼 중 '낮은가격순' 활성화
	        const lowPriceBtn = document.getElementById('lowPrice');
	        lowPriceBtn.classList.add('active');
	        lowPriceBtn.style.backgroundColor = '#007bff';
	        lowPriceBtn.style.color = 'white';
	
	        // 신규 상품 버튼 클릭 시
	        newPrdBtn.addEventListener('click', function() {
	            newPrds.forEach(prd => {
	                prd.style.display = 'block';
	            });
	            popPrds.forEach(prd => {
	                prd.style.display = 'none';
	            });
	            newPrdBtn.style.backgroundColor = '#007bff';
	            newPrdBtn.style.color = 'white';
	            popPrdBtn.style.backgroundColor = '';
	            popPrdBtn.style.color = '';
	        });
	
	        // 인기 상품 버튼 클릭 시
	        popPrdBtn.addEventListener('click', function() {
	            newPrds.forEach(prd => {
	                prd.style.display = 'none';
	            });
	            popPrds.forEach(prd => {
	                prd.style.display = 'block';
	            });
	            newPrdBtn.style.backgroundColor = '';
	            newPrdBtn.style.color = '';
	            popPrdBtn.style.backgroundColor = '#007bff';
	            popPrdBtn.style.color = 'white';
	        });
	
	        // 카테고리 클릭 시
	        categoryItems.forEach(item => {
	            item.addEventListener('click', function() {
	                categoryItems.forEach(item => {
	                    item.classList.remove('active');
	                    item.style.fontWeight = 'normal';
	                    item.style.color = '';
	                });
	                this.classList.add('active');
	                this.style.fontWeight = 'bold';
	                this.style.color = 'black';
	            });
	        });
	
	        // 정렬 버튼 클릭 시
	        sortButtons.forEach(button => {
	            button.addEventListener('click', function() {
	                sortButtons.forEach(button => {
	                    button.classList.remove('active');
	                    button.style.backgroundColor = '';
	                    button.style.color = '';
	                    button.style.fontWeight = 'normal';
	                });
	                this.classList.add('active');
	                this.style.backgroundColor = '#007bff';
	                this.style.color = 'white';
	                this.style.fontWeight = 'bold';
	            });
	        });
	
	        // 페이지 표시 함수
	        function showPage(pageNum) {
	            // 모든 페이지 숨기기
	            prdLists.forEach(list => {
	                list.style.display = 'none';
	            });
	            // 현재 페이지만 보이기
	            if (prdLists[pageNum - 1]) {
	                prdLists[pageNum - 1].style.display = 'flex';
	            }
	        }
	
	        // 다음 페이지로 이동
	        function nextPage() {
	            if (currentPage < prdLists.length) {
	                currentPage++;
	                showPage(currentPage);
	            }
	        }
	
	        // 이전 페이지로 이동
	        function prevPage() {
	            if (currentPage > 1) {
	                currentPage--;
	                showPage(currentPage);
	            }
	        }
	
	        // 초기 설정: 첫 번째 페이지 표시
	        showPage(currentPage);
	    });
	</script>
    
</body>

</html>
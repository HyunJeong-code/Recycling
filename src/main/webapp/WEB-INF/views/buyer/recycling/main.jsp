<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새상품 재활용품</title>
<style>

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
		flex: 1;
		overflow-y: auto;
		margin-top: 20px;
		margin-bottom: 50px;
		max-width: 1000px;
		text-align: center;
		width: 100%;
	}

	.mainBanner {
		max-width: 1000px;
		height: 620px;
		border: 1px solid black;
		overflow: hidden;
		display: flex;
		flex-direction: column;
		align-items: center;
		padding-top: 20px;
		background-color: #f8f9fa;
	}

	.btnArea {
		display: flex;
		justify-content: center;
		align-items: center;
		overflow: visible;
		width: 100%;
	}

	.bannerBtn {
		padding: 10px 20px;
		background-color: gray;
		color: white;
		border: none;
		cursor: pointer;
		margin-right: 10px;
		border-radius: 30px;
	}

	.bannerInfo {
		width: 100%;
		margin: 0 auto;
		display: flex;
		align-items: flex-start;
		flex-wrap: wrap;
	}

	.bannerContent {
		width: 220px;
		padding: 12px;
		margin-bottom: 10px;
		background-color: #f8f9fa;
		text-align: center;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	.bannerContent img {
		width: 200px;
		height: 200px;
		margin-top: 10px;
		margin-bottom: 5px;
	}

	.bannerTitle,
	.bannerPrice {
		margin-top: 5px;
		margin-bottom: 5px;
	}

	.bannerPrice {
		font-size: 16px;
		font-weight: bold;
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
		justify-content: flex-start;
	}

	.categoryMid {
		cursor: pointer;
		padding: 8px 16px;
		color: #6b6b6b;
		white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
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

	.prdContainer {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin-top: 20px;
		max-width: 1000px;
		width: 100%;
	}

	.prdList {
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start;
		width: 100%;
		box-sizing: border-box;
	}

	.productInfo {
		width: 100%;
		display: flex;
		justify-content: space-around;
		align-items: flex-start;
		flex-wrap: wrap;
	}

	.prd {
		width: 220px;
		padding: 10px;
		margin-bottom: 20px;
		text-align: left;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	.prd img {
		width: 200px;
		height: 200px;
		margin-top: 10px;
		margin-bottom: 5px;
	}

	.prdTitle,
	.prdPrice {
		margin-top: 5px;
		margin-bottom: 5px;
	}

	.prdPrice {
		font-size: 16px;
		font-weight: bold;
	}
	
	.spacer {
		height: 130px;
		opacity: 1;
		pointer-events: none;
	}
	


</style>

</head>

<body>
	<header>
		<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
	</header>

	<div class="mainContainer">
		<div class="mainBanner">
			<div class="bannerInfo">
		        <!-- 최신 상품 -->
		        <c:forEach var="prd" items="${latestList}">
		            <div class="bannerContent">
		                <img src="${pageContext.request.contextPath}/resources/img/empthy_400px.png">
		                <p class="bannerTitle">${prd.prdName}</p>
		                <p class="bannerPrice">${prd.price}원</p>
		            </div>
		        </c:forEach>
		        <hr>
		        <!-- 인기 상품 -->
		        <c:forEach var="prd" items="${HitList}">
		            <div class="bannerContent">
		                <img src="${pageContext.request.contextPath}/resources/img/empthy_400px.png">
		                <p class="bannerTitle">${prd.prdName}</p>
		                <p class="bannerPrice">${prd.price}원</p>
		            </div>
		        </c:forEach>
			</div>
		</div>
		<div class="categoryContainer">
				<div class="categoryBig"><strong>재활용품</strong></div>
				<div class="categoryBox">
				    <div class="categoryMid" data-category="all">전체</div>
				    <div class="categoryMid" data-category="0">플라스틱</div>
				    <div class="categoryMid" data-category="1">유리</div>
				    <div class="categoryMid" data-category="2">종이</div>
				    <div class="categoryMid" data-category="3">캔</div>
				    <div class="categoryMid" data-category="4">천</div>
				    <div class="categoryMid" data-category="5">기타</div>
				</div>
			</div>
		<div class="sortBtn">
			<button id="lowPrice">낮은가격순</button>
			<button id="highPrice">높은가격순</button>
			<button id="sales">판매량순</button>
			<button id="latest">최신순</button>
		</div>
		
		<div class="prdContainer">
			<div class="prdList">
				<!-- 테스트용 상품 리스트 -->
<%-- 				<c:forEach var="index" begin="1" end="32">
					<div class="prd" style="display: ${index <= 16 ? 'flex' : 'none'};">
						<img src="${pageContext.request.contextPath}/resources/img/product_${index}.jpg">
						<p class="prdTitle">Proddddddddddddddddduct ${index}</p>
						<p class="prdPrice">30,000원</p>
					</div>
                </c:forEach> --%>
                
				<c:forEach var="prd" items="${list}">
				    <div class="prd" data-ct-pdt-no="${prd.ctPdtNo}">
				        <a href="${pageContext.request.contextPath}/buyer/recycling/rcydetail?prdcode=${prd.prdCode}">
				            <img src="${pageContext.request.contextPath}/resources/img/product_${prd.prdCode}.jpg">
                            <p class="prdTitle">${prd.prdName}</p>
                            <p class="prdPrice">${prd.price}원</p>
				        </a>
				    </div>
				</c:forEach>
                
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
	    const categoryItems = document.querySelectorAll('.categoryMid');
	    const prdItems = document.querySelectorAll('.prd');
	    const sortButtons = document.querySelectorAll('.sortBtn button');
	
	    // 중분류 '전체' 활성화
	    const allCategory = document.querySelector('.categoryMid[data-category="all"]');
	    allCategory.classList.add('active');
	    allCategory.style.fontWeight = 'bold';
	    allCategory.style.color = 'black';
	
	    // 정렬 버튼 중 '낮은가격순' 활성화
	    const lowPriceBtn = document.getElementById('lowPrice');
	    lowPriceBtn.classList.add('active');
	    lowPriceBtn.style.backgroundColor = '#4CAF50';
	    lowPriceBtn.style.color = 'white';
	    lowPriceBtn.style.fontWeight = 'bold';
	    
	
	 // 카테고리 클릭 시
	    categoryItems.forEach((item) => {
	        item.addEventListener('click', function() {
	            // 이전에 선택한 정렬 기준 버튼 가져오기
	            const prevSortButton = document.querySelector('.sortBtn button.active');
	            
	            // 모든 카테고리 스타일 초기화
	            categoryItems.forEach(item => {
	                item.classList.remove('active');
	                item.style.fontWeight = 'normal';
	                item.style.color = '';
	            });
	            
	            // 선택된 카테고리 스타일 변경
	            this.classList.add('active');
	            this.style.fontWeight = 'bold';
	            this.style.color = 'black';
	            
	            // 해당 카테고리에 맞는 제품 로드
	            loadProductsByCategory(this.getAttribute('data-category'));
	            
	            // 이전에 선택한 정렬 기준 버튼 활성화 유지
	            if (prevSortButton) {
	                prevSortButton.classList.add('active');
	                prevSortButton.style.backgroundColor = '#4CAF50';
	                prevSortButton.style.color = 'white';
	                prevSortButton.style.fontWeight = 'bold';
	                
	                // 정렬 함수 호출
	                sortProducts(prevSortButton.id, this.getAttribute('data-category')); // 이전에 선택한 정렬 기준과 현재 중분류를 전달
	            } else {
	                // 이전에 선택한 정렬 기준이 없는 경우, '낮은가격순'으로 설정
	                const lowPriceBtn = document.getElementById('lowPrice');
	                lowPriceBtn.classList.add('active');
	                lowPriceBtn.style.backgroundColor = '#4CAF50';
	                lowPriceBtn.style.color = 'white';
	                lowPriceBtn.style.fontWeight = 'bold';
	                
	                // 정렬 함수 호출
	                sortProducts('lowPrice', this.getAttribute('data-category')); // 정렬 함수에 '낮은가격순'과 현재 중분류를 전달
	            }
	        });
	    });
	
	    // 카테고리에 따른 제품 로드 함수
	    function loadProductsByCategory(category) {
	        prdItems.forEach(item => {
	            if (category === 'all' || item.getAttribute('data-ct-pdt-no') === category) {
	                item.style.display = 'flex';
	            } else {
	                item.style.display = 'none';
	            }
	        });
	    }
	
	    
	 // 정렬 버튼 클릭 시
	    sortButtons.forEach(button => {
	        button.addEventListener('click', function() {
	            // 현재 선택된 중분류 가져오기
	            const currentCategory = document.querySelector('.categoryMid.active').getAttribute('data-category');
	            
	            sortButtons.forEach(button => {
	                button.classList.remove('active');
	                button.style.backgroundColor = '';
	                button.style.color = '';
	                button.style.fontWeight = 'normal';
	            });
	            this.classList.add('active');
	            this.style.backgroundColor = '#4CAF50';
	            this.style.color = 'white';
	            this.style.fontWeight = 'bold';
	            
	            // 정렬 함수 호출
	            sortProducts(this.id, currentCategory); // 정렬 함수에 현재 중분류를 전달
	        });
	    });
	
	 // 제품 정렬 함수
	    function sortProducts(criteria, category) {
	        let productsArray = Array.from(prdItems);
	        switch(criteria) {
	            case 'lowPrice':
	                productsArray.sort((a, b) => {
	                    return parseInt(a.querySelector('.prdPrice').textContent.replace(/,/g, '')) - parseInt(b.querySelector('.prdPrice').textContent.replace(/,/g, ''));
	                });
	                break;
	            case 'highPrice':
	                productsArray.sort((a, b) => {
	                    return parseInt(b.querySelector('.prdPrice').textContent.replace(/,/g, '')) - parseInt(a.querySelector('.prdPrice').textContent.replace(/,/g, ''));
	                });
	                break;
	            case 'latest':
	                productsArray.sort((a, b) => {
	                    return new Date(b.getAttribute('data-ct-pdt-no')) - new Date(a.getAttribute('data-ct-pdt-no'));
	                });
	                break;
	            default:
	                break;
	        }
	        const prdList = document.querySelector('.prdList');
	        prdList.innerHTML = '';
	        productsArray.forEach(product => {
	            // 해당 중분류에 맞는 제품만 추가
	            if (category === 'all' || product.getAttribute('data-ct-pdt-no') === category) {
	                prdList.appendChild(product);
	            }
	        });
	        showPage(currentPage);
	    }
	    
	    // 페이지 표시 함수
	    function showPage(pageNum) {
	        // 모든 페이지 숨기기
	        prdItems.forEach((item, index) => {
	            item.style.display = (index >= (pageNum - 1) * 16 && index < pageNum * 16) ? 'flex' : 'none';
	        });
	    }
	
	    // 다음 페이지로 이동
	    function nextPage() {
	        if (currentPage < Math.ceil(prdItems.length / 16)) {
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
	    let currentPage = 1;
	    showPage(currentPage);
	});
</script>
    
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/manager/sls/list.css">
</head>
<body>

    <div class="full">
        <aside>
        </aside>
        <div class="wrap">
            <div class="page">
<<<<<<< HEAD
            판매자 조회
         </div>
         
         <div class="search">
            <form action="./main" method="get">
               <input type="hidden" name="sCtg" value="UP">
               <input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
               <button>검색</button>
            </form>
         </div>
         
            <div class="section">    
                
               <table>
               <thead>
                  <tr>
                     <th>판매자 코드</th>
                           <th>구매자 코드</th>
                           <th>가입일</th>
                           <th>상세조회</th>
                           <th>상품판매조회</th>
                  </tr>
               </thead>
                       
=======
				판매자 조회
			</div>
			
			<div class="search">
				<form action="./main" method="get">
					<input type="hidden" name="sCtg" value="UP">
					<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
					<button>검색</button>
				</form>
			</div>
			
            <div class="section">    
                
	            <table>
					<thead>
						<tr>
							<th>판매자 코드</th>
	                        <th>구매자 코드</th>
	                        <th>가입일</th>
	                        <th>상세조회</th>
	                        <th>상품판매조회</th>
						</tr>
					</thead>
<<<<<<< HEAD

=======
>>>>>>> cf3b2559e2be98888183140c0e3fabd0825f47b8
                <div class="section">    
                    <h1>판매자 리스트</h1>
                    <hr>
                </div>       
				<div class="search">
					<form action="./main" method="get">
						<input type="hidden" name="sCtg" value="UP">
						<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
						<button>검색</button>
					</form>
				</div>
			                
                <table class="table table-striped table-hover table-sm">
        
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 5%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col style="width: 20%;">
                    </colgroup>

                    <thead>
                        <tr>
                            <th>판매자 코드</th>
                            <th>구매자 코드</th>
                            <th>가입일</th>
                            <th>상세조회</th>
                            <th>상품판매조회</th>
                        </tr>
                    </thead>

>>>>>>> 95b25a5954ab50aeb29ea101e9c29d1d810ef2e2
                    <tbody>
                        <c:forEach var="seller" items="${main }" varStatus="status">
                           <!-- sOut상태가 'N' 이면 보여주고 'Y'이면 숨기기 -->
                     <c:if test="${seller.sOut eq 'N'}">
                               <tr>
                                   <td>${seller.sCode}</td>
                                   <td>${seller.bCode}</td>
                                   <td>
                                       <fmt:parseDate value="${seller.sEntDate}" var="sEntDate" pattern="yyyy-MM-dd" />
                                       <fmt:formatDate value="${sEntDate}" pattern="yyyy-MM-dd" />
                                   </td>
                                   <td>                                
                                      <a href="/manager/sls/sellerdetail?sCode=${seller.sCode}">
                                         <button class="btn">상세조회</button>
                                     </a>                                   
                                   </td>
                                   <td>
                               <a href="/manager/sls/sellinglist?sCode=${seller.sCode}">
                                         <button class="btn">상품판매조회</button>
                                     </a> 
                           </td>
                               </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <br>
            <c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
        </div>
    </div>
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> TEST
=======
>>>>>>> cf3b2559e2be98888183140c0e3fabd0825f47b8
	<div class="full">
		<aside>
			aaaaa
		</aside>
		<div class="wrap">
			<div class="page">
				<div class="section">	
					<h1>판매자 리스트</h1>
					<hr>
				</div>
				
				<table class="table table-striped table-hover table-sm">
		
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 5%;">
						<col style="width: 15%;">
						<col style="width: 10%;">
						<col style="width: 20%;">
					</colgroup>
					
					<thead>
						<tr>
							<th>판매자 코드</th>
							<th>구매자 코드</th>
							<!-- <th>예금주</th>								
							<th>은행</th>
							<th>계좌번호</th>
							<th>우편번호</th>
							<th>주소</th>
							<th>상세주소</th> -->
							<th>가입일</th>
						</tr>
					</thead>
					
					<tbody>
					    <c:forEach var="seller" items="${main }">
				            <tr>
				                <td>${seller.sCode }</td>
				                <td>${seller.bCode }</td>
				                <%-- <td>${seller.accName }</td>
				                <td>${seller.accBank }</td>
				                <td>
				                    <a href="./buyerdetail?bCode=${buyer.bCode }">${buyer.bId }</a>
				                </td>
				                <td>${seller.accNo }</td>
				                <td>${seller.sPostcode }</td>
				                <td>${seller.sAddr }</td>
				                <td>${seller.sDetail }</td> --%>
				                <td>
				                    <fmt:parseDate value="${seller.sEntDate }" var="sEntDate" pattern="yyyy-MM-dd" />
				                    <fmt:formatDate value="${sEntDate }" pattern="yyyy-MM-dd" />
				                </td>
				            </tr>
					    </c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<div class="full">
	<div class="wrap">
		<div class="page">
		<h3>상품 판매 관리</h3>
		</div>
		
		<div class="section">
		</div>
		
		<div class="page">
		<h3>상품 관리</h3>
		</div>
		
		<div class="section">
		<table>
			<tr>
				<th><input type="checkbox" id="allChkBtn" name="allChkBtn"></th>
				<th>상품 코드</th>
				<th>상품 대분류</th>
				<th>상품 소분류</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
				<th>상품 등록일</th>
				<th>상품 상태</th>
				<th>상세 조회</th>
			</tr>
			
			<tr>
			</tr>
		</table>
		</div>
		
		<div class="page">
		<h3>판매 관리</h3>
		</div>
		
		<div class="section">
		</div>
	</div>
</div>
</body>
</html>

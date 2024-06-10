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
<link rel="stylesheet" href="/resources/css/manager/manager.css">
</head>
<body>

    <c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content">
	        <div class="wrap">
	            <div class="page">
	            판매자 조회
	         </div>
	         
	         <div class="search">
					<form action="./main" method="get" class ="search_form">
						<input type="hidden" name="sCtg" value="UP">
						<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search-input">
						<button class="btn btnRight">검색</button>
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
					
	                        <c:forEach var="seller" items="${main }" varStatus="status">
	                            <!-- sOut상태가 'N' 이면 보여주고 'Y'이면 숨기기 -->
	                            <c:if test="${seller.S_OUT eq 'N'}">
	                                <tr>
	                                    <td>${seller.S_CODE}</td>
	                                    <td>${seller.B_CODE}</td>
	                                    <td>
	                                        <fmt:parseDate value="${seller.S_ENTDATE}" var="sEntDate" pattern="yyyy-MM-dd" />
	                                        <fmt:formatDate value="${sEntDate}" pattern="yyyy-MM-dd" />
	                                    </td>
	                                    <td>                               
	                                    	<c:if test="${seller.B_CT_CODE eq 'C' }">
	                                        <a href="/manager/sls/sellercmpdetail?sCode=${seller.S_CODE}">
	                                            <button class="btn btnRight">상세조회</button>
	                                        </a>                                   
	                                    	</c:if> 
	                                    	<c:if test="${seller.B_CT_CODE eq 'P' }">
	                                        <a href="/manager/sls/sellerpridetail?sCode=${seller.S_CODE}">
	                                            <button class="btn btnRight">상세조회</button>
	                                        </a>                                   
	                                    	</c:if> 
	                                    </td>
	                                    <td>
	                                        <a href="/manager/sls/sellinglist?sCode=${seller.S_CODE}">
	                                            <button class="btn btnRight">판매조회</button>
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
    </div>
</body>
</html>

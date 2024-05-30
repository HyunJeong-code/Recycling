<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">
	$(function() {
		// 해당 상품의 ctPdtNo 선택
		$("#ctPdtNo option:eq(${prd.ctPdtNo})").attr("selected", "selected");
	})
	
</script>

<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

    <div class="full">
        <div class="wrap">
            <div class="page">
            
            </div>
        
            <div class="section">
            	<h3>${prd.prdName }</h3>
            	<form action="./cyupdate?prdCode=${prd.prdCode}" method="post">
	            	<table>
	            		<tr>
	            			<td>상품코드</td>
	            			<td>${prd.prdCode }</td>
	            		</tr>
	            		<tr>
	            			<td>상품 분류</td>
	            			<td>
	            				<select name="ctPdtNo" id="ctPdtNo">
						           	<option value="0">플라스틱</option>
						           	<option value="1">유리</option>
						           	<option value="2">종이</option>
						           	<option value="3">캔</option>
						           	<option value="4">천</option>
						           	<option value="5">기타</option>
					            </select>
	            			</td>
	            		</tr>
	            		<tr>
	            			<td>상품명</td>
	            			<td><input type="text" name="prdName" value="${prd.prdName }"></td>
	            		</tr>
	            		<tr>
	            			<td>가격</td>
	            			<td><input type="text" name="price" value="${prd.price }"></td>
	            		</tr>
	            		<tr>
	            			<td>재고</td>
	            			<td><input type="number" min="0" name="prdCnt" value="${prd.prdCnt }"></td>
	            		</tr>
	            		<tr>
	            			<td>상품 상세</td>
	            			<td><input type="text" name="prdDetail" value="${prd.prdDetail }"></td>
	            		</tr>
		           	</table>
		           	<button type="button"><a href="./upcylist">목록</a></button>
		           	<button>수정하기</button>
		           	<button type="button"><a href="./upcydel?prdCode=${prd.prdCode}">삭제하기</a></button>
	           	</form>
            </div>
        </div>
    </div>
    
    <c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
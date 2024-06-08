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
		
		//input 빈값 체크
        $("#btnUpdate").click(function(){
            var isRight = true;
            $("#redetailForm").find("input[type=text]").each(function(index, item){
                // 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
                if ($(this).val().trim() == '') {
                    alert($(this).attr("data-name")+" 항목을 입력하세요.");
                    isRight = false;
                    return false;
                }
            });

            if (!isRight) {
            	return false;
            } else {
            	$("#redetailForm").submit();
            }

            $(this).prop("disabled", true);
            $(this).prop("disabled", false);
        });
		
		// 해당 상품의 ctPdtNo 선택
		$("#ctPdtNo option:eq(${prd.ctPdtNo})").attr("selected", "selected");
		
		//input 빈값 체크
        $("#btnUpdate").click(function(){
            var isRight = true;
            $("#updetailForm").find("input[type=text]").each(function(index, item){
                // 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
                if ($(this).val().trim() == '') {
                    alert($(this).attr("data-name")+" 항목을 입력하세요.");
                    isRight = false;
                    return false;
                }
            });

            if (!isRight) {
            	return false;
            } else {
            	$("#updetailForm").submit();
            }

            $(this).prop("disabled", true);
            $(this).prop("disabled", false);
        });
		
		
		
	})
</script>

<body>



    <c:choose>
	
	<c:when test="${prd.ctPno == 0 }">
    <!-- 리사이클 -->
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
        <div class="wrap">
            <div class="page">
            
            </div>
        
            <div class="section">
            	<h3>${prd.prdCode }</h3>
            	<form action="./reprdupdate?sCode=${prd.sCode}" id="redetailForm" method="post">
            		<input type="hidden" name="prdCode" value="${prd.prdCode}">
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
	            			<td>상품 상세</td>
	            			<td><input type="text" name="prdDetail" value="${prd.prdDetail }"></td>
	            		</tr>
		           	</table>
		           	<button type="button"><a href="./sellinglist?sCode=${prd.sCode}">목록</a></button>
		           	<button type="button" id="btnUpdate">수정하기</button>
		           	<button type="button"><a href="./sellinglist?sCode=${prd.sCode}">삭제하기</a></button>
	           	</form>
            </div>
        </div>
    </div>
</div>
    	</c:when>
    	
	<c:when test="${prd.ctPno == 1 }">
	    <!-- 업사이클 -->
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
	        <div class="wrap">
	            <div class="page">
	            
	            </div>
        
            <div class="section">
            	<h3>${prd.prdName }</h3>
            	<form action="./upprdupdate?sCode=${prd.sCode}" id="updetailForm" method="post">
	            	<input type="hidden" name="prdCode" value="${prd.prdCode}">
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
	            			<td><input type="text" name="prdName" value="${prd.prdName }" data-name="상품명"></td>
	            		</tr>
	            		<tr>
	            			<td>가격</td>
	            			<td><input type="text" name="price" value="${prd.price }" data-name="가격"></td>
	            		</tr>
	            		<tr>
	            			<td>재고</td>
	            			<td><input type="number" min="0" name="prdCnt" value="${prd.prdCnt }" data-name="재고"></td>
	            		</tr>
	            		<tr>
	            			<td>상품 상세</td>
	            			<td><input type="text" name="prdDetail" value="${prd.prdDetail }" data-name="상품 상세"></td>
	            		</tr>
		           	</table>
		           	<button type="button"><a href="./sellinglist?sCode=${prd.sCode}">목록</a></button>
		           	<button type="button" id="btnUpdate">수정하기</button>
		           	<button type="button"><a href="./sellinglist?sCode=${prd.sCode}">삭제하기</a></button>
	           	</form>
            </div>
        </div>
    </div>
</div>
    	</c:when>
    </c:choose>
    
    
    
</body>
</html>
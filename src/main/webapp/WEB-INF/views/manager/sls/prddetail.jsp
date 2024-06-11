<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">
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
<style type="text/css">
/* 중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.section_top {
	display: flex;
	align-items: flex-start;
	margin-bottom: 20px;
}

.section img {
	height: 200px;
	width: 200px;
	border-radius: 50%;
	object-fit: cover;
	margin: 20px;
}

.select_img{
	height: 200px;
	width: 200px;
	border-radius: 50%;
	object-fit: cover;
	margin: 20px;
}

.section .deptno_box, .section .mgrName_box, .section .mgrCode_box,
	.section .mgrEntDate_box {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}

label {
	color: #373f57;
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 5px;
	width: 200px;
	text-align: justify;
}

input[type="text"], select {
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
}

.section h3 {
	color: #333;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 5px;
	margin-bottom: 20px;
}

.section_top_privacy {
	padding: 20px;
	margin-left: 20px;
	margin-top: 20px;
	flex: 1;
}

.section_top_privacy div {
	margin-bottom: 10px;
}

/* --------------------------------------- */
/* 색션 하단 */
.section_bot_title {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

.section_bot_itembox {
	width: 500px;
	margin-left: 280px;
}

.section .mgrPhone_box, .section .mgrEmail_box, .section .mgrBirth_box,
	.section .mgrGender_box {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}

/* 파일버튼 디자인 */
.bot_document_filebox {
	display: flex;
	margin-left: 20px;
	margin-bottom: 15px;
}


.bot_document_filebox .file_find {
	text-align: right;
	width: 100px;
}

.bot_document_filebox .file_name{
	overflow: auto;
}

.bot_document_filebox input[type="file"] {
	width: 0;
	height: 0;
	overflow: hidden;
	display: none;
}

.bot_document_filebox .document_file {
	display: inline-block;
	height: 46px;
	padding: 0 10px;
	vertical-align: middle;
	width: 79%;
	color: #999999;
}

.btnRight{
	margin-right: 20px;
}

</style>
<body>



    <c:choose>
	
	<c:when test="${prd.ctPno == 0 }">
    <!-- 리사이클 -->
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
			<sec:authentication var="managerLogin" property="principal"/>
	<c:if test="${managerLogin.deptno eq 10}">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 20}">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 30}">
		<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 40}">
		<c:import url="/WEB-INF/views/layout/manager/managercsmenu.jsp"/>
	</c:if>
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
		           	<button type="button"><a href="./sellinglist?sCode=${prd.sCode}" class="btn btnLeft">목록</a></button>
		           	<button type="button" id="btnUpdate" class="btn btnRight">수정하기</button>
		           	<button type="button"><a href="./sellinglist?sCode=${prd.sCode}" class="btn btnDel">삭제하기</a></button>
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
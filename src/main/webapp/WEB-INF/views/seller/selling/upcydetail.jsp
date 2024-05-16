<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="full">
        <div class="wrap">
            <div class="page">
            
            </div>
        
            <div class="section">
            	<h3>${prd.prdCode }</h3>
            	<form action="./upcyupdate?prdCode=${prd.prdCode}" method="post">
		            <select name="ctPdtNo" id="ctPdtNo">
			           	<option value="0">플라스틱</option>
			           	<option value="1">유리</option>
			           	<option value="2">종이</option>
			           	<option value="3">캔</option>
			           	<option value="4">천</option>
			           	<option value="5">기타</option>
		            </select><br>
		           	<input type="text" name="prdName" value="${prd.prdName }"><br>
		           	<input type="text" name="price" value="${prd.price }"><br>
		           	<input type="number" min="0" name="prdCnt" value="${prd.prdCnt }"><br>
		           	<input type="text" name="prdDetail" value="${prd.prdDetail }"><br>
		           	<button type="button"><a href="./upcylist">목록</a></button>
		           	<button>수정하기</button>
	           	</form>
            </div>
        </div>
    </div>
</body>
</html>
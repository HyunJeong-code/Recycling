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
	
		$("#del_btn").click(function() {
			var arr = new Array();
			arr.push("${prd.prdCode}");
			
			// 체크된 상품이 없을 때 알림
			if(arr.length == 0){
				alert("선택된 상품이 없습니다.");
			}else{
				$.ajax({
					type: "post"
					, url: "./prddel"
					, data: {
						arr: arr 
					}
					, dataType : "Json"
					, success: function(res) {
						console.log("AJAX 성공");
						
						location.href="./sellinglist";
						
						alert("상품이 삭제되었습니다.");
					}
					, error: function() {
						console.log("AJAX 실패");
					}
				}) 
			}
		    console.log(arr);
		}); // #dlt_btn click end
	})
</script>

<body>
	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
    <div class="full">
        <div class="wrap">
            <div class="page">
            
            </div>
        
            <div class="section">
            	<h3>${prd.prdCode }</h3>
            	<form action="./prdupdate?prdCode=${prd.prdCode}" method="post">
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
		           	<input type="text" name="prdDetail" value="${prd.prdDetail }"><br>
		           	<button>수정하기</button>
		           	<button type="button" id="del_btn">삭제하기</button>
		           	<button type="button"><a href="./sellinglist">목록</a></button>
	           	</form>
            </div>
        </div>
    </div>
    <c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
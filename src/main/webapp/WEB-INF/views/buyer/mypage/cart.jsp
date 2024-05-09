<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">

	$(function() {
		$("#ord_btn").click(function() {
			var arr = new Array();
			$('input:checkbox[name=checkList]').each(function () {
		        if($(this).is(":checked")==true){
		        	//let map = new Map();
		        	//map.set("cCode",$(this).attr('id').replace("c",""))
		        	let res = $(this).val();
		        	arr.push(res);
		        }
		    });
		    
			/* $.ajax({
				type: "get"
				, url: "./pay"
				, data: {
					arr: arr 
				}
				, dataType : "Json"
				, success: function(res) {
					console.log("AJAX 성공");
					
					location.href="./pay";
					
				}
				, error: function() {
					console.log("AJAX 실패");
				}
			}) */
		    
		    console.log(arr);
		}); // #ord_btn click end
	}); //$ end
</script>
</head>
<body>

	<form action="./pay" method="get">
	<table>
	
		<thead>
			<tr>
				<th></th>
				<th>카트 코드</th>
				<th>상품 이미지</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
				<th>수량</th>
				<th>총 금액</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cart" items="${list }">
				<tr>
					<td>
						<input type="checkbox" class="checkList" name="checkList" value="${cart.cCode }">
					</td>
			 		<td>${cart.cCode }</td>
			 		<td>${cart.storedName }</td>
			 		<td>${cart.prdName }</td>
			 		<td>${cart.prdFee }</td>
			 		<td>${cart.cCnt }</td>
			 		<td>
			 			${cart.cCnt * cart.prdFee }
			 		</td>
			 	</tr>
			</c:forEach>
		 	
	 	</tbody>
	</table>

	<button id="ord_btn">주문하기</button>
	
	</form>

</body>
</html>
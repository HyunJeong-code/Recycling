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

let sttList = {900: "결제 완료", 910: "배송 준비 중", 920: "배송 중", 930: "배송 완료" 
	, 940: "구매 확정", 950: "거래 완료", 960: "반품", 970: "교환", 980: "취소"}
	

$(function() {
	$("#sttName").text(sttList[${order.sttNo }])
	
	//뒤로가기
	$("#btn_rollback").click(function() {
		history.back();
	})
	
	//송장뒤로가기
	$("#btn_rollbackShip").click(function() {
		history.back();
	})

})

	
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >

		<form action="./orderupdate" method="post">
			<input name="orddtCode" value="${order.orddtCode }" style="display:none">
			<input name="ordCode" value="${order.ordCode }" style="display:none">
			<table>
				<tr>
					<td>주문번호</td>
					<td>${order.orddtCode }</td>
				</tr>
				<tr>
					<td>주문일</td>
					<td>${order.ordDate }</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td>${order.ordName }</td>
				</tr>
				<tr>
					<td>수량</td>
					<td>${order.ordCnt }</td>
				</tr>
				<tr>
					<td>총금액</td>
					<td>${order.ordSum }</td>
				</tr>
				<tr>
					<td>주문자</td>
					<td>
						<input type="text" name="sendName" value="${order.sendName }">
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" name="sendPhone" value="${order.sendPhone }">
					</td>
				</tr>
				<tr>
					<td>배송지</td>
					<td>
						<input type="text" name="ordPostcode" value="${order.ordPostcode }">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" name="ordAddr" value="${order.ordAddr }">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" name="ordDetail" value="${order.ordDetail }">
					</td>
				</tr>
				<tr>
					<td>메모</td>
					<td>${order.ordMemo }</td>
				</tr>
				<tr>
					<td>주문상태</td>
					<td id="sttName"></td>
				</tr>
				<tr>
					<td>택배사</td>
					<td>
						<c:if test="${order.shipName != null}">
			 				${order.shipName }
			 			</c:if>
			 			<c:if test="${order.shipName == null}">
							<select name="shipName">
							    <option value="">택배사 선택</option>
							    <option value="우체국택배">우체국택배</option>
							    <option value="CJ대한통운">CJ대한통운</option>
							    <option value="한진택배">한진택배</option>
							    <option value="로젠택배">로젠택배</option>
							    <option value="롯데택배">롯데택배</option>
							</select>
			 			</c:if>
					</td>
				</tr>
				<tr>
					<td>송장번호</td>
					<td>
						<c:if test="${order.shipNo != 0}">
			 				${order.shipNo }
			 				<button type="button" id ="btn_rollbackShip"><a href="./orderdetail?orddtCode=${order.orddtCode }">송장삭제</a></button>
			 			</c:if>
			 			<c:if test="${order.shipNo == 0}">
			 				<input type="text" name="shipNo">
			 			</c:if>
		 			</td>
				</tr>
			</table>
			
			<div>
				<button type="button" id="btn_rollback">목록으로</a></button>
				<button type="button" id=>수정하기</button>
			</div>
		</form>
	</div>

</div>

	
</body>
</html>
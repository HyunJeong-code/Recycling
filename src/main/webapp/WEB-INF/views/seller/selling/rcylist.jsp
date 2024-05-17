<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

let pdtList = {0:"플라스틱", 1:"유리", 2:"종이", 3:"캔", 4:"천", 5:"기타"}

let sttList = {900: "결제 완료", 910: "배송 준비 중", 920: "배송 중", 930: "배송 완료" 
		, 940: "구매 확정", 950: "거래 완료", 960: "환불", 970: "반품", 980: "취소"}

/* function pdtname(pdtno) {
	switch (pdtno) {
	case 0:
	  	return "플라스틱";
	  	break;
	case 1:
	  	return "유리";
	  	break;
	case 2:
		return "종이";
	  	break;
	case 3:
		return "캔";
	  	break;
	case 4:
		return "천";
	  	break;
	case 5:
		return "기타";
	}
} */


</script>

</head>
<body>

<h1>재활용품 상품 관리</h1>

<table border="1">
    <thead>
        <tr>
            <th></th>
            <th>상품 번호</th>
            <th>제품 분류</th>
            <th>상품 이름</th>
            <th>가격</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${plist}" var="prd">
            <tr>
                <td>
                	<input type="checkbox" class="checkList" name="checkList" value="${prd.prdCode }">
                </td>
                <td>${prd.prdCode}</td>
                <td>
                	<!-- <script>document.write(pdtname(${prd.ctPdtNo}))</script> -->
                	<script>document.write(pdtList[${prd.ctPdtNo}])</script>
                </td>
                <td>${prd.prdName}</td>
                <td>${prd.price}</td>
                <td>
                	<fmt:parseDate value="${prd.prdDate}" var="prdDate" pattern="yyyy-MM-dd HH:mm:ss" />
               		<fmt:formatDate value="${prdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td>${prd.prdHit}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<button>삭제하기</button>


<h1>재활용 판매 관리</h1>
<table border="1">
	<thead>
		<tr>
			<th>주문번호</th>
			<th>상품 이름</th>
			<th>가격</th>
			<th>총금액</th>
			<th>배송 상태</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="order" items="${olist }">
		<tr>
	 		<td>${order.orddtCode }</td>
	 		<td>${order.ordName }</td>
	 		<td>${order.ordPrice }</td>
	 		<td>${order.ordSum }</td>
	 		<td>${order.sttNo }</td>
	 	</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
let pdtList = {0:"플라스틱", 1:"유리", 2:"종이", 3:"캔", 4:"천", 5:"기타"}

let sttList = {900: "결제 완료", 910: "배송 준비 중", 920: "배송 중", 930: "배송 완료" 
	, 940: "구매 확정", 950: "거래 완료", 960: "반품", 970: "교환", 980: "취소"}
	
	
$(function() {
	$("#del_btn").click(function() {
		var arr = new Array();
		var sCodeInputNo = $(".sCode").val();
		
		$('input:checkbox[name=checkList]').each(function () {
	        if($(this).is(":checked")==true){
	        	let res = $(this).val();
	        	arr.push(res);
	        }
	    });
		
		// 체크된 상품이 없을 때 알림
		if(arr.length == 0){
			alert("선택된 상품이 없습니다.");
		}else{
			$.ajax({
				type: "post"
				, url: "./prddel"
				, data: {
					arr: arr 
					,sCode : sCodeInputNo
				}
				, dataType : "Json"
				, success: function(res) {
					console.log("AJAX 성공");
					
					location.href="./sellinglist?sCode=" + sCodeInputNo;
					
					alert("상품이 삭제되었습니다.");
				}
				, error: function() {
					console.log("AJAX 실패");
				}
			}) 
		}
	    console.log(arr);
	}); // #dlt_btn click end
	
	//주문 상태 변경
	$(".updateSttBtn").click(function(e){
		
		//버튼의 주문 상태
		var sttNo = $(this).attr('id');
		var arr = new Array();
		var flag = true;
		var sCodeInputNo = $(this).closest('div').children('.sCode').val();
	    console.log("sCodeInputNo: ", sCodeInputNo);
	    
		$('input:checkbox[name=ordCheckList]').each(function () {
	        if($(this).is(":checked")==true){
	        	if($(this).val() == sttNo){
	        		alert("선택된 주문의 주문 상태를 확인 해주세요.");
	        		flag = false;
	        		return false;
	        	}
	        	let res = $(this).attr('id');
	        	arr.push(res);
	        }
	    });
		
		//주문상태가 같을 때
		if(!flag){
			return false;
		}
		// 체크된 상품이 없을 때 알림
		if(arr.length == 0){
			alert("선택된 상품이 없습니다.");
		}else{
			$.ajax({
				type: "get"
				, url: "./changeorder"
				, data: {
					arr: arr
					, sttNo: sttNo
					, sCode : sCodeInputNo
				}
				, dataType : "Json"
				, success: function(res) {
					console.log("AJAX 성공");
					
					location.href="./sellinglist?sCode=" + sCodeInputNo;
					
					alert("주문"+res.Msg +"되었습니다.");
				}
				, error: function() {
					console.log("AJAX 실패");
				}
			}) 
		}
	}); //.updateSttBtn click end
	
	//송장번호 등록
	$("#shipCreateBtn").click(function() {
		var arr = [];
<<<<<<< HEAD
=======
		var sCodeInputNo = $(this).closest('div').children('.sCode').val();
>>>>>>> TEST
		
		$('input:checkbox[name=ordCheckList]').each(function () {
	        if($(this).is(":checked")==true){
	        	
	        	var checkboxId = $(this).attr('id');

                var parentRow = $(this).closest('tr');

                var shipNameSelect = parentRow.find('select[name="shipName"]').val();
                var shipNoInput = parentRow.find('input[name="shipNo"]').val();
                
	        	
	        	var res = {};
	        	
	        	res.orddtCode = checkboxId;
	        	res.shipName = shipNameSelect;
	        	res.shipNo = shipNoInput;
	        	
	        	arr.push(res);
	        	console.log(res);
	        }
	    });
	
	// 체크된 상품이 없을 때 알림
	if(arr.length == 0){
		var sCodeInputNo = $(this).closest('div').children('.sCode').val();
			alert("선택된 상품이 없습니다.");
		}else{
			$.ajax({
				type: "post"
				, url: "./prdShipform"
				, contentType: "application/json"
				, data: JSON.stringify(arr)
				, sCode : sCodeInputNo
				, dataType : "Json"
				, success: function(res) {
					console.log("AJAX 성공");
					
					location.href="./sellinglist?sCode=" + sCodeInputNo;
					
					alert("송장이 등록되었습니다.");
				}
				, error: function() {
					console.log("AJAX 실패");
				}
			}) 
		}
	    console.log(arr);
	}); // #shipBtn click end
	
	//송장 삭제
	$("#shipDelBtn").click(function() {
		var arr = [];
<<<<<<< HEAD
		
=======
		var sCodeInputNo = $(this).closest('div').children('.sCode').val();
>>>>>>> TEST
		$('input:checkbox[name=ordCheckList]').each(function () {
	        if($(this).is(":checked")==true){
		        if($(this).is(":checked")==true){
		        	let res = $(this).attr('id');
		        	arr.push(res);
		        }
	        }
	    });
		
	// 체크된 상품이 없을 때 알림
	if(arr.length == 0){
		var sCodeInputNo = $(this).closest('div').children('.sCode').val();
			alert("선택된 상품이 없습니다.");
		}else{
			$.ajax({
				type: "post"
				, url: "./shipdel"
				, data: {
					arr: arr
					, sCode : sCodeInputNo
				}
				, dataType : "Json"
				, success: function(res) {
					console.log("AJAX 성공");
					
<<<<<<< HEAD
					location.href="./sellinglist?sCode=" + sCodeInputNo;
=======
					location.href="/manager/sls/sellinglist?sCode=" + sCodeInputNo;
>>>>>>> TEST
					
					alert("송장이 삭제되었습니다.");
				}
				, error: function() {
					console.log("AJAX 실패");
				}
			}) 
		}
	    console.log(arr);
	}); // #shipBtn click end
	
	
	
}); //$ end

</script>
</head>
<body>
	<div class="full">
		<aside>확인</aside>

		<div class="wrap">
			<div class="page">전체 상품 판매관리</div>
			<div class="section">
			
				<div class="search">
					<form action="./sellinglist" method="get">
						<input type="hidden" name="sCtg" value="UP"> <input
							type="text" id="uppersearch" name="search"
							placeholder="검색어를 입력해주세요." class="search">
						<button>검색</button>
					</form>
				</div>

				<table>
					<tr>
						<th>판매자 분류</th>
						<th>판매자 번호</th>
						<th>이름/상호명</th>
						<th>연락처</th>
						<th>이메일</th>
						<!-- 						<th>전체 주문수</th> -->
						<!-- 						<th>판매 상품수</th> -->
					</tr>

					<!-- 개인 -->
					<tr>
						<th><c:choose>
								<c:when test="${selList.B_CT_CODE eq 'P'}">
								개인
							</c:when>
								<c:when test="${selList.B_CT_CODE eq 'C'}">
								기업
							</c:when>
							</c:choose></th>
						<th>${selList.S_CODE }</th>
						<th>${selList.B_NAME }</th>
						<th>${selList.B_PHONE }</th>
						<th>${selList.B_EMAIL }</th>
						<%-- 						<th>${selList. }</th> --%>
						<%-- 						<th>${selList. }</th> --%>
					</tr>

				</table>

				<div class="page">전체 상품관리</div>

				<table>
					<thead>
						<tr>
							<th></th>
							<th>상품번호</th>
							<th>제품분류</th>
							<th>상품상세분류</th>
							<th>제품이름</th>
							<th>재고</th>
							<th>제품가격</th>
							<th>상세조회</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="prdList" items="${prdList }">
							<tr>
								<td><input type="checkbox" class="checkList"
									id="${prdList.prdCode }" name="checkList"></td>
								<td>${prdList.prdCode }</td>
								<td><c:choose>
										<c:when test="${prdList.ctPno == 0 }">
															재활용품
														</c:when>
										<c:when test="${prdList.ctPno == 1 }">
															업사이클링
														</c:when>
									</c:choose></td>
								<td><script>document.write(pdtList[${prdList.ctPdtNo}])</script></td>
								<td><a
									href="/manager/sls/orderdetail?orddtCode=${prdList.orddtCode}">${prdList.prdName }</a></td>
								<td><c:choose>
										<c:when test="${prdList.ctPno == 0 }">
															1
														</c:when>
										<c:when test="${prdList.ctPno == 1 }">
															${prdList.prdCnt }
														</c:when>
									</c:choose></td>
								<td>${prdList.price }</td>

								<td><a
									href="/manager/sls/prddetail?prdCode=${prdList.prdCode }">
										<button class="btn">상세조회</button>
								</a></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<button id="del_btn">삭제하기</button>
				<c:import url="/WEB-INF/views/layout/upperpaging.jsp" />




				<div class="page">전체 판매관리</div>


				<div>
					<input type="hidden" class="sCode" value="${selList.S_CODE }">
					<button class="updateSttBtn" id="900">결제 완료</button>
					<button class="updateSttBtn" id="910">배송 준비 중</button>
					<button class="updateSttBtn" id="920">배송중</button>
					<button class="updateSttBtn" id="930">배송완료</button>
					<button class="updateSttBtn" id="940">구매 확정</button>
					<button class="updateSttBtn" id="960">반품</button>
					<button class="updateSttBtn" id="980">취소</button>
					<button id="shipCreateBtn">송장 직접입력</button>
					<button id="shipDelBtn">송장 삭제</button>
				</div>
				<table border="1">
					<thead>
						<tr>
							<th></th>
							<th>주문번호</th>
							<th>상품 이름</th>
							<th>가격</th>
							<th>총금액</th>
							<th>주문일</th>
							<th>주문 상태</th>
							<th>택배사</th>
							<th>송장번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ord" items="${olist }">
							<tr>
								<td><input type="checkbox" class="ordCheckList"
									name="ordCheckList" id="${ord.orddtCode }" value="${ord.sttNo}">
								</td>
								<td><a href="./orderdetail?orddtCode=${ord.orddtCode}">${ord.orddtCode }</a></td>
								<td>${ord.ordName }</td>
								<td>${ord.ordPrice }</td>
								<td>${ord.ordSum }</td>
								<td><fmt:parseDate value="${ord.ordDate}" var="ordDate"
										pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
										value="${ordDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td id="sttNo"><script>document.write(sttList[${ord.sttNo}])</script></td>
								<td><c:if test="${ord.shipName != null}">
			 				${ord.shipName }
			 			</c:if> <c:if test="${ord.shipName == null}">
										<select name="shipName">
											<option value="">택배사 선택</option>
											<option value="우체국택배">우체국택배</option>
											<option value="CJ대한통운">CJ대한통운</option>
											<option value="한진택배">한진택배</option>
											<option value="로젠택배">로젠택배</option>
											<option value="롯데택배">롯데택배</option>
										</select>
									</c:if></td>
								<td><c:if test="${ord.shipNo != 0}">
			 				${ord.shipNo }
			 			</c:if> <c:if test="${ord.shipNo == 0}">
										<input type="text" name="shipNo">
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<c:import url="/WEB-INF/views/layout/underpaging.jsp" />

			</div>
			<!-- section -->
		</div>
		<!-- wrap -->
	</div>
	<!-- full -->
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">

let sttList = {900: "결제 완료", 910: "배송 준비 중", 920: "배송 중", 930: "배송 완료" 
	, 940: "구매 확정", 950: "거래 완료", 960: "반품", 970: "교환", 980: "취소"}
	
	$(function() {
		$("#sttName").text(sttList[${orderDetail.sttNo }])
		
		var btnCencel = "<button id='980' class='changeOrder'>취소하기</button>";
		var btnReturn = "<button id='960' type='button' data-bs-toggle='modal' data-bs-target='#returnModal'>반품하기</button>";
		var btnChange = "<button id='970' type='button' data-bs-toggle='modal' data-bs-target='#exchangeModal'>교환하기</button>";
		var btnCheck = "<button id='940' class='changeOrder'>구매확정</button>";
		               
		
		if(${orderDetail.sttNo } == 900){
			$("#changeOrder").append(btnCencel);
		}else if(${orderDetail.sttNo } == 910 || ${orderDetail.sttNo } == 920){
			$("#changeOrder").append(btnReturn);
		}else if(${orderDetail.sttNo } == 930){
			$("#changeOrder").append(btnChange);
			$("#changeOrder").append(btnReturn);
			$("#changeOrder").append(btnCheck);
		}
		
		
		$(".changeOrder").click(function() {
			$.ajax({
				type: "post"
				, url: "./chageorder"
				, data: {
					orddtCode : "${orderDetail.orddtCode }",
					sttNo: $(this).attr("id")
				}
				, dataType : "Json"
				, success: function(res) {
					console.log("AJAX 성공");
					
					alert("주문"+res.Msg +"되었습니다.");
					
					location.href="./myorder";
					
				}
				, error: function() {
					console.log("AJAX 실패");
				}
			})
		})
		
	})

</script>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">

		<table>
			<tr>
				<td>주문번호</td>
				<td>${orderDetail.orddtCode }</td>
			</tr>
			<tr>
				<td>주문일</td>
				<td>${order.ordDate }</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>${orderDetail.ordName }</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>${orderDetail.ordCnt }</td>
			</tr>
			<tr>
				<td>총금액</td>
				<td>${orderDetail.ordSum }</td>
			</tr>
			<tr>
				<td>주문자</td>
				<td>${order.ordName }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${order.ordPhone }</td>
			</tr>
			<tr>
				<td>배송지</td>
				<td>${order.ordPostcode }</td>
			</tr>
			<tr>
				<td></td>
				<td>${order.ordAddr }</td>
			</tr>
			<tr>
				<td></td>
				<td>${order.ordDetail }</td>
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
				<td>주문 변경</td>
				<td colspan='3' id="changeOrder">
					<!-- <button type="button" data-bs-toggle="modal" data-bs-target="#exchangeModal">교환하기</button>
					<button type="button" data-bs-toggle="modal" data-bs-target="#returnModal">반품</button> -->
				</td>
			</tr>
		</table>
	
	</div>

    <!-- 교환 모달창 -->
    <div class="modal fade" id="exchangeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="display: table;">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">주문변경</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="./changeOrderCt" method="post">
            <div class="modal-body">
            <input name="orddtCode" value="${orderDetail.orddtCode }" style="display:none">
            <input name="sttNo" value="970" style="display:none">
				<div>
					<table>
						<tr>
							<td>
								교환사유 
							</td>
							<td>
								<select name="ctChgNo">
									<option value="800">단순변심</option>
									<option value="810">파손</option>
									<option value="820">오배송</option>
									<option value="830">배송 지연</option>
									<option value="840">상품 정보 불일치</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								상세내용 
							</td>
							<td>
								<textarea name="chgDt" rows="" cols=""></textarea>
							</td>
						</tr>
					</table>
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button class="btn btn-primary">교환하기</button>
            </div>
            </form>
            </div>
        </div>
    </div>
    
    <!-- 반품 모달창 -->
    <div class="modal fade" id="returnModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="display: table;">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">반품하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="./changeOrderCt" method="post">
            <div class="modal-body">
            <input name="orddtCode" value="${orderDetail.orddtCode }" style="display:none">
            <input name="sttNo" value="960" style="display:none">
				<div>
					<table>
						<tr>
							<td>
								반품사유 
							</td>
							<td>
								<select name="ctChgNo">
									<option value="800">단순변심</option>
									<option value="810">파손</option>
									<option value="820">오배송</option>
									<option value="830">배송 지연</option>
									<option value="840">상품 정보 불일치</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								상세내용 
							</td>
							<td>
								<textarea name="chgDt" rows="" cols=""></textarea>
							</td>
						</tr>
					</table>
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button class="btn btn-primary">반품하기</button>
            </div>
            </form>
            </div>
        </div>
    </div>


	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	

</body>
</html>
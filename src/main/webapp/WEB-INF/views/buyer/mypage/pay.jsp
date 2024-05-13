<%@page import="java.util.List"%>
<%@page import="recycling.dto.buyer.CartOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- gson -->
<%@ page import="com.google.gson.Gson" %>

<!-- clist gson으로 직렬화 하여 가져오기 -->
<%
    List<CartOrder> clist = (List<CartOrder>) request.getAttribute("clist");
    Gson gson = new Gson();
    String jsonData = gson.toJson(clist);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <!-- 결제 API -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    
    <!-- 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <script type="text/javascript">
    
    $(function(){
    	//api 활용하여 주소값 가져오기
        $("#btnPostcode").click(function() {
            
            new daum.Postcode({
                oncomplete : function(data){
                    console.log("우편번호", data.zonecode)
                    
                    console.log("도로명 주소", data.roadAddress)
                    console.log("지번 주소", data.jibunAddress)
                    console.log("사용자 선택", data.userSelectedType)
                    //-------------------------------------------------------

                    //우편번호 적용하기
                    $("#ordPostcode").val(data.zonecode)

                    //-------------------------------------------------------
                    
                    if(data.userSelectedType == 'J'){
                        $("#ordAddr").val(data.jibunAddress)
                    }else if(data.userSelectedType == 'R'){
                        $("#ordAddr").val(data.roadAddress)
                    }
                    
                    //-------------------------------------------------------
                    
                    //상세주소 포커스
                    $("#ordDetail").val("")
                    $("#ordDetail").focus()

                    //닫기 버튼 누르기
                    $('.modal').modal('hide');

                }
            // }).open()
            }).embed(postcodeWrap)

            //--------------------------------------------------------------
            //우편번호 div 보여주기
            $("#postcodeWrap").css("display","block")

        }) // $("#btnPostcode").click end

        //닫기 버튼 구현
        //$(".closeIcon").click(function() {
        //})
    })
    
    //const myModal = document.getElementById('myModal')
    //const myInput = document.getElementById('myInput')

    //myModal.addEventListener('shown.bs.modal', () => {
    //  myInput.focus()
    //})
    

        //가맹점 식별코드 초기화
        IMP.init('imp40731343')

        //json 데이터 가져오기
        var clist = <%= jsonData %>;
	    console.log(clist);
	    
	    let cartList = new Array();
	    let sCodeList = [];
	    let prdName = "";
	    let ordFee = 0;
	    let prdAmount = 0;
	    
	    for(let i = 0; i < clist.length; i++) {
	    	if(i !== 0){
	    		prdName += ","
	    	}
	    	prdName += clist[i].prdName;
	    	
	    	let prdFee = clist[i].prdFee;
	    	
	    	//같은 판매자의 상품을 여러개 구매할 경우 배송비 1번만 청구 
	    	for(let i = 0; i < sCodeList.length; i++){
	    		if(sCodeList[i] == clist[i].sCode){
	    			prdFee = 0;
	    		}
	    	}
	    	
	    	ordFee += prdFee;
	        
	    	prdAmount += clist[i].price * clist[i].cCnt + prdFee;
	    	
	    	sCodeList.push(clist[i].sCode);
	    	cartList.push(clist[i].cCode);
	    }
	    
	    console.log(prdName);
	    $(function(){
	    	$("#prdAmount").html(prdAmount);	    	
	    });
	    console.log(prdAmount);
	    
	    console.log(cartList);
	    

        function requestPay(){
        	var payOption = $("input:radio[name=payOption]:checked").attr("id");
            IMP.request_pay({
            pg: payOption, // PG사
            pay_method: "card", //결제 수단 (필수)
            merchant_uid: 'ORD' + new Date().getTime(),   // 주문번호
            name: prdName,             // 주문 상품 이름
            amount: prdAmount,                        // 결제 금액 (필수)

            buyer_name: $("#ordName").val(), 		// 주문자 정보들                   
            buyer_tel: $("#ordPhone").val(),
            buyer_addr: $("#ordAddr").val(),
            buyer_postcode: $("#ordPostcode").val()
            }, function (rsp) { // callback
                //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                
			  	/* $.post("test_data",
				  {
				    amount: $("#amount").val(),
				    rsp: rsp
				  },
				  function(data, status){
				    alert("Data: " + data + "\nStatus: " + status);
				  }); */

                console.log(rsp)
                
                //결제 성공시
                if(rsp.success){
                	//$("#order_form").submit();
                	
                	$.ajax({
            			type: "post"
            			, url: "./pay"
            			, data: {
            				ordCode: rsp.merchant_uid,
            				ordPay: rsp.pay_method,
            				sendName: $("#ordName").val(),
            				sendPhone: $("#ordPhone").val(),
            				ordPostcode: $("#ordPostcode").val(),
            				ordAddr: $("#ordAddr").val(),
            				ordDetail: $("#ordDetail").val(),
            				ordMemo: $("#ordMemo").val(),
            				ordSum: prdAmount,
            				ordFee: ordFee,
            				cartList: cartList
            			}
            			, dataType : "Json"
            			, success: function(res) {
            				console.log("AJAX 성공");
            				
            				//window.location.replace("./payinfo");
            				//window.location.replace("./payinfo?ordCode=${order.ordCode }");
            		        window.location.href = "./payinfo?ordCode=" + res.order.ordCode;

            			}
            			, error: function() {
            				console.log("AJAX 실패");
            			}
            	})
                //결제 실패시
                } else {
                	alert("결제실패");
                	console.log("결제실패"+rsp)
                }

/*                 $("<form>")
                    .attr("action","")
                    .attr("method","post")
                    .append(
                        $("<input>")
                        .attr({
                            type: "text"
                            , name: "imp_uid"
                            , value: rsp.imp_uid
                        }))
                    .append(
                        $("<input>")
                        .attr({
                            type: "text"
                            , name: "merchant_uid"
                            , value: rsp.merchant_uid
                        }))
                    .appendTo($(document.body))
                    .submit() */ 
            });
        }
    
    </script>
</head>
<body>

<h1>주문하기</h1>
<hr>

<table>
	
		<thead>
			<tr>
				<th>카트 코드</th>
				<th>상품 이미지</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
				<th>배송비</th>
				<th>수량</th>
				<th>총 금액</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cart" items="${clist }">
				<tr>
			 		<td>${cart.cCode }</td>
			 		<td>${cart.storedName }</td>
			 		<td>${cart.prdName }</td>
			 		<td>${cart.price }</td>
			 		<td>${cart.prdFee }</td>
			 		<td>${cart.cCnt }</td>
			 		<td>
			 			${cart.cCnt * cart.price + cart.prdFee }
			 		</td>
			 	</tr>
			</c:forEach>
		 	
	 	</tbody>
	</table>

상품: <span id="product_name">친환경 컵</span>

<br><br>
<form id="order_form" action="./pay" method="post">
<label>이름
	<input type="text" name="ordName" id="ordName" value="${buyer.adrName }">
</label><br>
<label>연락처
	<input type="text" name="ordPhone" id="ordPhone" value="${buyer.adrPhone }">
</label><br>
<!-- 클릭시 주소 모달창 활성화 -->
<button type="button" id="btnPostcode" data-bs-toggle="modal" data-bs-target="#exampleModal">주소 찾기</button>
<label>우편 번호
	<input type="text" name="ordPostcode" id="ordPostcode" value="${buyer.adrPostcode }">
</label><br>
<label>배송 주소
	<input type="text" name="ordAddr" id="ordAddr" value="${buyer.adrAddr }">
</label><br>
<label>상세 주소
	<input type="text" name="ordDetail" id="ordDetail" value="${buyer.adrDetail }">
</label><br>
<label>메모
	<input type="text" name="ordMemo" id="ordMemo">
</label><br>

<h3>총 가격: <span id="prdAmount"></span></h3>

<br>
</form>

<div id="payOption">
	<label>신용카드</label><input type="radio" id="html5_inicis" name="payOption" checked="checked"></label>
	<label>토스페이</label><input type="radio" id="tosspay" name="payOption"></label>
	<label>카카오페이</label><input type="radio" id="kakaopay" name="payOption"></label>
</div>

<button type="button" onclick="requestPay();">결제하기</button>

<!-- 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="display: table;">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
	      <div id="postcodeWrap">
	      </div>
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
    </div>
  </div>
</div>
</body>
</html>
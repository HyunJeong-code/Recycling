<%@page import="java.util.List"%>
<%@page import="recycling.dto.buyer.CartOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- gson -->
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- pay css -->
	<link rel="stylesheet" href="/resources/css/pay.css">

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
		
        
    }) //$ end
    
        //가맹점 식별코드 초기화
        IMP.init('imp40731343')

        function requestPay(){
        	var payOption = $("input:radio[name=payOption]:checked").attr("id");
            IMP.request_pay({
            pg: payOption, // PG사
            pay_method: "card", //결제 수단 (필수)
            merchant_uid: 'ORD' + new Date().getTime(),   // 주문번호
            name: "${prd.prdName}",             // 주문 상품 이름
            amount: ${prd.price},                        // 결제 금액 (필수)

            buyer_name: "${buyer.bName }", 		// 주문자 정보들                   
            buyer_tel: "${buyer.bPhone }",
            }, function (rsp) { // callback
                //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                
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
            				sendName: "${buyer.bName }",
            				sendPhone: "${buyer.bPhone }",
            				ordPostcode: '-',
            				ordAddr: '-',
            				ordDetail: '-',
            				ordMemo: '-',
            				ordCnt: 1,
            				ordSum: ${prd.price},
            				ordFee: 0,
            				prdCode: "${prd.prdCode}"
            			}
            			, dataType : "Json"
            			, success: function(res) {
            				console.log("AJAX 성공");
            				
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

            });
        }
    
    </script>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

    <div class="full">
        <div class="title">
            <h1>주문하기</h1>
        </div>

        <hr class="top-hr">

        <div class="page-header">
            <h5>주문정보</h5>
        </div>
        <table class="order-table">
            <thead>
                <tr>
                    <th>이미지</th>
                    <th>상품명</th>
                    <th>상품 가격</th>
                    <th>총 금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${prd.storedName }</td>
                    <td>${prd.prdName }</td>
                    <td>${prd.price }</td>
                    <td>
                        ${prd.price}
                    </td>
                </tr>
            </tbody>
        </table>
        <br>

        <hr class="top-hr">

        <div class="page-header">
            <h5>구매자 정보</h5>
        </div>

        <div class="buyer-info">
            <div class="form-group">
                <h6>이름 : </h6>
                <span>${buyer.bName }</span>
            </div>
            <div class="form-group">
                <h6>전화번호 : </h6>
                <span>${buyer.bPhone }</span>
            </div>
        </div>

        <hr class="top-hr">


        <div class="adr-info">


            <div class="order-info">
                <div class="sum-price">
                    <h3>가격: ${prd.price}</h3>
                    <h3>총 가격: ${prd.price}</h3>
                </div>

            </div>       

        </div>


        <hr class="top-hr">

        <div class="page-header">
            <h5>결제 방법</h5>
        </div>

        <div id="payOption">
            <label>신용카드</label><input type="radio" id="html5_inicis" name="payOption" checked="checked"></label>
            <label>토스페이</label><input type="radio" id="tosspay" name="payOption"></label>
            <label>카카오페이</label><input type="radio" id="kakaopay" name="payOption"></label>
        </div>

        <button type="button" id="btnPay" onclick="requestPay();">결제하기</button>

    </div>
    
    <c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
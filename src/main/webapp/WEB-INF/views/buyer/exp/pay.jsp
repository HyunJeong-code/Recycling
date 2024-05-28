<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>


    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- 결제 API -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>

    <script type="text/javascript">
    

    var resExpName = ${res}
        //가맹점 식별코드 초기화
        IMP.init('imp40731343')

        function requestPay(){
            var payOption = $("input:radio[name=payOption]:checked").attr("id");    //결제 PG사
            var payMethod = $("input:radio[name=payOption]:checked").val();         //결제수단
            IMP.request_pay({
            pg: payOption, // PG사
            pay_method: payMethod, //결제 수단 (필수)
            merchant_uid: 'RES' + new Date().getTime(),   // 주문번호
            name: resExpName,             // 주문 상품 이름 (입력)
            amount: resSum,                        // 결제 금액 (입력)

            buyer_name: $("#ordName").val(),       // 주문자 정보들                   
            buyer_tel: $("#ordPhone").val()
            }, function (rsp) { // callback
                
                console.log(rsp)
                
                //결제 성공시
                if(rsp.success){
                    $.ajax({
                        type: "post"
                        , url: "./pay"
                        , data: {
                            resCode: rsp.merchant_uid,
                            resPay: rsp.pay_method,
                            resName: $("#ordName").val(), //(입력)
                            resPhone: $("#ordPhone").val(), //(입력)
                            resprice: rsp.amount
                        }
                        , dataType : "Json"
                        , success: function(res) {
                            console.log("AJAX 성공");
                            
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
        <div class="pay">
            <div class="page-header">
                <h5>결제 방법</h5>
            </div>

            <div id="payOption">
                <label>신용카드<input type="radio" id="html5_inicis" name="payOption" checked="checked"></label>
                <label>토스페이<input type="radio" id="tosspay" name="payOption"></label>
                <label>카카오페이<input type="radio" id="kakaopay" name="payOption"></label>
            </div>

            <button type="button" id="btnPay" onclick="requestPay();">결제하기</button>
        </div>
    </body>
</html>
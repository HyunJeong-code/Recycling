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
    String buyeradrJson = gson.toJson(request.getAttribute("buyeradr"));
%>
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

		
		//배송지 입력 체크시
		$("#adrChk input").change(function() {
            if ($(this).is(':checked')) {
            	
            	if($(this).val() == -1){
                    $("#ordName").val("");
                    $("#ordPhone").val("");
                    $("#ordPostcode").val("");
                    $("#ordAddr").val("");
                    $("#ordDetail").val("");
                    return ;
            	}
            	
                var i = $(this).val();
                var buyeradr = JSON.parse('<%= buyeradrJson %>');
                console.log(buyeradr[i].adrDetail);

                $("#ordName").val(buyeradr[i].adrName);
                $("#ordPhone").val(buyeradr[i].adrPhone);
                $("#ordPostcode").val(buyeradr[i].adrPostcode);
                $("#ordAddr").val(buyeradr[i].adrAddr);
                $("#ordDetail").val(buyeradr[i].adrDetail);
                
            }
        });
        
    }) //$ end
    
    

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
	    	$("#ordFee").html(ordFee);
	    });
	    console.log(prdAmount);
	    
	    console.log(cartList);
	    

        function requestPay(){
        	//order_form
        	var isRight = true;
            $("#orderForm").find("input[type=text]").each(function(index, item){
                // 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
                if ($(this).val().trim() == '' && $(this).attr('id') != "ordMemo") {
                    alert($(this).attr("data-name")+" 항목을 입력하세요.");
                    isRight = false;
                    return false;
                }
            });
            
            //값이 전부 있으면 결제
            if (!isRight) {
            	return false;
            } else {
	        	var payOption = $("input:radio[name=payOption]:checked").attr("id");
	        	var payMethod = $("input:radio[name=payOption]:checked").val();
	            IMP.request_pay({
	            pg: payOption, // PG사
	            pay_method: payMethod, //결제 수단 (필수)
	            merchant_uid: 'ORD' + new Date().getTime(),   // 주문번호
	            name: prdName,             // 주문 상품 이름
	            amount: prdAmount,                        // 결제 금액 (필수)
	
	            buyer_name: $("#ordName").val(), 		// 주문자 정보들                   
	            buyer_tel: $("#ordPhone").val(),
	            buyer_addr: $("#ordAddr").val(),
	            buyer_postcode: $("#ordPostcode").val()
	            }, function (rsp) { // callback
	                //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	                
	                console.log(rsp)
	                
	                //결제 성공시
	                if(rsp.success){
	                	
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

            	});
            }
        }
    
    </script>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
	
	<div class="full">
        <div class="page-header">
            <h3>주문하기</h3>
        </div>

        <hr class="top-hr">

		<div class="page-header">
            <h5>주문정보</h5>
        </div>
		<table class="order-table">
			
			<thead>
				<tr>
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
				 		<td>
				 			<img alt="${cart.prdName }" src="/resources/image/${cart.originName }">
				 		</td>
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

        <hr class="top-hr">

        <div class="page-header">
            <h5>배송지 입력</h5>
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

        <div class="page-header">
            <h5>배송지 입력</h5>
        </div>

        <div class="adr-info">
            <div id="adrChk">
                <c:forEach var="adr" varStatus="status" items="${buyeradr }">
                    <label for="${adr.adrCode }">
                        ${adr.adrPostcode }
                        ${adr.adrAddr }
                        ${adr.adrDetail }
                    </label>
                    <c:choose>
                        <c:when test="${status.index == 0}">
                            <input type="radio" id="${adr.adrCode }" name="adr" value="${status.index }" checked>
                        </c:when>
                        <c:otherwise>
                            <input type="radio" id="${adr.adrCode }" name="adr" value="${status.index }">
                        </c:otherwise>
                    </c:choose>
                    <br>
                </c:forEach>
                <label for>직접입력</label>
                <input type="radio" name="adr" value="-1">

            </div>

            <div class="order-info">
                <div>
                    <form id="orderForm" action="./pay" method="post">
                        <div class="form-group">
                            <label for="ordName">받는 사람</label>
                            <input type="text" name="ordName" id="ordName" value="${buyeradr[0].adrName }" data-name="받는 사람">
                        </div>
                        <div class="form-group">
                            <label for="ordPhone">연락처</label>
                            <input type="text" name="ordPhone" id="ordPhone" value="${buyeradr[0].adrPhone }" data-name="연락처">
                        </div>
                        <!-- 클릭시 주소 모달창 활성화 -->
                        
                        <div class="form-group">
                            <label for="ordPostcode">우편 번호</label>
                            <input type="text" name="ordPostcode" id="ordPostcode" value="${buyeradr[0].adrPostcode }"  data-name="우편번호">
                            <button type="button" id="btnPostcode" data-bs-toggle="modal" data-bs-target="#exampleModal">주소 찾기</button>
                        </div>
                        <div class="form-group">
                            <label for="ordAddr">배송 주소</label>
                            <input type="text" name="ordAddr" id="ordAddr" value="${buyeradr[0].adrAddr }" data-name="배송 주소">
                        </div>
                        <div class="form-group">
                            <label for="ordPostcode">상세 주소</label>
                            <input type="text" name="ordDetail" id="ordDetail" value="${buyeradr[0].adrDetail }"  data-name="상세 주소">
                        </div>
                        <div class="form-group">
                            <label for="ordMemo">메모</label>
                            <input type="text" name="ordMemo" id="ordMemo">
                        </div>
                        
                    </form>
                </div>


                <div class="sum-price">
                    <h3>배송비: <span id="ordFee"></span></h3>
                    <h3>총 가격: <span id="prdAmount"></span></h3>
                </div>

            </div>       

        </div>
        <hr class="top-hr">

        <div class="page-header">
            <h5>결제 방법</h5>
        </div>
		
		<table class="view-table">
			<tr>
				<td>결제 수단</td>
				<td>
			        <div id="payOption">
			            <label>신용카드</label><input type="radio" id="html5_inicis" name="payOption" value="card" checked="checked"></label>
			            <label>토스페이</label><input type="radio" id="tosspay" name="payOption" value="tosspay"></label>
			            <label>카카오페이</label><input type="radio" id="kakaopay" name="payOption" value="kakaopay"></label>
			        </div>
		        </td>
	        </tr>
        </table>
		<div class="btnBox">
        	<button type="button" id="btnPay" class="btn btnRight" onclick="requestPay();">결제하기</button>
        </div>
        
    </div>



    <!-- 모달창 -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="display: table;">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">주소 찾기</h1>
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
    
    <c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
    
</body>
</html>
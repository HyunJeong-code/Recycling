<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험단 예약</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- 결제 API -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="/resources/css/pay.css">
<style type="text/css">

.wrap {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

h1 {
    font-size: 28px;
    margin-bottom: 20px;
    color: #333;
    text-align: center;
}

.form-label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #555;
}

.form-control, .form-select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-bottom: 15px;
}

.form-control:focus, .form-select:focus {
    border-color: #66afe9;
    outline: none;
    box-shadow: 0 0 5px rgba(102, 175, 233, 0.5);
}

.mb-3 {
    margin-bottom: 20px;
}

.pay {
    margin-top: 30px;
}

.page-header h5 {
    font-size: 20px;
    margin-bottom: 15px;
    color: #333;
}

#payOption {
    margin-bottom: 15px;
}

#payOption label {
    display: inline-block;
    margin-right: 20px;
    font-size: 14px;
    color: #555;
}

#payOption input[type="radio"] {
    margin-right: 5px;
}

.btnRight {
    cursor: pointer;
}

.btn:hover {
    background-color: #0056b3;
}

.btn:disabled {
    background-color: #ccc;
    cursor: not-allowed;
}

input[type="hidden"] {
    display: none;
}

</style>
<script type="text/javascript">
function setResDateTime() {
    var selectedOption = document.getElementById('expSchList').options[document.getElementById('expSchList').selectedIndex];
    var selectedDate = selectedOption.getAttribute('data-date');
    var selectedTime = selectedOption.getAttribute('data-time');
    var maxCnt = selectedOption.getAttribute('data-maxcnt');

    document.getElementById('resDate').value = selectedDate;
    document.getElementById('resTime').value = selectedTime;

    // 예약 인원 선택 옵션 갱신
    var resCntSelect = document.getElementById('resCnt');
    resCntSelect.innerHTML = ''; // 기존 옵션 제거
    for (var i = 1; i <= maxCnt; i++) {
        var option = document.createElement('option');
        option.value = i;
        option.text = i + '명';
        resCntSelect.appendChild(option);
    }
    updateResSum(); // 초기 선택 값에 대한 총 금액 갱신
}

function updateResSum() {
    var resCnt = document.getElementById('resCnt').value;
    var resPrice = document.getElementById('resPrice').value;
    var totalPrice = resCnt * resPrice;
    document.getElementById('resSum').value = totalPrice;
}

window.onload = function() {
    document.getElementById('resCnt').addEventListener('change', updateResSum);
    document.getElementById('expSchList').addEventListener('change', setResDateTime);
    // 초기 선택 값을 기준으로 총 금액 갱신
    setResDateTime();
}

var resExpName = "${exp.expName}"

// 가맹점 식별코드 초기화
IMP.init('imp40731343')

function requestPay() {
    var resSum = document.getElementById('resSum').value; // 총 금액 가져오기
    var payOption = $("input:radio[name=payOption]:checked").attr("id");    // 결제 PG사
    var payMethod = $("input:radio[name=payOption]:checked").val();         // 결제수단
    IMP.request_pay({
        pg: payOption, // PG사
        pay_method: payMethod, // 결제 수단 (필수)
        merchant_uid: 'RES' + new Date().getTime(),   // 주문번호
        name: resExpName,             // 주문 상품 이름 (입력)
        amount: resSum,                        // 결제 금액 (입력)

        buyer_name: $("#ordName").val(),       // 주문자 정보들                   
        buyer_tel: $("#ordPhone").val()
    }, function (rsp) { // callback
        
        console.log(rsp)
        
        // 결제 성공시
        if (rsp.success) {
            $.ajax({
                type: "post",
                url: "./pay",
                data: {
                    resCode: rsp.merchant_uid,
                    resPay: rsp.pay_method,
                    resName: $("#resName").val(),
                    resPhone: $("#resPhone").val(),
                    resEmail: $("#resEmail").val(),
                    resCnt: $("#resCnt").val(),
                    resPrice: $("#resPrice").val(),
                    resSum: $("#resSum").val(),
                    schNo: $("#expSchList").val()
                },
                dataType: "json",
                success: function(res) {
                    console.log("AJAX 성공");
                    window.location.href = "./payinfo?resCode=" + res.expRes.resCode;
                },
                error: function() {
                    console.log("AJAX 실패");
                }
            });
        } else {
            alert("결제 실패");
            console.log("결제 실패: " + rsp.error_msg);
        }
    });
}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">

<div class="wrap">
    <h1>체험단 예약</h1>
    <form action="./expresform" method="post">
        <div class="mb-3">
            <label for="expSchList" class="form-label">예약 날짜 및 시간</label>
            <select id="expSchList" name="schNo" class="form-select" required>
                <c:forEach var="expSch" items="${expSchList}">
                    <option id="${expSch.schNo}" value="${expSch.schNo}" data-date="${expSch.schDate}" data-time="${expSch.schTime}" data-maxcnt="${expSch.schCnt}">
                        <fmt:parseDate value="${expSch.schDate}" var="schDate" pattern="yyyy-MM-dd HH:mm:ss" />
                        <fmt:formatDate value="${schDate}" pattern="yyyy-MM-dd"/>
                        / ${expSch.schTime} (잔여 인원: ${expSch.schCnt})
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="resName" class="form-label">예약자 이름</label>
            <input type="text" class="form-control" id="resName" name="resName" value="${buyer.bName}" required>
        </div>
        <div class="mb-3">
            <label for="resPhone" class="form-label">예약자 연락처</label>
            <input type="text" class="form-control" id="resPhone" name="resPhone" value="${buyer.bPhone}" required>
        </div>
        <div class="mb-3">
            <label for="resEmail" class="form-label">예약자 이메일</label>
            <input type="email" class="form-control" id="resEmail" name="resEmail" value="${buyer.bEmail}" required>
        </div>
        <div class="mb-3">
            <label for="resCnt" class="form-label">예약 인원</label>
            <select id="resCnt" name="resCnt" class="form-select" required>
                <!-- 예약 가능한 인원수가 동적으로 여기에 채워집니다 -->
            </select>
        </div>
        <input type="hidden" id="resDate" name="resDate">
        <input type="hidden" id="resTime" name="resTime">
        <input type="hidden" id="resPrice" value="${resPrice}">
        <div class="mb-3">
            <label for="resSum" class="form-label">총 금액</label>
            <input type="text" class="form-control" id="resSum" name="resSum" readonly>
        </div>
        
        <div class="pay">
            <div class="page-header">
                <h5>결제 방법</h5>
            </div>

            <div id="payOption">
                <label>신용카드<input type="radio" id="html5_inicis" name="payOption" value="card" checked="checked"></label>
                <label>토스페이<input type="radio" id="tosspay" name="payOption" value="trans"></label>
                <label>카카오페이<input type="radio" id="kakaopay" name="payOption" value="kakaopay"></label>
            </div>

            <button class="btnRight" type="button" id="btnPay" onclick="requestPay();">신청하기</button>
            
        </div>
    </form>
</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
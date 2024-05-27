<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


<script type="text/javascript">
function setResDateTime() {
    var selectedOption = document.getElementById('expSchList').options[document.getElementById('expSchList').selectedIndex];
    var selectedDate = selectedOption.getAttribute('data-date');
    var selectedTime = selectedOption.getAttribute('data-time');
    
    document.getElementById('resDate').value = selectedDate;
    document.getElementById('resTime').value = selectedTime;
}

function updateResSum() {
    var resCnt = document.getElementById('resCnt').value;
    var resPrice = document.getElementById('resPrice').value;
    var totalPrice = resCnt * resPrice;
    document.getElementById('resSum').value = totalPrice;
}

window.onload = function() {
    document.getElementById('resCnt').addEventListener('change', updateResSum);
    // 초기 로드 시 1명으로 설정된 값을 기반으로 총 금액을 계산하여 표시
    updateResSum();
}

</script>
</head>
<body>
<div class="container">
    <h1>체험단 예약하기</h1>
    <form action="./expresform" method="post">
        <div class="mb-3">
            <label for="expSchList" class="form-label">예약 날짜 및 시간</label>
            <select id="expSchList" name="schNo" class="form-select" required onchange="setResDateTime()">
                <c:forEach var="expSch" items="${expSchList}">
                    <option value="${expSch.schNo}" data-date="${expSch.schDate}" data-time="${expSch.schTime}">
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
                <c:forEach var="i" begin="1" end="10">
                    <option value="${i}" ${i == 1 ? 'selected' : ''}>${i}명</option>
                </c:forEach>
            </select>
        </div>
        <input type="hidden" id="resDate" name="resDate">
        <input type="hidden" id="resTime" name="resTime">
        <div class="mb-3">
            <label for="resSum" class="form-label">총 금액</label>
            <input type="hidden" id="resPrice" value="${resPrice}">
            <input type="text" class="form-control" id="resSum" name="resSum" readonly>
        </div>
        <button type="submit" class="btn btn-primary">예약하기</button>
    </form>
</div>
</body>
</html>

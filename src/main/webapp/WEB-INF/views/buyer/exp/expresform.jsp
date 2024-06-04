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
</script>
</head>
<body>
<div class="container">
    <h1>체험단 예약하기</h1>
    <form action="./expresform" method="post">
        <div class="mb-3">
            <label for="expSchList" class="form-label">예약 날짜 및 시간</label>
            <select id="expSchList" name="schNo" class="form-select" required>
                <c:forEach var="expSch" items="${expSchList}">
                    <option value="${expSch.schNo}" data-date="${expSch.schDate}" data-time="${expSch.schTime}" data-maxcnt="${expSch.schCnt}">
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
        <button type="submit" class="btn btn-primary">예약하기</button>
    </form>
</div>
</body>
</html>

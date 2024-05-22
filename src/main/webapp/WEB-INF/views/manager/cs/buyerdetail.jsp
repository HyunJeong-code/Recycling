<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    function checkDelete(bCode) {
        if (confirm("삭제하시겠습니까?")) {
            // 확인을 선택한 경우, 삭제 요청을 서버로 전송
            var bOutValue = 'Y';
            var bOutDateValue = new Date().toISOString().slice(0, 10);
            var url = "./buyerdel?bCode=" + bCode + "&bOut=" + bOutValue + "&bOutDate=" + bOutDateValue;
            window.location.href = url;
        }
    }
</script>
</head>
<body>

    <h1>구매자 상세정보</h1>
    <hr>
    
    <h3>번호: ${buyer.bCode }</h3>
    
    <a href="./buyerupdate?bCode=${buyer.bCode }"><button>수정</button></a>
    <button onclick="checkDelete('${buyer.bCode}')">삭제</button>

    <a href="./buyerlist"><button>목록</button></a>
    
    <input type="hidden" id="bOut" name="bOut" value="Y">
    <input type="hidden" id="bOutDate" name="bOutDate" value="">
    
    <input type="hidden" id="bCode" name="bCode" value="${buyer.bCode }">
    
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myAddr</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
function execDaumPostcode(targetPostcode, targetAddress, targetDetail) {
    var postcodeElem = document.getElementById(targetPostcode);
    var addressElem = document.getElementById(targetAddress);
    var detailElem = document.getElementById(targetDetail);

    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.userSelectedType === 'R' ? data.roadAddress : data.jibunAddress;
            if (data.userSelectedType === 'R' && data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                addr += ' (' + data.bname + ')';
            }
            postcodeElem.value = data.zonecode;
            addressElem.value = addr;
            detailElem.focus();
        }
    }).open();
}

function toggleVisibility(elementId) {
	
	var element = document.getElementById(elementId);
	
	if(element.style.display === "none") {
		
		element.style.display = "block";
		
	} else {
		
		element.style.display = "none";
		
	}
	
}

function cancelForm() {
	
	window.history.back();
	
}

</script>

<style type="text/css">
.addr-field {
	width: 300px;
}
</style>

</head>
<body>
	<div class="full">
		<div class="wrap">
			<h2>배송지 관리</h2>
			<hr>
			<div class="page">
				<c:if test="${not empty buyerAdrList }">
					<h3>기본 배송지</h3>
					<form action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post">
						<c:forEach var="addr" items="${buyerAdrList }" begin="0" end="0">
							<input type="hidden" name="action" value="update">
							<input type="hidden" name="adrCode" value="${addr.adrCode }">
				
							<label for="adrName">받는 사람 </label>
							<input type="text" id="adrName" name="adrName" value="${addr.adrName }" required><br>
				
							<label for="adrPhone">연락처 </label>
							<input type="text" id="adrPhone" name="adrPhone" value="${addr.adrPhone }" required><br>
				
							<label for="adrPostcode">우편번호 </label>
							<input type="text" id="adrPostcodeEdit" name="adrPostcode" value="${addr.adrPostcode }" required>
							<input type="button" value="우편번호 찾기" onclick="execDaumPostcode('adrPostcodeEdit', 'adrAddrEdit', 'adrDetailEdit')"><br>
				
							<label for="adrAddr">배송 주소 </label>
							<input type="text" id="adrAddrEdit" name="adrAddr" class="addr-field" value="${addr.adrAddr }" required><br>
				
							<label for="adrDetail">상세 주소 </label>
							<input type="text" id="adrDetailEdit" name="adrDetail" class="addr-field" value="${addr.adrDetail }" required><br>
				
							<input type="submit" value="수정하기">
						</c:forEach>
					</form>
					<hr>
					<h3>추가 배송지</h3>
					<c:forEach var="addr" items="${buyerAdrList }" begin="1">
						<form action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post">
							<input type="hidden" name="action" value="register">
							<input type="hidden" name="adrCode" value="${addr.adrCode }">
							
							<label for="adrName">받는 사람 </label>
							<input type="text" id="adrName" name="adrName" value="${addr.adrName }" required><br>
				
							<label for="adrPhone">연락처 </label>
							<input type="text" id="adrPhone" name="adrPhone" value="${addr.adrPhone }" required><br>
				
							<label for="adrPostcode">우편번호 </label>
							<input type="text" id="adrPostcodeEdit" name="adrPostcode" value="${addr.adrPostcode }" required>
							<input type="button" value="우편번호 찾기" onclick="execDaumPostcode('adrPostcodeEdit', 'adrAddrEdit', 'adrDetailEdit')"><br>
				
							<label for="adrAddr">배송 주소 </label>
							<input type="text" id="adrAddrEdit" name="adrAddr" class="addr-field" value="${addr.adrAddr }" required><br>
				
							<label for="adrDetail">상세 주소 </label>
							<input type="text" id="adrDetailEdit" name="adrDetail" class="addr-field" value="${addr.adrDetail }" required><br>
							
							<input type="submit" value="수정하기">
						</form>
					</c:forEach>
					<c:if test="${buyerAdrList.size() < 2 }">
						<p>추가 배송지가 없습니다.</p>	
					</c:if>
				</c:if>
				
				<input type="button" value="추가 배송지 등록하기" onclick="toggleVisibility('addForm')"><br><br>
				
				<div id="addForm" style="display: none;">
					<h3>새 배송지 추가</h3>
					<form action="${pageContext.request.contextPath}/buyer/mypage/myaddr" method="post">
						<input type="hidden" name='action' value="register">
							
						<label for="adrName">받는 사람 </label>
						<input type="text" id="adrNameAdd" name="adrName" required><br>
							
						<label for="adrPhone">연락처 </label>
						<input type="text" id="adrPhoneAdd" name="adrPhone" required><br>
							
						<label for="adrPostcode">우편번호 </label>
						<input type="text" id="adrPostcodeAdd" name="adrPostcode" required>
						<input type="button" value="우편번호 찾기" onclick="execDaumPostcode('adrPostcodeAdd', 'adrAddrAdd', 'adrDetailAdd')"><br>
							
						<label for="adrAddr">배송 주소 </label>
						<input type="text" id="adrAddrAdd" name="adrAddr" class="addr-field" required><br>
							
						<label for="adrDetail">상세 주소 </label>
						<input type="text" id="adrDetailAdd" name="adrDetail" class="addr-field" required><br>
							
						<input type="submit" value="등록하기">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
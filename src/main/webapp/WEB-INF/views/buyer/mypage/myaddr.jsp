<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myAddr</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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

function showAlert(message) {
	
	alert(message);
	
}

function deleteAdr(adrCode) {
	
	if(confirm("정말 삭제하시겠습니까?")) {
		$.post('${pageContext.request.contextPath }/buyer/mypage/myaddr', 
				{ action: 'delete', adrCode: adrCode }, 
				function(response) {
			location.reload();
		});
	}
	
}

function setDefaultAdr(adrCode) {
	
    $.post('${pageContext.request.contextPath}/buyer/mypage/myaddr', 
    		{ action: 'setDefault', adrCode: adrCode }, 
    		function(response) {
        location.reload();
    });
    
}

function chkAdrLimit() {
	
    var limit = ${fn:length(buyerAdrList)};
    
    if(limit >= 3) {
        alert('추가 배송지는 최대 2개까지 등록할 수 있습니다.');
        return false;
    }
    return true;
    
}

function cancelForm() {
	
	window.history.back();

}
</script>

<style type="text/css">
.addr-field {
	width: 300px;
}

.addr-form {
	margin-bottom: 20px;
}
</style>

</head>
<body>
	<div class="full">
		<div class="wrap">
			<h3>배송지 관리</h3>
			<hr>
			<div class="page">
				<c:if test="${not empty buyerAdrList }">
					<h4>기본 배송지</h4>
					<c:forEach var="address" items="${buyerAdrList }" varStatus="status">
						<c:if test="${status.index == 0 }">
							<form class="addr-form" action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post" onsubmit="showAlert('수정되었습니다.');">
								<input type="hidden" name="action" value="update">
								<input type="hidden" name="adrCode" value="${address.adrCode }">
					
								<label for="adrName">받는 사람 </label>
								<input type="text" id="adrName_${status.index }" name="adrName" value="${address.adrName }" required><br>
					
								<label for="adrPhone">연락처 </label>
								<input type="text" id="adrPhone_${status.index }" name="adrPhone" value="${address.adrPhone }" required><br>
					
								<label for="adrPostcode">우편번호 </label>
								<input type="text" id="adrPostcode_${status.index }" name="adrPostcode" value="${address.adrPostcode }" required>
								<input type="button" value="우편번호 찾기" onclick="execDaumPostcode('adrPostcode_${status.index }', 'adrAddr_${status.index }', 'adrDetail_${status.index }')"><br>
					
								<label for="adrAddr">배송 주소 </label>
								<input type="text" id="adrAddr_${status.index }" name="adrAddr" class="addr-field" value="${address.adrAddr }" required><br>
					
								<label for="adrDetail">상세 주소 </label>
								<input type="text" id="adrDetail_${status.index }" name="adrDetail" class="addr-field" value="${address.adrDetail }"><br>
					
								<input type="hidden" name="adrChk" value="Y">
								<input type="submit" value="수정하기">
							</form>
						</c:if>
					</c:forEach>
					<hr>
					<h4>추가 배송지</h4>
					<c:forEach var="address" items="${buyerAdrList }" varStatus="status">
						<c:if test="${status.index > 0 }">
							<form class="addr-form" action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post" onsubmit="showAlert('수정되었습니다.');">
								<input type="hidden" name="action" value="update">
								<input type="hidden" name="adrCode" value="${address.adrCode }">
								
								<label for="adrName">받는 사람 </label>
								<input type="text" id="adrName_${status.index }" name="adrName" value="${address.adrName }" required><br>
					
								<label for="adrPhone">연락처 </label>
								<input type="text" id="adrPhone_${status.index }" name="adrPhone" value="${address.adrPhone }" required><br>
					
								<label for="adrPostcode">우편번호 </label>
								<input type="text" id="adrPostcode_${status.index }" name="adrPostcode" value="${address.adrPostcode }" required>
								<input type="button" value="우편번호 찾기" onclick="execDaumPostcode('adrPostcode_${status.index }', 'adrAddr_${status.index }', 'adrDetail_${status.index }')"><br>
					
								<label for="adrAddr">배송 주소 </label>
								<input type="text" id="adrAddr_${status.index }" name="adrAddr" class="addr-field" value="${address.adrAddr }" required><br>
					
								<label for="adrDetail">상세 주소 </label>
								<input type="text" id="adrDetail_${status.index }" name="adrDetail" class="addr-field" value="${address.adrDetail }"><br>
								
								<input type="hidden" name="adrChk" value="N">
								<input type="submit" value="수정하기">
								<input type="button" value="삭제하기" onclick="deleteAdr('${address.adrCode }')">
								<input type="button" value="기본 배송지로 설정" onclick="setDefaultAdr('${address.adrCode }', '${address.adrName }', '${address.adrPhone }', '${address.adrPostcode}', '${address.adrAddr}', '${address.adrDetail}')">
							</form>
						</c:if>	
					</c:forEach>
					<c:if test="${fn:length(buyerAdrList) <= 1 }">
						<p>추가 배송지가 없습니다.</p>
					</c:if>
				</c:if>
				<input type="button" value="추가 배송지 등록하기" onclick="if(chkAdrLimit()) {toggleVisibility('addForm'); }"><br><br>
				<div id="addForm" style="display: none;">
					<h4>새 배송지 추가</h4>
					<form class="addr-form" action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post">
						<input type="hidden" name='action' value="register">
						<input type="hidden" id="adrCodeAdd" name="adrCode" value="">
							
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
						<input type="text" id="adrDetailAdd" name="adrDetail" class="addr-field"><br>
						
						<input type="hidden" name="adrChk" value="N">
						<input type="submit" value="등록하기">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
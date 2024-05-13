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
	
	new daum.Postcode({
		
		oncomplete: function(data) {
			
			var addr = '';
			var extraAddr = '';
			
			// 주소 타입에 따라 도로명 주소와 지번 주소 구분
			if(data.userSelectedType === 'R') {	// 도로명 주소
				
				addr = data.roadAddress;
			
				// 참고 항목 문자열 조합			
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					
					extraAddr += data.bname;
					
				}
				
				if(data.buildingName !== '' && data.apartment === 'Y') {
					
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					
				}
				
				if(extraAddr !== ''){
					
					extraAddr = ' (' + extraAddr + ')';
					
				}
				
				addr += extraAddr;
				
			} else {	// 지번 주소
				
				addr = data.jibunAddress;
				
			}
			
			// 우편번호와 주소 정보를 해당 필드에 넣기
			document.getElementById(targetPostcode).value = data.zonecode;
			document.getElementById(targetAddress).value = addr;
			
			// 상세 주소 필드로 포커스 이동
			document.getElementById(targetDetail).focus();
			
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
					<c:forEach var="addr" items="${buyerAdrList }">
						<c:if test="${addr.adrChk eq 'Y'}">
							<form action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post">
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
								<input type="hidden" name="adrChk" value="Y">
							</form>
						</c:if>
					</c:forEach>
				</c:if>
				<input type="button" value="추가하기" onclick="toggleVisibility('addForm')"><br><br>
				
				<div id="addForm" style="display: none;">
					<h3>추가 배송지</h3>
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
						<input type="button" value="취소하기" onclick="cancelForm()">
					</form>
				</div>
				
				<hr>
				
				<h3>추가된 배송지 목록</h3>
				<c:if test="${not empty buyerAdrList }">
					<c:forEach var="addr" items="${buyerAdrList }">
						<c:if test="${addr.adrChk ne 'Y' }">
							<form action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post">
								<input type="hidden" name="action" value="update">
								<input type="hidden" name="adrCode" value="${addr.adrCode }">
								
								<label for="adrName">받는 사람 </label>
								<input type="text" id="adrNameEdit" name="adrName" value="${addr.adrName }" required><br>
							
								<label for="adrPhone">연락처 </label>
								<input type="text" id="adrPhoneEdit" name="adrPhone" value="${addr.adrPhone }" required><br>
							
								<label for="adrPostcode">우편번호 </label>
								<input type="text" id="adrPostcodeEdit2" name="adrPostcode" value="${addr.adrPostcode }" required>
								<input type="button" value="우편번호 찾기" onclick="execDaumPostcode('adrPostcodeEdit2', 'adrAddrEdit2', 'adrDetailEdit2')"><br>
							
								<label for="adrAddr">배송 주소 </label>
								<input type="text" id="adrAddrEdit2" name="adrAddr" class="addr-field" value="${addr.adrAddr }" required><br>
							
								<label for="adrDetail">상세 주소 </label>
								<input type="text" id="adrDetailEdit2" name="adrDetail" class="addr-field" value="${addr.adrDetail }" required><br>
							
								<input type="submit" value="수정하기">
								<input type="hidden" name="adrChk" value="N">
							</form>
							
							<form action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post" style="display: inline;">
								<input type="hidden" name="action" value="delete">
								<input type="hidden" name="adrCode" value='${addr.adrCode }'>
								<input type="submit" value="삭제하기">
							</form>
							
							<br><br>
						
						</c:if>
					</c:forEach>
				</c:if>	
				
				<c:if test="${not empty success}">
        			<p style="color: green;">${success }</p>
    			</c:if>
    			<c:if test="${not empty error}">
       				<p style="color: red;">${error }</p>
    			</c:if>
			</div>
		</div>
	</div>
</body>
</html>
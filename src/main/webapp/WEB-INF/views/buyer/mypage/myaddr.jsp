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
				{action: 'delete', adrCode: adrCode}, 
				function(response) {
			location.reload();
		});
	}
	
}

function setDefaultAdr(adrCode) {
	
    $.post('${pageContext.request.contextPath }/buyer/mypage/myaddr', 
    		{action: 'setDefault', adrCode: adrCode}, 
    		function(response) {
        location.reload();
    });
    
}

function chkAdrLimit() {
	
    var limit = ${fn:length(buyerAdrList) - 1};
    
    if(limit >= 2) {
        alert('추가 배송지는 최대 2개까지 등록할 수 있습니다.');
        return false;
    }
    return true;
    
}
</script>

<style>
body {
    margin: 0;
    padding: 0;
}

.full {
    width: 1200px;
    height: auto;
    margin: 0 auto;
    padding: 50px 20px;
    display: flex;
    justify-content: center;
    align-items: flex-start;
}

.wrap {
    display: flex;
    width: 100%;
    justify-content: flex-start;
    align-items: flex-start;
    border-radius: 8px;
    padding: 20px;
}

.page {
    margin-top: 20px;
    border-bottom: 3px solid #333;
    width: 70%;
    text-align: center;
}

h2 {
    margin-top: 0;
    color: #333;
}

hr {
    border: 0;
    border-top: 1px solid #ccc;
    margin: 20px 0;
}

.page a {
    display: block;
    margin: 10px 0;
    color: #0066cc;
    text-decoration: none;
}

.page a:hover {
    text-decoration: underline;
}

.table-container {
	text-align: center;
}

table {
    width: 50%;
    border-collapse: collapse;
    margin-top: 20px;
    display: inline-block;
}

table, th, td {
    border: 1px solid #dddddd;
}

th, td {
    padding: 15px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

.addr-form {
    margin-bottom: 20px;
}

.addr-form input[type="text"], .addr-form input[type="button"], .addr-form input[type="submit"] {
    margin-top: 5px;
    padding: 10px;
    width: calc(100% - 22px);
    box-sizing: border-box;
}

.addr-form label {
    display: block;
    margin-top: 10px;
    font-weight: bold;
}

.button-group {
    text-align: center;
    margin-top: 40px;
    margin-bottom: 40px;
}

.button-group button {
    margin-right: 10px;
    padding: 10px 20px;
    background-color: #878787;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 185px;
    height: 39px;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
			
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
<!-- 마이페이지 버튼 -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${buyerLogin.bCtCode == 'P' }"> --%>
<%-- 						<a href="${pageContext.request.contextPath }/buyer/mypage/mypagepri">마이페이지</a> --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${buyerLogin.bCtCode == 'C' }"> --%>
<%-- 						<a href="${pageContext.request.contextPath }/buyer/mypage/mypagecmp">마이페이지</a> --%>
<%-- 					</c:when> --%>
<%-- 				</c:choose> --%>
				
				<c:if test="${not empty buyerAdrList }">
					<div>
						<h4>기본 배송지</h4>
					</div>
					<c:forEach var="address" items="${buyerAdrList }" varStatus="status">
						<c:if test="${status.index == 0 }">
							<form class="addr-form" action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post" onsubmit="showAlert('수정되었습니다.');">
								<input type="hidden" name="action" value="update">
								<input type="hidden" name="adrCode" value="${address.adrCode }">
					
								<table>
									<tr>
										<th><label for="adrName">받는 사람 </label></th>
										<td><input type="text" id="adrName_${status.index }" name="adrName" value="${address.adrName }" required></td>
									</tr>
									<tr>
										<th><label for="adrPhone">연락처 </label></th>
										<td><input type="text" id="adrPhone_${status.index }" name="adrPhone" value="${address.adrPhone }" required></td>
									</tr>
									<tr>
										<th><label for="adrPostcode">우편번호 </label></th>
										<td>
											<input type="text" id="adrPostcode_${status.index }" name="adrPostcode" value="${address.adrPostcode }" required>
											<input type="button" value="우편번호 찾기" onclick="execDaumPostcode('adrPostcode_${status.index }', 'adrAddr_${status.index }', 'adrDetail_${status.index }')">
										</td>
									</tr>
									<tr>
										<th><label for="adrAddr">배송 주소 </label></th>
										<td><input type="text" id="adrAddr_${status.index }" name="adrAddr" class="addr-field" value="${address.adrAddr }" required></td>
									</tr>
									<tr>
										<th><label for="adrDetail">상세 주소 </label></th>
										<td><input type="text" id="adrDetail_${status.index }" name="adrDetail" class="addr-field" value="${address.adrDetail }"></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center;">
											<input type="hidden" name="adrChk" value="Y">
											<input type="submit" value="수정하기">
										</td>
									</tr>
								</table>
							</form>
						</c:if>
					</c:forEach>
					
					<hr>
				
					<div>
						<h4>추가 배송지</h4>
					</div>
					<c:set var="listLength" value="0" />
					<c:forEach var="address" items="${buyerAdrList }" varStatus="status">
						<c:if test="${status.index > 0 }">
							<form class="addr-form" action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post" onsubmit="showAlert('수정되었습니다.');">
								<input type="hidden" name="action" value="update">
								<input type="hidden" name="adrCode" value="${address.adrCode }">
								
								<table>
									<tr>
										<th><label for="adrName">받는 사람 </label></th>
										<td><input type="text" id="adrName_${status.index }" name="adrName" value="${address.adrName }" required></td>
									</tr>
									<tr>
										<th><label for="adrPhone">연락처 </label></th>
										<td><input type="text" id="adrPhone_${status.index }" name="adrPhone" value="${address.adrPhone }" required></td>
									</tr>
									<tr>
										<th><label for="adrPostcode">우편번호 </label></th>
										<td>
											<input type="text" id="adrPostcode_${status.index }" name="adrPostcode" value="${address.adrPostcode }" required>
											<input type="button" value="우편번호 찾기" onclick="execDaumPostcode('adrPostcode_${status.index }', 'adrAddr_${status.index }', 'adrDetail_${status.index }')">
										</td>
									</tr>
									<tr>
										<th><label for="adrAddr">배송 주소 </label></th>
										<td><input type="text" id="adrAddr_${status.index }" name="adrAddr" class="addr-field" value="${address.adrAddr }" required></td>
									</tr>
									<tr>
										<th><label for="adrDetail">상세 주소 </label></th>
										<td><input type="text" id="adrDetail_${status.index }" name="adrDetail" class="addr-field" value="${address.adrDetail }"></td>
									</tr>
									<tr>
										<td colspan="2" style="text-algin: center;">
											<input type="hidden" name="adrChk" value="N">
											<input type="submit" value="수정하기">
											<input type="button" value="삭제하기" onclick="deleteAdr('${address.adrCode }')">
											<input type="button" value="기본 배송지로 설정" onclick="setDefaultAdr('${address.adrCode }')">
										</td>
									</tr>
								</table>
							</form>
						</c:if>	
						<c:set var="listLength" value="${listLength + 1}" />
					</c:forEach>
					<c:if test="${fn:length(buyerAdrList) <= 1 }">
						<p>추가 배송지가 없습니다.</p>
					</c:if>
				</c:if>
				<div class="button-group">
					<c:if test="${fn:length(buyerAdrList) <= 2 }">
	 					<button type="button" class="btn" onclick="if(chkAdrLimit()) {toggleVisibility('addForm'); }">추가 배송지 등록하기</button><br><br>
					</c:if>
				</div>
				<div id="addForm" style="display: none;">
					<div>
						<h4>새 배송지 추가</h4>
					</div>
					<form class="addr-form" action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post">
						<input type="hidden" name='action' value="register">
							
						<table>
							<tr>
								<th><label for="adrNameAdd">받는 사람 </label></th>
								<td><input type="text" id="adrNameAdd" name="adrName" required></td>
							</tr>
							<tr>
								<th><label for="adrPhoneAdd">연락처 </label></th>
								<td><input type="text" id="adrPhoneAdd" name="adrPhone" required></td>
							</tr>
							<tr>
								<th><label for="adrPostcodeAdd">우편번호 </label></th>
								<td>
									<input type="text" id="adrPostcodeAdd" name="adrPostcode" required>
									<input type="button" value="우편번호 찾기" onclick="execDaumPostcode('adrPostcodeAdd', 'adrAddrAdd', 'adrDetailAdd')">
								</td>
							</tr>
							<tr>
								<th><label for="adrAddrAdd">배송 주소 </label></th>
								<td><input type="text" id="adrAddrAdd" name="adrAddr" class="addr-field" required></td>
							</tr>
							<tr>
								<th><label for="adrDetailAdd">상세 주소 </label></th>
								<td><input type="text" id="adrDetailAdd" name="adrDetail" class="addr-field"></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<input type="hidden" name="adrChk" value="N">
									<input type="submit" value="등록하기">
								</td>
							</tr>
						</table>	
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
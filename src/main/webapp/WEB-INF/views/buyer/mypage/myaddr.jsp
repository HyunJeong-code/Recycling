<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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

function addNewAddress() {
	if($(".address-form").length >= 3) {
		alert("추가 배송지는 최대 2개까지 등록할 수 있습니다.");
		return;
	}
	$("#newAddressForm").show();
}

function cancelNewAddress() {
	$("#newAddressForm").hide();
}

function deleteAddress(adrCode) {
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/buyer/mypage/myaddr",
		data: {action: "delete", adrCode : adrCode},
		success: function(response) {
			if(response.success) {
				alert("배송지가 삭제 되었습니다.");
				location.reload();
			} else {
				alert("배송지 삭제에 실패했습니다: " + response.message);
			}
		},
		error: function() {
			alert("배송지 삭제에 실패했습니다.");
		}
	});
}

$(document).ready(function() {
	$(".update-form").on("submit", function(event) {
		event.preventDefault();
		var form = $(this);
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/buyer/mypage/myaddr",
			data: form.serialize() + "&action=update",
			dataType: "json",
			success: function(response) {
				if(response.success) {
					alert("배송지 정보가 수정되었습니다.");
					location.reload();
				} else {
					alert("배송지 수정에 실패했습니다: " + response.message);
				}
			},
			error: function() {
				alert("배송지 수정에 실패했습니다.");
			}
		});
	});
	
	$("#registerForm").on("submit", function(event) {
		event.preventDefault();
		var form = $(this);
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/buyer/mypage/myaddr",
			data: form.serialize() + "&action=register",
			dataType: "json",
			success: function(response) {
				if(response.success) {
					alert("새 배송지가 등록되었습니다.");
					location.reload();
				} else {
					alert("배송지 등록에 실패했습니다: " + response.message);
				}
			},
			error: function() {
				alert("배송지 등록에 실패했습니다.");
			}
		});
	});
});

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
					<c:forEach var="addr" items="${buyerAdrList }" begin="0" end="0">
						<form class="update-form" action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post">
							<input type="hidden" name="action" value="update">
							<input type="hidden" name="adrCode" value="${addr.adrCode }">
				
							<label for="adrName">받는 사람 </label>
							<input type="text" id="adrName" name="adrName" value="${addr.adrName }"><br>
				
							<label for="adrPhone">연락처 </label>
							<input type="text" id="adrPhone" name="adrPhone" value="${addr.adrPhone }"><br>
				
							<label for="adrPostcode">우편번호 </label>
							<input type="text" id="adrPostcodeEdit" name="adrPostcode" value="${addr.adrPostcode }">
							<input type="button" value="우편번호 찾기" onclick="execDaumPostcode('adrPostcodeEdit', 'adrAddrEdit', 'adrDetailEdit')"><br>
				
							<label for="adrAddr">배송 주소 </label>
							<input type="text" id="adrAddrEdit" name="adrAddr" class="addr-field" value="${addr.adrAddr }"><br>
				
							<label for="adrDetail">상세 주소 </label>
							<input type="text" id="adrDetailEdit" name="adrDetail" class="addr-field" value="${addr.adrDetail }"><br>
				
							<input type="submit" value="수정하기">
						</form>
					</c:forEach>
					<hr>
					<h3>추가 배송지</h3>
					<c:forEach var="addr" items="${buyerAdrList }" begin="1">
						<form class="update-form" action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post">
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
						<form class="delete-form" action="${pageContext.request.contextPath }/buyer/mypage/myaddr" method="post">
							<input type="hidden" name="adrCode" value="${addr.adrCode }">
							<input type="button" value="삭제하기" onclick="deleteAddress("${addr.adrCode }")">
						</form>
					</c:forEach>
					<c:if test="${buyerAdrList.size() < 3 }">
						<input type="button" value="추가 배송지 등록하기" onclick="addNewAddress()"><br><br>
					</c:if>
				</c:if>
				
				<div id="newAddressForm" style="display: none;">
					<h3>새 배송지 추가</h3>
					<form id="registerForm" method="post">
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
						<input type="button" value="취소" onclick="cancelNewAddress()">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
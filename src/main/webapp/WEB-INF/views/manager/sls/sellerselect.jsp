<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    // 각 행 클릭 이벤트 리스너 추가
    $(".dataRow").on("click", function() {
        // 클릭된 행의 데이터 속성을 가져와서 삽입
        var sCode = $(this).data("s-code");
        var cmpNo = $(this).data("cmp-no");
        var cmpName = $(this).data("cmp-name");
        var cmpCEO = $(this).data("cmp-ceo");
        var cmpAddr = $(this).data("cmp-addr");

        // 폼 필드에 데이터 삽입
        document.getElementsByName("sCode")[0].value = sCode;
        document.getElementsByName("cmpName")[0].value = cmpName;

        alert("입력되었습니다.");
    });
});


</script>
<style type="text/css">
/* 테이블 세팅 */
table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 100%;
	text-align: center;
}

table td {
	padding: 9px;
}

table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table th:first-child, .table td:first-child {
	border-left: 0;
}

table th:last-child, .table td:last-child {
	border-right: 0;
}

table tr td:first-child {
	text-align: center;
}

table caption {
	caption-side: bottom;
	display: none;
}

table tr:hover {
  background-color: #f5f5f5;
  cursor: pointer;
}

</style>
</head>
<body>

	<div class="section">
		<table>
			<thead>
				<tr>
					<th>기업</th>
					<th>상호명</th>
					<th>대표자명</th>
					<th>사업장 주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="selList" items="${selList}">
	                <c:if test="${selList.S_CHK eq 'Y'}">
	                    <tr class="dataRow"
	                        data-s-code="${selList.S_CODE}"
	                        data-cmp-no="${selList.CMP_NO}"
	                        data-cmp-name="${selList.CMP_NAME}"
	                        data-cmp-ceo="${selList.CMP_CEO}"
	                        data-cmp-addr="${selList.CMP_ADDR}">
	                        <td>${selList.CMP_NO}</td>
	                        <td>${selList.CMP_NAME}</td>
	                        <td>${selList.CMP_CEO}</td>
	                        <td>${selList.CMP_ADDR}</td>
	                    </tr>
	                </c:if>
	            </c:forEach>

			</tbody>
		</table>

	</div>





</body>
</html>
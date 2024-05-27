<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypagecmp</title>

<script type="text/javascript">

</script>

</head>
<body>
	<div class="full">
		<div class="wrap">
			<h2>마이페이지</h2>
			<hr>
			<div class="page">
				<a href="/buyer/main">메인</a><br>
				<a href="/buyer/mypage/changepw">비밀번호 변경</a><br>
				<a href="/buyer/mypage/mydetailcmp" >기업 정보 수정</a><br>
				<a href="/buyer/mypage/myaddr">배송지</a><br>
				<a href="/buyer/mypage/outbuyer">회원탈퇴</a><br>
				<c:if test="${buyerProf != null}">
        			<img src="${pageContext.request.contextPath }/resources/image/${buyerProf.storedName }" alt="프로필 이미지" style="width: 100px; height: 100px;">
    			</c:if>
                <h3>회사이름: ${cmp.cmpName }</h3>
				<h3>이름: ${buyer.bName }</h3>
				<h3>사업자 등록증</h3><br>
				<c:if test="${not empty cmpFile}">
    				<img src="${pageContext.request.contextPath }/resources/cmpfile/${cmpFile.storedName }" alt="사업자 등록증" style="width: 100px; height: 100px;">
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
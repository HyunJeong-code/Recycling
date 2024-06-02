<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypagepri</title>

<script type="text/javascript">

</script>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
			<h2>마이페이지</h2>
			<hr>
			<div class="page">
				<a href="/buyer/main">메인</a><br>
				<a href="/buyer/mypage/changepw">비밀번호 변경</a><br>
				<a href="/buyer/mypage/mydetailpri" >개인 정보 수정</a><br>
				<a href="/buyer/mypage/myaddr">배송지</a><br>
				<a href="/buyer/mypage/outbuyer">회원탈퇴</a><br>
				<c:if test="${buyerProf != null}">
        			<img src="${pageContext.request.contextPath }/resources/image/${buyerProf.storedName }" alt="프로필 이미지" style="width: 100px; height: 100px;">
    			</c:if>
				<h3>이름: ${buyer.bName }</h3>
				<h3>멤버쉽 등급: ${buyerRank.rankName }</h3>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
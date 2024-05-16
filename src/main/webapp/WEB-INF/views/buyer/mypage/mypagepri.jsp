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
	<div class="full">
		<div class="wrap">
			<h2>마이페이지</h2>
			<hr>
			<div class="page">
				<a href="/buyer/mypage/mypagepri" >마이페이지</a><br>
				<a href="/buyer/mypage/mydetailpri" >개인 정보 수정</a><br>
				<c:if test="${not empty buyerProfName }">
                    <img src="${pageContext.request.contextPath }/uploads/${buyerProfName }" alt="프로필 이미지" width="100">
                </c:if>
                <c:if test="${empty buyerProfName }">
                    <p>프로필 이미지가 없습니다</p>
                </c:if>
				<h3>이름: ${buyer.bName }</h3>
				<h3>멤버쉽 등급: ${buyerRank.rankName }</h3>
			</div>
		</div>
	</div>
</body>
</html>
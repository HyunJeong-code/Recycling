<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypagepri</title>

<script type="text/javascript">
window.onload = function() {
    var error = '${error}';
    if (error) {
        alert(error);
        window.location.href = '/buyer/login'; // 로그인 페이지로 리디렉션
    }
}
</script>

</head>
<body>
	<div class="full">
		<div class="wrap">
			<h2>마이페이지</h2>
			<hr>
			<div class="page">
				<a href="/buyer/mypage/mypagepri" >마이페이지</a><br>
				<a href="/buyer/mypage/mydetailpri" >개인 정보 수정</a>
				<p>이름 : ${buyer.bName }</p>
				<p>아이디 : ${buyer.bId }</p>
				<p>등급 : ${buyerRank.rankName }</p>
			</div>
		</div>
	</div>
</body>
</html>
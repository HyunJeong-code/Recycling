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
				<img src="/src/main/webapp/resources/image${cmpProf.storedName }" alt="프로필 이미지" style="width:150px; height:150px;">
                <h3>회사이름: ${cmp.cmpName }</h3>
				<h3>이름: ${buyer.bName }</h3>
			</div>
		</div>
	</div>
</body>
</html>
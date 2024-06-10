<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changePw</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('form').on('submit', function(event) {
		var newPw = $('#newPw').val();
		var confirmPw = $('#confirmPw').val();
		
		if(newPw !== confirmPw) {
			alert('새 비밀번호가 일치하지 않습니다.');
			event.preventDefault();
		}
	});

    var rexPw = /[a-zA-Z0-9!@#$%]{8,15}/; // 비밀번호 정규식

    // 비밀번호
    $("#newPw").blur(function() {
        if($("#newPw").val() == '') {
            $("#pw").css("display", "block");
        } else {
            $("#pw").css("display", "none");
            
            if(!rexPw.test($("#newPw").val())) {
                console.log(rexPw.test($("#newPw").val()));
                $("#chkPw").css("display", "block");            
            } else {
                console.log(rexPw.test($("#newPw").val()));
                $("#chkPw").css("display", "none");                        
            }
        }
    });
});
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
    align-items: center;
}

.wrap {
    display: flex;
    width: 100%;
    justify-content: center;
    align-items: center;
    border-radius: 8px;
    padding: 20px;
}

.page {
    margin-top: 20px;
    border-bottom: 3px solid #333;
    width: 100%;
    text-align: center;
    padding-bottom: 30px;
}

.changepw {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
}

.changepw h2 {
    margin-bottom: 30px;
    color: #333;
}

.form-group {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
}

.form-group label {
    margin-right: 20px;
    text-align: right;
    width: 150px;
}

input[type="text"] {
    border: none;
    border-bottom: 1px solid black;
    width: 200px;
}

.button-group {
    text-align: center;
    margin-top: 40px;
    margin-bottom: 40px;
}

.button-group button {
    margin-right: 10px;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 135px;
    height: 39px;
}

.button-group button:hover {
    background-color: #58c05c;
}
</style>


</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
		
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
				<form action="${pageContext.request.contextPath }/buyer/mypage/changepw" method="post">
					<div class="changepw">
						<div>
							<h2>비밀번호 변경</h2>
						</div>
						<div class="form-group">
							<label for="newPw">새 비밀번호 </label>
							<input type="text" id="newPw" name="newPw" required>
						</div>
						<div class="form-group">
							<label for="confirmPw">새 비밀번호 확인 </label>
							<input type="text" id="confirmPw" name="confirmPw" required><br>
						</div>
						<div class="button-group">
							<button type="submit" class="btn">비밀번호 변경</button>
						</div>
					</div>
				</form>
				<c:if test="${not empty success }">
					<p style="color: green;">${success }</p>
				</c:if>
				<c:if test="${not empty error }">
					<p style="color: red;">${error }</p>
				</c:if>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>
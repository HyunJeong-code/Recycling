<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경e</title>
</head>


<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>

    <div class="full">
        <div class="wrap">
            <c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>   
        
           <h2>비밀번호 변경</h2>
            <div class="page">

            </div>
        
            <div class="section">
                     <form action="${pageContext.request.contextPath }/buyer/mypage/changepw" method="post">
               <h3>비밀번호 변경</h3>
               <label for="newPww">새 비밀번호 </label>
               <input type="password" id="newPw" name="newPw" required>
               <br>
               <label for="confirmPw">새 비밀번호 확인 </label>
               <input type="password" id="conformPw" name="confirmPw" required><br>
               <input type="submit" value="비밀번호 변경">
            </form>
            <c:if test="${not empty error}">
                 <p style="color: red;">${error}</p>
             </c:if>
             <c:if test="${not empty success}">
                   <p style="color: green;">${success}</p>
             </c:if>
            </div>
        </div>
    </div>
</body>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>

</html>
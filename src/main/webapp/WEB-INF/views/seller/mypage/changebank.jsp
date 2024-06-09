<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changebank</title>
</head>



<body>
   <c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>

    <div class="full">
        <div class="wrap">
           <c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>
        
           <h2>계좌번호 변경</h2>
           <hr>
            <div class="page">
            <form action="${pageContext.request.contextPath }/seller/mypage/changebank" method="post">
               <h3>계좌번호 변경</h3>
               <label for="newaccNo">새 계좌번호 </label>
               <input type="password" id="newaccNo" name="newaccNo" required>
               <br>
               <label for="accNo">새 계좌번호 확인 </label>
               <input type="password" id="accNo" name="accNo" required><br>
               <input type="submit" value="계좌번호 변경">

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
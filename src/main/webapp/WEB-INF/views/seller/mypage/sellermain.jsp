<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새활용</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
    <div class="full">
        <div class="wrap">
        <c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>   
         <div class="main-section">
              <div class="page">
                  
              </div>
              
              <div class="section">
                  <a href="/WEB-INF/view/seller/mypage/changebank.jsp" >판매자 계좌 변경</a>
                  <a href="/WEB-INF/view/seller/mypage/changepw.jsp" >판매자 비밀번호 변경</a>
                  <a href="/WEB-INF/view/seller/mypage/sellerdetail.jsp" >판매자 정보 변경</a>
                  <a href="/WEB-INF/view/seller/mypage/outseller.jsp" >판매자 회원탈퇴</a>
              </div>
           
           </div>
       </div>
    </div>
</body>

<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>

<script type="text/javascript">
$(function() {
   var num;
   var originalEmail = $('#bEmail').val();
   var emailChanged = false;
   
   $("#bEmail").on('input', function() {
      var currentEmail = $(this).val();
      emailChanged = currentEmail !== originalEmail;
   });
   
   $("#btnEmail").click(function() {
      if (!emailChanged) {
         alert("이메일을 변경해주세요.");
         return;
      }
      
      var email = $('#bEmail').val();
      console.log("이메일 : " + email);
      var emailNum = $("#emailNum")
      
      $.ajax({
         type: 'post',
         url : '${pageContext.request.contextPath}/buyer/mypage/EmailAuth',
         data: {email : email},
         dataType: 'json',
         success: function(res) {
            console.log("res : " + res);
            $("#emailChk").css("display", "block");
            num = res;
            alert("인증번호가 발송되었습니다. 입력하신 메일의 메일함을 확인해주세요.");
         }
      })
   })
   
   $("#emailNum").focusout(function() {
      var inputNum = $("#emailNum").val();
      
      console.log("입력 인증 번호 : " + inputNum);
      console.log("전송 인증 번호 : " + num);
      
      if(Number(inputNum) === num) {
         $("#emailOk").css("display", "block");
         $("#bEmail").css("disabled", "true");
         $("#bEmail2").css("disabled", "true");
         $("#btnEmail").css("disabled", "true");
         $("#emailNo").css("display", "none");         
      } else {
         $("#emailNo").css("display", "block");         
         $("#emailOk").css("display", "none");         
      }
   });
   
   $("form").submit(function(e) {
      if (emailChanged && $("#emailOk").css("display") !== "block") {
         alert("이메일 인증을 완료해주세요.");
         e.preventDefault();
      }
   });
   
   <c:if test="${not empty success }">
      alert("${success }");
   </c:if>
   
})
</script>

<script>
var previousChecked = {};

function toggleRadioButton(element) {
   
   var name = element.name;
   
   if(previousChecked[name] === element) {
      
      element.checked = false;
      previousChecked[name] = null;
      
   } else {
      
      previousChecked[name] = element;
      
   }
   
}

function cancelUpdate() {
      
   window.history.back();
      
}
</script>
</head>
<body>
   <c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
   
    <div class="full">
        <div class="wrap">
        <h2>개인 판매자 정보 수정</h2>
        
           <c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>
        
            <div class="page">
               <form action="${pageContext.request.contextPath }/seller.mypage/sellerdetail" method="post">
               <input type="hidden" name="cCode" value="${seller.cCode } ">
               <input type="hidden" name="bCode" value="${seller.bCode }" >
               <input type="hidden" name="accName" value="${seller.accName }" >
               <input type="hidden" name="accBank" value="${seller.accBank }" >
               <input type="hidden" name="accNo" value="${seller.accNo }" >
              
               
               <div class="mydetailpri">
                  <table class="s-table">
                     <tr>
                        <th colspan="2">개인 정보 수정</th>
                     </tr>
                     <tr>
                        <td>프로필</td>
                        <td>
                           <c:choose>
                              <c:when test="${sellrProf != null }">
                                 <img src="${pageContext.request.contextPath}/resources/image/${sellerProf.storedName}" alt="프로필 이미지" style="width: 100px; height: 100px;"><br>
                              </c:when>
                              <c:otherwise>
                                 <img src="${pageContext.request.contextPath}/resources/image/basicProf.png" alt="기본 프로필 이미지" style="width: 100px; height: 100px;"><br>
                              </c:otherwise>
                           </c:choose>
                           <label for="sellerProf" class="custom-file-upload">프로필 선택</label>
                           <input type="file" id="buyerProf" name="buyerProf" style="display: none;">
                        </td>
                     </tr>
                     <tr>
                        <td>이름</td>
                        <td><input type="text" id="bName" name="bName" value="${currentBuyer.bName}"></td>
                     </tr>
                     <tr>
                        <td>아이디</td>
                        <td><input type="text" id="bId" name="bId" value="${currentBuyer.bId }" readonly></td>
                     </tr>
                     <tr>
                        <td>전화번호</td>
                        <td>
                           <select id="phoneSelect">
                              <option value="010">010</option>
                              <option value="011">011</option>
                              <option value="016">016</option>
                              <option value="017">017</option>
                              <option value="custom">직접입력</option>
                           </select>
                           <input type="text" id="bPhone1" name="bPhone1" maxlength="3" style="width: 50px;">
                                - <input type="text" id="bPhone2" name="bPhone2" maxlength="4" style="width: 70px;">
                                - <input type="text" id="bPhone3" name="bPhone3" maxlength="4" style="width: 70px;">
                        </td>
                     </tr>
                     <tr>
                        <td>이메일</td>
                        <td>
                                <select id="emailSelect">
                              <option value="naver.com">naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="custom">직접입력</option>
                           </select>
                           <input type="button" id="btnEmail" value="이메일 인증">
                           <div id="emailChk" style="display: none;">
                              <label for="emailNum">이메일 인증 번호</label>
                              <input type="text" id="emailNum" name="emailNum" placeholder="인증번호 6자리를 입력해주세요.">
                              <div id="emailOk" style="color: green; display: none;">
                                 인증번호가 일치합니다.
                              </div>
                              <div id="emailNo" style="color: red; display: none;">
                                 인증번호가 불일치합니다. 다시 입력해주세요.
                              </div>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <td>광고성 정보 수신 여부</td>
                        <td>
                           <label for="adSms">SMS</label>
                           <input type="radio" name="adSms" id="adSms" value="Y" 
                           <c:if test="${currentBuyer.adSms eq 'Y' }">checked</c:if> onclick="toggleRadioButton(this)">
                           
                           <label for="adEmail">Email</label>
                           <input type="radio" name="adEmail" id="adEmail" value="Y" 
                           <c:if test="${currentBuyer.adEmail eq 'Y' }">checked</c:if> onclick="toggleRadioButton(this)">
                        </td>
                     </tr>
                  </table>
                  <div class="button-group">
                     <button type="btn btnRight">수정하기</button>
                     <button type="btn btnLeft" onclick="cancelUpdate()">취소하기</button>
                  </div>
               </div>
              
              <label for="sPostcode">우편번호</label>
              <input type="text" id="sPostcode" name="sPostcode" value="${seller.sPostcode }" required>
  
              <label for="sAddr">판매자 주소</label>
              <input type="text" id="sAddr" name="sAddr" value="${seller.sAddr }" required>
  
              <label for="sDetail">판매자 상세주소</label>
              <input type="text" id="sDetail" name="sDetail" value="${seller.sDetail }" required>
  
              <input type="submit" value="수정하기">
            <input type="button" value="취소하기" onclick="cancelUpdate()">
            
               </form>
            </div>
            <c:if test="${not empty success }">
               <p style="color: green;">${success }</p>
            </c:if>
            <c:if test="${not empty error }">
               <p style="color: red;">${error }</p>
            </c:if>
        </div>
    </div>
</body>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>



</html>
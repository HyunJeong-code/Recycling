<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager/cs/csdetail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    function checkDelete(bCode) {
        if (confirm("삭제하시겠습니까?")) {
            // 확인을 선택한 경우, 삭제 요청을 서버로 전송
            var bOutValue = 'Y';
            var bOutDateValue = new Date().toISOString().slice(0, 10);
            var url = "./buyerdel?bCode=" + bCode + "&bOut=" + bOutValue + "&bOutDate=" + bOutDateValue;
            window.location.href = url;
        }
    }
</script>
</head>
<body>

	<div class="full">
		<aside>
			왼쪽
		</aside>
			<div class="wrap">
				<div class="page">	
				    <h1>회원 정보</h1>
				    <hr>
	    		</div>
	    		
	    		<div class="section">
	    			<div class ="section_top">
						<div class="section_bot_itembox">
							<div class="bCode_box">
								<label>회원번호</label>
								<div>${buyerdetail.bCode }</div>
							</div>
							
							<div class="bName_box">
								<label>이 름</label>
								<div>${buyerdetail.bName }</div>
							</div>
							
							<div class="rankNo_box">
								<label for ="rankNo">등급</label>
								<div>${buyerdetail.rankNo }</div>
							</div>
						</div>
					</div>
					
					<div class="section_bot_title">상세 정보</div>

					<div class="section_bot_itembox">
						<div class="bPhone_box">
							<label for ="bPhone">전화번호</label> 
							<div>${buyerdetail.bPhone }</div>
						</div>
						
						<div class="bEmail_box">
							<label for ="bEmail">이메일</label>
						 	<div>${buyerdetail.bEmail }</div>
						</div>
						
						<div class="bEntDate_box">
							<label>가 입 일</label>
							<div>
								<fmt:parseDate value="${buyerdetail. bEntDate }" var="bEntDate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${bEntDate }" pattern="yyyy-MM-dd" />
							</div>
						</div>
					</div>
						
					<div class="btn_bot_wrap">
					    <a href="./buyerupdate?bCode=${buyer.bCode }"><button>수정</button></a>
					    <button onclick="checkDelete('${buyer.bCode}')">삭제</button>
					
					    <a href="./buyerlist"><button>목록</button></a>
					    
					    <input type="hidden" id="bOut" name="bOut" value="Y">
					    <input type="hidden" id="bOutDate" name="bOutDate" value="">
					    
					    <input type="hidden" id="bCode" name="bCode" value="${buyer.bCode }">
					</div>
				    
				</div>
			</div>
		</div>
    
</body>
</html>

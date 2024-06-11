<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	
	// 핸드폰 번호 처리
	var selPhone = "${seller.B_PHONE}".split("-");
	console.log("selPhone : " + selPhone);

	if($("#sPhone").val(selPhone[0])) {
		$("#inPhone").hide();
		$("#sPhone").val(selPhone[0]).attr("selected", "selected");
	} else {
		$("#inPhone").val(selPhone[0])
	}
	
	$("#mPhone").val(selPhone[1]);
	$("#lPhone").val(selPhone[2]);
	
	$("#sPhone").change(function() {
		if($("#sPhone").val() === "in") {
			$("#inPhone").show();		
			$("#sPhone").hide();		
		} else {
			$("#inPhone").hide();				
			$("#sPhone").show();		
		}		
	})
	
	// 이메일 처리
	var selEmail = "${seller.B_EMAIL}".split("@");
	console.log("selEmail: " + selEmail);
	
	$("#bEmail").val(selEmail[0]);
	
	if($("#bEmail2").val("@" + selEmail[1])) {
		$("#inEmail").hide();
		$("bEmail2").val(selEmail[1]).attr("selected", "selected");
	} else {
		$("#inEmail").val(selEmail[1]);
	}
	
	$("#bEmail2").change(function() {
		if($("#bEmail2").val() === "in") {
			$("#inEmail").show();
			$("#bEmail2").hide();
		} else {
			$("#inEmail").hide();
			$("#bEmail2").show();
		}
	})
	
	// 핸드폰 번호 직접 입력
	$("#inPhone").hide();
	
	$("#sPhone").change(function() {
		if($("#sPhone").val() === "in") {
			$("#inPhone").show();		
			$("#sPhone").hide();		
		} else {
			$("#inPhone").hide();				
			$("#sPhone").show();		
		}		
	})

	// 이메일 직접 입력
	$("#inEmail").hide();
	
	$("#sEmail2").change(function() {
		if($("#sEmail2").val() === "in") {
			$("#inEmail").show();
			$("#sEmail2").hide();
		} else {
			$("#inEmail").hide();
			$("#sEmail2").show();
		}
	})
	
	var sCode = "${seller.S_CODE}";
	console.log("sCode: " + sCode);
	
	$("#sOut").click(function() {
		$.ajax({
			type: 'post',
			url: './sellerout',
			data: {sCode : sCode},
			dataType: 'json',
			success: function(res) {
				if(res > 0) {
					alert("판매자 탈퇴 성공");
					location.reload();
				} else {
					alert("판매자 탈퇴 실패");					
				}
			}, error: function(res) {
				console.log("error");
			}
			
		})
	})
	
	$("#btnList").click(function() {
		history.back();
	})
	
})
</script>
<style type="text/css">
.prof {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
<div class="admin-container">
<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
<div class = "full content" >
<div class="wrap">
<c:set var="seller" value="${seller }" />

<div class="page">
	<h3>판매자 상세 조회</h3>
</div>

<div class="section">
	<div id="main">
		<div id="info">
			<table border="1">
			
				<tr>
					<td rowspan="6">
						<div id="prof">
							<img src="/resources/image/basicProf.png" alt="프로필 사진" class="prof">
						</div>
					</td>
				</tr>
				<tr>
					<th>판매자 코드</th>
					<td colspan="3" id="sCode">${seller.S_CODE }</td>
				</tr>
				
				<tr>
					<th>판매자 전환 여부</th>
					<td colspan="3">
						<c:if test="${seller.S_CHK eq 'Y' }">
							전환 완료
						</c:if>
						<c:if test="${seller.S_CHK eq null }">
							전환 대기중
						</c:if>
						<c:if test="${seller.S_CHK eq 'N' }">
							전환 거절
						</c:if>
					</td>
				</tr>
				
				<tr>					
					<c:if test="${seller.S_CHK eq 'Y' }">
						<th>전환일</th>
						<td colspan="3">
							<fmt:parseDate value="${seller.S_ENTDATE }"  var="S_ENTDATE" pattern="yyyy-MM-dd" />
	                   		<fmt:formatDate value="${S_ENTDATE }" pattern="yyyy-MM-dd"/>
						</td>
					</c:if>
					
					<c:if test="${seller.S_CHK eq 'N' }">
						<th>전환 신청일</th>
						<td colspan="3">
							<fmt:parseDate value="${seller.S_ENTDATE }"  var="S_ENTDATE" pattern="yyyy-MM-dd" />
	                   		<fmt:formatDate value="${S_ENTDATE }" pattern="yyyy-MM-dd"/>
						</td>							
					</c:if>
					
					<c:if test="${seller.S_CHK eq null }">
						<th>전환 신청일</th>
						<td colspan="3">
							<fmt:parseDate value="${seller.S_ENTDATE }"  var="S_ENTDATE" pattern="yyyy-MM-dd" />
	                   		<fmt:formatDate value="${S_ENTDATE }" pattern="yyyy-MM-dd"/>
						</td>							
					</c:if>
				</tr>
				<tr>
					<th>총 거래 건수</th>
					<td colspan="2">${ordCnt }</td>
					<td><button><a href="/manager/sls/rptseller?sCode=${seller.S_CODE }">신고 조회</a></button>
				</tr>
				<tr>
					<th>총 신고 횟수</th>
					<td colspan="2">${rptCnt }</td>
					<td><button><a href="/manager/sls/">판매-관리 조회</a></button></td>
				</tr>
			</table>	
		</div> <!-- info End -->
			
	</div> <!-- main End -->
</div> <!-- section End -->

<div class="page">
	<h3>판매자 상세 정보</h3>
</div>

<div class="section">
	<form action="./sellerpridetail" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th colspan="4">기본 정보</th>
			</tr>
			<tr>
				<th><label for="bId">아이디</label></th>
				<td><input type="text" id="bId" name="bId" value="${seller.B_ID }"></td>
				<th><label for="bPw">비밀번호</label></th>
				<td><input type="password" id="bPw" name="bPW" value="${seller.B_PW }"></td>
			</tr>
			<tr>
				<th><label for="bName">이름</label></th>
				<td><input type="text" id="bNAme" name="bName" value="${seller.B_NAME }"></td>
				<th><label for="sPhone">핸드폰 번호</label></th>
				<td><select class="sPhone" id="sPhone" name="sPhone">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="016">016</option>
						<option value="in">직접 입력</option>
					</select>
					<input type="text" class="s" id="inPhone" name="inPhone">-<input type="text" class="s" id="mPhone" name="mPhone">-<input type="text" class="s" id="lPhone" name="lPhone">
				</td>
			</tr>
			<tr>
				<th><label for="bEmail">이메일</label></th>
				<td><input type="text" id="bEmail" name="bEmail" required="required">
					<select class="bEmail2" name="bEmail2" id="bEmail2">
						<option>@naver.com</option>
						<option>@gmail.com</option>
						<option>@daum.net</option>
						<option value="in">직접 입력</option>
					</select>
					<input type="text" id="inEmail" name="inEmail" placeholder="@test.com 형식으로 입력하세요.">
				</td>
				<th><label for="bEntdate">가입일</label></th>
				<td><input type="date" id="bEntdate" name="bEntDate" value="${seller.B_ENTDATE }" readonly="readonly"></td>
			</tr>
			<tr>
				<th><label for="sPostcode">우편번호</label></th>
				<td colspan="3"><input type="text" id="sPostcode" name="sPostcode" value="${seller.S_POSTCODE }"></td>
			</tr>
			<tr>
				<th><label for="sAddr">거래 주소</label></th>
				<td colspan="3"><input type="text" id="sAddr" name="sAddr" value="${seller.S_ADDR }"></td>
			</tr>
			<tr>
				<th><label for="sDetail">상세 주소</label></th>
				<td colspan="3"><input type="text" id="sDetail" name="sDetail" value="${seller.S_DETAIL }"></td>
			</tr>
			
			<tr>
				<th colspan="4">기업 정보</th>
			</tr>

			<tr>
				<th><label for="cmpName">상호명</label></th>
				<td colspan="3"><input type="text" id="cmpName" name="cmpName" value="${seller.CMP_NAME }"></td>			
			</tr>
			
			<tr>
				<th><label for="cmpCeo">대표자명</label></th>
				<td><input type="text" id="cmpCeo" name="cmpCeo" value="${seller.CMP_CEO }"></td>			
				<th><label for="cmpNum">사업자 등록 번호</label></th>
				<td><input type="text" id="cmpNum" name="cmpNum" value="${seller.CMP_NUM }"></td>			
			</tr>
			
			<tr>
				<th><label for="cmpPostcode">우편번호</label></th>
				<td colspan="3"><input type="text" id="cmpPostcode" name="cmpPostcode" value="${seller.CMP_POSTCODE }"></td>			
			</tr>
			<tr>
				<th><label for="cmpAddr">사업장 주소</label></th>
				<td colspan="3"><input type="text" id="cmpAddr" name="cmpAddr" value="${seller.CMP_ADDR }"></td>			
			</tr>
			<tr>
				<th><label for="cmpDetail">사업장 상세 주소</label></th>
				<td colspan="3"><input type="text" id="cmpDetail" name="cmpDetail" value="${seller.CMP_DETAIL }"></td>			
			</tr>
						
			<tr>
				<th for="cmpFile">제출 서류</th>
				<td colspan="3"><input type="file" id="cmpFile" name="cmpFile"><td>
			</tr>
			
			<tr>
				<th colspan="4">계좌 정보</th>
			</tr>
			
			<tr>
				<th><label for="accName">예금주</label></th>
				<td colspan="3"><input type="text" id="accName" name="accName" value="${seller.ACC_NAME }"></td>
			</tr>
			<tr>
				<th><label for="accBank">은행명</label></th>
				<td><input type="text" id="accBank" name="accBank" value="${seller.ACC_BANK }"></td>
				<th><label for="accNo">계좌번호</label></th>
				<td><input type="text" id="accNo" name="accNo" value="${seller.ACC_NO }"></td>
			</tr>
			
			<tr>
				<th colspan="4">판매자 탈퇴 정보</th>
			</tr>
			
			<tr>
				<th>판매자 탈퇴 여부</th>
				<c:if test="${seller.S_OUT eq 'Y' }">
					<td>
						탈퇴
					</td>
				</c:if>
				<c:if test="${seller.S_OUT eq 'N' }">
					<td>
						미탈퇴
					</td>
				</c:if>
				
				<th><label for="sOutDate">탈퇴 날짜</label></th>
				<c:if test="${seller.S_OUT_DATE eq null }">
					<td>
						-
					</td>
				</c:if>
				<c:if test="${seller.S_OUT_DATE ne null }">
					<td>
						<input type="date" id="sOutDate" name="sOutDate" value="${seller.S_OUT_DATE }" readonly="readonly">			
					</td>
				</c:if>
			</tr>
			
			<c:if test="${seller.S_OUT eq 'N' }">
				<tr>
					<th><label for="sOut">탈퇴 처리</label></th>
					<td><input type="button" id="sOut" name="sOut" value="탈퇴하기"></td>
				</tr>
			</c:if>
			
		</table>
		
<!-- 		<button class="btnLeft">수정하기</button> -->
		<button type="button" id="btnList" class="btn">목록으로</a></button>
	</form>
</div> <!-- section End -->
</div>
</div>
</div>
</body>
</html>
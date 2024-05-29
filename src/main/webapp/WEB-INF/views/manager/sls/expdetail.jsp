<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager/sls/expdetail.css">

<script type="text/javascript">
$(function() {
	//예약관리 삭제기능
	$("#btn_expdetail_cancel").click(function() {

		var len = $("input[name=chkBox]:checked").length;
		var chk = new Array();
		
		$("input:checkbox[name=chkBox]").each(function() {
			if ($(this).is(":checked") == true) {
				chk.push($(this).attr('id'));
			}
		})
		
		console.log(len);
		console.log(chk);

		if (len == 0) {
			alert("삭제할 게시물 선택해주세요.");
			
			
		} else {
			$.ajax({
				url : "./expdetaillistdel",
				type : "post",
				data : {
					chBox : chk
					
				},
				 success: function(res) {
	                    if (res.res < 0) {
	                        alert("예약된 인원을 삭제해주세요.");
	                    } else if (res == 0) {
	                        alert("삭제 실패");
	                    } else {
	                        alert("삭제 성공");
	                        location.reload();
	                    }
	                },
				error : function() {
					console.log("error");
				}
			})
		}

	})//btn_expdetail_cancel
})
</script>

</head>

<body>
<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
	<div class="full">
		<aside>
			<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
			<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
		</aside>
		<div class="wrap">
			<div class="page">
				<h1>체험 상세조회</h1>
				<hr>
			</div>

			<div class="section">
				
				<label>프로필 이미지</label>
				<div>
					<img alt="없음" src="/upload/${profileimage.storedName }">
				</div>
		
				<div class="top_section_con">
						<div class="expName">
							<label>체험제목</label>
							<div>${view.expName}</div>
						</div>
		
						<div class="expPrice">
							<label>참가비용</label>
							<div>${view.expPrice}</div>
						</div>
		
						<div class="expDetail">
							<label>체험설명</label>
							<textarea readonly onclick="this.blur()">${view.expDetail}</textarea>
						</div>
		
						<div>
							<a href="./expupdate?expCode=${view.expCode }" ><button type="button">수정하기</button></a>
						</div>				
					</div>
				<label>체험상세 이미지</label>
				<div>
				<c:forEach var="fileImage" items="${fileImage }">
		    		<img alt="없음" src="/upload/${fileImage.storedName }">
				</c:forEach>
				</div>

				<div class="section">
	<table>
		<thead>
			<tr>
				<th></th>
				<th>모집날짜</th>
				<th>시간</th>
				<th>신청한인원</th>
				<th>등록가능인원</th>
				<th>예약관리</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
		<!-- 합계 합산 -->
	
			<c:forEach var="expSchList" items="${expSchList}">
				<tr>
					<td><input type="checkbox" id="${expSchList.schNo }" name="chkBox"></td>
					<td>
						<fmt:parseDate value="${expSchList.schDate}" var="schDate" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${schDate}" pattern="yyyy-MM-dd" /></td>
					<td>${expSchList.schTime}</td>
					
						<!-- 예약인원 합계계산 -->
						<c:set var="totalResCnt" value="0" />
						<c:forEach var="resCnt" items="${resCnt}">
							<c:if test="${expSchList.schNo == resCnt.schNo}">
								<c:set var="totalResCnt" value="${totalResCnt + resCnt.resCnt}" />
							</c:if>
						</c:forEach>
						<td class ="totalResCnt">${totalResCnt }</td>
					
					<td>${expSchList.schCnt}</td>
					<td>
						<c:choose>
	                		<c:when test="${expSchList.schCnt == totalResCnt }">
	                			모집마감
	                		</c:when>
	                		<c:when test="${expSchList.schCnt > totalResCnt }">
	                			모집중
	                		</c:when>
	                		<c:when test="${expSchList.schCnt < totalResCnt }">
	                			에러
	                		</c:when>
                		</c:choose>
					</td>
					<td><a href="./expresdetail?expCode=${expSchList.expCode}&schNo=${expSchList.schNo }"><button>예약관리</button></a>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
				
				
				<div class="btn_bot_box">
					<button type="button" id ="btn_expdetail_cancel">삭제하기</button>
					<a href="./explist" ><button type="button" >돌아가기</button></a>
				</div>
				<div></div>
			</div>
		</div>
	</div>
</body>



</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">
<title>Insert title here</title>

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
<style type="text/css">
/* 중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.section_top {
	display: flex;
	align-items: flex-start;
	margin-bottom: 20px;
}

.section_top img {
	height: 250px;
	width: 250px;
	object-fit: cover;
	margin: 20px;
}

.section .deptno_box, .section .mgrName_box, .section .mgrCode_box,
	.section .mgrEntDate_box {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}

label {
	color: #373f57;
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 5px;
	width: 200px;
	text-align: justify;
}

input[type="text"], select {
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
}

.section h3 {
	color: #333;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 5px;
	margin-bottom: 20px;
}

.top_section_con {
	padding: 20px;
	margin-left: 20px;
	margin-top: 20px;
	flex: 1;
}

.top_section_con div {
	margin-bottom: 10px;
}

/* --------------------------------------- */
/* 색션 하단 */
.section_bot_title {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

.section_bot_itembox {
	width: 500px;
	margin-left: 280px;
}

.section .mgrPhone_box, .section .mgrEmail_box, .section .mgrBirth_box,
	.section .mgrGender_box {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}

/* 파일버튼 디자인 */
.bot_document_filebox {
	display: flex;
	margin-left: 20px;
	margin-bottom: 15px;
}


.bot_document_filebox .file_find {
	text-align: right;
	width: 100px;
}

.bot_document_filebox .file_name{
	overflow: auto;
}

.bot_document_filebox input[type="file"] {
	width: 0;
	height: 0;
	overflow: hidden;
	display: none;
}

.bot_document_filebox .document_file {
	display: inline-block;
	height: 46px;
	padding: 0 10px;
	vertical-align: middle;
	width: 79%;
	color: #999999;
}

.btnRight{
	margin-right: 20px;
}


.expDetail{
	display: flex;
	padding-bottom: 20px
}
.expName{
	display: flex;
	padding-bottom: 20px
}

.expPrice{
	display: flex;
	padding-bottom: 20px
}

.btn_bot_box{
	margin-top: 20px;
	display: flex;
    justify-content: flex-end;
}

</style>
</head>

<body>
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
			<sec:authentication var="managerLogin" property="principal"/>
	<c:if test="${managerLogin.deptno eq 10}">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 20}">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 30}">
		<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 40}">
		<c:import url="/WEB-INF/views/layout/manager/managercsmenu.jsp"/>
	</c:if>
		<div class = "full content" >
		<div class="wrap">
			<div class="page">
				체험 상세조회
				<hr>
			</div>

			<div class="section_top">
			    
	    		<img alt="없음" src="/upload/${profileimage.storedName }">
		
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
							<textarea readonly onclick="this.blur()" style="width: 1000px;height: 100px;">${view.expDetail}</textarea>
						</div>
		
						<div>
							<a href="./expupdate?expCode=${view.expCode }" ><button type="button" class="btn btnRight">수정하기</button></a>
						</div>				
					</div>
				</div>
				
				<div class="section_bot">
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
					<td><a href="./expresdetail?expCode=${expSchList.expCode}&schNo=${expSchList.schNo }"><button class="btn btndetail">예약관리</button></a>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
				
				
				<div class="btn_bot_box">
					<a href="./explist" ><button type="button" class="btn btnRight">목록으로</button></a>
					<button type="button" class="btn btnDel" id ="btn_expdetail_cancel">삭제하기</button>
				</div>
				<div></div>
			</div>
		</div>
	</div>
</body>



</html>
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
/* 전체 기본 설정 */
* {
	margin: 0;
	padding: 0;
	border: 0;
	vertical-align: baseline;
	box-sizing: border-box;
	font: inherit;
	font-size: 100%;
	line-height: 1.5;
	color: #333;
}

h3 {
	color: #333;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 5px;
	margin-bottom: 20px;
}

/* 외부 레이아웃 설정 */
.full {
	width: 1200px;
	border: 1px solid #ccc;
	margin: 0 auto;
	display: flex;
	background-color: #f9f9f9;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
}

aside {
	width: 300px;
	background-color: #f1f1f1;
	border-right: 1px solid #ddd;
	box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.05);
}

.wrap {
	flex: 1;
	display: flex;
	flex-direction: column;
	padding: 20px;
}

/* 상단 페이지 */
.page {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

/* [우]중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* [우]하단 페이지 */
.btn_bot_style {
	display: flex;
	float: right;
	margin: 0 0 20px 0;
}

/* ------------------------------------- */
/* 상단 */
/* 검색 */
.search_form_wrap {
	padding-top: 20px;
	margin: 0 0 20px 0;
	display: flex;
	border-top: 3px solid #d8d8d8;
	flex-direction: row-reverse;
}
/* 검색창 */
.search_form {
	display: flex;
	align-items: center;
	margin-top: 20px;
	border-radius: 5px;
}

.search_form button[type="submit"] {
	padding: 6px 15px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px; /* 버튼 둥글게 */
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.search_form button[type="submit"]:hover {
	background-color: #0056b3;
}

/* 버튼 */
button[type="submit"] {
	padding: 6px 12px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}

/* 본문 */
/* 테이블 세팅 */
table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 100%;
	text-align: center;
}

table td {
	padding: 9px;
}

table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table th:first-child, .table td:first-child {
	border-left: 0;
}

table th:last-child, .table td:last-child {
	border-right: 0;
}

table tr td:first-child {
	text-align: center;
}

table caption {
	caption-side: bottom;
	display: none;
}

table tr:hover {
  background-color: #f5f5f5;
}


/* 버튼세팅 */
.btn_section_detail {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	cursor: pointer;
}

/* 하단 */
.btn_bot_wrap {
	padding-top: 10 px;
	display: flex;
	float: right;
	margin:20px 0;
	justify-content: flex-end
}

/* 버튼 세팅 */
.btn_bot_inform, .btn_bot_del {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	cursor: pointer;
}

.btn_bot_inform {
	background-color: #4CAF50;
	color: white;
}

.btn_bot_inform:hover {
	background-color: #45a049;
}

.btn_bot_del {
	background-color: #f44336;
	color: white;
	margin-left: 10px;
}

.btn_bot_del:hover {
	background-color: #da190b;
}

button[type="submit"]:hover,
.btn_section_detail:hover,
.btn_bot_inform:hover,
.btn_bot_del:hover {
  background-color: #0056b3;
}
</style>


</head>

<body>
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
		<div class="wrap">
			<div class="page">
				<h1>체험 상세조회</h1>
				<hr>
			</div>

			<div class="section">
			    
	    		<img alt="없음" src="/upload/${fileimage.storedName }">
		
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
	</div>
</body>



</html>
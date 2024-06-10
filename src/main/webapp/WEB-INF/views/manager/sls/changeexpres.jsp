<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">
<style type="text/css">
/* [우]하단 페이지 */
.btn_bot_style {
	display: flex;
	float: right;
	margin: 0 0 20px 0;
}


/* 섹션 스타일 */
.section {
	padding-top: 20px;
	width: 500px;
	margin: 0 auto;
}

.section input[type="date"] {
	padding: 12px;
	text-align: center;
	width: 100%;
}

.section input[type="text"] {
	border: 1px solid #ccc;
}

.section div {
	margin-bottom: 20px;
}

.section textarea {
	border: 1px solid #ccc;
	width: 100%;
}

.btn_modal_wrap {
	display: flex;
}

label {
	color: #373f57;
	font-size: 16px;
	font-weight: bold;
}

.section input[type="text"] {
	padding: 12px;
	width: 100%;
}

.section .hyphen {
	height: 46px;
	padding: 10px 10px;
	font-weight: bold;
	vertical-align: middle;
	margin: 0px;
	border: 0px;
}

/* 파일버튼 디자인 */
.filebox {
	display: flex;
	justify-content: flex-end;
}

.filebox input[type="file"] {
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.filebox .upload_name
, .filebox .profile_name {
	display: inline-block;
	height: 46px;
	padding: 0 10px;
	vertical-align: middle;
	width: 79%;
	color: #999999;
}

.filebox label {
	display: inline-block;
	width: 21%;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 46px;
}

.phone_box {
	display: flex;
}

.phone_box input[type="text"] {
	width: calc(1/ 3);
	text-align: center;
}

.email_box {
	display: flex;
}

/* 모달1버튼 */
#btnSearchCmp {
	padding: 6px 12px;
	background-color: #652CB3;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	white-space: nowrap;
}

#btnSearchCmp:hover {
	background-color: #652CB3;
}

.modal-header {
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid black;
	padding-bottom: 10px;
}

/* 모달2버튼 */
.btnPostcode_wrap {
	width: 230px;
	margin: 0 auto;
}

#postcodeWrap {
	margin: 0 auto;
	display: flex;
	border-radius: 8px;
	overflow: auto;
}

#btnPostcode {
	padding: 12px 25px;
	background-color: #652CB3;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	white-space: nowrap;
}

#btnPostcode:hover {
	background-color: #652CB3;
}

#schDate {
	border: 1px solid #ccc;
}

.modal_time_con {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.modal_time_section {
	margin: 10px 0;
}

.modal_time_section h2 {
	margin: 0;
	font-size: 1.2em;
	color: #333;
}

.modal_time_buttons {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.modal_time-buttons input {
	margin: 5px;
	padding: 10px 20px;
	font-size: 1em;
	background-color: #f0f0f0;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.modal_time-buttons input:hover {
	background-color: #ddd;
}

.modal_body_title {
	margin-bottom: 5px;
	font-size: 20px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}


#applyBtn, #time_modal_cencle{
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

.applyBtn {
	background-color: #4CAF50;
	color: white;
}

.applyBtn:hover {
	background-color: #45a049;
}

.time_modal_cencle {
	background-color: #f44336;
	color: white;
	margin-left: 10px;
}

.time_modal_cencle:hover {
	background-color: #da190b;
}

button[type="submit"] {
    outline: 0;
    border: none;
    transition: all 0.2s ;
   	width: 90px;
   	height: 36px;
    background-color: #652CB3;
    border-radius: 5px;
   	color: white;
   	font-size: 15px;
}

button[type="submit"]:hover {
	background-color: #652CB3;
}

.btn_inform{
	margin: 0 auto;
    display: flex;
}

.btn_bot_join{
	margin: 0 auto;
}

.page{
margin-bottom: 20px;
}

</style>
</head>

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
				체험 수정하기
				<hr>
			</div>

			<div class="section">
				<form action="./changeexpres?expCode=${update.expCode}&schNo=${update.schNo}" method="post">
				<div>
					<input type="hidden" name="resCode" value="${update.resCode}" >			
				</div>
	
				<div>
					<label>대표자 이름</label> <input type="text" name="resName" value="${update.resName}">
				</div>

				<div>
					<label>전화 번호</label> <input type="text" name="resPhone" value="${update.resPhone}">
				</div>
				
				<div>
					<label>이메일</label> <input type="text" name="resEmail" value="${update.resEmail}">
				</div>

				<div>
					<label>예약인원</label> <input type="text" name="resCnt" value="${update.resCnt}">
				</div>
				
				<div>
					<label>예약일</label><input type="date" name="schDate" value="${update.schDate }">
				</div>
				
				<div>
				<c:forEach var="expSch" items="${expSch}">
					<label>예약시간</label><input type="text" name="schTime" value="${expSch.schTime }">
				</c:forEach>
				</div>

				<div style="display: flex;">
					<button type="submit" style="margin: 0 auto;">수정완료</button>
				</div>
				</form>

			</div>
		</div>
	</div>
	</div>
</body>



</html>
<%@page import="recycling.dto.manager.Faq"%>
<%@page import="recycling.dto.manager.FaqCt"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>CS Center</title>

<style type="text/css">
.wrap {
	width: 1000px;
	margin: auto;
}

.page_box {
	border-bottom: 3px solid #000;
}
.FAQ_Content h2 {
	text-align: center;
	margin-top: 15px;
}
.FAQ_CT_button {
	color: gray;
	font-size: 20px;
	font-weight: 600;
    background-color: white;
    border: 0;
}

.FAQ_CT {
	margin-top:30px;
	margin-left: 10px;
}
.cs_center{
	text-align: right;
}

.cs_menu {
    text-align: center;
    border-bottom: 3px solid #000;
    
}

.cs_menu a {
    text-decoration: none;
    color: gray;
    text-align: center;
    font-size: 25px;
}

.cs_menu_a { 
 	margin: 60px; 
}

.FAQ_table_head {
	display: flex;
    box-sizing: border-box;
    width: 100%;
    height: 55px;
    border-top: 1px solid #000;
    border-bottom: 3px solid #000;
    align-items: center;
    justify-content: center;
}

.FAQ_table {
	margin-top: 15px;
}

.FAQ_table_ct{
	width: 160px;
    text-align: center;
}

.FAQ_table_title {
	text-align: center;
    flex: 1;
}

.FAQ_table_list_Ans {
    display: flex;
    width: 160px;
    font-size: 14px;
    color: #6e6e6e;
    align-items: center;
    justify-content: center;
}

.FAQ_table_list_contents {
    padding: 24px 10px;
    font-size: 14px;
    color: #6e6e6e;
}


.FAQ_table_list_box {
    display: flex;
    overflow: hidden;
    height: auto;
    background-color: #f5f5f5;
}

</style>

<script type="text/javascript">
function toggleAnswer(ctFaqno) {
    var answerBox = ctFaqno.querySelector('.FAQ_table_list_AnsBox');
    if (answerBox.style.display === 'none' || answerBox.style.display === '') {
        answerBox.style.display = 'block';
    } else {
        answerBox.style.display = 'none';
    }
}

</script>
</head>
<body>

<div class="wrap">
<div class="page_box">
<h2>고객센터</h2>
</div>

<div class="menu">
	<div class="cs_center">
	
		<div>
			<p class="cs_number font-mss">
			<span>TEL.</span>
			1234-1234
			</p>
		</div>
		
		<div class="cs_time">
			- 평일 9:00~18:00<br>
			- 토, 일, 공휴일 휴무<br>
			카카오톡 문의 : asdf@asdf.com<br><br>
		</div>
	
	</div>
	<br>
	
	<nav class="cs_menu">
			<a href="./noticelist" class="cs_menu_a">공지사항</a>
			<a href="./otoform" class="cs_menu_a">1:1문의하기</a>
			<a href="/buyer/mypage/myboard" class="cs_menu_a">내 질문</a>
			<a href="./main" class="cs_menu_a">자주 묻는 질문</a><br><br>
	</nav>
		
<div class="FAQ_Content">
	<h2>FAQ 자주 묻는 질문</h2>
	
	<nav class="FAQ_CT">
			<button type="button" class="FAQ_CT_button" value="3000"><a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3000&sCtg=UP">회원</a></button>
            <button type="button" class="FAQ_CT_button" value="3010"><a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3010&sCtg=UP">결제</a></button>
            <button type="button" class="FAQ_CT_button" value="3020"><a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3020&sCtg=UP">예약</a></button>
            <button type="button" class="FAQ_CT_button" value="3030"><a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3030&sCtg=UP">재활용품</a></button>
            <button type="button" class="FAQ_CT_button" value="3040"><a href="/buyer/help/main?curPage=${upPaging.curPage }&search=${upPaging.search}&sCtg=UP">업사이클링</a></button>
            <button type="button" class="FAQ_CT_button" value="3050"><a href="/buyer/help/main?curPage=${upPaging.curPage }&search=${upPaging.search}&sCtg=UP">체험단</a></button>
            <button type="button" class="FAQ_CT_button" value="3060"><a href="/buyer/help/main?curPage=${upPaging.curPage }&search=${upPaging.search}&sCtg=UP">세척</a></button>
            <button type="button" class="FAQ_CT_button" value="3070"><a href="/buyer/help/main?curPage=${upPaging.curPage }&search=${upPaging.search}&sCtg=UP">기타</a></button>
	</nav>
	

</div>

<div class="FAQ_table">
	<div class="FAQ_table_head">
		<p class="FAQ_table_ct">구분</p>
		<p class="FAQ_table_title">제목</p>
	</div>
	
	<c:forEach var="faq" items="${list}">
		<div class="FAQ_table_list" onclick="toggleAnswer(this)" data-ctFaqno="${faq.ctFaqno}">
			<em class="FAQ_list_ct">
				<c:forEach var="faqCt" items="${faqCtlist}">
					<c:if test="${faq.ctFaqno == faqCt.ctFaqno}">
						${faqCt.ctFaqname}
					</c:if>
				</c:forEach>
			</em>
			<p class="FAQ_list_title">${faq.faqTitle}</p>
			<div class="FAQ_table_list_box">
				<div class="FAQ_table_list_AnsBox" style="display: none;">
					<em class="FAQ_table_list_Ans">답변</em>
					<div class="FAQ_table_list_contents">
						<p>${faq.faqAns}</p>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>

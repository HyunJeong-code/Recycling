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
<title>CS Center</title>

<style type="text/css">

.full{
	background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.wrap {
    background-color: #fff;
    padding: 20px;
    box-sizing: border-box;
}

.page{
   border-bottom: 3px solid #ddd;
}

.page, .section {
    display: flex;
    flex: 1;
    flex-direction: column;
}
.cs_center {
    text-align: right;
    margin-bottom: 20px;
}

.cs_center .cs_number {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
}

.cs_center .cs_time {
    font-size: 14px;
    line-height: 1.6;
}

.cs_menu {
    text-align: center;
    border-bottom: 3px solid #ddd;
    margin-bottom: 30px;
}

.cs_menu a {
    text-decoration: none;
    color: gray;
    font-size: 20px;
    margin: 60px;
    transition: color 0.3s;
}

.cs_menu a:hover {
    color: #000;
}

.FAQ_Content h2 {
    text-align: center;
    margin-top: 15px;
    font-size: 24px;
}

.FAQ_CT {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 30px;
}

.FAQ_CT a {
    text-decoration: none;
}

.FAQ_CT_button {
    color: gray;
    font-size: 17px;
    font-weight: 600;
    background-color: white;
    border: 0;
    padding: 10px 10px;
    cursor: pointer;
}


.FAQ_table {
    margin-top: 15px;
    border-top: 2px solid #000;
}

.FAQ_table_head {
    display: flex;
    box-sizing: border-box;
    width: 100%;
    height: 55px;
    background-color: #f9f9f9;
    border-bottom: 2px solid #000;
    align-items: center;
    justify-content: center;
}

.FAQ_table_head p {
    margin: 0;
    font-weight: bold;
}

.FAQ_table_ct {
    width: 160px;
    text-align: center;
}

.FAQ_table_title {
    flex: 1;
    text-align: center;
}

.FAQ_table_list {
    display: ruby-text;
    padding: 10px;
    cursor: pointer;
    border-bottom: 1px solid #eee;
    transition: background-color 0.3s;
    position: relative;
}

.FAQ_table_list:hover {
    background-color: #f1f1f1;
}

.FAQ_list_ct {
	display: flex;
    width: 160px;
    height:30px;
    text-align: center;
    font-weight: bold;
    margin-left: 40px;
}

.FAQ_list_title {
    flex: 1;
    padding-left: 20px;
    font-size: 16px;
}

.FAQ_list_toggle {
    width: 30px;
    text-align: center;
    font-size: 24px;
    transform: rotate(0);
    transition: transform 0.3s;
}

.FAQ_table_list.open .FAQ_list_toggle {
    transform: rotate(180deg);
}

.FAQ_table_list_box {
    display: none;
    width: 100%;
    padding: 15px;
    background-color: #f5f5f5;
    border-top: 1px solid #ddd;
    box-sizing: border-box;
    position: relative;
    margin-top: 10px;
}

.FAQ_table_list_AnsBox {
	display: flex;
    padding: 10px;
    width: 100%;
}

.FAQ_table_list_Ans {
    display: flex;
    width: 160px;
    text-align: center;
    font-weight: bold;
    margin-left: 30px;
    font-size: 16px;
    color: #6e6e6e;
}

.FAQ_table_list_contents {
    font-size: 14px;
    color: #6e6e6e;
    margin-left: 200px;
}

</style>

<script type="text/javascript">
// function toggleAnswer(ctFaqno) {
//     var answerBox = ctFaqno.querySelector('.FAQ_table_list_AnsBox');
//     if (answerBox.style.display === 'none' || answerBox.style.display === '') {
//         answerBox.style.display = 'block';
//     } else {
//         answerBox.style.display = 'none';
//     }
// }
function toggleAnswer(element) {
    var answerBox = element.querySelector('.FAQ_table_list_box');
    if (answerBox.style.display === 'none' || answerBox.style.display === '') {
        answerBox.style.display = 'block';
        element.querySelector('.FAQ_list_toggle').textContent = '∧';  // 펼쳐졌을 때 표시
        element.style.height = 'auto'; // 높이를 자동으로 설정
    } else {
        answerBox.style.display = 'none';
        element.querySelector('.FAQ_list_toggle').textContent = '∨';  // 닫혔을 때 표시
        element.style.height = 'auto'; // 높이를 자동으로 설정
    }
}

</script>
</head>
<body>
<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
<div class="full">
<div class="wrap">

<div class="page">
<h2>고객센터</h2>
</div>

<div>
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
</div>		
<div class="FAQ_Content">
	<h2>FAQ 자주 묻는 질문</h2>
	
	<nav class="FAQ_CT">
			<a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3000&sCtg=UP"><button type="button" class="FAQ_CT_button" value="3000">회원</button></a>
            <a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3010&sCtg=UP"><button type="button" class="FAQ_CT_button" value="3010">결제</button></a>
            <a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3020&sCtg=UP"><button type="button" class="FAQ_CT_button" value="3020">예약</button></a>
            <a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3030&sCtg=UP"><button type="button" class="FAQ_CT_button" value="3030">재활용품</button></a>
            <a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3040&sCtg=UP"><button type="button" class="FAQ_CT_button" value="3040">업사이클링</button></a>
            <a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3050&sCtg=UP"><button type="button" class="FAQ_CT_button" value="3050">체험단</button></a>
            <a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3060&sCtg=UP"><button type="button" class="FAQ_CT_button" value="3060">세척</button></a>
            <a href="/buyer/help/main?curPage=${upPaging.curPage }&search=3070&sCtg=UP"><button type="button" class="FAQ_CT_button" value="3070">기타</button></a>
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
			<div class="FAQ_list_toggle">∨</div>
			<div class="FAQ_table_list_box">
				<div class="FAQ_table_list_AnsBox">
					<em class="FAQ_table_list_Ans">답변</em>
					<div class="FAQ_table_list_contents">
						<p>${faq.faqAns}</p>
					</div>
				</div>
			</div>
		</div>
		<hr>
	</c:forEach>
	
<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
</div>
</div>
</div>
<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>

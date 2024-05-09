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

function toggleAnswer(question) {
    var answerBox = question.querySelector('.FAQ_table_list_AnsBox');
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
	
	
</div>

<div class="FAQ_Content">
	<h2>FAQ 자주 묻는 질문</h2>
	
	<nav class="FAQ_CT">
			<button type="button" class="FAQ_CT_button " value="000" onclick="getFaq('000', '')">회원</button>
			<button type="button" class="FAQ_CT_button " value="001" onclick="getFaq('001', '')">상품확인</button>
			<button type="button" class="FAQ_CT_button " value="002" onclick="getFaq('002', '')">주문/결제</button>
			<button type="button" class="FAQ_CT_button " value="003" onclick="getFaq('003', '')">배송</button>
			<button type="button" class="FAQ_CT_button " value="004" onclick="getFaq('004', '')">교환/취소(반품)</button>
			<button type="button" class="FAQ_CT_button " value="005" onclick="getFaq('005', '')">기타</button>
	</nav>

</div>

<div class="FAQ_table">
	<div class="FAQ_table_head">
		<p class="FAQ_table_ct">구분</p>
		<p class="FAQ_table_title">제목</p>
	</div>
	
<!-- 	<div class="FAQ_table_list_box"> -->
	
	
<!-- 		<div class="CFaqTableItem"> -->
		
		
<!-- 		<div class="FAQ_table_list" > -->
<%-- 			<em class="FAQ_list_ct">${faqct.ctFaqname }</em> --%>
<%-- 			<p class="FAQ_list_title">${faq.faqTitle }</p> --%>
<!-- 		</div> -->
		
		
		
		
<!-- 		<div class="FAQ_table_list_AnsBox"> -->
<!-- 			<em class="FAQ_table_list_Ans">답변</em> -->
<!-- 			<div class="FAQ_table_list_contents"> -->
<%-- 				<p>${faq.faqAns }</p> --%>
<!-- 			</div> -->
<!-- 		</div> -->
		
		
<!-- 		</div> -->
		
		
<!-- 	</div> -->
	
		<% 
            List<Faq> list = (List<Faq>) request.getAttribute("list");// Controller에서 전달된 질문 목록
            List<FaqCt> faqCtlist = (List<FaqCt>) request.getAttribute("faqCtlist");
            for (Faq faq : list) {
   		%>
   		
<!-- 	<div>수정중 -->
	
	<div class="FAQ_table_list" onclick="toggleAnswer(this)">
		<em class="FAQ_list_ct">
		<%
		for (FaqCt faqCt : faqCtlist) {
			if(faq.getCtFaqno() == faqCt.getCtFaqno()){
				out.print(faqCt.getCtFaqname());
				break;
			}
		}
		%>
		</em>
		<p class="FAQ_list_title"><%= faq.getFaqTitle() %></p>
	    
	    
		<div class="FAQ_table_list_box">
			<div class="FAQ_table_list_AnsBox" style="display: none;">
				<em class="FAQ_table_list_Ans">답변</em>
					<div class="FAQ_table_list_contents">
	    				<p><%= faq.getFaqAns() %></p>
	                </div>
	        </div>
        </div>
	</div>
<!-- 	</div> -->
                <%
            }
        %>
</div>
<c:import url="/WEB-INF/views/layout/paging.jsp"/>
</div>


</body>
</html>
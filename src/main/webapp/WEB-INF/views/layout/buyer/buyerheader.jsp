<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새활용 메인페이지</title>

<!-- header css -->
<link rel="stylesheet" href="/resources/css/header.css">
<script src="https://kit.fontawesome.com/4d3841cf80.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
$(function(){
// 	setInterval(() => 
// 		$.ajax({
// 			type: 'get',
// 			url : '/buyer/buyerheader',
// 			dataType: 'json',
// 			success: function(res) {
				
	// 			$("#ntcBanner").html(res[0].RNUM)
	// 			$("#ntcBanner").html(res[0].NTC_CODE)
	// 			$("#ntcBanner").html(res[0].TITLE)
	
	// 			var html = "" + res[0]["RNUM"] + " " + res[0]["NTC_CODE"] + " " + res[0]["TITLE"]
	// 			$("#ntcBanner").html(html)
				
// 				$("<div>").html( res[0].RNUM + " " + res[0].NTC_CODE + " " + "<a href='/buyer/hepl/noticedetail?ntcCode=" + res[0].NTC_CODE + "'>" + val.TITLE +"</a>" )
// 				.appendTo($("#ntcBanner"))					

// 			console.log("res : " + JSON.stringify(res));
// 			console.log("res : " + JSON.stringify(res).length);
// 			console.log("res : " + typeof(JSON.stringify(res)));
			
// 			var none = "<div id='info'>공지사항이 없습니다.</div>";
			
// 			var ntcList = JSON.stringify(res);
// 			console.log("ntcList : " + ntcList);
// 			console.log("ntcList[0] : " + typeof(ntcList));
			
			
// 			if(ntcList.length == 0) {
// 				$("#ntcBanner").html(none);
// 			} else {
				
// 				var banner = $("#ntc-banner");
// 				var ntc = "";
				
// 				ntc += "<ul>";
// 				for(var i = 0; i < ntcList.length; i++) {
// 					banner.append(
// 							$("<li>").html(ntcList[i].NTC_TITLE)
// 						);
// 				}
// 				ntc += "</ul>";
// 			}
// 		});
// 	, 5000);
    var header = $('.header');
    var headerOffset = header.offset().top;

    /* $(window).scroll(function() {
        if ($(window).scrollTop() >= headerOffset+600) {
            if (!header.hasClass('fixed')) {
                header.addClass('fixed').css('top', '-100px').animate({ top: 0 }, 300);
                $("body").css("padding-top","210px");
            }
        } else {
            if (header.hasClass('fixed')) {
                header.removeClass('fixed').animate({ top: '-100px' }, 300, function() {
                    header.css('top', '');
                    $("body").css("padding-top","0");
                });
            }
        }
    }); */
    
    // 페이지 로딩 시 sub-wrap을 숨긴 상태로 설정
    $(".sub-wrap").hide();
    
    
    //메뉴 스크롤 업/다운
    $('.menu, .sub-wrap').on('mouseleave', function(){
        $(".sub-wrap").stop().slideUp(200);
    });

    $('.menu, .sub-wrap').on('mouseover', function(){
        $(".sub-wrap").stop().slideDown(200);
    });
});
</script>
</head>
<body>
	<header class="header">
        <div class="notice-banner" id="ntcBanner">
        </div>
        
        <div class="container">
            <div class="nav-ul">
                <ul>
                    <li><a href="">고객센터</a></li>
                    <li><a href="">회사소개</a></li>
                </ul>
            </div>
            <div class="logo">
                <a href="/buyer/main">
                    <img src="/resources/img/logo.png" alt="Logo">
                </a>
            </div>
            <div class="nav-ul">
            	<sec:authorize access="isAnonymous()">
	                <ul>
	                    <li><a href="/buyer/login">로그인</a></li>
	                    <li><a href="/buyer/join">회원가입</a></li>
	                </ul>
            	</sec:authorize>
            	<sec:authorize access="hasRole('ROLE_BUYER')">
            	 	<ul>
	                    <li><a href="/buyer/logout">로그아웃</a></li>
	                    <li><a href="/buyer/mypage/myboard">마이페이지</a></li>
	                    <li><a href="/buyer/mypage/cart">장바구니</a>
	                    </li>
	                </ul>
            	</sec:authorize>
            </div>
        </div>
        <div class="container">
            <div>
                <div class="select-page">
                    <button class="selected"><a href="/buyer/main">Buyer</a></button><button><a href="/seller/main">Seller</a></button>
                </div>
            </div>
            <div class="search-bar">
                <input type="text" placeholder="검색어를 입력해주세요.">
                <button type="submit">
                    <span class="sch_send">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </span>
                </button>
            </div>
        </div>
        <div class="container">
            <div class="nav-ul menu">
                <ul class="menu-ul">
                    <li class="selected"><a href="/buyer/main">홈</a></li>
                    <li><a href="/buyer/upcycling/main">재활용품</a></li>
                    <li><a href="/buyer/recycling/main">업사이클링</a></li>
                    <li><a href="/buyer/exp/main">체험단</a></li>
                    <li><a href="/buyer/help/main">고객센터</a></li>
                    <li><a href="/buyer/about/info">회사소개</a></li>
                </ul>
            </div>
        </div>
        <div>
	        <div class="sub-wrap">
	            <ul>
	                <li><a href=""></a></li>
	            </ul>
	            <ul>
	                <li><a href="">가까운 판매자 찾기</a></li>
	                <li><a href="">분류1</a></li>
	                <li><a href="">분류2</a></li>
	                <li><a href="">분류3</a></li>
	                <li><a href="">분류4</a></li>
	                <li><a href="">분류5</a></li>
	            </ul>
	            <ul>
	                <li><a href="">분류1</a></li>
	                <li><a href="">분류2</a></li>
	                <li><a href="">분류3</a></li>
	                <li><a href="">분류4</a></li>
	                <li><a href="">분류5</a></li>
	            </ul>
	            <ul>
	                <li><a href="/buyer/exp/main">체험단 예약</a></li>
	                <li><a href="">체험단 후기</a></li>
	            </ul>
	            <ul>
	                <li><a href="">고객센터 안내</a></li>
	                <li><a href="">공지사항</a></li>
	                <li><a href="">자주 묻는 질문</a></li>
	                <li><a href="">1:1 게시판</a></li>
	                <li><a href="">Q & A</a></li>
	            </ul>
	            <ul>
	                <li><a href="">회사개요</a></li>
	            </ul>
	        </div>
	    </div>
    </header>
    
</body>
</html>
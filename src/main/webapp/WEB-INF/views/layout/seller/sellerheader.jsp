<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- header css -->
<link rel="stylesheet" href="/resources/css/header.css">
<script src="https://kit.fontawesome.com/4d3841cf80.js" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
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

});
</script>
</head>
<body>
	<header class="header">
        <div class="notice-banner">
            <a href="">공지사항</a>
        </div>
        <div class="container">
            <div class="nav-ul">
                <ul>
                    <li><a href="">고객센터</a></li>
                    <li><a href="">회사소개</a></li>
                </ul>
            </div>
            <div class="logo">
                <a href="/seller/main">
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
            	<sec:authorize access="hasRole('ROLE_SELLER')">
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
    </header>
</body>
</html>
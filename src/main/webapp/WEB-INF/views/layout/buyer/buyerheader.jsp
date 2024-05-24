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
        
            $('.menu, .sub-wrap').on('mouseover', function(){
                $(".sub-wrap").stop().slideDown(200);
            });

            $('.menu, .sub-wrap').on('mouseleave', function(){
                $(".sub-wrap").stop().slideUp(200);
            });

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
                <a href="#">
                    <img src="/resources/img/logo.png" alt="Logo">
                </a>
            </div>
            <div class="nav-ul">
            	<sec:authorize access="isAnonymous()">
	                <ul>
	                    <li><a href="../../buyer/login">로그인</a></li>
	                    <li><a href="../../buyer/join">회원가입</a></li>
	                    </li>
	                </ul>
            	</sec:authorize>
            	<sec:authorize access="hasRole('ROLE_BUYER')">
            	 	<ul>
	                    <li><a href="/buyer/logout">로그아웃</a></li>
	                    <li><a href="../../buyer/mypage/myboard">마이페이지</a></li>
	                    <li><a href="../../buyer/mypage/cart">장바구니</a>
	                    </li>
	                </ul>
            	</sec:authorize>
            </div>
        </div>
        <div class="container">
            <div>
                <div class="select-page">
                    <button class="selected">Buyer</button><button>Seller</button>
                </div>
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Search...">
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
                    <li class="selected"><a href="">홈</a></li>
                    <li><a href="">재활용품</a></li>
                    <li><a href="">업사이클링</a></li>
                    <li><a href="">세척업체 소개</a></li>
                    <li><a href="">체험단</a></li>
                    <li><a href="">고객센터</a></li>
                    <li><a href="">회사소개</a></li>
                </ul>
            </div>
        </div>
    </header>
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
                <li><a href="">업체 소개</a></li>
                <li><a href="">세척</a></li>
            </ul>
            <ul>
                <li><a href="">체험단 예약</a></li>
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
</body>
</html>
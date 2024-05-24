<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- header css -->
<link rel="stylesheet" href="/resources/css/header.css">

<script src="https://kit.fontawesome.com/4d3841cf80.js" crossorigin="anonymous"></script>
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
                <ul>
                    <li><a href="">로그인</a></li>
                    <li><a href="">회원가입</a></li>
                    <li><a href="">장바구니</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div>
                <div class="select-page">
                    <button class="selected">buyer</button><button>seller</button>
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
    </header>
</body>
</html>
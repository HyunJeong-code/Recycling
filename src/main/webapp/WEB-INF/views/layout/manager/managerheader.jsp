<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- <link rel="stylesheet" href="../../../resources/css/manager/sls/explist.css"> -->
</head>
<body>
	<header class="header">
        <div class="notice-banner">
            <a href="">공지사항</a>
        </div>
        <div class="logo">
			<a href="#">
			    <img src="/resources/img/logo.png" alt="Logo">
			</a>
        </div>
        <div class="nav-ul">
           	<sec:authorize access="isAnonymous()">
                <ul>
                    <li><a href="/manager/login">로그인</a></li>
                    <li><a href="/manager/join">회원가입</a></li>
                </ul>
           	</sec:authorize>
           	<sec:authorize access="hasRole('ROLE_MANAGER')">
           	 	<ul>
                    <li><a href="/manager/logout">로그아웃</a></li>
                    <li><a href="/manager/mgr/main">마이페이지</a></li>
                </ul>
           	</sec:authorize>
		</div>
	</header>
</body>
</html>

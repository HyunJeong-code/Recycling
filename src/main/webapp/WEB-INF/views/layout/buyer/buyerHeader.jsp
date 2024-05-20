<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style type="text/css">
header {
	width: 1200px;
	margin: 0 auto;
}
</style>
<header>
    <div class="head">
        <div class="ntc">
<%--         	<c:forEach var="" items=""> --%>
<!-- 	        	<h6></h6> -->
<%--         	</c:forEach> --%>
        </div>
        <div class="main">
            <h1>새활용</h1>
            <div class="search">
                <form action="" method="">
                    <input type="text" placeholder="Search">
                    <button>검색</button>
                </form>
            </div>
            <div class="top-btn">
                <!-- 세션 조건 걸기(로그인 여부) -->
                <sec:authorize access="isAnonymous()">
	                <button><a href="./join">회원가입</a></button>
					<button><a href="./login">로그인</a></button>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_BUYER')">
					<button><a href="./logout">로그아웃</a></button>
	                <button><a href="">마이페이지</a></button>
				</sec:authorize>

            </div>
        </div>
    </div>
</header>
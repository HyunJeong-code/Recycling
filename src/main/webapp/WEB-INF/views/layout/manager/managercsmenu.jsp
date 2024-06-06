<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/manager/cs/csdetail.css">
<style type="text/css">
.width-menu {
	width: 300px;
	background-color: gray;
	display: inline-block;
}

table {
	text-align: center;
}
</style>
</head>
<body>
<div class="width-menu">
    <nav class="menu cs">
        <table class="all">
            <tr>
                <th><a href="/manager/emplist">사원 정보</a></th>
            </tr>
            <tr>
                <td><a href="/manager/emplist">전체 사원 조회</a></td>
            </tr>

            <tr>
                <th><a href="/manager/cs/main">구매자 관리</a></th>
            </tr>
            <tr>
                <td><a href="/manager/cs/buyerlist">구매자 정보 조회</a></td>
            </tr>
            <tr>
                <td><a href="/manager/cs/main">구매자 문의글 조회</a></td>
            </tr>

            <tr>
                <th><a href="/manager/mgr/main">관리자 정보 관리</a></th>
            </tr>
            <tr>
                <td><a href="/manager/mgr/changepw">비밀번호 변경</a></td>
            </tr>
            <tr>
                <td><a href="/manager/mgr/mgrdetail">관리자 정보 수정</a></td>
            </tr>

            <tr>
                <th><a href="/manager/noticelist">공지사항</a></th>
            </tr>
        </table>
    </nav>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
.width-menu {
	width: 300px;
	background-color: gray;
	display: inline-block;
}

table {
	text-align: center;
}
</head>
<body>
<div class="width-menu">
    <nav class="menu sls">
        <table class="all">
            <tr>
                <th><a href="../../manager/emplist">사원 정보</a></th>
            </tr>
            <tr>
                <td><a href="../../manager/emplist">전체 사원 조회</a></td>
            </tr>

            <tr>
                <th><a href="../../manager/sls/main">판매자 정보 관리</a></th>
            </tr>
            <tr>
                <td><a href="../../manager/sls/main">판매자 정보 조회</a></td>
            </tr>
            <tr>
                <td><a href="../../manager/sls/sellerchklist">판매자 요청 관리</a></td>
            </tr>

            <tr>
                <th><a href="../../manager/sls/explist">체험단 관리</a></th>
            </tr>
            <tr>
                <td><a href="../../manager/sls/explist">체험단 전체 조회</a></td>
            </tr>
            <tr>
                <td><a href="../../manager/sls/expform">체험단 등록</a></td>
            </tr>

            <tr>
                <th><a href="../../manager/mgr/main">관리자 정보 관리</a></th>
            </tr>
            <tr>
                <td><a href="../../manager/mgr/changepw">비밀번호 변경</a></td>
            </tr>
            <tr>
                <td><a href="../../manager/mgr/mgrdetail">관리자 정보 수정</a></td>
            </tr>

            <tr>
                <th><a href="../../manager/noticelist">공지사항</a></th>
            </tr>
        </table>
    </nav>
</div>

</body>
</html>

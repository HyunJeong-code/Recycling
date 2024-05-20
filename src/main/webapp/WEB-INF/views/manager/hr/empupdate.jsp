<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 기본 설정 */
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    color: #333;
}

/* 전체 페이지 레이아웃 */
.full {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.wrap {
    width: 90%;
    max-width: 800px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    border-radius: 8px;
}

/* 헤더 스타일 */
.page h1 {
    text-align: center;
    color: #007BFF;
}

.page hr {
    border: 0;
    height: 1px;
    background-color: #007BFF;
}

/* 섹션 스타일 */
.section {
    margin-top: 20px;
}

.section div {
    margin-bottom: 10px;
}

.section h2 {
    color: #333;
    border-bottom: 2px solid #007BFF;
    padding-bottom: 5px;
}

.section hr {
    border: 0;
    height: 1px;
    background-color: #007BFF;
    margin: 20px 0;
}

.section select,
.section input[type="text"],
.section input[type="date"] {
    width: calc(100% - 20px);
    padding: 8px;
    margin: 0;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.section input[type="file"] {
    padding: 8px 0;
}

.section a {
    color: #007BFF;
    text-decoration: none;
}

.section a:hover {
    text-decoration: underline;
}

/* 버튼 스타일 */
button {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    margin-top: 10px;
}

button:hover {
    background-color: #0056b3;
}

/* 링크 버튼 스타일 */
a button {
    background-color: #6c757d;
    margin-right: 10px;
}

a button:hover {
    background-color: #5a6268;
}
</style>
</head>
<body>

	<div class="full">
		<div class="wrap">
			<div class="page">
				<h1>사원 정보 수정하기</h1>
				<hr>
			</div>

			<div class="section">
				<form action="./empupdate?mgrCode=${view.mgrCode }" method="post">
					프로필 생략

					<div>
						부서명 :
						<select name="deptno">
<!-- 						<option>----- 선택하세요 -----</option> -->
							<option value="20">20: 인사팀</option>
							<option value="30">30: 판매제휴팀</option>
							<option value="40">40: 구매CS팀</option>
						</select>
					</div>
					<div>이름 : <input type="text" name ="mgrName" value="${view.mgrName }"></div>
					<div>사원번호 : ${view. mgrCode }</div>
					<div>입사일 :
						<fmt:parseDate value="${view. mgrEntDate }" var="mgrEntDate" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${mgrEntDate }" pattern="yyyy-MM-dd" />
					</div>

					<h2>사원 정보</h2>
					<hr>

					<div>전화번호 : <input type="text" name="mgrPhone" value="${view.mgrPhone }"></div>
					<div>이메일 : <input type="text" name="mgrEmail" value="${view.mgrEmail }"></div>
					<div>생년월일 :
						<fmt:parseDate value="${view.mgrBirth }" var="mgrBirth" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${mgrBirth }" pattern="yyyy-MM-dd" />
					</div>
					<div>성별 : ${view.mgrGender }</div>

					<!-- 근로계약서, 등본 등 -->
					<div>입사서류 파일 : <a href="./hrdownload?mgrCode=${mgrFile.mgrCode }">${fileList.originName }</a></div>

					<!-- 개명, 주소지변경 등 -->
					<div>필요서류 파일 : </div>
				</form>
				
				<hr>
				<div><a href="./empupdate"><button>수정완료</button></a> <br></div>
				<div><a href="./empdetail?mgrCode=${view.mgrCode }"><button>돌아가기</button></a></div>
			</div>
		</div>
	</div>



</body>
</html>
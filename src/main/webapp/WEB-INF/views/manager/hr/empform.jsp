<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
    max-width: 600px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    border-radius: 8px;
}

/* 헤더 스타일 */
.page h3 {
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

.section table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.section table td {
    padding: 10px;
    border: 1px solid #ddd;
}

.section table select,
.section table input[type="text"],
.section table input[type="date"],
.section table input[type="file"],
.section table input[type="radio"] {
    width: calc(100% - 20px);
    padding: 8px;
    margin: 0;
}

.section table input[type="radio"] {
    width: auto;
}

.section table tr td:first-child {
    width: 30%;
    font-weight: bold;
    background-color: #f9f9f9;
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

/* 링크 스타일 */
a {
    text-decoration: none;
}

a button {
    background-color: #6c757d;
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
				<h3>사원 등록</h3>
				<hr>
			</div>

			<div class="section">
				<form action="./empform" method="post" enctype="multipart/form-data">

					<table border="1">
						<tr>
							<td>부서명</td>
							<td><select name="deptno">
									<option>----- 선택하세요 -----</option>
									<option value="20">20: 인사팀</option>
									<option value="30">30: 판매제휴팀</option>
									<option value="40">40: 구매CS팀</option>
							</select></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="mgrName"
								placeholder="이름 입력해주세요"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="mgrPhone"
								placeholder="전화번호 입력해주세요"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="mgrEmail"
								placeholder="이메일을 입력해주세요"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="date" name="mgrBirth"
								placeholder="생년월일 작성해주세요"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								<input type="radio" name="mgrGender" value="M"> 남자
								<input type="radio" name="mgrGender" value="W"> 여자
							</td>
						</tr>
						<tr>
							<td>입사일</td>
							<td><input type="date" name="mgrEntDate" placeholder="입사일"></td>
						</tr>
						
						<tr>
						<td>파일 업로드</td>
						<td><input type="file" name="file"></td>
						</tr>
				
					</table>

					<button>등록하기</button>

				</form>
				<a href="./main"><button>돌아가기</button></a>
			</div>
		</div>
	</div>


</body>
</html>
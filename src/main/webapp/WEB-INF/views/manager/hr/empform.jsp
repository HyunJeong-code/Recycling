<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
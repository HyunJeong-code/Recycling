<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
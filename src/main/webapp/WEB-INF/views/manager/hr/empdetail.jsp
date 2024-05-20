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
				<h1>사원 상세조회</h1>
				<hr>
			</div>

			<div class="section">
					<div>
						부서명 : 
						<c:choose>
							<c:when test="${view.deptno == 20 }">인사팀</c:when>
							<c:when test="${view.deptno == 30 }">판매제휴팀</c:when>
							<c:when test="${view.deptno == 40 }">구매CS팀</c:when>
						</c:choose>
					</div>
					<div>이름 : ${view.mgrName }</div>
					<div>사원번호 : ${view. mgrCode }</div>
					<div>입사일 :
						<fmt:parseDate value="${view. mgrEntDate }" var="mgrEntDate" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${mgrEntDate }" pattern="yyyy-MM-dd" />
					</div>

					<h2>사원 정보</h2>
					<hr>

					<div>전화번호 : ${view.mgrPhone }</div>
					<div>이메일 : ${view.mgrEmail }</div>
					<div>생년월일 :
						<fmt:parseDate value="${view.mgrBirth }" var="mgrBirth" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${mgrBirth }" pattern="yyyy-MM-dd" />
					</div>
					<div>성별 : ${view.mgrGender }</div>
												
					<div>입사서류 파일 : <a href="/upload/${fileList.storedName }" download="${fileList.originName }">${fileList.originName }</a></div>
				<hr>
				<div><a href="./empupdate?mgrCode=${view.mgrCode }"><button>수정하기</button></a> <br></div>
				<div><a href="./main"><button>돌아가기</button></a></div>
			</div>
		</div>
	</div>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<h1>체험 수정하기</h1>
				<hr>
			</div>

			<div class="section">
				<form action="./expupdate?expCode=${update.expCode }" method="post">
				<div>코드번호 : ${update.expCode }</div>

				<div>
					<label>체험제목</label> <input type="text" name="expName" value="${update.expName}">
				</div>

				<div>
					<label>참가비용</label> <input type="text" name="expPrice" value="${update.expPrice}">원
				</div>

				<div>
					<label>모집 인원</label> <select>
						<option value="${schCnt}">${schCnt}명</option>
					</select>
				</div>

				<div>
					<label>체험설명</label>
					<textarea name="expDetail">${update.expDetail}</textarea>
				</div>

				<div>
					<a href="./explist"><button type="submit">수정완료</button></a>
				</div>
				</form>

				<div>
					<a href="./expdetail?expCode=${update.expCode }"><button type="button">돌아가기</button></a>
				</div>
			</div>
		</div>
	</div>
</body>



</html>
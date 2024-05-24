<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.full {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    padding: 20px;
}

.wrap {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    width: 100%;
}

.page h1 {
    font-size: 24px;
    margin-bottom: 10px;
}

.page hr {
    margin: 10px 0;
}

.section {
    margin-top: 20px;
}

.section div {
    margin-bottom: 15px;
}

.section label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.section input[type="text"],
.section select,
.section textarea {
    width: calc(100% - 22px);
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.section textarea {
    height: 100px;
    resize: vertical;
}

.section button {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    margin-right: 10px;
}

.section button[type="button"] {
    background-color: #6c757d;
}

.section button:hover {
    background-color: #0056b3;
}

.section button[type="button"]:hover {
    background-color: #5a6268;
}
</style>
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

				<div>
					<label>체험제목</label> <input type="text" name="expName" value="${update.expName}">
				</div>

				<div>
					<label>참가비용</label> <input type="text" name="expPrice" value="${update.expPrice}">원
				</div>

				<div>
					<label>체험설명</label>
					<textarea name="expDetail">${update.expDetail}</textarea>
				</div>

				<div>
					<button type="submit">수정완료</button>
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
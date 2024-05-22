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
    text-align: center;
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
    background-color: #f5f5f5;
    cursor: default;
}

.section textarea {
    height: 100px;
    resize: none;
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
    display: inline-block;
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

.section img {
    width: 100%;
    height: auto;
    margin-bottom: 15px;
    border-radius: 4px;
}
</style>
</head>

<body>
	<div class="full">
		<div class="wrap">
			<div class="page">
				<h1>체험 상세조회</h1>
				<hr>
			</div>

			<div class="section">
			    
	    		<img alt="없음" src="/upload/${fileimage.storedName }">

				<div>
					<label>체험제목</label> <input type="text" value="${view.expName}" readonly="readonly">
				</div>

				<div>
					<label>참가비용</label> <input type="text" value="${view.expPrice}" readonly onclick="this.blur()"> 원
				</div>

				<div>
					<label>모집 인원</label> <select readonly onclick="this.blur()">
						<option value="${schCnt}">${schCnt.schCnt}명</option>
					</select>
				</div>

				<div>
					<label>체험설명</label>
					<textarea readonly onclick="this.blur()">${view.expDetail}</textarea>
				</div>

				<div>
					<a href="./expupdate?expCode=${view.expCode }" ><button type="button">수정하기</button></a>
				</div>				

				<div>
				<a href="./explist" ><button type="button">돌아가기</button></a>
				</div>
			</div>
		</div>
	</div>
</body>



</html>
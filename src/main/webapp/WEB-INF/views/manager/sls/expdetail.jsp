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
						<option value="${schCnt}">${schCnt}명</option>
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
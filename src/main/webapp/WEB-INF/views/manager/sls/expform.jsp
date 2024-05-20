<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function setThumbnail(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "col-lg-6");
		document.querySelector("div#image_container").appendChild(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
}
</script>
</head>
<body>

    <div class="full">
        <div class="wrap">
            <div class="page">
            <h1>체험단 등록</h1>
            
            </div>
            <div class="section">
            <form action="./expform" method="post" enctype="multipart/form-data">
					<div>
						체험 이름 <input type="text" name="expName">
					</div>
					<div>
						1인 체험비 <input type="text" name="expPrice" placeholder="제품가격을 입력하세요">
					</div>
					<div>
						설명 <textarea rows="5" cols="22" name="expDetail" placeholder="업체에서 제공한 설명을 적어주세요"></textarea>
					</div>
					<div>
						이미지 첨부 <input type="file" name="file" onchange="setThumbnail(event);"><div id="image_container"></div>
					</div>
						<br>
						<hr>
						<br>
						
						<div>체험 가능 날짜/시간등록</div>

						<div>
						체험 마감일 <input type="date" name="schDate" placeholder="종료일">
						시간<input type="time" name="schTime" placeholder="시간">
						인원<input type="text" name="schCnt" placeholder="인원">
						</div>
					<button>등록하기</button>
				</form>
				<a href="./explist"><button>돌아가기</button></a>
                
            </div>
        </div>
    </div>

</body>
</html>
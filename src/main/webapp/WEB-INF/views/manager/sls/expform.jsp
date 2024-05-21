<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<script type="text/javascript">
$(document).ready(function() {
	//파일 미리보기
	function setThumbnail(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			document.querySelector("div#image_container").appendChild(img);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
	
				// applyBtn 함수 정의
				function applyBtn() {
					// 체험일 입력값 가져오기
					var schDate = document.getElementsByName("schDate")[0].value;

					// 시간 입력값 가져오기
					var selectedTimes = document.querySelectorAll('.hourBtnClick.selected');
					var schTime = [];
					selectedTimes.forEach(function(time) {
						schTime.push(time.value);
					});

					// 인원 입력값 가져오기
					var schCnt = document.getElementsByName("schCnt")[0].value;

					document.getElementById("schDateDisplay").innerText = "체험일: " + schDate;
					document.getElementById("schTimeDisplay").innerText = "시간: " + schTime.join(", ");
					document.getElementById("schCntDisplay").innerText = "인원: " + schCnt;
				}

				// applyBtn 버튼 클릭 이벤트 리스너 추가
				$("#applyBtn").on("click", applyBtn);

				var selectedTimes = [];

				// 시간 버튼에 대한 클릭 이벤트 핸들러 등록
				$(".hourBtnClick").on('click', function(e) {
				    var button = $(this);
				    var time = button.val();

				    // 선택한 버튼의 색상을 변경하거나 원래대로 돌아오도록 처리
				    if (button.hasClass('selected')) {
				        //선택 해제
				        button.removeClass('selected');
				        button.css({
				            'background-color' : ''
				        });

				        // 선택한 시간 배열에서 제거
				        var index = selectedTimes.indexOf(time);
				        if (index !== -1) {
				            selectedTimes.splice(index, 1);
				        }
				    } else {
				        //선택
				        button.addClass('selected');
				        button.css({
				            'background-color' : '#0056b3'
				        });

				        // 선택한 시간 배열에 추가
				        selectedTimes.push(time);
				        console.log(time)
				    }
				});
				
	
	$("form").on("submit", function(e) {
		//선택한 시간 숨겨서 저장하고 넘길준비
		$("#selectedTimes").val(selectedTimes.join(","));
		console.log(selectedTimes)
	})
   
});
	    
</script>


<style type="text/css">
.full {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.wrap {
	width: 60%;
}

.page {
	text-align: center;
}

.section {
	margin-top: 20px;
}

input[type="text"], input[type="date"], input[type="time"], textarea {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="file"] {
	margin-bottom: 10px;
}

button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

button:focus {
	outline: none;
}

#image_container {
	margin-top: 10px;
}

img {
	max-width: 100%;
	height: auto;
	margin-top: 10px;
}

@media ( max-width : 768px) {
	.wrap {
		width: 80%;
	}
}


</style>

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
						설명
						<textarea rows="5" cols="22" name="expDetail" placeholder="업체에서 제공한 설명을 적어주세요"></textarea>
					</div>
					<div>
						이미지 첨부 <input type="file" name="file" onchange="setThumbnail(event);">
						<div id="image_container"></div>
					</div>
					<br>
					<hr>
					<br>

					<!-- 모달 버튼 -->
					<button type="button" id="btnPostcode" data-bs-toggle="modal" data-bs-target="#expformModal">
						체험 가능 날짜/시간등록
					</button>
					
					<!-- 모달창-->
					<div class="modal fade" id="expformModal" tabindex="-1" aria-labelledby="expformModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- 모달 헤드 -->
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="expformModalLabel">
									체험 가능 날짜/시간등록</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"aria-label="Close"></button>
								</div>
								
								<!-- 모달 바디 -->
								<div class="modal-body">
									<h3>체험 마감일</h3>
									<input type="date" name="schDate" placeholder="종료일">

									<h3>시간</h3>
									<!-- 시작시간 -->
									<c:set var="startTimeHour" value="7" />
									<!-- 종료시간 -->
									<c:set var="endTimeHour" value="18"/>
									<c:set var="interval" value="30" />
									<c:forEach var="hour" begin="${startTimeHour}" end="${endTimeHour}">
										<c:forEach var="minute" begin="0" end="59" step="${interval}">
											<input type="button" name="schTime" class="hourBtnClick" value="${hour < 10 ? '0' : ''}${hour}:${minute < 10 ? '0' : ''}${minute}" readonly="readonly">
										</c:forEach>
									</c:forEach>
									
									<h3>인원</h3>
									<input type="text" name="schCnt" placeholder="인원">
								</div>
								
								<!-- 모달 푸터 -->
								<div class="modal-footer">
									<button type="button" id="applyBtn" data-bs-dismiss="modal">
										추가
									</button>
									<button type="button" class="btn btn-footer" data-bs-dismiss="modal">
										닫기																			
									</button>
								</div>
							</div>
						</div>
					</div>
					
					<div>
						<div id="schDateDisplay"></div>
						<div id="schTimeDisplay"></div>
						<!-- 모달창에 입력한 데이터 숨기기 -->
						<input type="hidden" id="selectedTimes" name="schTime">
						<div id="schCntDisplay"></div>
					</div>
					
					<div>
						<button type="submit">등록하기</button>
					</div>
				</form>
				<a href="./explist"><button>돌아가기</button></a>

			</div>
		</div>
	</div>

</body>
</html>
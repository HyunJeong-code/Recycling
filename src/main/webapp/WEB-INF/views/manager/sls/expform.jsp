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
//파일 미리보기
function setThumbnail(event) {
    var fileInput = event.target;
    var files = fileInput.files;
    var container = document.querySelector("div#image_container");
	console.log(files)
    
    // 이미지 컨테이너의 모든 자식 요소를 삭제합니다.
    while (container.firstChild) {
        container.removeChild(container.firstChild);
    }
	var reader = new FileReader()

	reader.onload = function(event) {
		var img = document.createElement("img")
		img.setAttribute("src", event.target.result)
		img.setAttribute("class", "col-lg-6")
		document.querySelector("div#image_container").appendChild(img)
	}

	reader.readAsDataURL(event.target.files[0]);
}

function setThumbnail2(event) {
    var fileInput = event.target;
    var files = fileInput.files;
    var container = document.querySelector("div#image_container2");
    var formData = new FormData();
    
    // 파일이 선택되었는지 확인하고, 선택된 파일이 있다면 이미지를 추가합니다.
    for (var i = 0; i < files.length; i++) {
        var reader = new FileReader();

        // 선택한 파일의 각각을 읽어와서 이미지로 표시합니다.
        reader.onload = (function(file) {
            return function(event) {
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                img.setAttribute("class", "col-lg-6");
                container.appendChild(img);
            };
        })(files[i]);

        // 파일을 읽어옵니다.
        reader.readAsDataURL(files[i]);
        
    }
    
    for (var i = 0; i < files.length; i++) {
        formData.append('files', files[i]); // 'files'는 서버에서 해당 파일을 식별하기 위한 키값입니다.
    }
    
    $.ajax({
        url: "/manager/sls/expform",
        type: 'POST',
        data: formData,
        processData: false, // FormData 객체를 전송할 때 jQuery가 데이터를 처리하지 않도록 설정
        contentType: false, // 컨텐츠 타입을 false로 설정하여 jQuery가 데이터를 전송할 때 content-type 헤더를 설정
        success: function(response) {
            console.log('파일 업로드 성공');
            // 성공적으로 파일 업로드가 완료되었을 때 실행할 코드 작성
        },
        error: function(xhr, status, error) {
            console.error('파일 업로드 실패', error);
            // 파일 업로드에 실패했을 때 실행할 코드 작성
        }
    });
    
}

$(function() {
	$(document).ready(function() {
	
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
				});//hourBtnClick
				
	
	$("form").on("submit", function(e) {
		e.preventDefault();
		
		//선택한 시간 숨겨서 저장하고 넘길준비
		$("#selectedTimes").val(selectedTimes.join(","));
		console.log(selectedTimes)
		
		
		  /* 등록 여부 확인 */
		
	    // 기업명 입력 확인
	    var cmpName = document.getElementsByName("cmpName")[0].value;
	    if (cmpName === "") {
	        alert("기업명을 입력하세요.");
	        return false; // 기업명이 비어 있으면 false를 반환하여 제출을 막습니다.
	    }
	
	    // 체험 이름 입력 확인
	    var expName = document.getElementsByName("expName")[0].value;
	    if (expName === "") {
	        alert("체험 이름을 입력하세요.");
	        return false;
	    }
	
	    // 체험 비용 확인
	    var expPrice = document.getElementsByName("expPrice")[0].value;
	    if (expPrice === "") {
	        alert("체험 비용을 입력하세요.");
	        return false;
	    }
	
	    // 체험 설명 확인
	    var expDetail = document.getElementsByName("expDetail")[0].value;
	    if (expDetail === "") {
	        alert("체험 설명을 입력하세요.");
	        return false;
	    }
	
	    // 체험 파일 확인
	    var file = document.getElementsByName("file")[0].value;
	    if (file === "") {
	        alert("파일이 존재하지 않습니다.");
	        return false;
	    }
	    
	    // 체험일 확인
	    var schDate = document.getElementsByName("schDate")[0].value;
	    if (schDate === "") {
	        alert("체험일을 입력하세요.");
	        return false;
	    }
	    
	 // 체험일 확인
	    var schTime = document.getElementsByName("schTime")[0].value;
	    if (schDate === "") {
	        alert("체험시간을 입력하세요.");
	        return false;
	    }
	
	    // 체험인원 확인
	    var schCnt = document.getElementsByName("schCnt")[0].value;
	    if (schCnt === "") {
	        alert("체험인원을 입력하세요.");
	        return false;
	    }
	
	    // 모든 입력 확인이 통과되면 true를 반환하여 폼을 제출합니다.
	    this.submit();
	})
	
	//기업정보 모달창으로 보여주기
	$("#btnSearchCmp").click(function() {
        $.ajax({
            type: "GET",
            url: "./sellerselect",
            data: {
            	CMP_NO : $(this).attr("id") 
				, CMP_NAME : $(this).closest('tr').find('td:eq(1)').text()
				, CMP_CEO : $(this).closest('tr').find('td:eq(2)').text()
				, CMP_ADDR : $(this).closest('tr').find('td:eq(3)').text()
            },
            dataType: "html",
            success: function(res) {
                console.log("AJAX 성공");
                console.log(res);
                
                $("#serachCmpinfo").html(res)
            },
            error: function() {
                console.log("AJAX 실패");
            }
        });
    });//btnSearchCmp
   
    
    // 오늘 날짜를 가져오는 함수
    function getToday() {
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
        var yyyy = today.getFullYear();

        today = yyyy + '-' + mm + '-' + dd;
        return today;
    }

    // 페이지 로드 시 실행
    window.onload = function() {
        var today = getToday();
        document.getElementById("schDate").min = today;
    };
    
    
    
    
    
    
});
	    
</script>
<style type="text/css">
/* 전체 기본 설정 */
* {
	margin: 0;
	padding: 0;
	border: 0;
	vertical-align: baseline;
	box-sizing: border-box;
	font: inherit;
	font-size: 100%;
	line-height: 1.5;
	color: #333;
}

/* 외부 레이아웃 설정 */
.full {
	width: 1200px;
	border: 1px solid #ccc;
	margin: 0 auto;
	display: flex;
	border-radius: 8px;
	overflow: hidden;
}

aside {
	width: 300px;
	background-color: #f1f1f1;
	border-right: 1px solid #ddd;
	box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.05);
}

.wrap {
	flex: 1;
	display: flex;
	flex-direction: column;
	padding: 20px;
}

/* 상단 페이지 */
.page {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	color: #007BFF;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

/* [우]하단 페이지 */
.btn_bot_style {
	display: flex;
	float: right;
	margin: 0 0 20px 0;
}

/* ------------------------------------- */

/* 섹션 스타일 */
.section {
	padding-top: 20px;
	width: 500px;
	margin: 0 auto;
}

.section input[type="date"] {
	padding: 12px;
	text-align: center;
	width: 100%;
}

.section input[type="text"] {
	border: 1px solid #ccc;
}

.section div {
	margin-bottom: 20px;
}

.section textarea {
	border: 1px solid #ccc;
	width: 100%;
}

.btn_modal_wrap {
	display: flex;
}

label {
	color: #373f57;
	font-size: 16px;
	font-weight: bold;
}

.section input[type="text"] {
	padding: 12px;
	height: 46px;
	width: 100%;
}

.section .hyphen {
	height: 46px;
	padding: 10px 10px;
	font-weight: bold;
	vertical-align: middle;
	margin: 0px;
	border: 0px;
}

/* 파일버튼 디자인 */
.filebox {
	display: flex;
	justify-content: flex-end;
}

.filebox input[type="file"] {
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.filebox .upload_name
, .filebox .profile_name {
	display: inline-block;
	height: 46px;
	padding: 0 10px;
	vertical-align: middle;
	width: 79%;
	color: #999999;
}

.filebox label {
	display: inline-block;
	width: 21%;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 46px;
}

.phone_box {
	display: flex;
}

.phone_box input[type="text"] {
	width: calc(1/ 3);
	text-align: center;
}

.email_box {
	display: flex;
}

/* 모달1버튼 */
#btnSearchCmp {
	padding: 6px 12px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	white-space: nowrap;
}

#btnSearchCmp:hover {
	background-color: #0056b3;
}

.modal-header {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	color: #007BFF;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

/* 모달2버튼 */
.btnPostcode_wrap {
	width: 230px;
	margin: 0 auto;
}

#postcodeWrap {
	margin: 0 auto;
	display: flex;
	border-radius: 8px;
	overflow: auto;
}

#btnPostcode {
	padding: 12px 25px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	white-space: nowrap;
}

#btnPostcode:hover {
	background-color: #0056b3;
}

#schDate {
	border: 1px solid #ccc;
}

.modal_time_con {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.modal_time_section {
	margin: 10px 0;
}

.modal_time_section h2 {
	margin: 0;
	font-size: 1.2em;
	color: #333;
}

.modal_time_buttons {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.modal_time-buttons input {
	margin: 5px;
	padding: 10px 20px;
	font-size: 1em;
	background-color: #f0f0f0;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.modal_time-buttons input:hover {
	background-color: #ddd;
}

.modal_body_title {
	margin-bottom: 5px;
	font-size: 20px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}


#applyBtn, #time_modal_cencle{
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

.applyBtn {
	background-color: #4CAF50;
	color: white;
}

.applyBtn:hover {
	background-color: #45a049;
}

.time_modal_cencle {
	background-color: #f44336;
	color: white;
	margin-left: 10px;
}

.time_modal_cencle:hover {
	background-color: #da190b;
}


/* 버튼 세팅 */
.btn_inform {
	border: 0;
	width: 106px;
	margin: 0 auto;
}

.btn_bot_join, .btn_bot_cencle {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

.btn_bot_join {
	background-color: #4CAF50;
	color: white;
}

.btn_bot_join:hover {
	background-color: #45a049;
}

.btn_bot_cencle {
	background-color: #f44336;
	color: white;
	margin-left: 10px;
}

.btn_bot_cencle:hover {
	background-color: #da190b;
}

</style>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
		<div class="wrap">
			<div class="page">
				<h1>체험단 등록</h1>
			</div>
			<div class="section">
				<form action="./expform" method="post" enctype="multipart/form-data">
					
							<label>업체 명</label> 
						<div class="btn_modal_wrap">
							<input type="text" name="cmpName" readonly="readonly">
						
							<!-- 모달 버튼 -->
							<button type="button" id="btnSearchCmp" data-bs-toggle="modal" data-bs-target="#SearchCmpModal">
								검색
							</button>
						</div>	
							<!-- 모달창 업체 검색-->
							<div class="modal fade" id="SearchCmpModal" tabindex="-1" aria-labelledby="#SearchCmpModalLabel" aria-hidden="true">
								<div class="modal-dialog">
								<div class="modal-content" style="display: table;">
		
								<!-- 모달 헤드 -->
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="SearchCmpModalLabel">기업 정보</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
												
								<!-- 모달 바디 -->
								<div class="modal-body">
									<div id="postcodeWrap">
										<div id = "serachCmpinfo"></div>							
									</div>
								</div>
								</div>
							</div><!-- modal end -->
						</div><!-- btn_modal_wrap -->
						
					<label for ="sCode">판매자 코드</label> 
					<div>
						<input type="text" id="sCode" name="sCode" readonly="readonly">
					</div>
					
					<label for ="expName">체험 이름</label>
					<div>
						 <input type="text" id="expName" name="expName">
					</div>
					
					<label for ="expPrice">1인 체험비</label>
					<div>
						<input type="text" id="expPrice" name="expPrice" placeholder="제품가격을 입력하세요">
					</div>
					
					<label for="expDetail">설명</label>
					<div>
						<textarea rows="5" cols="22" id ="expDetail" name="expDetail" placeholder="업체에서 제공한 설명을 적어주세요"></textarea>
					</div>
					
					<div>
						이미지 첨부 <input type="file" name="file" onchange="setThumbnail(event);">
						<div id="image_container"></div>
					</div>

					<!-- 모달 버튼 -->
					<div class="btnPostcode_wrap">
						<button type="button" id="btnPostcode" data-bs-toggle="modal" data-bs-target="#expformModal">
							체험 가능 날짜/시간등록
						</button>
					</div>
					
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
								<!-- 오늘 이전 날은 선택 불가능 -->
									<div class="modal_body_title">체험일 선택</div>
									<div>
										<input type="date" name="schDate" id="schDate" placeholder="종료일">
									</div>
										
									<div class="modal_body_title">시간</div>
									
								    <div class="modal_time_con">
								        <div class="modal_time_morning">
								            <h2>오전</h2>
								            <div class="modal_time-buttons">
								                <input type="button" name="schTime" class="hourBtnClick" value="07:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="07:30" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="08:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="08:30" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="09:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="09:30" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="10:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="10:30" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="11:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="11:30" readonly="readonly">
								            </div>
								        </div>
								        <hr>
								        <div class="modal_time_afternoon">
								            <h2>오후</h2>
								            <div class="modal_time-buttons">
								                <input type="button" name="schTime" class="hourBtnClick" value="12:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="12:30" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="13:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="13:30" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="14:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="14:30" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="15:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="15:30" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="16:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="16:30" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="17:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="17:30" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="18:00" readonly="readonly">
								                <input type="button" name="schTime" class="hourBtnClick" value="18:30" readonly="readonly">
								            </div>
								        </div>
								    </div>
									
									<div class="modal_body_title">인원</div>
									<input type="text" name="schCnt" placeholder="인원">
								</div>
								
								<!-- 모달 푸터 -->
								<div class="modal-footer">
									<button type="button" id ="applyBtn" data-bs-dismiss="modal">
										추가
									</button>
									<button type="button" id ="time_modal_cencle" class="btn btn-footer" data-bs-dismiss="modal">
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
					
					<div class="btn_inform">
						<button type="submit" class="btn_bot_join">등록하기</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>
</body>
</html>
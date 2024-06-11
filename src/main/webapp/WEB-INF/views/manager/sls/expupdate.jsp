<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">

<script type="text/javascript">
//파일 미리보기
function setThumbnail(event, i) {
    var fileInput = event.target;
    var files = fileInput.files;
    var container = document.querySelector("div#image_container"+i);

    // 이미지 컨테이너의 모든 자식 요소를 삭제합니다.
    while (container.firstChild) {
        container.removeChild(container.firstChild);
    }


    // 파일이 선택되었는지 확인하고, 선택된 파일이 있다면 이미지를 추가합니다.
    if (files && files.length > 0) {
       
        var reader = new FileReader();

        // 선택한 파일의 첫 번째 파일을 읽어옵니다.
        reader.readAsDataURL(files[0]);

        // 파일이 로드될 때마다 실행될 onload 함수를 설정합니다.
        reader.onload = function(event) {
           //$("#mainImg").attr("src",event.target.result);
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");
            container.appendChild(img);
        };
    }
}


function setThumbnail2(event) {
    var fileInput = event.target;
    var files = fileInput.files;
    var container = document.querySelector("div#image_container2");
    
    // 이미지 컨테이너의 모든 자식 요소를 삭제합니다.
    while (container.firstChild) {
        container.removeChild(container.firstChild);
    }
    
 // 파일이 선택되었는지 확인하고, 선택된 파일이 있다면 이미지를 추가합니다.
    if (files && files.length > 0) {
       
        var id = "#file"+i;
        
        
        var input = document.createElement("input");
        input.setAttribute("value", $(id).attr("class"));
        input.setAttribute("hidden","hidden");
        input.setAttribute("name","fileId");
        container.appendChild(input);
        
        var id1 = "#before"+i;
        
        $(id1).val('');
        

        var reader = new FileReader();

        // 선택한 파일의 첫 번째 파일을 읽어옵니다.
        reader.readAsDataURL(files[0]);

        // 파일이 로드될 때마다 실행될 onload 함수를 설정합니다.
        reader.onload = function(event) {
           //$("#mainImg").attr("src",event.target.result);
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");
            container.appendChild(img);
        };
    }
    
    for (var i = 0; i < files.length; i++) {
       var reader = new FileReader();
       
        // 선택한 파일의 i 번째 파일을 읽어옵니다.
        reader.readAsDataURL(files[i]);
        
        if($(this).attr("id"))
        reader.onload = function(event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            container.appendChild(img);
        };

       var div = document.createElement("div");
        div.innerText = fileName;
        container.appendChild(div);
    }
}


$(function() {
	// 이미지 클릭 시 파일 선택 창 열기
	$("#profilePreview").on('click', function() {
	    $("#expfileUpdate").click();
	    console.log(profilePreview)
	    console.log(expfileUpdate)
	    
	});
	
	// 파일 선택 시 미리보기 이미지 업데이트
	$("#expfileUpdate").on('change', function() {
	    if (this.files && this.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function(e) {
	            $("#profilePreview").attr("src", e.target.result);
	            console.log(profilePreview)
	        }
	        reader.readAsDataURL(this.files[0]);
	    }
	})
	
    // 일반 파일 이름 표시
// 	$('#expMultiFileUpdate').on('change', function(event) {
// 		console.log(expMultiFileUpdate)
// 	    var files = event.target.files;
// 	    var fileNames = $('#fileNames').text().split(', '); // 이전에 선택한 파일 이름 가져오기
// 	    for (var i = 0; i < files.length; i++) {
// 	        fileNames.push(files[i].name);
// 	    }
// 	    $('#fileNames').text(fileNames.join(', ')); // 이전 파일 이름에 새로운 파일 이름 추가하여 표시
// 	    console.log(fileNames)
// 	});

	 // 파일 선택 시 미리보기 이미지 업데이트
    $("input[type='file']").on('change', function() {
        var files = this.files;
        var container = $(this).siblings(".image_container");

        // 이미지 컨테이너의 모든 자식 요소를 삭제합니다.
        container.empty();

        // 선택된 파일이 있다면 이미지를 추가합니다.
        if (files && files.length > 0) {
            for (var i = 0; i < files.length; i++) {
                var reader = new FileReader();
                reader.readAsDataURL(files[i]);
                reader.onload = function(event) {
                    var img = $("<img>");
                    img.attr("src", event.target.result);
                    img.attr("alt", "미리보기 이미지");
                    container.append(img);
                };
            }
        }
    });
	
	 
})
</script>
<style type="text/css">
/* [우]하단 페이지 */
.btn_bot_style {
	display: flex;
	float: right;
	margin: 0 0 20px 0;
}


/* 섹션 스타일 */
.section {
	padding-top: 20px;
	width: 1200px;
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
	height: 200px;	
	
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
	background-color: #652CB3;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	white-space: nowrap;
}

#btnSearchCmp:hover {
	background-color: #652CB3;
}

.modal-header {
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid black;
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
	background-color: #652CB3;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	white-space: nowrap;
}

#btnPostcode:hover {
	background-color: #652CB3;
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

button[type="submit"] {
    outline: 0;
    border: none;
    transition: all 0.2s ;
   	width: 90px;
   	height: 36px;
    background-color: #652CB3;
    border-radius: 5px;
   	color: white;
   	font-size: 15px;
}

button[type="submit"]:hover {
	background-color: #652CB3;
}

.btn_inform{
	margin: 0 auto;
    display: flex;
}

.btn_bot_join{
	margin: 0 auto;
}

.page{
margin-bottom: 20px;
}

#profilePreview{
	width: 200px;
}

.file_box{
	display: flex;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
			<sec:authentication var="managerLogin" property="principal"/>
	<c:if test="${managerLogin.deptno eq 10}">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 20}">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 30}">
		<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 40}">
		<c:import url="/WEB-INF/views/layout/manager/managercsmenu.jsp"/>
	</c:if>
		<div class = "full content" >
		<div class="wrap">
			<div class="page">
				체험 수정하기
			</div>

			<div class="section">
				<form action="./expupdate?expCode=${update.expCode }" method="post">

					<label>프로필 이미지</label>
					<input type="file" id="expfileUpdate" name="expfileUpdate" style="display: none;" />
					<div class="select_img">
					    <img alt="없음" id="profilePreview" src="/upload/${profile.storedName}" />
						<input type="hidden" id="expFlNo" name="expFlNo" value="${profile.expFlNo }"/>
					</div>
					<div>
						<div class="expName">
							<label>체험제목</label>
							<input type="text" name="expName" value="${update.expName}">
						</div>
		
						<div class="expPrice">
							<label>참가비용</label>
							<input type="text" name="expPrice" value="${update.expPrice}">
						</div>
		
						<div class="expDetail">
							<label>체험설명</label>
							<textarea name="expDetail">${update.expDetail}</textarea>
						</div>
					</div>
	
					<label>체험상세 이미지</label>
					<div class="file_box">
						
						<c:set var ="files" value="${files }"/>
                        <c:forEach var="i" begin="1" end="3">
                           <td>
							<input multiple="multiple" type="file" id="file${i }" class="${files[i].expFlNo }" name="file" onchange="setThumbnail(event,${i});">
                              <div id="image_container${i}" >
                                 <c:if test="${not empty files[i] }">
                                    <div>
    	                                <input value="${files[i].expFlNo }" name="fileId" hidden="hidden">
	                                    <img alt="사진없음" src="/upload/${files[i].storedName}" >
                                    </div>
                                 </c:if>
                              </div>
                           </td>
                        </c:forEach>
					</div>
					
						<div id="fileNames"></div>
					
					
					<div>
						<button type="submit">수정하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager/sls/expupdate.css">

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
	text-align: center;
}

/* 외부 레이아웃 설정 */
.full {
	width: 1200px;
	border: 1px solid #ccc;
	margin: 0 auto;
	display: flex;
	background-color: #f9f9f9;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

/* 중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.section .top_section_con{
	width: 500px;
	margin: 0 auto;
}

.section img {
	height: 200px;
	width: 200px;
	border-radius: 50%;
	object-fit: cover;
	margin: 20px;
}

.section .expName
, .section .expPrice
, .section .expDetail {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}
.section .expName div
, .section .expPrice div{
	width: 300px;
	border: 1px solid #ccc;
}

.section .expDetail textarea{
	border: 1px solid #ccc;
	width: 300px;
	height: 300px;
	
}


label {
	color: #373f57;
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 5px;
	width: 200px;
	text-align: justify;
}

input[type="text"], select {
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
}

.section h3 {
	color: #333;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 5px;
	margin-bottom: 20px;
}

.section_top_privacy {
	padding: 20px;
	margin-left: 20px;
	margin-top: 20px;
	flex: 1;
}

.section_top_privacy div {
	margin-bottom: 10px;
}

/* --------------------------------------- */
/* 색션 하단 */
.section_bot_title {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

.section_bot_itembox {
	width: 500px;
	margin: 0 auto;
}

.section .mgrPhone_box, .section .mgrEmail_box, .section .mgrBirth_box,
	.section .mgrGender_box {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}

/* 하단 페이지 버튼 스타일 */
.btn_bot_wrap {
	display: flex;
	width: 500px;
	padding-top: 20px;
	margin: 0 auto;
	justify-content: space-around;
}

/* 버튼 스타일 */
button {
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	font-size: 16px;
	margin-left: 10px;
}

button:hover {
	background-color: #0056b3;
}

table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 100%;
	text-align: center;
}

table td {
	padding: 9px;
}

table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table th:first-child, .table td:first-child {
	border-left: 0;
}

table th:last-child, .table td:last-child {
	border-right: 0;
}

table tr td:first-child {
	text-align: center;
}table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 100%;
	text-align: center;
}

table td {
	padding: 9px;
}

table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table th:first-child, .table td:first-child {
	border-left: 0;
}

table th:last-child, .table td:last-child {
	border-right: 0;
}

table tr td:first-child {
	text-align: center;
}

table caption {
	caption-side: bottom;
	display: none;
}

table tr:hover {
  background-color: #f5f5f5;
}table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 100%;
	text-align: center;
}

table td {
	padding: 9px;
}

table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table th:first-child, .table td:first-child {
	border-left: 0;
}

table th:last-child, .table td:last-child {
	border-right: 0;
}

table tr td:first-child {
	text-align: center;
}

table caption {
	caption-side: bottom;
	display: none;
}

table tr:hover {
  background-color: #f5f5f5;
}

table caption {
	caption-side: bottom;
	display: none;
}

table tr:hover {
  background-color: #f5f5f5;
}

.btn_bot_box{
	margin-top: 20px;
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
				<h1>체험 수정하기</h1>
				<hr>
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
							<input type="text" name="expPrice" value="${update.expPrice}">원
						</div>
		
						<div class="expDetail">
							<label>체험설명</label>
							<textarea name="expDetail">${update.expDetail}</textarea>
						</div>
					</div>
	
					<label>체험상세 이미지</label>
					<div>
						
						<c:set var ="files" value="${files }"/>
                        <c:forEach var="i" begin="1" end="3">
                           <td>
							<input multiple="multiple" type="file" id="file${i }" class="${files[i].expFlNo }" name="file" onchange="setThumbnail(event,${i});">
                            
                              <div id="image_container${i}">
                                 <c:if test="${not empty files[i] }">
                                    <input value="${files[i].expFlNo }" name="fileId" hidden="hidden">
                                    <img alt="사진없음" src="/upload/${files[i].storedName }">
                                 </c:if>
                              </div>
                           </td>
                        </c:forEach>
					</div>
					
						<div id="fileNames"></div>
					
					
					<div>
						<button type="submit">수정하기</button>
					</div>
				
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
	</div>
</body>
</html>
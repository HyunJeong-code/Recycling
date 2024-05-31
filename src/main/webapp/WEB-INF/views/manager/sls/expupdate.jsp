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
	$('#expMultiFileUpdate').on('change', function(event) {
		console.log(expMultiFileUpdate)
	    var files = event.target.files;
	    var fileNames = $('#fileNames').text().split(', '); // 이전에 선택한 파일 이름 가져오기
	    for (var i = 0; i < files.length; i++) {
	        fileNames.push(files[i].name);
	    }
	    $('#fileNames').text(fileNames.join(', ')); // 이전 파일 이름에 새로운 파일 이름 추가하여 표시
	    console.log(fileNames)
	});

	
	
})
</script>

</head>
<body>
	<div class="full">
		<aside>
			<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
			<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
		</aside>
		<div class="wrap">
			<div class="page">
				<h1>체험 수정하기</h1>
				<hr>
			</div>

			<div class="section">
				<form action="./expupdate?expCode=${update.expCode }" method="post" enctype="multipart/form-data">

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
						<c:forEach var="expFileList" items="${expFileList }">
						    <img alt="없음" class="filePreview" src="/upload/${expFileList.storedName }">
						</c:forEach>
						
						<div>
						    <input multiple="multiple" type="file" id="expMultiFileUpdate" name="expMultiFileUpdate" />
						</div>
					</div>
						<div id="fileNames"></div>
					
					
					<div>
						<button type="submit">수정하기</button>
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
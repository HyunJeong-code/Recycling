<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>

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
    	
        /* var id = "#file"+i;
        
        
        var input = document.createElement("input");
        input.setAttribute("value", $(id).attr("class"));
        input.setAttribute("hidden","hidden");
        input.setAttribute("name","fileId");
        container.appendChild(input);
        
        var id1 = "#before"+i;
        
        $(id1).val(''); */
        
        //<input value="${files[1].prdFlNo }" id="before1" name="beforeFile" hidden="" >
        

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
    	
/*         var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.setAttribute("class", "col-lg-6");
        container.appendChild(img); */
        
    	var div = document.createElement("div");
        div.innerText = fileName;
        container.appendChild(div);
    }
}

	$(function() {
		// 해당 상품의 ctPdtNo 선택
		$("#ctPdtNo option:eq(${prd.ctPdtNo})").attr("selected", "selected");
		
		//input 빈값 체크
        $("#btnUpdate").click(function(){
            var isRight = true;
            $("#detailForm").find("input[type=text]").each(function(index, item){
                // 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
                if ($(this).val().trim() == '') {
                    alert($(this).attr("data-name")+" 항목을 입력하세요.");
                    isRight = false;
                    return false;
                }
            });

            if (!isRight) {
            	return false;
            } else {
            	$("#detailForm").submit();
            }

            $(this).prop("disabled", true);
            $(this).prop("disabled", false);
        });
		
	})
	
</script>

<body>

	<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>

    <div class="full">
        <div class="wrap">
            <c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>
        
            <div class="section">
            	<h3>${prd.prdName }</h3>
            	<form action="./cyupdate?prdCode=${prd.prdCode}" id="detailForm" method="post" enctype="multipart/form-data">
	            	<table>
	            		<tr>
	            			<td>상품코드</td>
	            			<td>${prd.prdCode }</td>
	            		</tr>
	            		<tr>
	            			<td>상품 분류</td>
	            			<td>
	            				<select name="ctPdtNo" id="ctPdtNo">
						           	<option value="0">플라스틱</option>
						           	<option value="1">유리</option>
						           	<option value="2">종이</option>
						           	<option value="3">캔</option>
						           	<option value="4">천</option>
						           	<option value="5">기타</option>
					            </select>
	            			</td>
	            		</tr>
	            		<tr>
	            			<td>상품명</td>
	            			<td><input type="text" name="prdName" value="${prd.prdName }" data-name="상품명"></td>
	            		</tr>
	            		<tr>
	            			<td>가격</td>
	            			<td><input type="text" name="price" value="${prd.price }" data-name="가격"></td>
	            		</tr>
	            		<tr>
	            			<td>재고</td>
	            			<td><input type="number" min="0" name="prdCnt" value="${prd.prdCnt }" data-name="재고"></td>
	            		</tr>
	            		<tr>
	            			<td>상품 상세</td>
	            			<td><input type="text" name="prdDetail" value="${prd.prdDetail }" data-name="상품 상세"></td>
	            		</tr>
	            		<c:forEach var="file" items="${files }">
	            			<c:if test="${file.ctPflNo == 600 }">
		 	            		<tr>
			            			<td>메인 이미지</td>
			            			<td>
			            				<div class="filebox">
											<input type="file" id="profile" name="profile" onchange="setThumbnail(event,0);" required="required">
										</div>
										<div id="image_container0">
											<img id="mainImg" alt="${prd.prdName }" src="/upload/${file.storedName }">
										</div>
			            			</td>
			            		</tr>
			            	</c:if>
		            	</c:forEach>
		            	<tr>
		            		<td>서브 이미지</td>
			            	<!-- <div class="filebox">
								<input multiple="multiple" type="file" id="file1" name="file" onchange="setThumbnail(event,1);"  required="required">
								<input multiple="multiple" type="file" id="file2" name="file" onchange="setThumbnail(event,2);"  required="required">
								<input multiple="multiple" type="file" id="file3" name="file" onchange="setThumbnail(event,3);"  required="required">
							</div> -->
			            	<c:set var="files" value="${files }"/>
			            	<c:forEach var="i" begin="1" end="3">
			            		<td>
			            			<input multiple="multiple" type="file" id="file${i }" class="${files[i].prdFlNo }" name="file" onchange="setThumbnail(event,${i});"  required="required">
			            			
					            	<div id="image_container${i}">
					            		<c:if test="${not empty files[i] }">
				            				<input value="${files[i].prdFlNo }" name="fileId" hidden="hidden">
					            			<img alt="${prd.prdName }" src="/upload/${files[i].storedName }">
					            		</c:if>
					            	</div>
				            	</td>
			            	</c:forEach>
		            	</tr>
		           	</table>
		           	<button type="button"><a href="./upcylist">목록</a></button>
		           	<button type="button" id="btnUpdate">수정하기</button>
		           	<button type="button"><a href="./upcydel?prdCode=${prd.prdCode}">삭제하기</a></button>
	           	</form>
            </div>
        </div>
    </div>
    
    <c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
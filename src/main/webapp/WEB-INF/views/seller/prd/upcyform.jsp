<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
$(function() {
	
	$("form").submit(function(e) {
		 if(!$("#main").val() ||  !$("#detail1").val() || !$("#detail2").val() || !$("#detail3").val()) {
			 alert("썸네일 1개, 상세이미지 3개를 모두 첨부해야 합니다.");
			 e.preventDefault();
		 } else if($("#prdName").val() == '' || $("#price").val() == '' || $("#prdCnt").val() == '' || $("#prdFee").val() == '' || $("#prdDetail").val() == '') {
			 alert("필수 입력 정보를 모두 입력해야합니다.");
			 e.preventDefault();
		 }
	 })
	
	$("#prdName").blur(function() {
		if($("#prdName").val() == '') {
			$(".name").css("display", "block");
		} else {
			$(".name").css("display", "none");			
		}
	})
	
	$("#price").blur(function() {
		if($("#price").val() == '') {
			$(".price").css("display", "block");
		} else {
			$(".price").css("display", "none");			
		}
	})
	
	$("#prdFee").blur(function() {
		if($("#prdFee").val() == '') {
			$(".fee").css("display", "block");
		} else {
			$(".fee").css("display", "none");			
		}
	})
	
	$("#prdCnt").blur(function() {
		if($("#prdCnt").val() == '') {
			$(".cnt").css("display", "block");
		} else {
			$(".cnt").css("display", "none");			
		}
	})
	
	$("#prdDetail").blur(function() {
		if($("#prdDetail").val() == '') {
			$(".detail").css("display", "block");
		} else {
			$(".detail").css("display", "none");			
		}
	})
	
})
</script>
<style type="text/css">

.wrap {
	text-align: center;
}

.prd {
	width: 600px;
	margin: 0 auto;
	text-align: left;
}

input[type=file]::file-selector-button {
	width: 100px;
   	height: 36px;
	background: #4CAF50;
	border: 1px solid white;
	color: white;
	border-radius: 5px;
	font-size: 15px;
	cursor: pointer;
}

.section label {
	display: inline-block;
	width: 200px;
	height: 50px;
	vertical-align: middle;
	line-height: 50px;
}

.section input[type="text"], input[type="password"] {
	height: 50px;
	border: none;
	border-bottom: 1px solid black;
}

.select {
	display: inline-block;
	position: relative;
	width: 100px;
	height: 35px;
	border-radius: 4px;
	border: 2px solid #4CAF50;
}

select::-ms-expand { 
	display: none;
}

.select .selectIn {
	-o-appearance: none;
  	-webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
  	width: inherit;
    height: inherit;
    background: transparent;
    border: 0 none;
    outline: 0 none;
    padding: 0 5px;
    position: relative;
    z-index: 3;
}

.btn-list {
	display: flex;
	justify-content: space-around;
	margin-top: 50px;
}

.agree {
	display: flex;
	justify-content: flex-end;
}

.section .agree .ag-chk {
	width: 100px;
}

.ag-box {
	margin-top: 50px;
	text-align: center;
}

.ag-content {
	width: 590px;
	height: 200px;
    overflow: auto;
}

.ag-content::-webkit-scrollbar {
    width: 10px;
}

.ag-content::-webkit-scrollbar-thumb {
    background-color: #4CAF50;
}

.ag-content::-webkit-scrollbar-track {
    background-color: #ccc;
}

.ne {
	color: red;
}

.j-info {
	font-size: 12px;
	height: 30px;
}

.s {
	width: 70px;
}

.m {
	width: 150px;
}

.l {
	width: 300px;
}

.mm {
	width: 100px;
}

.content {
	text-align: center;
}

</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
<div class="full">
	<div class="wrap">
		<c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>	
		<div class="main-section">
		
			<div class="page-header">
			<h3>새활용 등록</h3>
			</div>
			
			<div class="section">
				<div class="prd">
				<form action="./upcyform" method="post" enctype="multipart/form-data">
					
					<input type="hidden" id="ctPno" name="ctPno" value="1">
					
					<label for="ctPdtNo">분류</label>
					<div class="select">
						<select id="ctPdtNo" name="ctPdtNo" class="selectIn">
							<option value="0" selected="selected">plastic</option>
							<option value="1">glass</option>
							<option value="2">paper</option>
							<option value="3">can</option>
							<option value="4">cloth</option>
							<option value="5">etc</option>
						</select>
					</div>
					
					<div class="j-info"></div>
					
					<label for="main">상품 썸네일</label>
					<input type="file" id="main" name="main" accept="image/*">
					<div class="j-info">
						<div class="file" style="display:none; color:red;">
						<label></label>
						썸네일 사진은 필수입니다.
						</div>
					</div>
					
					<label for="prdName">상품명</label>
					<input type="text" id="prdName" name="prdName" class="l">
					<div class="j-info">
						<div class="name" style="display:none; color:red;">
						<label></label>
						상품명을 입력해주세요
						</div>
					</div>
					
					<label for="price">가격</label>
					<input type="text" id="price" name="price" class="m"><span>원</span>
					<div class="j-info">
						<div class="price" style="display:none; color:red;">
						<label></label>
						가격은 필수입니다.
						</div>
					</div>
					
					<label for="prdFee">배송비</label>
					<input type="text" id="prdFee" name="prdFee" class="s"><span>원</span>
					<div class="j-info">
						<div class="fee" style="display:none; color:red;">
						<label></label>
						배송비는 필수입니다.(무료일 경우, '0'입력)
						</div>
					</div>
					
					<label for="prdCnt">수량</label>
					<input type="text" id="prdCnt" name="prdCnt" class="s"><span>개</span>
					<div class="j-info" >
						<div class="cnt" style="display:none; color:red;">
						<label></label>
						수량은 필수입니다.(최소 1개 이상)
						</div>
					</div>
					
					<div class="content">
						<label for="prdDetail">설명</label>
						<textarea rows="30" cols="70" id="prdDetail" name="prdDetail" placeholder="재활용품에 대한 설명을 적어주세요.(세쳑 유무, 거래 방법, 수량/무게 등)"></textarea>
						<div class="j-info j-detail">
							<div class="detail" style="display:none; color:red;">
							설명은 필수입니다.
							</div>
						</div>
					</div>
					
					<label for="detail">상품 상세 이미지</label>
					<input type="file" id="detail1" name="detail" accept="image/*">
					<label></label>
					<input type="file" id="detail2" name="detail" accept="image/*">
					<label></label>
					<input type="file" id="detail3" name="detail" accept="image/*">
					
					<div class="btn-list">
						<button class="btn btnRight">등록하기</button>
						<a href="./main"><button class="btn btnLeft">취소하기</button></a>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>
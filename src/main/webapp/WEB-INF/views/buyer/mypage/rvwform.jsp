<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#rvw fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#rvw fieldset legend{
    text-align: right;
}

#rvw .star {
	display: none; 
}

#rvw label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#rvw label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#rvw label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#rvw input[type="radio"]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<div class="full">
	<div class="wrap">
		<div class="page">
			<h3>리뷰 작성 가능 제품</h3>
		</div>
		
		<div class="section">
			
		</div> <!-- section End -->
		
		<div class="page">
			<h3>리뷰 작성 가능 체험단</h3>
		</div>
		
		<div class="section">
			
		</div> <!-- section End -->
				
		<div class="page">
			<h3>후기 작성하기</h3>
		</div>
		
		<div class="section">
			<form action="./rvwform" method="post" id="rvw">
				<span class="text-bold">별점을 선택해주세요</span>
				<fieldset>
					<input type="radio" name="grade" id="five" value="5" class="star">
					<label for="five">★</label>
					<input type="radio" name="grade" id="four" value="4" class="star">
					<label for="four">★</label>
					<input type="radio" name="grade" id="three" value="3" class="star">
					<label for="three">★</label>
					<input type="radio" name="grade" id="two" value="2" class="star">
					<label for="two">★</label>
					<input type="radio" name="grade" id="one" value="1" class="star">
					<label for="one">★</label>
				</fieldset>
				
				<br>
				
				<textarea rows="10" cols="50" id="content" value="content" placeholder="후기 내용을 작성해주세요. 최대 600자까지 적을 수 있습니다."></textarea>
				
				<button>등록하기</button>
				<button><a href="">취소하기</a></button>
			</form>
		</div> <!-- section End -->		
	</div> <!-- wrap End -->
</div> <!-- full End -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- sellermenu css -->
<link rel="stylesheet" href="/resources/css/sellermenu.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">

	$(function() {
        $(".sub_menu").hide();

        //사이드바 하위메뉴 슬라이드
        $('#main_menu > li > a').mouseover(function(){
            $(this).next($('.snd_menu')).slideDown(500);
        })
        $('#main_menu > li > a').mouseleave(function(){
            $(this).next($('.snd_menu')).slideUp(300);
        })
        
        // 마우스오버 색 변경
        $('#main_menu li').mouseover(function(){
            $(this).addClass('selec');
        })
        $("#main_menu li").mouseleave(function(){
            $(this).removeClass('selec');
        })
	})
	
</script>

</head>
<body>
	<div class="sidebar">
	    <div class="panel-heading">
	        <a href="#">판매자 메뉴</a>
	    </div>
	    <div class="width-menu">
	        <ul id="main_menu">
	            <li><a href="#">상품등록</a>
	                <ul class="snd_menu sub_menu">
	                    <li><a href="/seller/prd/main">상품등록</a></li>
	                    <li><a href="/seller/prd/rcyform">재활용품 등록</a></li>
	                    <li><a href="/seller/prd/upcyform">새활용 등록</a></li>
	                </ul>
	            </li>
	            
	            <li><a href="#">상품-판매 관리</a>
	                <ul class="snd_menu sub_menu">
	                    <li><a href="/seller/selling/main">상품-판매 관리</a></li>
	                    <li><a href="/seller/selling/rcylist">재활용품 관리</a></li>
	                    <li><a href="/seller/selling/upcylist">새활용 관리</a></li>
	                    <li><a href="/seller/selling/explist">체험단 관리</a></li>
	                </ul>
	            </li>
	            
	            <li><a href="#">매출 관리</a>
	                <ul class="snd_menu sub_menu">
	                    <li><a href="/seller/sales/main">매출 관리</a></li>
	                    <li><a href="/seller/sales/">재활용품 관리</a></li>
	                    <li><a href="/seller/sales/">새활용 관리</a></li>
	                    <li><a href="/seller/sales/">체험단 관리</a></li>
	                </ul>
	            </li>
	            
	            <li><a href="#">고객 관리</a>
	                <ul class="snd_menu sub_menu">
	                    <li><a href="/seller/qna/main">고객 관리</a></li>
	                    <li><a href="/seller/qna/qnaform">고객 문의 사항</a></li>
	                </ul>
	            </li>
	            
	            <li><a href="#">판매자 정보</a>
	                <ul class="snd_menu sub_menu">
	                    <li><a href="/seller/mypage/sellermain">판매자 정보</a></li>
	                    <li><a href="/seller/mypage/changepw">비밀번호 변경</a></li>
	                    <li><a href="/seller/mypage/changebank">계좌번호 변경</a></li>
	                    <li><a href="/seller/mypage/sellerdetail">판매자 정보 수정</a></li>
	                    <li><a href="/seller/mypage/outseller">판매자 탈퇴</a></li>
	                </ul>
	            </li>
	        </ul>
	    </div>
	</div>
</body>
</html>

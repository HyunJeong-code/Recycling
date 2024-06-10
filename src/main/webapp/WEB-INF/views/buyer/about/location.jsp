<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/common.css">
<style>
    /* 전체 요소를 가운데 정렬합니다 */
    body {
        text-align: center;
    }
</style>
</head>
<body>
    <c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>
    <br>

    <h1>사업장 위치</h1>
    <br>
    
    <div style="text-align: center;">
	    <table class="contact" cellpadding="15" cellspacing="0" style="display: inline-block; border-collapse: collapse;">
	        <tbody>
	            <tr>
	                <th style="border-top:1px solid #222; border-bottom:1px solid #dae0e9; background-color: #f2f2f2; padding: 10px;">주소</th>
	                <td style="border-top:1px solid #222; border-bottom:1px solid #dae0e9; padding: 10px;">(주)제리: 서울특별시 강남구 테헤란로 14길 6</td>
	            </tr>
	            <tr>
	                <th style="border-top:1px solid #222; border-bottom:1px solid #dae0e9; background-color: #f2f2f2; padding: 10px;">버스</th>
	                <td style="border-top:1px solid #222; border-bottom:1px solid #dae0e9; padding: 10px;">역삼역.포스코P&amp;S타워 정류장<br>146 / 740 / 341 / 360 / 1100 / 1700 / 2000 / 7007 / 8001</td>
	            </tr>
	            <tr>
	                <th style="border-bottom:1px solid #222; background-color: #f2f2f2; padding: 10px;">지하철</th>
	                <td style="border-bottom:1px solid #222; padding: 10px;">지하철 2호선 역삼역 3번출구 100m</td>
	            </tr>
	        </tbody>
	    </table>
	</div>
	<br>

    <div style="display: flex; justify-content: center;">
    	<div id="map" style="width:1150px; height:550px;"></div>
    </div>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41ba379def68013bd8f17aebb90337cb"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(37.499205, 127.032763), // 학원 좌표
                level: 3 // 지도의 확대 레벨
            };
        
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        
        // 마커가 표시될 위치입니다 
        var markerPosition  = new kakao.maps.LatLng(37.499205, 127.032763); 
        
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        
        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
        
        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);    
    </script>
    
    <c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>

<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    ArrayList<Map<String, Object>> gpsList = (ArrayList<Map<String, Object>>) request.getAttribute("gpsList");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 찾기</title>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

    <h1>판매자 찾기</h1>
    <hr>
    
    <div style="display: flex; justify-content: center;">
      <div id="map" style="width:1150px;height:550px;"></div>
    </div>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41ba379def68013bd8f17aebb90337cb&libraries=services"></script>
    <script>
    
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨 
            };
        
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        
        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
        if (navigator.geolocation) {
            
            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
                
                var lat = position.coords.latitude, // 위도
                    lon = position.coords.longitude; // 경도
                
                var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                    message = '<div style="padding:5px;">내 위치</div>'; // 인포윈도우에 표시될 내용입니다
                
                // 마커와 인포윈도우를 표시합니다
                displayMarker(locPosition, message);
                    
            });
            
        } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
            
            var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
                message = 'geolocation을 사용할수 없어요..'
                
            displayMarker(locPosition, message);
        }
        
        var gpsList = [
            <% for (int i = 0; i < gpsList.size(); i++) { %>
                {
                    sCode: '<%=gpsList.get(i).get("sCode")%>',
                    bCode: '<%=gpsList.get(i).get("bCode")%>',
                    accName: '<%=gpsList.get(i).get("accName")%>',
                    accBank: '<%=gpsList.get(i).get("accBank")%>',
                    accNo: '<%=gpsList.get(i).get("accNo")%>',
                    sPostcode: '<%=gpsList.get(i).get("sPostcode")%>',
                    sAddr: '<%=gpsList.get(i).get("sAddr")%>',
                    sDetail: '<%=gpsList.get(i).get("sDetail")%>',
                    sEntDate: '<%=gpsList.get(i).get("sEntDate")%>',
                    sChk: '<%=gpsList.get(i).get("sChk")%>',
                    sOut: '<%=gpsList.get(i).get("sOut")%>',
                    sOutDate: '<%=gpsList.get(i).get("sOutDate")%>',
                    prdCode: '<%=gpsList.get(i).get("prdCode")%>'
                }<%= i == gpsList.size() - 1 ? "" : "," %>
            <% } %>
        ];

        console.log(gpsList);

        // 마커가 표시된 좌표를 저장할 배열
        var displayedMarkers = [];

        for (let i = 0; i < gpsList.length; i++) {
            let gps = gpsList[i];
            let sCode = gps.sCode; // sCode 값을 가져옴
            let prdCode = gps.prdCode; // prdCode 값을 가져옴
            let sOut = gps.sOut; // sOut 값을 가져옴

            // sOut이 "Y"일 경우 마커를 생성하지 않음
            if (sOut === "Y") {
                continue;
            }
            
            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();
            
            // 주소로 좌표를 검색합니다
            geocoder.addressSearch(gps.sAddr, function(result, status) {

                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 이미 표시된 마커가 있는지 확인하고 있으면 좌표를 조금 이동
                    displayedMarkers.forEach(function(marker) {
                        if (marker.getPosition().equals(coords)) {
                            var newLat = coords.getLat() + (Math.random() - 0.5) * 0.0001;
                            var newLng = coords.getLng() + (Math.random() - 0.5) * 0.0001;
                            coords = new kakao.maps.LatLng(newLat, newLng);
                        }
                    });

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 표시된 마커의 좌표를 저장
                    displayedMarkers.push(marker);
                    
                    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
                    var iwContent = '<div style="padding:5px;"><a href="/buyer/recycling/rcydetail?prdCode=' + prdCode + '">' + sCode + '</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

                    // 인포윈도우를 생성합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content : iwContent,
                        removable : iwRemoveable
                    });

                    // 마커에 클릭이벤트를 등록합니다
                    kakao.maps.event.addListener(marker, 'click', function() {
                        // 마커 위에 인포윈도우를 표시합니다
                        infowindow.open(map, marker);  
                    });

                }
                 
            });
        }
        
        // 지도에 마커와 인포윈도우를 표시하는 함수입니다
        function displayMarker(locPosition, message) {

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({  
                map: map, 
                position: locPosition
            }); 
            
            var iwContent = message, // 인포윈도우에 표시할 내용
                iwRemoveable = true;

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent,
                removable : iwRemoveable
            });
            
            // 인포윈도우를 마커위에 표시합니다 
            infowindow.open(map, marker);
            
            // 지도 중심좌표를 접속위치로 변경합니다
            map.setCenter(locPosition);
            
            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                // 마커 위에 인포윈도우를 표시합니다
                infowindow.open(map, marker);
            });
        }
        
    </script>
    
    <c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
</body>
</html>
